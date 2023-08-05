import 'package:bmiapp/kStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String? dateTime1 = 'Select a Date';

class _HomePageState extends State<HomePage> {
  String myAge = "";
  String name = "";
  String address = "";
  int height = 160;
  int weight = 65;
  late double bmi = calculateBmi(height: height, weight: weight);
  late double bmiValue;
  String? gender = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bmiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 3, 133),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Color.fromARGB(255, 243, 135, 243),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Enter Your Details",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Name"),
                          ],
                        ),
                      ),
                      TextField(
                        //scrollController:FixedExtentScrollController.,
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                          contentPadding: EdgeInsets.all(5.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Address"),
                          ],
                        ),
                      ),
                      TextField(
                        //scrollController:FixedExtentScrollController.,
                        controller: addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                          contentPadding: EdgeInsets.all(5.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Date Of Birth"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextField(
                          onTap: _showDatePicker,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: (dateTime1),
                            contentPadding: const EdgeInsets.all(5.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Gender"),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text("Male"),
                          Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                }); //selected value
                              }),
                          Text("Female"),
                          Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                }); //selected value
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 27.0),
                      child: Column(
                        children: [
                          Text(
                            "Weight (KG)",
                            style: kHeightAndWeightTextStyles,
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (weight < 300) {
                                          weight++;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 180, 25, 241),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 5) {
                                          weight--;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 248, 3, 248),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 27.0),
                      child: Column(
                        children: [
                          Text(
                            "Height (CM)",
                            style: kHeightAndWeightTextStyles,
                          ),
                          Text(
                            "$height",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (height < 250) {
                                          height++;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 180, 25, 241),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (height > 100) {
                                          height--;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 248, 3, 248),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          child: Text(
                            "Submit",
                            style: kButtonTextStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 85, 3, 133),
                            minimumSize: Size(365, 50),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              name = nameController.text;
                              address = addressController.text;
                              myAge;
                              bmi =
                                  calculateBmi(height: height, weight: weight);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.add_reaction_outlined),
                        Text(
                          "Name",
                          style: kUserDetailsStyles,
                        ),
                        Text(name),
                        Icon(Icons.place_outlined),
                        Text(
                          "ADDRESS",
                          style: kUserDetailsStyles,
                        ),
                        Text(address),
                        Icon(Icons.airline_stops_sharp),
                        Text(
                          "AGE",
                          style: kUserDetailsStyles,
                        ),
                        Text(myAge),
                        Row(
                          children: [
                            Icon(Icons.man),
                            Icon(Icons.woman),
                          ],
                        ),
                        Text(
                          "GENDER",
                          style: kUserDetailsStyles,
                        ),
                        Text(
                          '$gender',
                        ),
                        Icon(Icons.account_circle_outlined),
                        Text(
                          "BMI",
                          style: kUserDetailsStyles,
                        ),
                        Text(bmi.toStringAsFixed(2), style: kBmiValueStyles),
                        Text(
                          bmiResult(bmi),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: clear,
                    child: Text("Clear Text"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        calculateAge(value);
      }

      dateTime1 = DateFormat('yyyy-MM-dd').format(value!);
    });
  }

  double calculateBmi({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String bmiResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Over Weight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  void calculateAge(DateTime? value) {
    DateTime now = DateTime.now();
    Duration age = now.difference(value!);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    myAge = '$years years';
  }

  void clear() {
    setState(() {
      name = '';
      addressController.text = '';
    });
  }
}
