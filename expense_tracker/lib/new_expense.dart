import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expesne.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpense> {
//var _enteredTitle  = '';

//void _saveTitleInput(String inputValue){
  //_enteredTitle = inputValue;
//}

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCatagory = Category.leisure;


  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    // after this value

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount== null || enteredAmount<= 0;


    if(_titleController.text.trim().isEmpty ||  amountIsInvalid || _selectedDate == null){
      //error message 
      showDialog(
        context: context, 
        builder: (ctx)=> AlertDialog(
          title: const Text('Invalid Input'),
          content:  const Text('please make sure a valid title, amount and date was entered'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text('Okay') )
          ],
        ),
      );
      
      return;
    }

    widget.onAddExpense(Expense(category:_selectedCatagory , title: _titleController.text, amount: enteredAmount, date: _selectedDate!));
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixText: 'Rs ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'Select Date'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                  value:  _selectedCatagory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if(value== null) {return;}
                      _selectedCatagory = value;
                    });
                  }),
                  const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    _submitExpenseData();
                  },
                  child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
