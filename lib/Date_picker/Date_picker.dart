import 'package:drawer_stepper/Drawer_screen/Provider_screen/Drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Date_picker extends StatefulWidget {
  const Date_picker({Key? key}) : super(key: key);

  @override
  State<Date_picker> createState() => _Date_pickerState();
}

class _Date_pickerState extends State<Date_picker> {
  Drawer_provider? providerF;
  Drawer_provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Drawer_provider>(context, listen: false);
    providerT = Provider.of<Drawer_provider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Text(""),
          title: Text(
            "Date & Time Picker",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          actions: [
            Icon(
              Icons.person,
              size: 30,
              color: Colors.blue,
            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Bottom shit
              SizedBox(height: 100),
              FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "My Friends",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("😎Darshan😎"),
                              Text("😎Kaushik😎"),
                              Text("😎Vivek😎"),
                              Text("😎Prinsh😎"),
                              Text("😎Bhargava😎"),
                              Text("😎Krunal😎"),
                              Text("😎Dixit😎"),
                              Text("😎Yash😎"),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  label: Text("Show Bottom Shit")),
              //Date picker
              SizedBox(height: 30),
              FloatingActionButton.extended(
                  onPressed: () async {
                    DateTime? c2 = await showDatePicker(
                        context: context,
                        initialDate: providerT!.c1,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2030));

                    providerF!.choiceDate(c2!);
                  },
                  label: Text("Date Picker")),
              //dats
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text("Day",style: TextStyle(fontSize: 20,color: Colors.black)),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 3)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "${providerT!.c1.day}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Month",style: TextStyle(fontSize: 20,color: Colors.black)),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 3)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "${providerT!.c1.month}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Year",style: TextStyle(fontSize: 20,color: Colors.black)),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 3)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "${providerT!.c1.year}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //Time picker
              SizedBox(height: 30),
              FloatingActionButton.extended(
                  onPressed: () async {
                    TimeOfDay? t2= await showTimePicker(context: context, initialTime: providerT!.t1);

                    providerF!.choiceTime(t2!);
                  },
                  label: Text("Time Picker")),
              //tims
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text("Hour",style: TextStyle(fontSize: 20,color: Colors.black)),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 3)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "${providerT!.t1.hour}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Minutes",style: TextStyle(fontSize: 20,color: Colors.black)),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 3)
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "${providerT!.t1.minute}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
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
