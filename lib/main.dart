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
                                  builder: (BuildContext context) => User()));
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
  var fullnameController = new TextEditingController();
  var yearController = new TextEditingController();
  var blockController = new TextEditingController();
  List<Map<String, dynamic>> students = [];
  var student_id;

  void resetControllers() {
    fullnameController.text = '';
    yearController.text = '';
    blockController.text = '';
    student_id = 0;
  }

  void initState() {
    super.initState();
    loadAllStudents();
  }

  Future<void> loadAllStudents() async {
    final data = await DatabaseHelper.retrieveAllStudents();
    setState(() {
      students = data;
    });
  }

  void addUserModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: fullnameController,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: yearController,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: blockController,
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (fullnameController.text.isEmpty) {
                                //Error Message
                              } else if (yearController.text.isEmpty) {
                                //Error Message
                              } else if (blockController.text.isEmpty) {
                                //Error Message
                              } else {
                                var result = await DatabaseHelper.insertStudent(
                                    fullnameController.text,
                                    yearController.text,
                                    blockController.text);
                                if (result == 1) {
                                  //Success Message
                                } else {
                                  //Error Message
                                }
                              }
                              fullnameController.text = '';
                              yearController.text = "";
                              blockController.text = "";
                              loadAllStudents();
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: Text('Add'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void updateUserModal(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16.0,
                      ),
                      CircleAvatar(
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: fullnameController,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: yearController,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: blockController,
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (fullnameController.text.isEmpty) {
                                //Error Message
                              } else if (yearController.text.isEmpty) {
                                //Error Message
                              } else if (blockController.text.isEmpty) {
                                //Error Message
                              } else {
                                var result = await DatabaseHelper.updateStudent(
                                    student_id,
                                    fullnameController.text,
                                    yearController.text,
                                    blockController.text);
                                if (result == 1) {
                                  //Success Message
                                } else {
                                  //error message
                                }
                              }
                              resetControllers();
                              loadAllStudents();
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: Text('Update'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future deleteWarning(String fullname, int id) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Warning'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Center(),
                      SizedBox(
                        height: 18.0,
                      ),
                      Center(
                          child: Text(
                        'Are you sure you want to remove  $fullname?',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0),
                      ))
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                      child: const Text('Delete'),
                      onPressed: () async {
                        var result = await DatabaseHelper.deleteStudent(id);
                        if (result == 1) {
                          //Success Message
                        } else {
                          //Error Message
                        }
                        loadAllStudents();
                        setState(() {});
                        Navigator.of(context).pop();
                      }),
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addUserModal(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => User()));
          },
        ),
        backgroundColor: Colors.green.shade900,
        title: Text('List of Students'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  //loadData();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  fullnameController.text = students[index]['fullname'];
                  yearController.text = students[index]['year'];
                  blockController.text = students[index]['block'];
                  student_id = students[index]['id'];
                  updateUserModal(context);
                },
              ),
              title: Text(students[index]['fullname']),
              subtitle: Text(
                  students[index]['year'] + '-' + students[index]['block']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteWarning(
                      students[index]['fullname'], students[index]['id']);
                },
              ),
            );
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
