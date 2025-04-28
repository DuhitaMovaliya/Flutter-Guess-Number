
import 'dart:math';
import 'package:flutter/material.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  final TextEditingController _controller=TextEditingController();
  int _randomNumber = Random().nextInt(10)+1;
  String _message='';
  int _tries=0;
  int _score=0;
  
  
  void _checkGuess(){
    int? guess= int.tryParse(_controller.text);
    if(guess == null){
      setState(() {
        _message='Please Enter a Valid Number between 1 and 10!';
      });
      return;
    }
    setState(() {
      _tries++;
    
    
    if(guess < _randomNumber){
        _message='Too low! Try again.';
      
    }else if(guess > _randomNumber){
          _message='Too high! Try again.';
      
    }else{
        _score ++;
        _message='Congratulation! You guessed it right!';
    }
      });
    }
    

    
  void _resetGame(){
    setState(() {
      _randomNumber=Random().nextInt(10)+1;
      _controller.clear();
      _message='';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Guess The Number")),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("I/'m thinking of a number between 1 and 10.\n Can you guess it?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your guess"
            ),
            keyboardType: TextInputType.number,
            
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: (){_checkGuess();},
           child: Text("Guess")),
           SizedBox(height: 20),
           Text(
            _message,
            style: TextStyle(fontSize: 20,
            color: Colors.deepPurple),
            textAlign: TextAlign.center,
           ),
           SizedBox(height: 20),
           ElevatedButton(onPressed: (){_resetGame();},
            child: Text("Play Again!"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(height: 20),
            Text("Tries:$_tries",
            style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Score:$_score",style: TextStyle(fontSize: 18)),
        ],
      ),
      ),
    );
  }
}