(function(){
  const config=window.CMG_CONFIG||{};
  let client;
  function getClient(){
    if(client)return client;
    if(!window.supabase?.createClient)throw new Error('Supabase library did not load.');
    client=window.supabase.createClient(config.SUPABASE_URL,config.SUPABASE_KEY);
    return client;
  }
  const screen=()=>document.getElementById('authScreen');
  const errorBox=()=>document.getElementById('authError');
  const loading=()=>document.getElementById('authLoading');
  const submit=()=>document.getElementById('authSubmit');
  function showError(message){const el=errorBox();el.textContent=message||'Unable to sign in.';el.classList.add('show');}
  function clearError(){const el=errorBox();el.textContent='';el.classList.remove('show');}
  function showLogin(){screen().classList.remove('hidden');loading().style.display='none';submit().disabled=false;}
  function hideLogin(){screen().classList.add('hidden');}
  async function requireSession(){const {data,error}=await getClient().auth.getSession();if(error)throw error;if(!data.session)throw new Error('Not signed in.');return data.session;}
  async function signIn(email,password){
    clearError();submit().disabled=true;loading().style.display='block';loading().textContent='Signing in…';
    const {data,error}=await getClient().auth.signInWithPassword({email,password});
    if(error){submit().disabled=false;loading().style.display='none';showError(error.message);return null;}
    hideLogin();window.dispatchEvent(new CustomEvent('cmg-authenticated',{detail:data.session}));return data.session;
  }
  async function signOut(){await getClient().auth.signOut();location.reload();}
  async function initialize(){
    document.getElementById('authForm').addEventListener('submit',e=>{e.preventDefault();signIn(document.getElementById('authEmail').value.trim(),document.getElementById('authPassword').value);});
    const {data,error}=await getClient().auth.getSession();
    if(error){loading().style.display='none';showError(error.message);return;}
    if(data.session){hideLogin();window.dispatchEvent(new CustomEvent('cmg-authenticated',{detail:data.session}));}else{showLogin();}
    getClient().auth.onAuthStateChange((event,session)=>{if(event==='SIGNED_OUT'||!session)showLogin();});
  }
  window.CMGAuth={initialize,signIn,signOut,requireSession,getClient};
})();
