(function(){
  const config=window.CMG_CONFIG||{};
  const BUCKET='cmg-job-photos';
  let client;
  function getClient(){if(client)return client;if(!window.supabase?.createClient)throw new Error('Supabase library did not load.');client=window.supabase.createClient(config.SUPABASE_URL,config.SUPABASE_KEY);return client}
  function safeName(name){const ext=(name.split('.').pop()||'jpg').toLowerCase().replace(/[^a-z0-9]/g,'')||'jpg';const base=name.replace(/\.[^.]+$/,'').replace(/[^a-z0-9_-]+/gi,'_').slice(0,60)||'photo';return `${Date.now()}_${Math.random().toString(36).slice(2,8)}_${base}.${ext}`}
  async function upload(jobId,file){if(!jobId)throw new Error('Save the job before adding photos.');if(!file?.type?.startsWith('image/'))throw new Error('Only image files can be uploaded.');if(file.size>20*1024*1024)throw new Error('Each photo must be 20 MB or smaller.');const name=safeName(file.name),path=`${jobId}/${name}`;const {error}=await getClient().storage.from(BUCKET).upload(path,file,{cacheControl:'3600',upsert:false,contentType:file.type});if(error)throw error;return {name,path}}
  async function list(jobId){const {data,error}=await getClient().storage.from(BUCKET).list(jobId,{limit:100,sortBy:{column:'created_at',order:'desc'}});if(error)throw error;const files=(data||[]).filter(x=>x.name&&!x.name.startsWith('.'));return Promise.all(files.map(async x=>{const path=`${jobId}/${x.name}`;const {data:signed,error:signedError}=await getClient().storage.from(BUCKET).createSignedUrl(path,3600);if(signedError)throw signedError;return {name:x.name,path,url:signed.signedUrl,createdAt:x.created_at}}))}
  async function remove(jobId,name){const {error}=await getClient().storage.from(BUCKET).remove([`${jobId}/${name}`]);if(error)throw error}
  async function removeAll(jobId){const files=await list(jobId);if(!files.length)return;const {error}=await getClient().storage.from(BUCKET).remove(files.map(x=>x.path));if(error)throw error}
  window.CMGPhotos={upload,list,remove,removeAll,BUCKET};
})();
