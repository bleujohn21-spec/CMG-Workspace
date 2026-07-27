<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capital Marble Workspace</title>
<style>
:root{
  --nav:#14283d;--nav2:#1d3954;--accent:#2f80ed;--bg:#f4f7fb;--card:#fff;
  --text:#17202a;--muted:#6b7785;--border:#dce3ea;--good:#1f9d55;--warn:#d08b00;--bad:#c0392b;
}
*{box-sizing:border-box} body{margin:0;font-family:Arial,Helvetica,sans-serif;background:var(--bg);color:var(--text)}
button,input,select,textarea{font:inherit}.app{display:grid;grid-template-columns:240px 1fr;min-height:100vh}
.sidebar{background:var(--nav);color:white;padding:24px 16px;position:sticky;top:0;height:100vh}
.brand{font-weight:800;font-size:20px;line-height:1.2;margin:0 8px 26px}.brand small{display:block;font-weight:400;color:#a9bed1;font-size:12px;margin-top:5px}
.nav button{width:100%;display:flex;gap:10px;align-items:center;background:none;border:0;color:#dce8f2;padding:12px;border-radius:9px;text-align:left;cursor:pointer;margin:3px 0}
.nav button:hover,.nav button.active{background:var(--nav2);color:#fff}.nav .icon{width:22px;text-align:center}
.main{padding:26px;min-width:0}.topbar{display:flex;justify-content:space-between;gap:16px;align-items:center;margin-bottom:22px}
h1{font-size:28px;margin:0}.subtitle{color:var(--muted);margin-top:5px}
.primary,.secondary,.danger{border:0;border-radius:8px;padding:10px 14px;cursor:pointer;font-weight:700}
.primary{background:var(--accent);color:white}.secondary{background:#e8eef5;color:#25415d}.danger{background:#fde8e6;color:var(--bad)}
.grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:16px}.card{background:var(--card);border:1px solid var(--border);border-radius:12px;padding:18px;box-shadow:0 2px 8px rgba(15,30,50,.04)}
.kpi .label{color:var(--muted);font-size:13px}.kpi .value{font-size:28px;font-weight:800;margin-top:8px}.kpi .hint{font-size:12px;color:var(--muted);margin-top:6px}
.two-col{display:grid;grid-template-columns:1.4fr 1fr;gap:16px;margin-top:16px}.section-title{display:flex;justify-content:space-between;align-items:center;margin-bottom:14px}.section-title h2{font-size:18px;margin:0}
table{width:100%;border-collapse:collapse;font-size:14px}th,td{padding:11px 9px;border-bottom:1px solid var(--border);text-align:left;vertical-align:middle}th{font-size:12px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em}
.badge{display:inline-block;border-radius:99px;padding:5px 8px;font-size:11px;font-weight:700;background:#e9eef3;color:#405466}.status-control,.payment-control{display:flex;align-items:center;gap:5px;white-space:nowrap}.status-pill{display:inline-flex;align-items:center;justify-content:center;border:0;border-radius:99px;padding:0 14px;min-width:128px;height:34px;min-height:34px;white-space:nowrap;font-size:11px;font-weight:800;line-height:normal;cursor:pointer;text-align:center;overflow:visible;vertical-align:middle}.status-pill.quote{background:#fff3d6;color:#8a5b00}.status-pill.scheduled{background:#fde7cf;color:#9a4f00}.status-pill.progress{background:#dcecff;color:#185c9d}.status-pill.installed{background:#e4f5eb;color:#147a3f}.status-pill.hold{background:#eee8fa;color:#66429a}.status-pill.cancelled{background:#fde8e6;color:#a93226}.status-menu,.payment-menu{width:30px;padding:6px 3px;border:1px solid var(--border);border-radius:8px;background:#fff;color:#405466;cursor:pointer}.payment-pill{display:inline-flex;align-items:center;justify-content:center;border:0;border-radius:99px;padding:0 14px;min-width:128px;height:34px;min-height:34px;white-space:nowrap;font-size:11px;font-weight:800;line-height:normal;cursor:pointer;text-align:center;overflow:visible;vertical-align:middle}.payment-pill.no-deposit{background:#fff3d6;color:#8a5b00}.payment-pill.deposit{background:#e4f5eb;color:#147a3f}.payment-pill.not-paid{background:#fde7cf;color:#9a4f00}.payment-pill.paid{background:#dfeee7;color:#116b38}.balance-cell{min-width:185px}.balance-cell .muted{font-size:11px;margin-top:4px}.badge.good{background:#e4f5eb;color:#147a3f}.badge.warn{background:#fff3d6;color:#8a5b00}.badge.bad{background:#fde8e6;color:#a93226}
.empty{padding:30px;text-align:center;color:var(--muted)}.view{display:none}.view.active{display:block}
.toolbar{display:flex;gap:10px;align-items:center;margin-bottom:14px;flex-wrap:wrap}.toolbar input,.toolbar select{padding:9px 10px;border:1px solid var(--border);border-radius:8px;background:#fff}
.list-card{background:#fff;border:1px solid var(--border);border-radius:12px;overflow:hidden}.actions{display:flex;gap:6px}
.link-btn{border:0;background:none;color:var(--accent);cursor:pointer;font-weight:700;padding:4px}.muted{color:var(--muted)}
.modal-wrap{position:fixed;inset:0;background:rgba(7,18,30,.55);display:none;align-items:center;justify-content:center;padding:20px;z-index:20}.modal-wrap.open{display:flex}.modal{background:#fff;border-radius:14px;width:min(720px,100%);max-height:92vh;overflow:auto;padding:22px}
.modal-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}.modal h2{margin:0}.close{border:0;background:#eef2f6;border-radius:50%;width:34px;height:34px;cursor:pointer}
.form-grid{display:grid;grid-template-columns:1fr 1fr;gap:14px}.field{display:flex;flex-direction:column;gap:6px}.field.full{grid-column:1/-1}.field label{font-size:12px;font-weight:700;color:#516171}.field input,.field select,.field textarea{padding:10px;border:1px solid var(--border);border-radius:8px}.field textarea{min-height:80px;resize:vertical}.modal-actions{display:flex;justify-content:flex-end;gap:10px;margin-top:18px}
.report-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px}.report-block h3{margin-top:0}.progress{height:10px;background:#e7edf3;border-radius:99px;overflow:hidden}.progress span{display:block;height:100%;background:var(--accent)}
.export-box{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}.calc-box{grid-column:1/-1;background:#f4f8fc;border:1px solid #cfe0f3;border-radius:10px;padding:14px}.calc-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:10px}.calc-item{background:#fff;border:1px solid var(--border);border-radius:8px;padding:10px}.calc-item small{display:block;color:var(--muted);margin-bottom:5px}.calc-item b{font-size:17px}.field-note{font-size:11px;color:var(--muted)}.customer-picker-row{display:flex;gap:8px;align-items:center}.customer-picker-row input{flex:1}.customer-stats{white-space:nowrap}.export-option{background:#fff;border:1px solid var(--border);border-radius:12px;padding:18px}.export-option h3{margin-top:0}
@media(max-width:1000px){.grid{grid-template-columns:repeat(2,1fr)}.two-col,.report-grid{grid-template-columns:1fr}}
@media(max-width:720px){.app{grid-template-columns:1fr}.sidebar{height:auto;position:static;padding:14px}.brand{margin-bottom:10px}.nav{display:flex;overflow:auto}.nav button{min-width:max-content}.main{padding:16px}.grid,.export-box{grid-template-columns:1fr}.form-grid{grid-template-columns:1fr}.field.full{grid-column:auto}.topbar{align-items:flex-start}.topbar .primary{white-space:nowrap}}
</style>
</head>
<body>
<div class="app">
  <aside class="sidebar">
    <div class="brand">Capital Marble <small>Business Workspace</small></div>
    <nav class="nav" id="nav">
      <button class="active" data-view="dashboard"><span class="icon">⌂</span>Dashboard</button>
      <button data-view="jobs"><span class="icon">▦</span>Jobs</button>
      <button data-view="customers"><span class="icon">👤</span>Customers</button>
      <button data-view="expenses"><span class="icon">$</span>Expenses</button>
      <button data-view="inventory"><span class="icon">▣</span>Inventory</button>
      <button data-view="pricing"><span class="icon">◇</span>Materials &amp; Pricing</button>
      <button data-view="schedule"><span class="icon">▤</span>Schedule</button>
      <button data-view="reports"><span class="icon">◫</span>Reports</button>
      <button data-view="export"><span class="icon">⇩</span>Export</button>
    </nav>
  </aside>
  <main class="main">
    <section class="view active" id="dashboard">
      <div class="topbar"><div><h1>Dashboard</h1><div class="subtitle">What needs your attention right now</div></div><button class="primary" onclick="openModal('job')">+ New Job</button></div>
      <div class="grid">
        <div class="card kpi"><div class="label">Revenue</div><div class="value" id="kpiRevenue">$0</div><div class="hint">Completed and installed jobs</div></div>
        <div class="card kpi"><div class="label">Gross Profit</div><div class="value" id="kpiProfit">$0</div><div class="hint" id="kpiMargin">0% gross margin</div></div>
        <div class="card kpi"><div class="label">Money Owed</div><div class="value" id="kpiOwed">$0</div><div class="hint">Outstanding customer balances</div></div>
        <div class="card kpi"><div class="label">Upcoming Installs</div><div class="value" id="kpiUpcoming">0</div><div class="hint">Next 14 days</div></div>
      </div>
      <div class="two-col">
        <div class="card"><div class="section-title"><h2>Active Jobs</h2><button class="link-btn" onclick="showView('jobs')">View all</button></div><div id="activeJobs"></div></div>
        <div class="card"><div class="section-title"><h2>Needs Attention</h2></div><div id="attention"></div></div>
      </div>
    </section>

    <section class="view" id="jobs">
      <div class="topbar"><div><h1>Jobs</h1><div class="subtitle">Every countertop job from quote through completion</div></div><button class="primary" onclick="openModal('job')">+ New Job</button></div>
      <div class="toolbar"><input id="jobSearch" placeholder="Search jobs..." oninput="renderJobs()"><select id="jobFilter" onchange="renderJobs()"><option value="">All statuses</option><option>Quote</option><option>Scheduled</option><option>In Progress</option><option>Installed</option><option>On Hold</option><option>Cancelled</option></select></div>
      <div class="list-card"><div id="jobsTable"></div></div>
    </section>

    <section class="view" id="customers">
      <div class="topbar"><div><h1>Customers</h1><div class="subtitle">Homeowners, builders, and repeat clients</div></div><button class="primary" onclick="openModal('customer')">+ New Customer</button></div>
      <div class="list-card"><div id="customersTable"></div></div>
    </section>

    <section class="view" id="expenses">
      <div class="topbar"><div><h1>Expenses</h1><div class="subtitle">Overhead and operating costs</div></div><button class="primary" onclick="openModal('expense')">+ Add Expense</button></div>
      <div class="list-card"><div id="expensesTable"></div></div>
    </section>

    <section class="view" id="inventory">
      <div class="topbar"><div><h1>Inventory</h1><div class="subtitle">Slabs, remnants, sinks, faucets, and supplies</div></div><button class="primary" onclick="openModal('inventory')">+ Add Inventory</button></div>
      <div class="list-card"><div id="inventoryTable"></div></div>
    </section>

    <section class="view" id="pricing">
      <div class="topbar"><div><h1>Materials &amp; Pricing</h1><div class="subtitle">Exact colors and the default costs used for new jobs</div></div><button class="primary" onclick="addMaterial()">+ Add Material</button></div>
      <div class="card" style="margin-bottom:16px"><div class="section-title"><h2>Default Job Rates</h2></div><div class="field-note" style="margin-bottom:14px">Cost is what the item or service costs Capital Marble. Customer charge is what is added to the automatic estimate.</div><div class="form-grid">
        <div class="field"><label>Template Cost per Sq Ft</label><input id="rateTemplate" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Fabrication Cost per Sq Ft</label><input id="rateFabrication" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Installation Cost per Sq Ft</label><input id="rateInstall" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Sink Cutout Cost Each</label><input id="rateSinkCutoutCost" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Sink Cutout Customer Charge</label><input id="rateSinkCutoutCharge" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Cooktop Cutout Cost Each</label><input id="rateCooktopCutoutCost" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Cooktop Cutout Customer Charge</label><input id="rateCooktopCutoutCharge" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Sink Cost Each</label><input id="rateSinkCost" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Sink Customer Charge</label><input id="rateSinkCharge" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Tear Out Cost per Sq Ft</label><input id="rateTearoutCost" type="number" step="0.01" onchange="saveRates()"></div>
        <div class="field"><label>Tear Out Customer Charge</label><input id="rateTearoutCharge" type="number" step="0.01" onchange="saveRates()"></div>
      </div></div>
      <div class="list-card"><div id="materialsTable"></div></div>
    </section>

    <section class="view" id="schedule">
      <div class="topbar"><div><h1>Schedule</h1><div class="subtitle">Templates and installations by date</div></div></div>
      <div class="list-card"><div id="scheduleTable"></div></div>
    </section>

    <section class="view" id="reports">
      <div class="topbar"><div><h1>Reports</h1><div class="subtitle">P&amp;L and job profitability generated automatically</div></div></div>
      <div class="report-grid">
        <div class="card report-block"><h3>Profit &amp; Loss</h3><table id="plTable"></table></div>
        <div class="card report-block"><h3>Most Profitable Jobs</h3><div id="profitJobs"></div></div>
        <div class="card report-block"><h3>Revenue by Material</h3><div id="materialReport"></div></div>
        <div class="card report-block"><h3>Expense Breakdown</h3><div id="expenseReport"></div></div>
      </div>
    </section>

    <section class="view" id="export">
      <div class="topbar"><div><h1>Export &amp; Backup</h1><div class="subtitle">Take your data into Excel or Google Sheets</div></div></div>
      <div class="export-box">
        <div class="export-option"><h3>Excel Compatible Workbook</h3><p class="muted">Exports Jobs, Customers, Expenses, Inventory, Schedule, and a P&amp;L summary into one multi sheet .xls file.</p><button class="primary" onclick="exportExcel()">Export Workbook</button></div>
        <div class="export-option"><h3>CSV Files</h3><p class="muted">Exports each section as a separate CSV file that opens in Excel or Google Sheets.</p><button class="secondary" onclick="exportCSVs()">Export CSV Files</button></div>
        <div class="export-option"><h3>Backup</h3><p class="muted">Save or restore the full workspace, including every record and setting.</p><button class="secondary" onclick="exportBackup()">Download Backup</button><br><br><input type="file" id="restoreFile" accept=".json" onchange="restoreBackup(event)"></div>
      </div>
    </section>
  </main>
</div>

<div class="modal-wrap" id="modalWrap"><div class="modal"><div class="modal-head"><h2 id="modalTitle"></h2><button class="close" onclick="closeModal()">×</button></div><form id="modalForm"><div class="form-grid" id="modalFields"></div><div class="modal-actions"><button type="button" class="secondary" onclick="closeModal()">Cancel</button><button class="primary" type="submit">Save</button></div></form></div></div>


<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script src="js/config.js"></script>
<script src="js/supabase.js"></script>

<script>
const DB_KEY='capital_marble_workspace_v1';
const DEFAULT_MATERIALS=[
 {id:'mat-luna-pearl',name:'Luna Pearl Granite',type:'Granite',supplier:'',cost:32,sell:62},
 {id:'mat-steel-gray',name:'Steel Gray Granite',type:'Granite',supplier:'',cost:34,sell:64},
 {id:'mat-dallas-white',name:'Dallas White Granite',type:'Granite',supplier:'',cost:30,sell:59},
 {id:'mat-calacatta-gold',name:'Calacatta Gold Quartz',type:'Quartz',supplier:'',cost:44,sell:78},
 {id:'mat-carrara-marmi',name:'Carrara Marmi Quartz',type:'Quartz',supplier:'',cost:39,sell:72},
 {id:'mat-taj-mahal',name:'Taj Mahal Quartzite',type:'Quartzite',supplier:'',cost:66,sell:110}
];
const DEFAULT_RATES={template:3,fabrication:14,install:9,sinkCutoutCost:40,sinkCutoutCharge:175,cooktopCutoutCost:35,cooktopCutoutCharge:150,sinkCost:120,sinkCharge:250,tearoutCost:4,tearoutCharge:8};
let stored;
try{stored=JSON.parse(localStorage.getItem(DB_KEY)||'null')}catch(e){stored=null}
const legacyCustomers=Array.isArray(stored?.customers)?stored.customers:[];
let db={jobs:[],customers:[],expenses:[],inventory:[],materials:DEFAULT_MATERIALS.map(x=>({...x})),rates:{...DEFAULT_RATES},...(stored||{}),customers:[]};
db.jobs=Array.isArray(db.jobs)?db.jobs:[];
db.customers=Array.isArray(db.customers)?db.customers:[];
// Link older jobs to customer records by name when possible.
db.jobs.forEach(j=>{if(!j.customerId&&j.customer){let c=db.customers.find(x=>String(x.name||'').trim().toLowerCase()===String(j.customer||'').trim().toLowerCase());if(c)j.customerId=c.id}});
db.expenses=Array.isArray(db.expenses)?db.expenses:[];
db.inventory=Array.isArray(db.inventory)?db.inventory:[];
db.materials=Array.isArray(db.materials)&&db.materials.length?db.materials:DEFAULT_MATERIALS.map(x=>({...x}));
db.rates={...DEFAULT_RATES,...(db.rates||{})};
if(db.rates.sink!==undefined){db.rates.sinkCutoutCost=db.rates.sinkCutoutCost??db.rates.sink;db.rates.sinkCutoutCharge=db.rates.sinkCutoutCharge??db.rates.sink}
if(db.rates.cooktop!==undefined){db.rates.cooktopCutoutCost=db.rates.cooktopCutoutCost??db.rates.cooktop;db.rates.cooktopCutoutCharge=db.rates.cooktopCutoutCharge??db.rates.cooktop}
if(db.rates.tearout!==undefined){db.rates.tearoutCost=db.rates.tearoutCost??db.rates.tearout;db.rates.tearoutCharge=db.rates.tearoutCharge??db.rates.tearout}
let editing={type:null,id:null};
const modalWrap=document.getElementById('modalWrap');
const modalTitle=document.getElementById('modalTitle');
const modalForm=document.getElementById('modalForm');
const modalFields=document.getElementById('modalFields');
const money=n=>new Intl.NumberFormat('en-US',{style:'currency',currency:'USD'}).format(Number(n||0));
const fmtDate=d=>d?new Date(d+'T00:00:00').toLocaleDateString('en-US'):'—';
const uid=p=>p+'-'+Date.now().toString(36)+Math.random().toString(36).slice(2,6);
function saveLocalWorkspace(){
 const localDb={...db,customers:[]};
 localStorage.setItem(DB_KEY,JSON.stringify(localDb));
}
async function save(){
 saveLocalWorkspace();
 renderAll();
}
function normalizeExistingStatuses(){let changed=false;db.jobs.forEach(j=>{let n=normalizeStatus(j.status);if(j.status!==n){j.status=n;changed=true}});if(changed)saveLocalWorkspace()}
function esc(s){return String(s??'').replace(/[&<>"']/g,m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m]))}
function showView(id){document.querySelectorAll('.view').forEach(x=>x.classList.toggle('active',x.id===id));document.querySelectorAll('.nav button').forEach(x=>x.classList.toggle('active',x.dataset.view===id));window.scrollTo(0,0)}
document.getElementById('nav').onclick=e=>{let b=e.target.closest('button');if(b)showView(b.dataset.view)};
const JOB_STATUSES=['Quote','Scheduled','In Progress','Installed','On Hold','Cancelled'];
const STATUS_FLOW=['Quote','Scheduled','In Progress','Installed'];
function normalizeStatus(s){let map={'Lead':'Quote','Quoted':'Quote','Approved':'Scheduled','Template Scheduled':'Scheduled','Fabrication':'In Progress','Install Scheduled':'In Progress','Completed':'Installed'};return map[s]||s||'Quote'}
function statusClass(s){return {'Quote':'quote','Scheduled':'scheduled','In Progress':'progress','Installed':'installed','On Hold':'hold','Cancelled':'cancelled'}[normalizeStatus(s)]||'quote'}
function statusBadge(s){s=normalizeStatus(s);let c=s==='Installed'?'good':s==='Cancelled'?'bad':['Quote','Scheduled'].includes(s)?'warn':'';return `<span class="badge ${c}">${esc(s)}</span>`}
function statusControl(j){let current=normalizeStatus(j.status);return `<div class="status-control"><button class="status-pill ${statusClass(current)}" title="Click to advance status" onclick="advanceJobStatus('${j.id}')">${esc(current)}</button><select class="status-menu" aria-label="Choose status for ${esc(j.jobNo||j.customer||'job')}" title="Choose any status" onchange="updateJobStatus('${j.id}',this.value);this.selectedIndex=0"><option value="">▾</option>${JOB_STATUSES.map(s=>`<option value="${esc(s)}">${esc(s)}</option>`).join('')}</select></div>`}
function applyInstalledPaymentRule(j,previousStatus){if(normalizeStatus(j.status)!=='Installed'||normalizeStatus(previousStatus)==='Installed')return;let state=paymentState(j);if(state==='no-deposit')j.paymentStatus='not-paid'}
function advanceJobStatus(id){let j=db.jobs.find(x=>x.id===id);if(!j)return;let previous=normalizeStatus(j.status),i=STATUS_FLOW.indexOf(previous);if(i<0)return;j.status=STATUS_FLOW[Math.min(i+1,STATUS_FLOW.length-1)];applyInstalledPaymentRule(j,previous);save()}
function updateJobStatus(id,status){if(!status)return;let j=db.jobs.find(x=>x.id===id);if(!j)return;let previous=normalizeStatus(j.status);j.status=normalizeStatus(status);applyInstalledPaymentRule(j,previous);save()}
function calcJob(j){let revenue=+j.contractAmount||0, cogs=(+j.materialCost||0)+(+j.sinkCost||0)+(+j.laborCost||0)+(+j.otherCost||0), profit=revenue-cogs, balance=revenue-(+j.paid||0);return {revenue,cogs,profit,balance,margin:revenue?profit/revenue:0}}
const PAYMENT_STATES=['no-deposit','deposit','not-paid','paid'];
function paymentState(j){let total=+j.contractAmount||0,paid=+j.paid||0;if(j.paymentStatus&&PAYMENT_STATES.includes(j.paymentStatus)){if(total>0&&paid>=total-.01)return 'paid';return j.paymentStatus}if(total>0&&paid>=total-.01)return 'paid';if(total>0&&Math.abs(paid-total/2)<.01)return 'deposit';if(paid<=0&&normalizeStatus(j.status)==='Installed')return 'not-paid';if(paid<=0)return 'no-deposit';return 'not-paid'}
function paymentLabel(state){return {'no-deposit':'No Deposit','deposit':'50% Deposit','not-paid':'Not Paid','paid':'Paid'}[state]||'No Deposit'}
function paymentClass(state){return state}
function paymentControl(j){let state=paymentState(j);return `<div class="payment-control"><button class="payment-pill ${paymentClass(state)}" title="Click to advance payment status" onclick="advancePaymentStatus('${j.id}')">${paymentLabel(state)}</button><select class="payment-menu" aria-label="Choose payment status for ${esc(j.customer||j.jobNo||'job')}" title="Choose any payment status" onchange="updatePaymentStatus('${j.id}',this.value);this.selectedIndex=0"><option value="">▾</option>${PAYMENT_STATES.map(x=>`<option value="${x}">${paymentLabel(x)}</option>`).join('')}</select></div>`}
function setPaymentState(j,state){let total=+j.contractAmount||0;j.paymentStatus=state;if(state==='paid')j.paid=total.toFixed(2);else if(state==='deposit')j.paid=(total/2).toFixed(2);else if(state==='no-deposit'||state==='not-paid')j.paid='0.00'}
function advancePaymentStatus(id){let j=db.jobs.find(x=>x.id===id);if(!j)return;let current=paymentState(j),i=PAYMENT_STATES.indexOf(current);setPaymentState(j,PAYMENT_STATES[(i+1)%PAYMENT_STATES.length]);save()}
function updatePaymentStatus(id,state){if(!state)return;let j=db.jobs.find(x=>x.id===id);if(!j)return;setPaymentState(j,state);save()}
function paymentCell(j){let c=calcJob(j),paid=+j.paid||0;return `<div class="balance-cell">${paymentControl(j)}<div class="muted">Paid ${money(paid)} · Balance ${money(Math.max(0,c.balance))}</div></div>`}
function activeRevenue(){return db.jobs.filter(j=>normalizeStatus(j.status)==='Installed').reduce((s,j)=>s+calcJob(j).revenue,0)}
function renderDashboard(){
 let relevant=db.jobs.filter(j=>normalizeStatus(j.status)==='Installed'), revenue=relevant.reduce((s,j)=>s+calcJob(j).revenue,0), profit=relevant.reduce((s,j)=>s+calcJob(j).profit,0), owed=db.jobs.reduce((s,j)=>s+Math.max(0,calcJob(j).balance),0);
 let now=new Date(),end=new Date();end.setDate(end.getDate()+14);let upcoming=db.jobs.filter(j=>j.installDate&&new Date(j.installDate+'T00:00:00')>=new Date(now.toDateString())&&new Date(j.installDate+'T00:00:00')<=end&&!['Installed','Cancelled'].includes(normalizeStatus(j.status))).length;
 kpiRevenue.textContent=money(revenue);kpiProfit.textContent=money(profit);kpiMargin.textContent=(revenue?profit/revenue*100:0).toFixed(1)+'% gross margin';kpiOwed.textContent=money(owed);kpiUpcoming.textContent=upcoming;
 let active=db.jobs.filter(j=>!['Installed','Cancelled'].includes(normalizeStatus(j.status))).slice(0,8);
 activeJobs.innerHTML=active.length?`<table><thead><tr><th>Job</th><th>Status</th><th>Install</th><th>Payment</th></tr></thead><tbody>${active.map(j=>`<tr><td><b>${esc(j.customer||j.jobNo)}</b><div class="muted">${esc(j.jobNo)}</div></td><td>${statusControl(j)}</td><td>${fmtDate(j.installDate)}</td><td>${paymentCell(j)}</td></tr>`).join('')}</tbody></table>`:'<div class="empty">No active jobs yet. Add your first job.</div>';
 let att=[];db.jobs.forEach(j=>{let c=calcJob(j);if(c.balance>0&&normalizeStatus(j.status)==='Installed')att.push(`${esc(j.customer)} owes ${money(c.balance)}`);if(j.installDate&&!j.templateDate&&!['Quote','Cancelled'].includes(normalizeStatus(j.status)))att.push(`${esc(j.customer)} has no template date`)});db.inventory.filter(i=>(+i.qty||0)<= (+i.reorderAt||0)).forEach(i=>att.push(`${esc(i.item)} is low in inventory`));
 attention.innerHTML=att.length?att.slice(0,8).map(x=>`<div style="padding:10px 0;border-bottom:1px solid var(--border)">⚠ ${x}</div>`).join(''):'<div class="empty">Nothing urgent right now.</div>';
}
function renderJobs(){
 let q=(jobSearch?.value||'').toLowerCase(),f=jobFilter?.value||'';let rows=db.jobs.filter(j=>(!f||normalizeStatus(j.status)===f)&&JSON.stringify(j).toLowerCase().includes(q));
 jobsTable.innerHTML=rows.length?`<table><thead><tr><th>Job</th><th>Customer</th><th>Status</th><th>Install</th><th>Revenue</th><th>Profit</th><th>Payment</th><th></th></tr></thead><tbody>${rows.map(j=>{let c=calcJob(j);return `<tr><td><b>${esc(j.jobNo)}</b><div class="muted">${esc(j.material||'')}</div></td><td>${esc(j.customer)}</td><td>${statusControl(j)}</td><td>${fmtDate(j.installDate)}</td><td>${money(c.revenue)}</td><td>${money(c.profit)}<div class="muted">${(c.margin*100).toFixed(1)}%</div></td><td>${paymentCell(j)}</td><td class="actions"><button class="link-btn" onclick="editItem('job','${j.id}')">Edit</button><button class="link-btn" onclick="deleteItem('jobs','${j.id}')">Delete</button></td></tr>`}).join('')}</tbody></table>`:'<div class="empty">No jobs found.</div>';
}
function renderSimple(tableEl, rows, headers, body){
 tableEl.innerHTML=rows.length?`<table><thead><tr>${headers.map(h=>`<th>${h}</th>`).join('')}</tr></thead><tbody>${rows.map(body).join('')}</tbody></table>`:'<div class="empty">No records yet.</div>'
}
function customerJobs(c){return db.jobs.filter(j=>j.customerId===c.id||(!j.customerId&&String(j.customer||'').trim().toLowerCase()===String(c.name||'').trim().toLowerCase()))}
function renderCustomers(){renderSimple(customersTable,db.customers,['Customer','Contact','Phone','Email','Address','Jobs','Balance',''],c=>{let jobs=customerJobs(c),balance=jobs.reduce((s,j)=>s+calcJob(j).balance,0);return `<tr><td><b>${esc(c.name)}</b><div class="muted">${esc(c.type||'')}</div></td><td>${esc(c.contact||'')}</td><td>${esc(c.phone||'')}</td><td>${esc(c.email||'')}</td><td>${esc(c.address||'')}</td><td class="customer-stats">${jobs.length}</td><td class="customer-stats">${money(balance)}</td><td class="actions"><button class="primary" style="padding:7px 10px" onclick="createJobForCustomer('${c.id}')">+ Job</button><button class="link-btn" onclick="editItem('customer','${c.id}')">Edit</button><button class="link-btn" onclick="deleteItem('customers','${c.id}')">Delete</button></td></tr>`})}
function createJobForCustomer(id){let c=db.customers.find(x=>x.id===id);if(!c)return;openModal('job',{customerId:c.id,customer:c.name,address:c.address||''})}
function renderExpenses(){renderSimple(expensesTable,db.expenses,['Date','Vendor','Category','Description','Amount',''],e=>`<tr><td>${fmtDate(e.date)}</td><td>${esc(e.vendor||'')}</td><td>${esc(e.category)}</td><td>${esc(e.description||'')}</td><td>${money(e.amount)}</td><td><button class="link-btn" onclick="editItem('expense','${e.id}')">Edit</button><button class="link-btn" onclick="deleteItem('expenses','${e.id}')">Delete</button></td></tr>`)}
function renderInventory(){renderSimple(inventoryTable,db.inventory,['Item','Type','Qty','Unit Cost','Value','Location',''],i=>`<tr><td><b>${esc(i.item)}</b><div class="muted">${esc(i.description||'')}</div></td><td>${esc(i.type)}</td><td>${esc(i.qty||0)} ${esc(i.unit||'')}</td><td>${money(i.unitCost)}</td><td>${money((+i.qty||0)*(+i.unitCost||0))}</td><td>${esc(i.location||'')}</td><td><button class="link-btn" onclick="editItem('inventory','${i.id}')">Edit</button><button class="link-btn" onclick="deleteItem('inventory','${i.id}')">Delete</button></td></tr>`)}
function renderSchedule(){let r=db.jobs.filter(j=>j.templateDate||j.installDate).flatMap(j=>[{date:j.templateDate,type:'Template',j},{date:j.installDate,type:'Install',j}]).filter(x=>x.date).sort((a,b)=>a.date.localeCompare(b.date));renderSimple(scheduleTable,r,['Date','Activity','Job','Customer','Address','Status'],x=>`<tr><td>${fmtDate(x.date)}</td><td>${x.type}</td><td>${esc(x.j.jobNo)}</td><td>${esc(x.j.customer)}</td><td>${esc(x.j.address||'')}</td><td>${statusBadge(x.j.status)}</td></tr>`)}
function renderReports(){
 let r=db.jobs.filter(j=>normalizeStatus(j.status)==='Installed'), revenue=r.reduce((s,j)=>s+calcJob(j).revenue,0), cogs=r.reduce((s,j)=>s+calcJob(j).cogs,0), expenses=db.expenses.reduce((s,e)=>s+(+e.amount||0),0), gp=revenue-cogs, net=gp-expenses;
 plTable.innerHTML=`<tbody><tr><td>Revenue</td><td><b>${money(revenue)}</b></td></tr><tr><td>Cost of Goods Sold</td><td>${money(cogs)}</td></tr><tr><td><b>Gross Profit</b></td><td><b>${money(gp)}</b></td></tr><tr><td>Gross Margin</td><td>${revenue?(gp/revenue*100).toFixed(1):0}%</td></tr><tr><td>Operating Expenses</td><td>${money(expenses)}</td></tr><tr><td><b>Net Operating Profit</b></td><td><b>${money(net)}</b></td></tr></tbody>`;
 let pj=[...r].sort((a,b)=>calcJob(b).profit-calcJob(a).profit).slice(0,8);profitJobs.innerHTML=pj.length?pj.map(j=>`<div style="margin:12px 0"><div style="display:flex;justify-content:space-between"><b>${esc(j.customer)}</b><span>${money(calcJob(j).profit)}</span></div><div class="progress"><span style="width:${Math.max(0,Math.min(100,calcJob(j).margin*100))}%"></span></div><small class="muted">${(calcJob(j).margin*100).toFixed(1)}% margin</small></div>`).join(''):'<div class="empty">No completed jobs yet.</div>';
 let mats={};r.forEach(j=>mats[j.material||'Other']=(mats[j.material||'Other']||0)+calcJob(j).revenue);materialReport.innerHTML=groupBars(mats);
 let ex={};db.expenses.forEach(e=>ex[e.category||'Other']=(ex[e.category||'Other']||0)+(+e.amount||0));expenseReport.innerHTML=groupBars(ex);
}
function groupBars(obj){let arr=Object.entries(obj).sort((a,b)=>b[1]-a[1]),max=Math.max(...arr.map(x=>x[1]),1);return arr.length?arr.map(([k,v])=>`<div style="margin:12px 0"><div style="display:flex;justify-content:space-between"><span>${esc(k)}</span><b>${money(v)}</b></div><div class="progress"><span style="width:${v/max*100}%"></span></div></div>`).join(''):'<div class="empty">No data yet.</div>'}
function renderPricing(){
 if(!window.materialsTable)return;materialsTable.innerHTML=`<table><thead><tr><th>Exact Material / Color</th><th>Type</th><th>Supplier</th><th>Cost / Sq Ft</th><th>Sell / Sq Ft</th><th></th></tr></thead><tbody>${db.materials.map(m=>`<tr><td><b>${esc(m.name)}</b></td><td>${esc(m.type)}</td><td>${esc(m.supplier||'')}</td><td>${money(m.cost)}</td><td>${money(m.sell)}</td><td><button class="link-btn" onclick="editMaterial('${m.id}')">Edit</button><button class="link-btn" onclick="deleteMaterial('${m.id}')">Delete</button></td></tr>`).join('')}</tbody></table>`;
 ['template','fabrication','install','sinkCutoutCost','sinkCutoutCharge','cooktopCutoutCost','cooktopCutoutCharge','sinkCost','sinkCharge','tearoutCost','tearoutCharge'].forEach(k=>{let e=document.getElementById('rate'+k[0].toUpperCase()+k.slice(1));if(e)e.value=db.rates[k]})
}
function saveRates(){['template','fabrication','install','sinkCutoutCost','sinkCutoutCharge','cooktopCutoutCost','cooktopCutoutCharge','sinkCost','sinkCharge','tearoutCost','tearoutCharge'].forEach(k=>{let e=document.getElementById('rate'+k[0].toUpperCase()+k.slice(1));db.rates[k]=+(e?.value||0)});save()}
function addMaterial(){let name=prompt('Exact material or color name:');if(!name)return;let type=prompt('Stone type:', 'Granite')||'Other',cost=+prompt('Your cost per square foot:', '0')||0,sell=+prompt('Default selling price per square foot:', '0')||0,supplier=prompt('Supplier:', '')||'';db.materials.push({id:uid('mat'),name,type,cost,sell,supplier});save()}
function editMaterial(id){let m=db.materials.find(x=>x.id===id);if(!m)return;m.name=prompt('Exact material or color name:',m.name)||m.name;m.type=prompt('Stone type:',m.type)||m.type;m.cost=+prompt('Your cost per square foot:',m.cost)||0;m.sell=+prompt('Default selling price per square foot:',m.sell)||0;m.supplier=prompt('Supplier:',m.supplier||'')??m.supplier;save()}
function deleteMaterial(id){if(confirm('Delete this material from the catalog?')){db.materials=db.materials.filter(x=>x.id!==id);save()}}
function renderAll(){renderDashboard();renderJobs();renderCustomers();renderExpenses();renderInventory();renderPricing();renderSchedule();renderReports()}
const fields={
 job:[['jobNo','Job Number','text'],['customer','Customer / Builder','customer'],['address','Job Address','text'],['material','Exact Material / Color','material'],['materialType','Stone Type','readonly'],['sqft','Square Feet','number'],['sinkCutouts','Sink Cutouts','number'],['cooktopCutouts','Cooktop Cutouts','number'],['sinks','Sinks Supplied','number'],['tearoutSqft','Tear Out Sq Ft','number'],['status','Status','select',['Quote','Scheduled','In Progress','Installed','On Hold','Cancelled']],['templateDate','Template Date','date'],['installDate','Install Date','date'],['contractAmount','Contract Amount','number'],['paid','Payments Received','number'],['materialCost','Material Cost','number'],['sinkCost','Cutouts / Sinks Cost','number'],['laborCost','Labor Cost','number'],['otherCost','Other Direct Cost','number'],['notes','Notes','textarea']],
 customer:[['name','Customer / Builder','text'],['type','Type','select',['Homeowner','Builder','Contractor','Other']],['contact','Contact Name','text'],['phone','Phone','text'],['email','Email','email'],['address','Address','text'],['notes','Notes','textarea']],
 expense:[['date','Date','date'],['vendor','Vendor','text'],['category','Category','select',['Advertising','Bank Fees','Fuel','Insurance','Office Supplies','Professional Services','Repairs & Maintenance','Shop Rent','Software','Telephone & Internet','Tools','Utilities','Wages - Admin','Other']],['description','Description','text'],['amount','Amount','number'],['notes','Notes','textarea']],
 inventory:[['item','Material / Item','text'],['type','Inventory Type','select',['Slab','Remnant','Sink','Faucet','Consumable','Other']],['description','Color / Description','text'],['supplier','Supplier','text'],['qty','Quantity On Hand','number'],['unit','Unit','select',['slabs','pieces','boxes','each','sq ft']],['unitCost','Unit Cost','number'],['location','Location','text'],['reorderAt','Reorder When Qty Reaches','number'],['notes','Notes','textarea']]
};
function openModal(type,item=null){
 editing={type,id:item?._returnToJob?'temp-return':(item?.id||null)};modalTitle.textContent=(item?'Edit ':'New ')+({job:'Job',customer:'Customer',expense:'Expense',inventory:'Inventory Item'}[type]);
 modalFields.innerHTML=fields[type].map(([n,l,t,opts])=>{
   if(t==='customer'){let selectedId=item?.customerId||'';return `<div class="field"><label>${l}</label><div class="customer-picker-row"><input name="${n}" list="customerChoices" autocomplete="off" placeholder="Search name, phone, or address" value="${esc(item?.[n]||'')}" oninput="syncSelectedCustomer()"><button type="button" class="secondary" onclick="openCustomerFromJob()">New</button></div><input type="hidden" name="customerId" value="${esc(selectedId)}"><datalist id="customerChoices">${db.customers.map(c=>`<option value="${esc(c.name)}">${esc([c.contact,c.phone,c.address].filter(Boolean).join(' • '))}</option>`).join('')}</datalist><div class="field-note">Start typing to find a repeat customer. Their job address fills automatically.</div></div>`};
   if(t==='material')return `<div class="field"><label>${l}</label><select name="${n}" onchange="recalcJobForm()"><option value=""></option>${db.materials.map(m=>`<option value="${esc(m.name)}" ${item?.[n]===m.name?'selected':''}>${esc(m.name)} — ${esc(m.type)}</option>`).join('')}</select><div class="field-note">Choose the exact material color, not only the stone type.</div></div>`;
   if(t==='readonly')return `<div class="field"><label>${l}</label><input name="${n}" readonly value="${esc(item?.[n]||'')}"></div>`;
   return `<div class="field ${t==='textarea'?'full':''}"><label>${l}</label>${t==='select'?`<select name="${n}"><option value=""></option>${opts.map(o=>`<option ${item?.[n]===o?'selected':''}>${o}</option>`).join('')}</select>`:t==='textarea'?`<textarea name="${n}">${esc(item?.[n]||'')}</textarea>`:`<input name="${n}" type="${t}" step="${t==='number'?'0.01':''}" value="${esc(item?.[n]||'')}">`}</div>`
 }).join('');
 if(type==='job'){
   modalFields.insertAdjacentHTML('beforeend',`<div class="calc-box"><b>Automatic Job Estimate</b><div class="calc-grid" style="margin-top:10px"><div class="calc-item"><small>Material Cost</small><b id="autoMaterial">$0</b></div><div class="calc-item"><small>Labor &amp; Add On Cost</small><b id="autoLabor">$0</b></div><div class="calc-item"><small>Suggested Price</small><b id="autoSell">$0</b></div><div class="calc-item"><small>Estimated Profit</small><b id="autoProfit">$0</b></div></div><div class="field-note" style="margin-top:8px">Calculated amounts can still be changed manually before saving.</div></div>`);
   ['sqft','sinkCutouts','cooktopCutouts','sinks','tearoutSqft'].forEach(n=>modalFields.querySelector(`[name="${n}"]`)?.addEventListener('input',recalcJobForm));
   setTimeout(()=>recalcJobForm(!item),0);
 }
 modalWrap.classList.add('open')
}
function syncSelectedCustomer(){if(editing.type!=='job')return;let name=modalFields.querySelector('[name="customer"]')?.value.trim()||'',hidden=modalFields.querySelector('[name="customerId"]'),c=db.customers.find(x=>String(x.name||'').trim().toLowerCase()===name.toLowerCase());if(hidden)hidden.value=c?.id||'';if(c){let address=modalFields.querySelector('[name="address"]');if(address&&!address.value)address.value=c.address||''}}
function openCustomerFromJob(){let name=modalFields.querySelector('[name="customer"]')?.value||'',address=modalFields.querySelector('[name="address"]')?.value||'';closeModal();openModal('customer',{name,address,_returnToJob:true})}
function recalcJobForm(writeValues=true){
 if(editing.type!=='job')return;let f=modalFields,mat=db.materials.find(m=>m.name===f.querySelector('[name="material"]')?.value),sq=+(f.querySelector('[name="sqft"]')?.value||0),sinkCutouts=+(f.querySelector('[name="sinkCutouts"]')?.value||0),cooktopCutouts=+(f.querySelector('[name="cooktopCutouts"]')?.value||0),sinks=+(f.querySelector('[name="sinks"]')?.value||0),tear=+(f.querySelector('[name="tearoutSqft"]')?.value||0);
 let material=mat?sq*mat.cost:0;
 let baseLabor=sq*(+db.rates.template + +db.rates.fabrication + +db.rates.install);
 let tearoutCost=tear*(+db.rates.tearoutCost);
 let addOnCost=sinkCutouts*(+db.rates.sinkCutoutCost)+cooktopCutouts*(+db.rates.cooktopCutoutCost)+sinks*(+db.rates.sinkCost);
 let labor=baseLabor+tearoutCost;
 let addOnCharges=sinkCutouts*(+db.rates.sinkCutoutCharge)+cooktopCutouts*(+db.rates.cooktopCutoutCharge)+sinks*(+db.rates.sinkCharge)+tear*(+db.rates.tearoutCharge);
 let sell=mat?sq*mat.sell+addOnCharges:addOnCharges;
 if(f.querySelector('[name="materialType"]'))f.querySelector('[name="materialType"]').value=mat?.type||'';
 if(writeValues){if(f.querySelector('[name="materialCost"]'))f.querySelector('[name="materialCost"]').value=material.toFixed(2);if(f.querySelector('[name="laborCost"]'))f.querySelector('[name="laborCost"]').value=labor.toFixed(2);if(f.querySelector('[name="sinkCost"]'))f.querySelector('[name="sinkCost"]').value=addOnCost.toFixed(2);if(f.querySelector('[name="contractAmount"]'))f.querySelector('[name="contractAmount"]').value=sell.toFixed(2)}
 if(window.autoMaterial){autoMaterial.textContent=money(material);autoLabor.textContent=money(labor+addOnCost);autoSell.textContent=money(sell);autoProfit.textContent=money(sell-material-labor-addOnCost)}
}
function closeModal(){modalWrap.classList.remove('open')}
function editItem(type,id){let key={job:'jobs',customer:'customers',expense:'expenses',inventory:'inventory'}[type];openModal(type,db[key].find(x=>x.id===id))}
async function deleteItem(key,id){
 if(!confirm('Delete this record?'))return;
 if(key==='customers'){
   try{
     await window.CMGCustomers.remove(id);
     db.customers=db.customers.filter(x=>x.id!==id);
     renderAll();
   }catch(error){alert('Customer could not be deleted. '+error.message)}
   return;
 }
 db[key]=db[key].filter(x=>x.id!==id);
 save();
}
modalForm.addEventListener('submit',async e=>{
 e.preventDefault();
 const key={job:'jobs',customer:'customers',expense:'expenses',inventory:'inventory'}[editing.type];
 if(!key||!Array.isArray(db[key])){alert('Unable to save this record. Please reopen the form.');return}
 const obj=Object.fromEntries(new FormData(modalForm).entries());
 let returnToJob=false;
 if(editing.type==='job'&&obj.customer){let c=db.customers.find(x=>x.id===obj.customerId)||db.customers.find(x=>String(x.name||'').trim().toLowerCase()===String(obj.customer||'').trim().toLowerCase());if(c){obj.customerId=c.id;obj.customer=c.name;if(!obj.address)obj.address=c.address||''}}
 if(editing.type==='customer'&&editing.id&&String(editing.id).startsWith('temp-'))returnToJob=true;
 if(editing.type==='customer'){
   try{
     const savedCustomer=await window.CMGCustomers.save(obj,editing.id&&!String(editing.id).startsWith('temp-')?editing.id:null);
     obj.id=savedCustomer.id;
     const i=db.customers.findIndex(x=>x.id===obj.id);
     if(i>=0)db.customers[i]=savedCustomer;else db.customers.unshift(savedCustomer);
     renderAll();
   }catch(error){alert('Customer could not be saved. '+error.message);return}
 }else if(editing.id&&!String(editing.id).startsWith('temp-')){
   const i=db[key].findIndex(x=>x.id===editing.id);
   if(i>=0)db[key][i]={...db[key][i],...obj};
 }else{
   obj.id=uid(editing.type);
   if(editing.type==='job'&&!obj.jobNo)obj.jobNo='JOB-'+String(db.jobs.length+1).padStart(4,'0');
   db[key].unshift(obj);
 }
 if(editing.type!=='customer')save();closeModal();
 if(returnToJob&&editing.type==='customer'){openModal('job',{customerId:obj.id,customer:obj.name,address:obj.address||''});return}
 if(editing.type==='job')showView('jobs');
});
function download(name,content,type='text/plain'){let a=document.createElement('a');a.href=URL.createObjectURL(new Blob([content],{type}));a.download=name;a.click();setTimeout(()=>URL.revokeObjectURL(a.href),1000)}
function rowsFor(type){if(type==='Jobs')return db.jobs.map(j=>{let c=calcJob(j);return {...j,totalRevenue:c.revenue,totalCOGS:c.cogs,grossProfit:c.profit,grossMargin:(c.margin*100).toFixed(1)+'%',balanceDue:c.balance}});if(type==='Customers')return db.customers;if(type==='Expenses')return db.expenses;if(type==='Inventory')return db.inventory.map(i=>({...i,inventoryValue:(+i.qty||0)*(+i.unitCost||0)}));if(type==='Schedule')return db.jobs.flatMap(j=>[{date:j.templateDate,activity:'Template',jobNo:j.jobNo,customer:j.customer,address:j.address,status:j.status},{date:j.installDate,activity:'Install',jobNo:j.jobNo,customer:j.customer,address:j.address,status:j.status}]).filter(x=>x.date);return []}
function csv(rows){if(!rows.length)return '';let heads=[...new Set(rows.flatMap(Object.keys))].filter(x=>x!=='id');let q=v=>'"'+String(v??'').replace(/"/g,'""')+'"';return heads.map(q).join(',')+'\n'+rows.map(r=>heads.map(h=>q(r[h])).join(',')).join('\n')}
function exportCSVs(){['Jobs','Customers','Expenses','Inventory','Schedule'].forEach((s,i)=>setTimeout(()=>download('Capital_Marble_'+s+'.csv',csv(rowsFor(s)),'text/csv'),i*250))}
function xmlEscape(v){return String(v??'').replace(/[<>&'"]/g,c=>({'<':'&lt;','>':'&gt;','&':'&amp;',"'":'&apos;','"':'&quot;'}[c]))}
function sheetXML(name,rows){let heads=rows.length?[...new Set(rows.flatMap(Object.keys))].filter(x=>x!=='id'):['No Data'];let row=x=>'<Row>'+x.map(v=>`<Cell><Data ss:Type="${typeof v==='number'?'Number':'String'}">${xmlEscape(v)}</Data></Cell>`).join('')+'</Row>';return `<Worksheet ss:Name="${xmlEscape(name)}"><Table>${row(heads)}${rows.map(r=>row(heads.map(h=>r[h]))).join('')}</Table></Worksheet>`}
function exportExcel(){let completed=db.jobs.filter(j=>normalizeStatus(j.status)==='Installed'),revenue=completed.reduce((s,j)=>s+calcJob(j).revenue,0),cogs=completed.reduce((s,j)=>s+calcJob(j).cogs,0),expenses=db.expenses.reduce((s,e)=>s+(+e.amount||0),0);let pl=[{Account:'Revenue',Amount:revenue},{Account:'Cost of Goods Sold',Amount:cogs},{Account:'Gross Profit',Amount:revenue-cogs},{Account:'Operating Expenses',Amount:expenses},{Account:'Net Operating Profit',Amount:revenue-cogs-expenses}];let xml=`<?xml version="1.0"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">${sheetXML('P&L',pl)}${['Jobs','Customers','Expenses','Inventory','Schedule'].map(s=>sheetXML(s,rowsFor(s))).join('')}</Workbook>`;download('Capital_Marble_Workspace_Export.xls',xml,'application/vnd.ms-excel')}
function exportBackup(){download('Capital_Marble_Backup.json',JSON.stringify(db,null,2),'application/json')}
function restoreBackup(e){let f=e.target.files[0];if(!f)return;let r=new FileReader();r.onload=async()=>{try{let x=JSON.parse(r.result);if(!x.jobs||!x.customers)throw Error();let restoredCustomers=Array.isArray(x.customers)?x.customers:[];db={...x,customers:db.customers};await window.CMGCustomers.importMany(restoredCustomers);db.customers=await window.CMGCustomers.list();await save();alert('Backup restored.')}catch(error){alert('That backup could not be restored. '+(error.message||''))}};r.readAsText(f)}
async function startWorkspace(){
 normalizeExistingStatuses();
 renderAll();
 try{
   db.customers=await window.CMGCustomers.initialize(legacyCustomers);
   renderAll();
 }catch(error){
   console.error(error);
   alert('Customers could not connect to Supabase. Check js/config.js and confirm the customers table was created.');
 }
}
startWorkspace();
</script>


</body>
</html>