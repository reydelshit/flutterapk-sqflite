import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _UserHome();
}

class _UserHome extends State<HomePage> {
  final fullnameController = TextEditingController();
  final yearController = TextEditingController();
  final blockController = TextEditingController();
  List<Map<String, dynamic>> students = [];
  var student_id;

  void resetControllers() {
    fullnameController.text = '';
    yearController.text = '';
    blockController.text = '';
    student_id = 0;
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'OK', onPressed: () {})));
  }

  void successMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'OK', onPressed: () {})));
  }

  @override
  void initState() {
    loadAllStudents();
    super.initState();
  }

  loadAllStudents() async {
    final data = await DatabaseHelper.retrieveAllStudents();
    setState(() {
      students = data!;
    });
  }

  void addUserModal(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
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
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: fullnameController,
                        decoration: const InputDecoration(
                            labelText: "Student Name",
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            prefixIcon: Icon(Icons.person_outline_outlined)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: yearController,
                        decoration: const InputDecoration(
                            labelText: "Year",
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            prefixIcon: Icon(Icons.numbers)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: blockController,
                        decoration: const InputDecoration(
                            labelText: "Block",
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            prefixIcon: Icon(Icons.link)),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            // adjust width height elevated button
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 20.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onPressed: () async {
                              if (fullnameController.text.isEmpty) {
                                showError('Please enter fullname');
                              } else if (yearController.text.isEmpty) {
                                showError('Please enter year');
                              } else if (blockController.text.isEmpty) {
                                showError('Please enter block');
                              } else {
                                var result = await DatabaseHelper.insertStudent(
                                    fullnameController.text,
                                    yearController.text,
                                    blockController.text);
                                if (result > 0) {
                                  //Success Message
                                  successMessage('Student Added - ADD MODAL');
                                  resetControllers();
                                  setState(() {
                                    loadAllStudents();
                                  });
                                  Navigator.of(context).pop();
                                } else {
                                  //Error Message
                                  showError('Error Adding Student - ADD MODAL');
                                }
                              }
                            },
                            child: const Text('Add'),
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
        shape: const RoundedRectangleBorder(
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
                      const SizedBox(
                        height: 16.0,
                      ),
                      const CircleAvatar(
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: fullnameController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: yearController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        controller: blockController,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (fullnameController.text.isEmpty) {
                                //Error Message
                                showError('Fullname is Empty');
                              } else if (yearController.text.isEmpty) {
                                //Error Message
                                showError('Year is Empty');
                              } else if (blockController.text.isEmpty) {
                                //Error Message
                                showError('Block is Empty');
                              } else {
                                var result = await DatabaseHelper.updateStudent(
                                    student_id,
                                    fullnameController.text,
                                    yearController.text,
                                    blockController.text);
                                if (result == 1) {
                                  //Success Message
                                  successMessage(
                                      'Student Updated - UPDATE MODAL');
                                  resetControllers();
                                  setState(() {
                                    loadAllStudents();
                                  });
                                  Navigator.of(context).pop();
                                } else {
                                  //error message
                                  showError(
                                      'Error Updating Student - UPDATE MODAL');
                                }
                              }
                            },
                            child: const Text('Update'),
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
                title: const Text('Warning'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      const Center(),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Center(
                          child: Text(
                        'Are you sure you want to remove  $fullname?',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 20.0),
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
                          successMessage('Student Deleted');
                        } else {
                          //Error Message
                          showError('Error Deleting Student');
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
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.green.shade900,
        title: const Text('List of Students'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  loadAllStudents();
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  updateUserModal(context);
                  fullnameController.text = students[index]['fullName'];
                  yearController.text = students[index]['year'];
                  blockController.text = students[index]['block'];
                  student_id = students[index]['id'];
                },
              ),
              title: Text(students[index]['fullName']),
              subtitle: Text(
                  students[index]['year'] + '-' + students[index]['block']),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteWarning(
                      students[index]['fullName'], students[index]['id']);
                },
              ),
            );
          }),
    );
  }
}
