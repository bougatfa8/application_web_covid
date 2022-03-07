// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage("../images/dc.png"),
            height: 200,
            width: 200,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "user name",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      validator: (text) {
                        if (text!.length < 3) {
                          return ("Your Name must exceed 3 Characters");
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      validator: (text) {
                        if (text!.length < 13) {
                          return ("Your Email must exceed 13 Characters");
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      validator: (text) {
                        if (text!.length < 6) {
                          return ("Your Password must exceed 6 Characters");
                        }
                        return null;
                      },
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Text("If you have Account "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("Login");
                              },
                              child: const Text(
                                "Click Here",
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            )
                          ],
                        )),
                    Container(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: Colors.white,
                        onPressed: () {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            Navigator.of(context)
                                .pushReplacementNamed("homepage");
                          } else {
                            // ignore: avoid_print
                            print("Not Valid");
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
