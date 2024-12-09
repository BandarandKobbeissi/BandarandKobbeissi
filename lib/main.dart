import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),MaterialApp(
      debugShowCheckedModeBanner: false, 
)
      home: PayrollManager(),
    );
  }
}

class PayrollManager extends StatefulWidget {
  @override
  _PayrollManagerState createState() => _PayrollManagerState();
}

class _PayrollManagerState extends State<PayrollManager> {
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _bonusController = TextEditingController();
  final TextEditingController _deductionController = TextEditingController();

  double _grossPay = 0;
  double _deductions = 0;
  double _netPay = 0;

  void _calculatePayroll() {
    setState(() {
      double hoursWorked = double.tryParse(_hoursController.text) ?? 0;
      double hourlyRate = double.tryParse(_rateController.text) ?? 0;
      double bonus = double.tryParse(_bonusController.text) ?? 0;
      double deductions = double.tryParse(_deductionController.text) ?? 0;

      double grossPay = hoursWorked * hourlyRate + bonus;

      double netPay = grossPay - deductions;

      _grossPay = grossPay;
      _deductions = deductions;
      _netPay = netPay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payroll Manager'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _hoursController,
              decoration: InputDecoration(
                labelText: 'Hours Worked',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _rateController,
              decoration: InputDecoration(
                labelText: 'Hourly Rate (\$)',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _bonusController,
              decoration: InputDecoration(
                labelText: 'Bonus (\$)',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _deductionController,
              decoration: InputDecoration(
                labelText: 'Deductions (\$)',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.lightBlue.shade50,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculatePayroll,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
              ),
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text(
              'Gross Pay: \$$_grossPay',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            Text(
              'Deductions: \$$_deductions',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            Text(
              'Net Pay: \$$_netPay',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
