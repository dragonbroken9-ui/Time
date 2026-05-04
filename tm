<!DOCTYPE html>
<html>
<head>
    <title>💀 SYSTEM PAYROLL v2.0 🖥️</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * { box-sizing: border-box; }
        body { 
            font-family: 'Courier New', Courier, monospace; 
            padding: 5px; 
            margin: 0; 
            background: #000000; 
            color: #00ff41;
        }
        .container { 
            max-width: 100%; 
            margin: auto; 
            background: #0a0a0a; 
            padding: 10px; 
            border-radius: 5px; 
            box-shadow: 0 0 15px #00ff41, 0 0 30px rgba(0,255,65,0.5);
            border: 2px solid #00ff41;
        }
        h1 { 
            text-align: center; 
            color: #ff003c; 
            margin: 5px 0; 
            font-size: 20px;
            font-weight: bold;
            text-shadow: 0 0 10px #ff003c;
        }
        h2 { font-size: 16px; margin: 8px 0; color: #00ff41; }
        h3 { font-size: 14px; margin: 5px 0; color: #00ff41; }
        
        /* --- HEADER STYLE --- */
        .header-bar {
            background: linear-gradient(to right, #111, #222);
            color: #00ff41;
            padding: 10px;
            text-align: center;
            border-radius: 4px;
            border: 2px solid #ff003c;
            margin-bottom: 10px;
            box-shadow: inset 0 0 10px #ff003c;
        }
        .header-bar p { margin: 0; font-size: 12px; opacity: 0.8; color: #aaa; }

        .cutoff { 
            background: #111; 
            padding: 10px; 
            border-radius: 5px; 
            margin-bottom: 10px; 
            border: 2px solid #00ff41;
            box-shadow: inset 0 0 10px #00ff41;
        }
        .row { 
            display: flex; 
            gap: 8px; 
            flex-wrap: wrap; 
            margin-bottom: 8px; 
        }
        .col { 
            flex: 1; 
            min-width: 120px; 
        }
        label { 
            font-size: 11px; 
            font-weight: bold; 
            color: #00ff41;
        }
        input { 
            width: 100%; 
            padding: 8px; 
            margin-top: 2px; 
            background: #000;
            color: #00ff41;
            border: 2px solid #00ff41; 
            border-radius: 3px; 
            font-size: 12px;
            font-family: 'Courier New', monospace;
            box-shadow: 0 0 5px #00ff41;
        }
        input:focus {
            outline: none;
            box-shadow: 0 0 10px #ff003c;
            border-color: #ff003c;
        }
        button { 
            padding: 8px 12px; 
            background: #111; 
            color: #00ff41; 
            border: 2px solid #00ff41;
            border-radius: 3px; 
            cursor: pointer; 
            margin-right: 3px;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 11px;
            font-family: 'Courier New', monospace;
            box-shadow: 0 0 8px #00ff41;
            transition: all 0.2s;
        }
        button:hover {
            background: #00ff41;
            color: #000;
        }
        .btn-green { background: #000; border-color: #00ff41; color: #00ff41; }
        .btn-red { background: #000; border-color: #ff003c; color: #ff003c; box-shadow: 0 0 8px #ff003c; }
        .btn-red:hover { background: #ff003c; color: #000; }
        .btn-blue { background: #000; border-color: #0088ff; color: #0088ff; }
        .btn-orange { background: #000; border-color: #ff9900; color: #ff9900; }

        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 10px; 
            font-size: 9px; 
            border: 2px solid #00ff41;
            box-shadow: 0 0 10px rgba(0,255,65,0.3);
        }
        th, td { 
            border: 1px solid #00ff41; 
            padding: 4px 2px; 
            text-align: center; 
        }
        th { 
            background: #000; 
            color: #ff003c; 
            font-weight: bold;
            text-shadow: 0 0 5px #ff003c;
        }
        
        /* --- SUMMARY BOX --- */
        .summary { 
            background: #000; 
            padding: 12px; 
            margin-top: 12px; 
            border-radius: 5px; 
            border: 2px solid #00ff41;
            box-shadow: inset 0 0 10px #00ff41;
        }
        .total { 
            font-weight: bold; 
            margin: 5px 0; 
            font-size: 12px;
            color: #00ff41;
        }
        .netpay { 
            font-size: 16px; 
            color: #ff003c; 
            font-weight: bold; 
            text-align: center;
            background: #000;
            padding: 10px;
            border-radius: 4px;
            border: 2px solid #ff003c;
            margin-top: 8px;
            text-shadow: 0 0 10px #ff003c;
            box-shadow: inset 0 0 10px #ff003c;
        }
        .deductions { 
            background: #111; 
            padding: 10px; 
            border-radius: 6px; 
            margin-top:10px;
            border: 1px solid #ffcc00;
        }

        /* --- PAYSLIP DESIGN --- */
        #payslipArea { 
            display: none; 
            background: #000000; 
            border: 3px solid #00ff41; 
            padding: 15px; 
            margin-top: 15px; 
            box-shadow: 0 0 20px #00ff41;
        }
        .payslip-header { 
            text-align: center; 
            margin-bottom: 15px; 
        }
        .payslip-table { 
            width: 100%; 
            border-collapse: collapse; 
        }
        .payslip-table td, .payslip-table th { 
            border: 1px solid #00ff41; 
            padding: 8px; 
        }
        .payslip-total { 
            text-align: right; 
            font-weight: bold; 
            font-size: 16px; 
            color: #ff003c; 
            text-shadow: 0 0 8px #ff003c;
        }

        /* --- HISTORY PAGE --- */
        #historyPage { display: none; }
        .history-controls { 
            background: #111; 
            padding: 10px; 
            border-radius: 6px; 
            margin-bottom: 8px;
            border: 1px solid #00ff41;
        }
        .history-item { 
            background: #0a0a0a; 
            border: 2px solid #00ff41; 
            padding: 10px; 
            margin: 8px 0; 
            border-radius: 6px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .history-item:hover { 
            background: #111; 
            border-color: #ff003c;
            box-shadow: 0 0 10px #ff003c;
        }

        @media print {
            body * { visibility: hidden; }
            #payslipArea, #payslipArea * { visibility: visible; }
            #payslipArea { position: absolute; left: 0; top: 0; width: 100%; background: white; color: black; border: 1px solid black; }
            #payslipArea th, #payslipArea td { border: 1px solid black; color: black; text-shadow: none; }
            button { display: none; }
        }

        @media (max-width: 480px) {
            .col { min-width: 110px; }
            table { font-size: 8px; }
            th, td { padding: 3px 1px; }
            button { padding: 6px 8px; font-size: 10px; }
            .summary { padding: 10px; }
        }

        /* SCROLL */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #000;
        }
        ::-webkit-scrollbar-thumb {
            background: #00ff41;
            box-shadow: 0 0 10px #00ff41;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-bar">
        <h1>💀 SECURE PAYROLL SYSTEM v2.0 🖥️</h1>
        <p>DATA ENCRYPTED • ACCESS GRANTED • COMPUTATION INITIATED</p>
    </div>

    <button onclick="showPage('main')" class="btn-blue">📝 MAIN TERMINAL</button>
    <button onclick="showPage('history')" class="btn-orange">📜 LOGS HISTORY</button>
    <hr style="border: 1px solid #ff003c; margin: 8px 0; box-shadow: 0 0 5px #ff003c;">

    <!-- ============================================== -->
    <!-- ================= MAIN PAGE ================== -->
    <!-- ============================================== -->
    <div id="mainPage">

        <!-- CUT OFF SETTING -->
        <div class="cutoff">
            <h3>📅 SET PERIOD RANGE</h3>
            <div class="row">
                <div class="col">
                    <label>FROM:</label>
                    <input type="date" id="fromDate">
                </div>
                <div class="col">
                    <label>TO:</label>
                    <input type="date" id="toDate">
                </div>
                <div class="col">
                    <label>USER ID / NAME:</label>
                    <input type="text" id="empName" placeholder="Enter Identity">
                </div>
            </div>
        </div>

        <!-- INPUT AREA -->
        <div class="input-area">
            <div class="row">
                <div class="col">
                    <label>DATE IN:</label>
                    <input type="date" id="datein">
                </div>
                <div class="col">
                    <label>TIME IN:</label>
                    <input type="time" id="timein">
                </div>
                <div class="col">
                    <label>DATE OUT:</label>
                    <input type="date" id="dateout">
                </div>
                <div class="col">
                    <label>TIME OUT:</label>
                    <input type="time" id="timeout">
                </div>
            </div>
            
            <div class="row">
                <div class="col">
                    <label>RATE / DAY (₱):</label>
                    <input type="number" id="dailyrate" value="600">
                </div>
                <div class="col">
                    <label>OT MULTIPLIER:</label>
                    <input type="number" id="otrate" value="1.3" step="0.01">
                </div>
                <div class="col">
                    <label>NSD MULTIPLIER:</label>
                    <input type="number" id="nsdrate" value="0.10" step="0.01">
                </div>
                <div class="col">
                    <label>BREAK TIME:</label>
                    <input type="text" value="1 HR (DEDUCTED)" disabled style="background:#111;">
                </div>
            </div>

            <button onclick="addRecord()" class="btn-green">➕ UPLOAD DATA</button>
            <button onclick="saveCutoff()" class="btn-green">💾 SAVE TO DATABASE</button>
            <button onclick="generatePayslip()">📄 GENERATE REPORT</button>
            <button onclick="clearAll()" class="btn-red">🗑️ WIPE SYSTEM</button>
        </div>

        <table id="dtrTable">
            <thead>
                <tr>
                    <th>DATE</th>
                    <th>T IN</th>
                    <th>T OUT</th>
                    <th>TOT HRS</th>
                    <th>WRK HRS</th>
                    <th>REG</th>
                    <th>OT</th>
                    <th>NSD</th>
                    <th>REG PAY</th>
                    <th>OT PAY</th>
                    <th>NSD PAY</th>
                    <th>DAILY TOTAL</th>
                </tr>
            </thead>
            <tbody id="tableBody">
            </tbody>
        </table>
        <!-- SUMMARY -->
        <div class="summary">
            <h2>📊 SYSTEM ANALYTICS</h2>
            <hr style="border:1px solid #ff003c; margin:5px 0;">
            <p class="total">🟢 TOTAL REGULAR HOURS: <span id="totalHours">0.00</span> hrs</p>
            <p class="total">🟢 TOTAL OT HOURS: <span id="totalOT">0.00</span> hrs</p>
            <p class="total">🟢 TOTAL NSD HOURS: <span id="totalNSD">0.00</span> hrs</p>
            <p class="total">💰 GROSS PAY: ₱ <span id="grossPay">0.00</span></p>

            <div class="deductions">
                <h3>🔌 DEDUCTIONS CONFIG</h3>
                <div class="row">
                    <div class="col">
                        <label>SSS:</label>
                        <input type="number" id="sss" value="0" min="0">
                    </div>
                    <div class="col">
                        <label>PHILHEALTH:</label>
                        <input type="number" id="philhealth" value="0" min="0">
                    </div>
                    <div class="col">
                        <label>PAG-IBIG:</label>
                        <input type="number" id="pagibig" value="0" min="0">
                    </div>
                    <div class="col">
                        <label>OTHERS:</label>
                        <input type="number" id="others" value="0" min="0">
                    </div>
                </div>
                <button onclick="updateDeductions()" class="btn-blue">🔄 UPDATE</button>
            </div>

            <p class="total">⚠️ TOTAL DEDUCTIONS: ₱ <span id="totalDeduc">0.00</span></p>
            <p class="netpay">💳 NET PAY: ₱ <span id="netPay">0.00</span></p>
        </div>
    </div>

    <!-- ============================================== -->
    <!-- ================ HISTORY PAGE ================ -->
    <!-- ============================================== -->
    <div id="historyPage">
        <h2>📜 ARCHIVE LOGS</h2>
        <div class="history-controls">
            <label>🔍 SEARCH BY NAME:</label>
            <input type="text" id="searchName" placeholder="Enter User ID..." oninput="searchHistory()">
        </div>
        <div id="historyList">
            <!-- Saved records will appear here -->
        </div>
    </div>

    <!-- ============================================== -->
    <!-- ================ PAYSLIP AREA ================ -->
    <!-- ============================================== -->
    <div id="payslipArea">
        <div class="payslip-header">
            <h1>💀 SYSTEM GENERATED REPORT 💻</h1>
            <h2>PAYSLIP / SALARY SLIP</h2>
            <p id="payslipPeriod">PERIOD: ---</p>
            <p id="payslipName">EMPLOYEE: ---</p>
        </div>

        <table class="payslip-table">
            <tr>
                <th>DESCRIPTION</th>
                <th>AMOUNT</th>
                <th>DEDUCTIONS</th>
            </tr>
            <tr>
                <td>Regular Pay</td>
                <td id="psReg">₱ 0.00</td>
                <td></td>
            </tr>
            <tr>
                <td>OT Pay</td>
                <td id="psOT">₱ 0.00</td>
                <td></td>
            </tr>
            <tr>
                <td>NSD Pay</td>
                <td id="psNSD">₱ 0.00</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>SSS: <span id="psSSS">₱ 0.00</span></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>PhilHealth: <span id="psPhil">₱ 0.00</span></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>Pag-IBIG: <span id="psPag">₱ 0.00</span></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>Others: <span id="psOthers">₱ 0.00</span></td>
            </tr>
            <tr>
                <td class="payslip-total">GROSS PAY</td>
                <td class="payslip-total" id="psGross">₱ 0.00</td>
                <td class="payslip-total">TOTAL DED: <span id="psTotalDeduc">₱ 0.00</span></td>
            </tr>
        </table>

        <div class="payslip-total" style="margin-top:20px; font-size:22px;">
            NET PAY: ₱ <span id="psNet">0.00</span>
        </div>

        <br>
        <button onclick="printPayslip()" class="btn-green">🖨️ PRINT REPORT</button>
        <button onclick="closePayslip()" class="btn-red">❌ CLOSE TERMINAL</button>
    </div>

</div>

<script>
let tableData = [];
let currentGross = 0;

// Show/Hide Pages
function showPage(page) {
    document.getElementById('mainPage').style.display = (page == 'main') ? 'block' : 'none';
    document.getElementById('historyPage').style.display = (page == 'history') ? 'block' : 'none';
    if(page == 'history') loadHistory();
}

// Compute Time
function computeTime(timeIn, timeOut) {
    let start = new Date('1/1/2000 ' + timeIn);
    let end = new Date('1/1/2000 ' + timeOut);
    if(end < start) end.setDate(end.getDate() + 1);
    let diff = (end - start) / 1000 / 60 / 60;
    let workHrs = diff - 1; // minus 1hr break
    return { total: diff, work: workHrs };
}

// Add Record
function addRecord() {
    let dtIn = document.getElementById('datein').value;
    let tIn = document.getElementById('timein').value;
    let dtOut = document.getElementById('dateout').value;
    let tOut = document.getElementById('timeout').value;
    let rate = parseFloat(document.getElementById('dailyrate').value) || 0;
    let otMult = parseFloat(document.getElementById('otrate').value) || 1.3;
    let nsdMult = parseFloat(document.getElementById('nsdrate').value) || 0.10;

    if(!dtIn || !tIn || !dtOut || !tOut) { alert("⚠️ INCOMPLETE DATA!"); return; }

    let hrs = computeTime(tIn, tOut);
    let regHrs = Math.min(hrs.work, 8);
    let otHrs = Math.max(hrs.work - 8, 0);
    let nsdHrs = 0; // You can add logic here if needed

    let ratePerHr = rate / 8;
    let regPay = regHrs * ratePerHr;
    let otPay = otHrs * ratePerHr * otMult;
    let nsdPay = nsdHrs * ratePerHr * nsdMult;
    let dailyTotal = regPay + otPay + nsdPay;

    let row = {
        dtIn, tIn, dtOut, tOut,
        totalHrs: hrs.total.toFixed(2),
        workHrs: hrs.work.toFixed(2),
        regHrs: regHrs.toFixed(2),
        otHrs: otHrs.toFixed(2),
        nsdHrs: nsdHrs.toFixed(2),
        regPay: regPay.toFixed(2),
        otPay: otPay.toFixed(2),
        nsdPay: nsdPay.toFixed(2),
        dailyTotal: dailyTotal.toFixed(2)
    };

    tableData.push(row);
    updateTable();
}

function updateTable() {
    let tbody = document.getElementById('tableBody');
    tbody.innerHTML = '';
    let totalH=0, totalOT=0, totalNSD=0, gross=0;

    tableData.forEach((r, i) => {
        totalH += parseFloat(r.regHrs);
        totalOT += parseFloat(r.otHrs);
        totalNSD += parseFloat(r.nsdHrs);
        gross += parseFloat(r.dailyTotal);

        let tr = tbody.insertRow();
        tr.innerHTML = `
            <td>${r.dtIn}</td>
            <td>${r.tIn}</td>
            <td>${r.tOut}</td>
            <td>${r.totalHrs}</td>
            <td>${r.workHrs}</td>
            <td>${r.regHrs}</td>
            <td>${r.otHrs}</td>
            <td>${r.nsdHrs}</td>
            <td>${parseFloat(r.regPay).toFixed(2)}</td>
            <td>${parseFloat(r.otPay).toFixed(2)}</td>
            <td>${parseFloat(r.nsdPay).toFixed(2)}</td>
            <td><b>${parseFloat(r.dailyTotal).toFixed(2)}</b></td>
        `;
    });

    currentGross = gross;
    document.getElementById('totalHours').innerText = totalH.toFixed(2);
    document.getElementById('totalOT').innerText = totalOT.toFixed(2);
    document.getElementById('totalNSD').innerText = totalNSD.toFixed(2);
    document.getElementById('grossPay').innerText = gross.toFixed(2);
    updateDeductions();
}

function updateDeductions() {
    let sss = parseFloat(document.getElementById('sss').value) || 0;
    let ph = parseFloat(document.getElementById('philhealth').value) || 0;
    let pg = parseFloat(document.getElementById('pagibig').value) || 0;
    let ot = parseFloat(document.getElementById('others').value) || 0;
    let total = sss + ph + pg + ot;
    let net = currentGross - total;

    document.getElementById('totalDeduc').innerText = total.toFixed(2);
    document.getElementById('netPay').innerText = net.toFixed(2);
}

// SAVE TO LOCAL STORAGE
function saveCutoff() {
    let name = document.getElementById('empName').value;
    let from = document.getElementById('fromDate').value;
    let to = document.getElementById('toDate').value;
    if(!name || !from || !to) { alert("⚠️ INPUT NAME & DATES!"); return; }
    if(tableData.length == 0) { alert("⚠️ NO DATA TO UPLOAD!"); return; }

    let dataObj = {
        id: Date.now(),
        name: name,
        period: from + " to " + to,
        records: tableData,
        gross: currentGross,
        sss: parseFloat(document.getElementById('sss').value) || 0,
        philhealth: parseFloat(document.getElementById('philhealth').value) || 0,
        pagibig: parseFloat(document.getElementById('pagibig').value) || 0,
        others: parseFloat(document.getElementById('others').value) || 0
    };

    let allData = JSON.parse(localStorage.getItem('payrollDB') || '[]');
    allData.push(dataObj);
    localStorage.setItem('payrollDB', JSON.stringify(allData));

    alert("✅ DATA UPLOADED TO DATABASE!");
}

// LOAD HISTORY
function loadHistory() {
    let allData = JSON.parse(localStorage.getItem('payrollDB') || '[]');
    let list = document.getElementById('historyList');
    list.innerHTML = '';

    allData.forEach((item, index) => {
        let totalDeduc = item.sss + item.philhealth + item.pagibig + item.others;
        let net = item.gross - totalDeduc;
        let div = document.createElement('div');
        div.className = 'history-item';
        div.innerHTML = `
            <h3>🆔 ${item.name}</h3>
            <p>📅 ${item.period}</p>
            <p>💰 Gross: ₱${item.gross.toFixed(2)} | 📉 Deductions: ₱${totalDeduc.toFixed(2)} | ✅ Net: ₱${net.toFixed(2)}</p>
            <button onclick="loadRecord(${index})" class="btn-green">📂 LOAD</button>
            <button onclick="deleteRecord(${index})" class="btn-red">🗑️ DELETE</button>
        `;
        list.appendChild(div);
    });
}

function loadRecord(index) {
    let allData = JSON.parse(localStorage.getItem('payrollDB') || '[]');
    let item = allData[index];
    
    tableData = item.records;
    currentGross = item.gross;
    document.getElementById('empName').value = item.name;
    document.getElementById('fromDate').value = item.period.split(' to ')[0];
    document.getElementById('toDate').value = item.period.split(' to ')[1];
    document.getElementById('sss').value = item.sss;
    document.getElementById('philhealth').value = item.philhealth;
    document.getElementById('pagibig').value = item.pagibig;
    document.getElementById('others').value = item.others;

    updateTable();
    showPage('main');
}

function deleteRecord(index) {
    if(!confirm("⚠️ CONFIRM DATA DELETION?")) return;
    let allData = JSON.parse(localStorage.getItem('payrollDB') || '[]');
    allData.splice(index,1);
    localStorage.setItem('payrollDB', JSON.stringify(allData));
    loadHistory();
}

function searchHistory() {
    let txt = document.getElementById('searchName').value.toLowerCase();
    document.querySelectorAll('.history-item').forEach(el => {
        el.style.display = el.innerText.toLowerCase().includes(txt) ? 'block' : 'none';
    });
}

// GENERATE PAYSLIP
function generatePayslip() {
    let sss = parseFloat(document.getElementById('sss').value) || 0;
    let ph = parseFloat(document.getElementById('philhealth').value) || 0;
    let pg = parseFloat(document.getElementById('pagibig').value) || 0;
    let ot = parseFloat(document.getElementById('others').value) || 0;
    let totalDeduc = sss + ph + pg + ot;
    let net = currentGross - totalDeduc;

    document.getElementById('payslipName').innerText = "USER ID: " + document.getElementById('empName').value;
    document.getElementById('payslipPeriod').innerText = "PERIOD: " + document.getElementById('fromDate').value + " TO " + document.getElementById('toDate').value;

    document.getElementById('psReg').innerText = "₱ " + (currentGross - (parseFloat(document.getElementById('totalOT').innerText)*((parseFloat(document.getElementById('dailyrate').value)/8)*1.3) - parseFloat(document.getElementById('totalNSD').innerText)*((parseFloat(document.getElementById('dailyrate').value)/8)*0.10))).toFixed(2);
    document.getElementById('psOT').innerText = "₱ " + (parseFloat(document.getElementById('totalOT').innerText)*((parseFloat(document.getElementById('dailyrate').value)/8)*1.3)).toFixed(2);
    document.getElementById('psNSD').innerText = "₱ " + (parseFloat(document.getElementById('totalNSD').innerText)*((parseFloat(document.getElementById('dailyrate').value)/8)*0.10)).toFixed(2);
    document.getElementById('psGross').innerText = "₱ " + currentGross.toFixed(2);

    document.getElementById('psSSS').innerText = "₱ " + sss.toFixed(2);
    document.getElementById('psPhil').innerText = "₱ " + ph.toFixed(2);
    document.getElementById('psPag').innerText = "₱ " + pg.toFixed(2);
    document.getElementById('psOthers').innerText = "₱ " + ot.toFixed(2);
    document.getElementById('psTotalDeduc').innerText
    document.getElementById('psNet').innerText = net.toFixed(2);

    document.getElementById('payslipArea').style.display = 'block';
    window.scrollTo(0, document.getElementById('payslipArea').offsetTop);
}

function closePayslip() {
    document.getElementById('payslipArea').style.display = 'none';
}

function printPayslip() {
    window.print();
}

function clearAll() {
    if(confirm("⚠️ WIPE ALL CURRENT DATA?")) {
        tableData = [];
        document.getElementById('tableBody').innerHTML = '';
        document.getElementById('grossPay').innerText = '0.00';
        updateDeductions();
    }
}

// Initialize
window.onload = function() {
    showPage('main');
};
</script>

</body>
</html>
