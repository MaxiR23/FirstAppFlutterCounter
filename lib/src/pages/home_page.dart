import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _textStyle = TextStyle(fontSize: 17);

  int _counter = 0;

  String _toastMessage = 'Negative numbers cannot be displayed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('CounterApp'),
         centerTitle: true,
         backgroundColor: Colors.indigo,
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('Counter', style: _textStyle,),
             Text('$_counter', style: _textStyle,)
           ],
         ),
       ),
       floatingActionButton: _createFABS(),
    );
  }

  Widget _createFABS() {
    return Row(
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton(child: Icon(Icons.exposure_zero), backgroundColor: Colors.indigo, onPressed: _reset,),
        Expanded(child: SizedBox(),),
        FloatingActionButton(child: Icon(Icons.remove), backgroundColor: Colors.indigo, onPressed:_decrement,),
        SizedBox(width: 5,),
        FloatingActionButton(child: Icon(Icons.add), backgroundColor: Colors.indigo, onPressed: _increment,)
      ],
    );
  }

  void _increment(){
    setState(() => _counter++);
  }

  void _decrement(){
    setState(() => _counter == 0 ? showToast(_toastMessage) : _counter-- );
  }

  void _reset(){
    setState(() => _counter = 0);
  }

  void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}