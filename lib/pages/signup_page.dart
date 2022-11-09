import 'package:firstapk/pages/login_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  var firstName = TextEditingController();
  var middleName = TextEditingController();
  var lastName = TextEditingController();
  var course = TextEditingController();
  var birthDay = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup '),
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
                  controller: firstName,
                  decoration: const InputDecoration(
                    labelText: "Firstname",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  )),
              TextField(
                  controller: middleName,
                  decoration: const InputDecoration(
                    labelText: "Middlename",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  )),
              TextField(
                  controller: lastName,
                  decoration: const InputDecoration(
                    labelText: "Lastname",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  )),
              TextField(
                  controller: course,
                  decoration: const InputDecoration(
                    labelText: "Course",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  )),
              TextField(
                  controller: birthDay,
                  decoration: const InputDecoration(
                    labelText: "Birthday",
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 120,
                    height: 70,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            child: const Text('Signup'),
                            onPressed: () {
                              if (firstName.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            const Text('Firstname is empty!'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                              } else if (middleName.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            const Text('Middlename is empty!'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                              } else if (lastName.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            const Text('Lastname is empty!'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                              } else if (course.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: const Text('Course is empty!'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                              } else if (birthDay.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            const Text('Birthday is empty!'),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                              } else {
                                ScaffoldMessenger.of(
                                        context)
                                    .showSnackBar(SnackBar(
                                        content: const Text(
                                            'Succesfully Created an Account'),
                                        backgroundColor: Colors.green,
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {})));
                                //                               Navigator.of(context).push(MaterialPageRoute(
                                //                                   builder: (BuildContext context) =>
                                //                                       Dashboard()));
                              }
                            }))),
                SizedBox(
                    width: 120,
                    height: 70,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage()));
                            })))
              ])
            ])));
  }
}
