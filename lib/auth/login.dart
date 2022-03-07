import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  get length => null;
   TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();

  Future signin() async {
    // ignore: prefer_typing_uninitialized_variables
    var formstatesignin;
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();

      var data = {
        "username": username.text,
        "password": password.text,
      };
      var url = "http://10.0.2.2:8080/flutter/login.php";
      var response = await http.post(Uri.parse(url), body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(responsebody['username']);
      } else {
        print("login faild");
      }
    } else {
      print("not valid");
    }
  }

  /*Future login(BuildContext context) async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Both failed cannot be Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      var url = 'http://10.0.2.2/conn/login.php';
      var response = await http.post(Uri.parse(url), body: {
        "username": username.text,
        "password": password.text,
      });
      var data = json.decode(response.body);
      if (data == "success") {
        Navigator.of(context).pushReplacementNamed("homepage");
      } else {
        Fluttertoast.showToast(
          msg: "the user and password combination does not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }*/

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
                            borderSide: BorderSide(width: 1)),
                      ),
                      validator: (text) {
                        if (text!.length < 3) {
                          return ("Your Name must exceed 3 Characters");
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
                            const Text("If you haven't Account "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("signup");
                              },
                              child: const Text(
                                "Click Here",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: RaisedButton(
                        textColor: Colors.white,
                        /*onPressed:
                        () {
                          Navigator.of(context)
                              .pushReplacementNamed("homepage");
                        },*/

                        onPressed: () {
                          {
                            var formdata = formstate.currentState;
                            if (formdata!.validate()) {
                            
                              //signin();
                              // ignore: duplicate_ignore
                            }
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

/*@override
//Widget build(BuildContext context) => throw UnimplementedError();*/
