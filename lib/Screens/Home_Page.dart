import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Model/Model_class.dart';
import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:timestamp_to_string/timestamp_to_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  late TextEditingController editcontroller;

  List<ModelClass> todolistiteam = [];

  @override
  void initState() {
//initilizing text editing controller

    controller = TextEditingController();
    editcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      body: SafeArea(
        child: Container(
    
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.person),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Search",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "All ToDos",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: ListView.builder(
                      itemCount: todolistiteam.length,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Checkbox(
                                            value: todolistiteam[index].check,
                                            onChanged: (onChanged) {
                                              todolistiteam[index].check =
                                                  onChanged!;
                                              setState(() {});
                                            }),
                                        (todolistiteam[index].check == true)
                                            ? Text(
                                                todolistiteam[index]
                                                    .description
                                                    .toString(),
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                ),
                                              )
                                            : Text(todolistiteam[index]
                                                .description
                                                .toString()),
                                      ],
                                    ),
                                    Text(
                                        "${todolistiteam[index].dateTime!.timestamp}")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await CustomAlertDialogBox
                                              .showCustomAlertBox(
                                            context: context,
                                            willDisplayWidget: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 200,
                                                    child: TextFormField(
                                                      controller: editcontroller,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      todolistiteam[index]
                                                              .description =
                                                          editcontroller.text;
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          color: Colors.blue),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "Done",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blue),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        todolistiteam.removeAt(index);
                    
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.red),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 50,
                            child: CupertinoTextField(
                              controller: controller,
                              placeholder: "Add a new Todo Iteam",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            todolistiteam.add(ModelClass(
                                controller.text, false, TimestampToString.now()));
                    
                            controller.clear();
                    
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
