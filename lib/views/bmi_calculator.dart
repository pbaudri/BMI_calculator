import 'package:flutter/material.dart';
import 'package:imc_calculator/views/result.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = false;

  double valueHeight = 183;
  double valueWeight = 90;
  double valueAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xff0f1538),
      ),
      body: Container(
        color: const Color(0xff0f1538),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Card(
                          color: const Color(0xff141a3c),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: isMale ? Colors.white : Colors.grey,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  color: isMale ? Colors.white : Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Card(
                          color: const Color(0xff141a3c),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: !isMale ? Colors.white : Colors.grey,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                  color: !isMale ? Colors.white : Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 125,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: const Color(0xff141a3c),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "HEIGHT",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              valueHeight.toString() + "cm",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Slider(
                              max: 260,
                              min: 60,
                              divisions: 200,
                              value: valueHeight,
                              onChanged: (val) {
                                setState(() {
                                  valueHeight = val;
                                });
                              },
                              thumbColor: const Color(0xffff0067),
                              activeColor: Colors.white,
                              inactiveColor: Colors.white.withOpacity(.4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: const Color(0xff141a3c),
                      child: Column(
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            valueWeight.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff0f1538),
                                  ),
                                ),
                                onPressed: () {
                                  if (valueWeight > 0) {
                                    setState(() {
                                      valueWeight--;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff0f1538),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    valueWeight++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      color: const Color(0xff141a3c),
                      child: Column(
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            valueAge.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff0f1538),
                                  ),
                                ),
                                onPressed: () {
                                  if (valueAge > 0) {
                                    setState(() {
                                      valueAge--;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff0f1538),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    valueAge++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  bmi: valueWeight /
                                      ((valueHeight / 100) *
                                          (valueHeight / 100)),
                                ),
                              ));
                        },
                        child: const Text(
                          "CALCULATE YOUR BMI",
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffff0067),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
