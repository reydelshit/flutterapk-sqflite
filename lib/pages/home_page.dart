import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _UserHome();
}

class _UserHome extends State<HomePage> {
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
            Navigator.of(context).pop();
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
