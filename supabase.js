(function(){
  const config=window.CMG_CONFIG||{};
  const placeholder='PASTE_YOUR_PUBLISHABLE_KEY_HERE';

  function requireClient(){
    if(!window.supabase?.createClient)throw new Error('Supabase library did not load.');
    if(!config.SUPABASE_URL||!config.SUPABASE_KEY||config.SUPABASE_KEY===placeholder){
      throw new Error('Add your Supabase publishable key in js/config.js.');
    }
    return window.supabase.createClient(config.SUPABASE_URL,config.SUPABASE_KEY);
  }

  let client;
  function getClient(){
    client=client||requireClient();
    return client;
  }

  const fromRow=row=>({
    id:row.id,
    name:row.name||'',
    type:row.type||'',
    contact:row.contact||'',
    phone:row.phone||'',
    email:row.email||'',
    address:row.address||'',
    notes:row.notes||''
  });

  const toRow=customer=>({
    name:String(customer.name||'').trim(),
    type:customer.type||null,
    contact:customer.contact||null,
    phone:customer.phone||null,
    email:customer.email||null,
    address:customer.address||null,
    notes:customer.notes||null
  });

  async function list(){
    const {data,error}=await getClient().from('customers').select('*').order('created_at',{ascending:false});
    if(error)throw error;
    return (data||[]).map(fromRow);
  }

  async function save(customer,id){
    const row=toRow(customer);
    if(!row.name)throw new Error('Customer / Builder is required.');
    const query=id
      ?getClient().from('customers').update(row).eq('id',id).select().single()
      :getClient().from('customers').insert(row).select().single();
    const {data,error}=await query;
    if(error)throw error;
    return fromRow(data);
  }

  async function remove(id){
    const {error}=await getClient().from('customers').delete().eq('id',id);
    if(error)throw error;
  }

  async function importMany(customers){
    if(!Array.isArray(customers)||!customers.length)return;
    for(const customer of customers){
      const row=toRow(customer);
      if(!row.name)continue;
      if(customer.id&&/^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(customer.id)){
        const {error}=await getClient().from('customers').upsert({id:customer.id,...row});
        if(error)throw error;
      }else{
        const {data,error}=await getClient().from('customers').select('id').ilike('name',row.name).limit(1);
        if(error)throw error;
        if(!data?.length){const result=await getClient().from('customers').insert(row);if(result.error)throw result.error;}
      }
    }
  }

  async function initialize(legacyCustomers){
    let customers=await list();
    if(!customers.length&&Array.isArray(legacyCustomers)&&legacyCustomers.length){
      await importMany(legacyCustomers);
      customers=await list();
    }
    return customers;
  }

  window.CMGCustomers={list,save,remove,importMany,initialize};
})();
