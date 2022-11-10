import 'package:firstapk/pages/home_page.dart';
import 'package:firstapk/pages/signup_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media-exp1.licdn.com/dms/image/C5603AQFfPjVO7Bulow/profile-displayphoto-shrink_800_800/0/1652540197138?e=2147483647&v=beta&t=qxYfICadGRXZVbBN_Zm-nJIWcwHzJMqS8LyrPr_6uQA"),
                  radius: 50.0),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: "Username",
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.person_outline_outlined)),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.remove_red_eye_outlined)),
              ),
              SizedBox(
                  width: 120,
                  height: 70,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () {
                            if (usernameController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: const Text('Username is empty!'),
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                          label: 'OK', onPressed: () {})));
                            } else if (passwordController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: const Text('Password is empty!'),
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                          label: 'OK', onPressed: () {})));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: const Text('Loggin Succesfully'),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                          label: 'OK', onPressed: () {})));
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage()));
                            }
                          }))),
              Row(children: <Widget>[
                TextButton(
                  onPressed: () {
//                         Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()));
                  },
                  child: const Text('No Account?'),
                ),
              ])
            ])));
  }
}
