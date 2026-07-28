(function(){
  const config=window.CMG_CONFIG||{};
  let client;
  function getClient(){
    if(client)return client;
    if(!window.supabase?.createClient)throw new Error('Supabase library did not load.');
    client=window.supabase.createClient(config.SUPABASE_URL,config.SUPABASE_KEY);
    return client;
  }
  const n=v=>Number(v||0);
  const materialFrom=r=>({id:r.id,name:r.name||'',type:r.type||'',supplier:r.supplier||'',cost:n(r.cost_per_sqft),sell:n(r.sell_per_sqft),active:r.active!==false});
  const sinkFrom=r=>({id:r.id,name:r.name||'',supplier:r.supplier||'',cost:n(r.cost),sell:n(r.sell_price),active:r.active!==false});
  async function listMaterials(){const {data,error}=await getClient().from('cmg_materials').select('*').order('type').order('name');if(error)throw error;return (data||[]).map(materialFrom)}
  async function saveMaterial(m,id){const row={name:String(m.name||'').trim(),type:String(m.type||'').trim(),supplier:m.supplier||null,cost_per_sqft:n(m.cost),sell_per_sqft:n(m.sell),active:m.active!==false};if(!row.name||!row.type)throw new Error('Material name and stone type are required.');let q=id?getClient().from('cmg_materials').update(row).eq('id',id):getClient().from('cmg_materials').insert(row);const {data,error}=await q.select().single();if(error)throw error;return materialFrom(data)}
  async function deleteMaterial(id){const {error}=await getClient().from('cmg_materials').delete().eq('id',id);if(error)throw error}
  async function listSinks(){const {data,error}=await getClient().from('cmg_sinks').select('*').order('name');if(error)throw error;return (data||[]).map(sinkFrom)}
  async function saveSink(s,id){const row={name:String(s.name||'').trim(),supplier:s.supplier||null,cost:n(s.cost),sell_price:n(s.sell),active:s.active!==false};if(!row.name)throw new Error('Sink name is required.');let q=id?getClient().from('cmg_sinks').update(row).eq('id',id):getClient().from('cmg_sinks').insert(row);const {data,error}=await q.select().single();if(error)throw error;return sinkFrom(data)}
  async function deleteSink(id){const {error}=await getClient().from('cmg_sinks').delete().eq('id',id);if(error)throw error}
  async function getRates(){const {data,error}=await getClient().from('cmg_rates').select('*').eq('id',1).maybeSingle();if(error)throw error;return data?{install:n(data.install_cost_per_sqft),sinkCutoutCost:n(data.sink_cutout_cost),sinkCutoutCharge:n(data.sink_cutout_charge),cooktopCutoutCost:n(data.cooktop_cutout_cost),cooktopCutoutCharge:n(data.cooktop_cutout_charge),tearoutCost:n(data.tearout_cost_per_sqft),tearoutCharge:n(data.tearout_charge_per_sqft)}:{install:0,sinkCutoutCost:0,sinkCutoutCharge:0,cooktopCutoutCost:0,cooktopCutoutCharge:0,tearoutCost:0,tearoutCharge:0}}
  async function saveRates(r){const row={id:1,install_cost_per_sqft:n(r.install),sink_cutout_cost:n(r.sinkCutoutCost),sink_cutout_charge:n(r.sinkCutoutCharge),cooktop_cutout_cost:n(r.cooktopCutoutCost),cooktop_cutout_charge:n(r.cooktopCutoutCharge),tearout_cost_per_sqft:n(r.tearoutCost),tearout_charge_per_sqft:n(r.tearoutCharge),updated_at:new Date().toISOString()};const {error}=await getClient().from('cmg_rates').upsert(row);if(error)throw error}
  async function initialize(localMaterials,localRates,localSinks){let [materials,sinks,rates]=await Promise.all([listMaterials(),listSinks(),getRates()]);if(!materials.length&&Array.isArray(localMaterials)&&localMaterials.length){for(const m of localMaterials)await saveMaterial(m);materials=await listMaterials()}if(!sinks.length&&Array.isArray(localSinks)&&localSinks.length){for(const s of localSinks)await saveSink(s);sinks=await listSinks()}if(!Object.values(rates).some(Boolean)&&localRates){rates={install:n(localRates.install),sinkCutoutCost:n(localRates.sinkCutoutCost),sinkCutoutCharge:n(localRates.sinkCutoutCharge),cooktopCutoutCost:n(localRates.cooktopCutoutCost),cooktopCutoutCharge:n(localRates.cooktopCutoutCharge),tearoutCost:n(localRates.tearoutCost),tearoutCharge:n(localRates.tearoutCharge)};await saveRates(rates)}return {materials,sinks,rates}}
  window.CMGPricing={initialize,listMaterials,saveMaterial,deleteMaterial,listSinks,saveSink,deleteSink,getRates,saveRates};
})();
