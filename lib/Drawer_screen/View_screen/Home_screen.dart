import 'package:drawer_stepper/Drawer_screen/Provider_screen/Drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
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
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.more_outlined,
                  color: Colors.blue,
                )),
          ),
          title: Text(
            "Drawer",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          actions: [
            Icon(
              Icons.person,
              size: 25,
              color: Colors.blue,
            ),
          ],
        ),
        body: Column(
          children: [
            Stepper(
              currentStep: providerT!.Continue,
              onStepContinue: () {
                providerT!.nextStap();
              },
              onStepCancel: () {
                providerT!.backStap();
              },
              steps: [
                Step(
                  title: Text("Enter Your Name"),
                  content: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
                Step(
                  title: Text("Enter Your Address"),
                  content: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
                Step(
                  title: Text("Enter Your Stander"),
                  content: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
                Step(
                  title: Text("Enter Your Age"),
                  content: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "date");
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 3),
                  ],
                ),
                alignment: Alignment.center,
                child: Text("Next",style: TextStyle(fontSize: 18,color: Colors.black),),
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP6-MfoJ0MLH3ZH7oIyNvP_PfLRoYI-ZgPeQ&usqp=CAU"),
                ),
              ),
              SizedBox(height: 20),
              info(Icon(Icons.settings), "Settings"),
              info(Icon(Icons.download), "Download"),
              info(Icon(Icons.person), "Profile"),
              info(Icon(Icons.info), "About app"),
              info(Icon(Icons.logout_outlined), "Logout"),
            ],
          ),
        ),
      ),
    );
  }

  Widget info(Icon i1, String data) {
    return ListTile(
      title: Text(
        "$data",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      leading: i1,
    );
  }
}
