import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTx;

  NewTransaction(this._addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final newTitle = titleController.text;
    final newAmount = double.parse(amountController.text);
    if( newTitle.isEmpty || newAmount <=0)
    {
      return; 
    }
    widget._addNewTx(
      newTitle,
      newAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput=val,
            ),
            FlatButton(
              child: Text('submit'),
              onPressed: submitData,
              textColor: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
