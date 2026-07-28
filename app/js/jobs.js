(function(){
  const config=window.CMG_CONFIG||{};
  let client;
  function getClient(){if(client)return client;if(!window.supabase?.createClient)throw new Error('Supabase library did not load.');client=window.supabase.createClient(config.SUPABASE_URL,config.SUPABASE_KEY);return client}
  const fromRow=r=>({id:r.id,...(r.data||{})});
  async function list(){const {data,error}=await getClient().from('cmg_jobs').select('*').order('created_at',{ascending:false});if(error)throw error;return (data||[]).map(fromRow)}
  async function save(job,id){const data={...job};delete data.id;const row={data,updated_at:new Date().toISOString()};let q=id?getClient().from('cmg_jobs').update(row).eq('id',id):getClient().from('cmg_jobs').insert(row);const {data:result,error}=await q.select().single();if(error)throw error;return fromRow(result)}
  async function remove(id){const {error}=await getClient().from('cmg_jobs').delete().eq('id',id);if(error)throw error}
  async function importMany(jobs){if(!Array.isArray(jobs))return;for(const job of jobs){const existing=job.id&&/^[0-9a-f-]{36}$/i.test(job.id);if(existing){const data={...job};delete data.id;const {error}=await getClient().from('cmg_jobs').upsert({id:job.id,data});if(error)throw error}else await save(job)}}
  async function initialize(localJobs){let jobs=await list();if(!jobs.length&&Array.isArray(localJobs)&&localJobs.length){await importMany(localJobs);jobs=await list()}return jobs}
  window.CMGJobs={initialize,list,save,remove,importMany};
})();
