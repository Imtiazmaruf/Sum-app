import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberOneTEController = TextEditingController();
  final TextEditingController _numberTwoTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _numberOneTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Input Number One',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return 'Enter number one';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _numberTwoTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Input Number Two',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return 'Enter number Two';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          double numOne = double.tryParse(
                              _numberOneTEController.text.trim()) ??
                              0;
                          double numTwo = double.tryParse(
                              _numberTwoTEController.text.trim()) ??
                              0;
                          double result = subs(numOne, numTwo);
                          _result = result;
                          setState(() {});
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                      if(_formkey.currentState!.validate()){
                        double numOne = double.tryParse(
                            _numberOneTEController.text.trim()) ??
                            0;
                        double numTwo = double.tryParse(
                            _numberTwoTEController.text.trim()) ??
                            0;
                        double result = subs(numOne, numTwo);
                        _result = result;
                        setState(() {});
                      }
                      },
                      child: Text('Sub'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: Clear,
                      child: Text('clear'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text('Result = $_result'),
            ],
          ),
        ),
      ),
    );
  }

  void Clear() {
    _numberOneTEController.clear();
    _numberTwoTEController.clear();
    _result = 0;
    setState(() {});
  }

  double add(double numOne, double numTwo) {
    return numOne + numTwo;
  }

  double subs(double numOne, double numTwo) {
    return numOne - numTwo;
  }
}
