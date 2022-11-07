import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginHome());
  }
}

class LoginHome extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

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
              ),
              TextField(
                controller: passwordController,
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
                                      Dashboard()));
                            }
                          }))),
              Row(children: <Widget>[
                TextButton(
                  onPressed: () {
//                         Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Signup()));
                  },
                  child: const Text('No Account?'),
                ),
              ])
            ])));
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DashboardHome());
  }
}

class DashboardHome extends StatelessWidget {
  var fullName = TextEditingController();
  var block = TextEditingController();
  var year = TextEditingController();

  void addUser(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 2,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      const CircleAvatar(
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const TextField(
                          decoration: InputDecoration(
                        labelText: "Full Name",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                      const TextField(
                          decoration: InputDecoration(
                        labelText: "Block",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                      const TextField(
                          decoration: InputDecoration(
                        labelText: "Year",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 120,
                                height: 70,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => Dashboard()));
                                        }))),
                            SizedBox(
                                width: 120,
                                height: 70,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                        child: const Text('Add User'),
                                        onPressed: () {})))
                          ])
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C5603AQFfPjVO7Bulow/profile-displayphoto-shrink_800_800/0/1652540197138?e=2147483647&v=beta&t=qxYfICadGRXZVbBN_Zm-nJIWcwHzJMqS8LyrPr_6uQA"),
                    radius: 50.0,
                  ),
                  const Text('Reydel A. Ocon'),
                  SizedBox(
                      width: 170,
                      height: 70,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Login()));
                              }))),
                ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addUser(context);
          },
          child: const Icon(Icons.add)),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://media-exp1.licdn.com/dms/image/C5603AQFfPjVO7Bulow/profile-displayphoto-shrink_800_800/0/1652540197138?e=2147483647&v=beta&t=qxYfICadGRXZVbBN_Zm-nJIWcwHzJMqS8LyrPr_6uQA"),
            radius: 50.0,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => User()));
            },
            child: const ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('List of Users')),
          )
        ],
      )),
    );
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignupPage());
  }
}

class SignupPage extends StatelessWidget {
  var firstName = TextEditingController();
  var middleName = TextEditingController();
  var lastName = TextEditingController();
  var course = TextEditingController();
  var birthDay = TextEditingController();

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
                                  builder: (BuildContext context) => Login()));
                            })))
              ])
            ])));
  }
}

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserHome());
  }
}

class UserHome extends StatefulWidget {
  @override
  State<UserHome> createState() => _UserHome();
}

class _UserHome extends State<UserHome> {
  Future deleteUser(String user) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text('Confirmation'),
              content: SingleChildScrollView(
                  child: ListBody(
                children: [
                  Center(child: Text('Are you sure you want to remove $user')),
                ],
              )),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close')),
                TextButton(
                  onPressed: () {},
                  child: Text('Delete'),
                )
              ],
            );
          });
        });
  }

  var users = ['Reydel Ocon', 'Ben Dover', 'Alex Caruso', 'Lebron Jahames'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Users '),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: Text(users[index].toString()),
//                 title: Text("User # $index"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteUser(users[index].toString());
                  },
                ));
          }),
    );
  }
}

class DatabaseHelper {
  //Create Database Function
  static Future<sql.Database> createDatabase() async {
    return await sql.openDatabase('itelec2.db', version: 1,
        onCreate: (sql.Database database, version) async {
      await createTables(database);
    });
  }

  //Create Tables Function
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        fullName TEXT,
        year TEXT,
        block TEXT,
        dateCreated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    """);
  }

  ///Insert Student function
  static Future<int> insertStudent(
      String? fullName, String? year, String block) async {
    final db = await DatabaseHelper.createDatabase();
    final data = {'fullname': fullName, 'year': year, 'block': block};
    final res = db.insert('students', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return res;
  }

  //Function to retrieve all Student data
  static Future<List<Map<String, dynamic>>> retrieveAllStudents() async {
    final db = await DatabaseHelper.createDatabase();
    return await db.query('students', orderBy: 'fullname');
  }

  //Function to update student data
  static Future<int> updateStudent(
      int id, String? fullName, String? year, String? block) async {
    final db = await DatabaseHelper.createDatabase();
    final res = db.rawUpdate(
        "UPDATE students SET fullname = '$fullName', year ='$year', block ='$block' WHERE id = $id ");
    return res;
  }

  //Function to delete student data
  static Future<int> deleteStudent(int id) async {
    final db = await DatabaseHelper.createDatabase();
    final res = db.rawDelete("DELETE FROM students WHERE id = $id");
    return res;
  }
}
