import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learingflutter1/transaction.dart';
import 'transaction.dart';

class MyApp extends StatefulWidget {
  MyApp();

  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>.empty(growable: true);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidgetList() {
      return _transactions.map((eachTransaction) {
        return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            color: Colors.pink,
            child: ListTile(
              leading: const Icon(Icons.alarm),
              title: Text(
                eachTransaction.content,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: Text('Price: ${eachTransaction.amount}'),
            ));
      }).toList();
    }

    return MaterialApp(
      title: "My app",
      home: Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (Text) {
                    setState(() {
                      _transaction.content = Text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _amountController,
                  onChanged: (Text) {
                    setState(() {
                      _transaction.amount = double.tryParse(Text) ?? 0;
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                  height: 20,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.blue),
                    onPressed: () {
                      setState(() {
                        _transactions.add(_transaction);
                        _transaction = Transaction(content: '', amount: 0.0);
                        _contentController.text = '';
                        _amountController.text = '';
                      });
                    },
                    child: Text(
                      'Insert Transaction',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Column(children: _buildWidgetList())
              ],
            )),
      ),
    );
  }
}
