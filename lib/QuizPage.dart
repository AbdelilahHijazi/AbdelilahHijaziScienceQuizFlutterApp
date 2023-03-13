import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List of questions
  List<String> _questions = [
    "1.	What is the sum of the roots of the equation x2 + 5x + 6 = 0? ",
    "2.	What is the slope of the line that passes through the points (5, 3) and (8, 6)?",
    "3. What is the value of the determinant of the matrix [[1, 2], [3, 4]]?",
    "4. What is the inverse function of y = 2x + 1?",
    "5. 14.	What is the formula for force? ",
    "6. 16.	A car accelerates from rest to a speed of 25 m/s in 10 seconds. What is the car's acceleration? ",
    "7. A 100-ohm resistor is connected to a 6-volt battery. What is the power consumed by the resistor? ",
    "8. A sinusoidal AC voltage has a peak voltage of 220V and a frequency of 60Hz. What is the RMS voltage?",
    "9. What is the role of the mitochondria in the cell? ",
    "10. What is the role of the ribosome in protein synthesis? ",
    "11. What is the process that occurs in the Golgi apparatus?",
    "12. What is the role of enzymes in biochemical reactions?",
    "13. What is the name for the process in which a solid is converted directly into a gas without passing through the liquid state?",
    "14. What is the name of the chemical reaction in which a reactant loses electrons?",
    "15. What is the atomic number of carbon?",
    "16. What is the molar mass of CO2?",
    "17. What is the primary function of the Operating System (OS)?",
    "18. What is the function of a compiler? ",
    "19. What is a computer virus? ",
    "20. What is an algorithm? " // Add more questions here
  ];

  // List of answer options for each question
  List<List<String>> _answers = [
    ["a) -1", "b) -5", "c) -6", "d) 5"],
    ["a) 0.5", "b) 2", "c) 1.5", "d) 1"],
    ["a) -2", "b) -1", "c) 1", "d) 2"],
    ["a) y = (x - 1)/2", "b) y = 2/x + 1", "c) y = x/2 + 1", "d) y = -x/2 - 1"],
    [
      "a) Force = Mass x Acceleration",
      "b)Force = Mass / Acceleration",
      "c)Force = Acceleration x Time",
      "d) Force = Acceleration / Time"
    ],
    ["a)25 m/s^2 ", "b)5 m/s^2 ", "c)10 m/s^2 ", "d)2.5 m/s^2"],
    ["a)3.6 Watts", "b)360 Watts", "c)0.36 Watts", "d)36 Watts"],
    ["a)140 V", "b)155.5 V", "c)110 V", "d)220 V"],
    [
      "a)To control the movement of materials into and out of the cell",
      "b)To produce energy for the cell",
      "c)To store genetic information",
      "d)To support the shape of the cell"
    ],
    [
      "a)To transcribe DNA into RNA",
      "b)To translate RNA into proteins",
      "c)To replicate DNA",
      "d)To repair DNA"
    ],
    [
      "a)Lipid synthesis",
      "b)Protein synthesis",
      "c)Protein modification and sorting",
      "d)DNA replication"
    ],
    [
      "a)To lower the activation energy required for a reaction to occur",
      "b)To increase the rate of a reaction",
      "c)To change the products of a reaction",
      "d)All of the above"
    ],
    ["a)Condensation", "b)Evaporation", "c)Sublimation", "d)Melting Solution"],
    ["a)Oxidation", "b)Reduction", "c)Neutralization", "d)Hydrolysis Solution"],
    ["a)12", "b)8", "c)24", "d)6"],
    ["a)54 g/mol", "b)44 g/mol", "c) 64 g/mol", "d) 40 g/mol"],
    [
      "a)To provide a platform for the execution of software applications",
      "b)To manage hardware resources of a computer system",
      "c)To provide a graphical user interface",
      "d)All of the Above"
    ],
    [
      "a)To convert high-level programming language into machine code",
      "b)To convert low-level programming language into machine code",
      "c)To convert high-level programming language into assembly code",
      "d)To convert assembly code into machine code"
    ],
    [
      "a)A software program designed to replicate and spread itself to other computers",
      "b)A program designed to perform a specific task",
      "c)A hardware component designed to protect the computer",
      "d)None of the above "
    ],
    [
      "a)A set of instructions for solving a specific problem",
      "b)A type of software application ",
      "c)A type of hardware component",
      "d)None of the above "
    ] // Add more answer options here
  ];

  // List of correct answers (index of the correct answer in the answers list)
  List<int> _correctAnswers = [
    1, 3, 0, 0, 0, 3, 2, 1, 1, 1, 2, 1, 2, 0, 3, 1, 3,
    0, 0, 0 // Add more correct answers here
  ];
  //List of images
  List<String> _images = [
    "images/question_1.png",
    "images/question_2.jpg",
    "images/question_3.png",
    "images/question_4.png",
    "images/question_5.jpg",
    "images/question_6.jpg",
    "images/question_7.jpg",
    "images/question_8.png",
    "images/question_9.jpg",
    "images/question_10.jpg",
    "images/question_11.jpg",
    "images/question_12.png",
    "images/question_13.jpg",
    "images/question_14.png",
    "images/question_15.jpg",
    "images/question_16.jpg",
    "images/question_17.jpeg",
    "images/question_18.jpg",
    "images/question_19.jpg",
    "images/question_20.jpg",
    // Add more image here
  ];

  int _currentQuestion = 0;
  int _score = 0;
  int _selectedAnswer = -1;
  bool _isCompleted = false;
  var _timer = null;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 25), _timeOut);
  }

  void _timeOut() {
    _selectedAnswer = -1;
    _checkAnswer();
  }

  void _checkAnswer() {
    if (_selectedAnswer == _correctAnswers[_currentQuestion]) {
      _score++;
    }
    _currentQuestion++;
    _timer.cancel();
    if (_currentQuestion == _questions.length) {
      _isCompleted = true;
    } else {
      _startTimer();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 55, 155, 255),
            centerTitle: true,
            title: Text(
              "Abdelilah Hijazi Science Quiz",
              style: TextStyle(
                fontFamily: "Prompt",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
        body: _isCompleted
            ? (_score != 20
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Quiz completed, but you didn't get the full grade so try another time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Your score: $_score/${_questions.length}",
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Code to restart the application
                          setState(() {
                            // Reset the test progress
                            _currentQuestion = 0;
                            _selectedAnswer = -1;
                            _score = 0;
                            _isCompleted = false;
                          });
                        },
                        child: Text(
                          'Restart Quiz',
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green[700],
                      ),
                      MaterialButton(
                        onPressed: () {
                          // This function will exit the app when the button is pressed
                          SystemNavigator.pop();
                        },
                        child: Text(
                          'Quit Quiz',
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Color.fromARGB(255, 196, 6, 21),
                      )
                    ],
                  )
                : Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/win_background.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Congratulations! You win',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Prompt",
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 184, 20, 42),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text(
                              'Quit Quiz',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Prompt",
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            color: Color.fromARGB(255, 196, 6, 21),
                          )
                        ],
                      ),
                    ),
                  ))
            : Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(_images[_currentQuestion]),
                      Text(_questions[_currentQuestion],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color.fromARGB(255, 55, 155, 255),
                            letterSpacing: 1,
                          )),
                      ..._answers[_currentQuestion]
                          .map((a) => ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 55, 155, 255)),
                                ),
                                onPressed: () {
                                  _selectedAnswer =
                                      _answers[_currentQuestion].indexOf(a);
                                  _checkAnswer();
                                  _timer.cancel();
                                },
                                child: Text(a,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "Prompt",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.white,
                                        letterSpacing: 1)),
                              ))
                          .toList(),
                      MaterialButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          'Quit Quiz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Prompt",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Color.fromARGB(255, 196, 6, 21),
                      )
                    ]),
              ));
  }
}
