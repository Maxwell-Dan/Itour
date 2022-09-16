import 'package:flutter/material.dart';
import 'package:itour/src/customWidgets/userform.dart';
import 'package:itour/src/screens/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Itour',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
          ),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                UserForm(
                                  fullnameController: _fullname,
                                  contactController: _contact,
                                  emailController: _email,
                                  fullnameHintText: "Enter fullname",
                                  emailHintText: "Enter email",
                                  contactHintText: "Enter contact",
                                  fullnameIcon: const Icon(Icons.person),
                                  emailIcon: const Icon(Icons.mail),
                                  contactIcon: const Icon(Icons.numbers),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "field can not be empty";
                                    }
                                    return null;
                                  },
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "You have successfully signed in")));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()));
                                      }
                                    },
                                    child: const Text("Sign In"))
                              ],
                            ),
                          ));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              "https://img.freepik.com/premium-vector/boarding-passenger-ship-harbour-ferry-arriving-pier-dock-travelling-holidays_225067-116.jpg?w=740",
              fit: BoxFit.cover,
            ),
            const Text(
              "Itour",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.normal,
              ),
            ),
            const Text(
              "Make the most out of your vacations",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text("Get Started")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  /*  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ],*/
                ),
                constraints: BoxConstraints.expand(
                  width: double.infinity,
                  height: _screenSize.width < 1000 ? 100 : 60,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: const [
                      Text(
                        "About: Mobile Development Project: Promote toursim in Ghana",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                      Text(
                        "CopyRight 2022",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      )
                    ]),
              ),
            )
          ],
        ));
  }
}
