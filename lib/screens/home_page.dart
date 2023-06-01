import 'package:calcmania/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userQuestion = '';

  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 142, 206),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 50),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQuestion,
                            style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            userAnswer,
                            style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )),
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    //! Clear Button
                    if (index == 0) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          buttonText: buttons[index]);
                    }

                    //! Delete Button
                    else if (index == 1) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              if (userQuestion.length != 0) {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              }
                            });
                          },
                          color: Color.fromARGB(255, 248, 50, 36),
                          textColor: Colors.white,
                          buttonText: buttons[index]);
                    }

                    //! Equal Button
                    else if (index == buttons.length - 1) {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                              userQuestion = '';
                            });
                          },
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          buttonText: buttons[index]);
                    }

                    //! Other Buttons
                    else {
                      return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          buttonText: buttons[index]);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '-' || x == 'x' || x == '=' || x == '+') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    if (finalQuestion == '') {
      userAnswer = 'No input';
    } else {
      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      userAnswer = eval.toString();
    }
  }
}
