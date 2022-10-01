import 'package:flutter/material.dart';

const valueStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 44, color: Colors.white);
const valueExpStyle = TextStyle(fontSize: 22, color: Colors.grey);
const butStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white);
List<String> calcButton = [
  "7",
  "8",
  "9",
  "x",
  "4",
  "5",
  "6",
  "/",
  "1",
  "2",
  "3",
  "-",
  "C",
  "0",
  "=",
  "+"
];

double a = 0;
double b = 0;
double answer = 0;
String? signe;
String expression = "";

String value = "0";
const inIt = [3, 7, 11, 14, 15];

class Computer extends StatefulWidget {
  const Computer({super.key});

  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        leading: const Icon(Icons.menu),
        title: const Text("Standard"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.black,
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: SelectableText(
                      value,
                      style: valueStyle,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 70,
                    child: Text(
                      expression,
                      style: valueExpStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: calcButton.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          if (calcButton[index] == "+" ||
                              calcButton[index] == "/" ||
                              calcButton[index] == "-" ||
                              calcButton[index] == "x") {
                            setState(() {
                              a = double.parse(value);
                              signe = calcButton[index];
                              expression += a.toString();
                              expression += calcButton[index];
                              value = "0";
                            });
                          } else if (calcButton[index] == "=") {
                            setState(() {
                              b = double.parse(value);
                              expression += b.toString();

                              value = "${operation(a, b, signe!)}";
                            });
                          } else if (calcButton[index] == "C") {
                            setState(() {
                              a = 0;
                              b = 0;
                              value = "0";
                              expression = "";
                            });
                          } else {
                            setState(() {
                              if (value == "0") {
                                value = calcButton[index];
                              } else {
                                value += calcButton[index];
                              }
                            });
                          }
                        },
                        child: Container(
                          color: inIt.contains(index)
                              ? Colors.orange
                              : Colors.white10,
                          width: MediaQuery.of(context).size.width / 3,
                          height: 50,
                          child: Center(
                              child: Text(
                            calcButton[index],
                            style: butStyle,
                          )),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

double operation(double a, double b, String signe) {
  switch (signe) {
    case "x":
      return a * b;

    case "/":
      return a / b;
    case "+":
      return a + b;
    case "-":
      return a - b;

    default:
      return 0;
  }
}
