import 'package:flutter/material.dart';
import 'package:flutter_guide/result.dart';
import './result.dart';
import './quiz.dart';
// void main(){
//   runApp(myApp());
// }
void main() => runApp(myApp());

class myApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myAppState();
  }
}
class _myAppState extends State<myApp>{
  var _questionIndex = 0;
  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
          _questionIndex=0;
    _totalScore=0;
    });
  }
      final _questions= const[
      {'questionText': 'What\'s your favourite colour?', 'answers':[{'text':'Black', 'score': 10},{'text':'Red', 'score': 8},{'text':'Green', 'score': 7},{'text':'Blue', 'score': 9}],},
      {'questionText': 'What\'s your favourite animal?', 'answers':[{'text':'Tiger', 'score':10},{'text': 'Leopard', 'score':15},{'text':'Cheetah', 'score':5 },{'text':'Lion', 'score': 4}],},
      {'questionText': 'What\'s your rating of the app?', 'answers':[{'text': '1', 'score': 10}, {'text': '2', 'score': 15}, {'text': '3', 'score': 3}, {'text': '4', 'score': 4}],},
      ];
  void _answerQuestions(int score){
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex<_questions.length){
      print("We have more questions!!");
    }
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Basic App'),
      ),
      body: _questionIndex<_questions.length 
      ? Quiz(answerQuestions: _answerQuestions, questionIndex: _questionIndex, questions: _questions,) 
      : Result(_totalScore, _resetQuiz),
    ),
    );
  }
}