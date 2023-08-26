import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var list = ["1", "2", "3", "4", "5", "", "7", "8", "6"];
  var list1 = ["1", "2", "3", "4", "5", "6", "7", "8", ""];
  String msg = "";
  int c = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list = List.filled(9, "");

    for (int i = 0; i < 9; i++) {
      while (true) {
        int r = Random().nextInt(9);

        print(list);

        if (!list.contains("$r")) {
          list[i] = "$r";
          print(list);
          break;
        }
      }
    }
    for (int i = 0; i < 9; i++) {
      if (list[i] == "0") {
        list[i] = "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Are You Sure Want To Exit??"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('No'),
              ),
            ],
          ),
        );
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white54,
            title: Text("PUZZLE GAME",
                style: TextStyle(
                    fontSize: 25, color: Color(0xFF01579B), letterSpacing: 3)),
            centerTitle: true),
        body: Column(children: [
          Expanded(
              flex: 25,
              child: Row(
                children: [button(list[0]), button(list[1]), button(list[2])],
              )),
          Expanded(
              flex: 25,
              child: Row(
                children: [button(list[3]), button(list[4]), button(list[5])],
              )),
          Expanded(
              flex: 25,
              child: Row(
                children: [button(list[6]), button(list[7]), button(list[8])],
              )),
          Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text("$msg",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF01579B),
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          //  list = ["1", "5", "8", "4", "2", "6", "7", "", "3"];
                          // list.shuffle();
                          list = List.filled(9, "");

                          for (int i = 0; i < 9; i++) {
                            while (true) {
                              int r = Random().nextInt(9);
                              if (!list.contains("$r")) {
                                list[i] = "$r";
                                print(list);
                                break;
                              }
                            }
                          }
                          for (int i = 0; i < 9; i++) {
                            if (list[i] == "0") {
                              list[i] = "";
                            }
                          }
                          msg = "";
                          c = 0;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF01579B))),
                      child: Text("RESET")),
                  SizedBox(width: 30),
                  c == 0
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              list = [
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                "",
                                "7",
                                "8",
                                "6"
                              ];
                            });
                          },
                          icon: Icon(
                            Icons.lightbulb_outline,
                            color: c == 0 ? Colors.yellow : Colors.white,
                            size: 20,
                          ))
                      : Container()
                ],
              ))
        ]),
      ),
    );
  }

  button(String btnnumber, [int btnclr = 0xFF039BE5]) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              if (c == 0) {
                if (btnnumber == list[0]) {
                  if (list[0] != "") {
                    if (list[1] == "") {
                      list[1] = list[0];
                      list[0] = "";
                    } else if (list[3] == "") {
                      list[3] = list[0];
                      list[0] = "";
                    }
                  }
                } else if (btnnumber == list[1]) {
                  if (list[1] != "") {
                    if (list[2] == "") {
                      list[2] = list[1];
                      list[1] = "";
                    } else if (list[4] == "") {
                      list[4] = list[1];
                      list[1] = "";
                    } else if (list[0] == "") {
                      list[0] = list[1];
                      list[1] = "";
                    }
                  }
                } else if (btnnumber == list[2]) {
                  if (list[2] != "") {
                    if (list[1] == "") {
                      list[1] = list[2];
                      list[2] = "";
                    } else if (list[5] == "") {
                      list[5] = list[2];
                      list[2] = "";
                    }
                  }
                } else if (btnnumber == list[3]) {
                  if (list[3] != "") {
                    if (list[0] == "") {
                      list[0] = list[3];
                      list[3] = "";
                    } else if (list[4] == "") {
                      list[4] = list[3];
                      list[3] = "";
                    } else if (list[6] == "") {
                      list[6] = list[3];
                      list[3] = "";
                    }
                  }
                } else if (btnnumber == list[4]) {
                  if (list[4] != "") {
                    if (list[1] == "") {
                      list[1] = list[4];
                      list[4] = "";
                    } else if (list[3] == "") {
                      list[3] = list[4];
                      list[4] = "";
                    } else if (list[5] == "") {
                      list[5] = list[4];
                      list[4] = "";
                    } else if (list[7] == "") {
                      list[7] = list[4];
                      list[4] = "";
                    }
                  }
                } else if (btnnumber == list[5]) {
                  if (list[5] != "") {
                    if (list[2] == "") {
                      print("helllo");
                      list[2] = list[5];
                      list[5] = "";
                    } else if (list[4] == "") {
                      list[4] = list[5];
                      list[5] = "";
                    } else if (list[8] == "") {
                      list[8] = list[5];
                      list[5] = "";
                    }
                  }
                } else if (btnnumber == list[6]) {
                  if (list[6] != "") {
                    if (list[3] == "") {
                      list[3] = list[6];
                      list[6] = "";
                    } else if (list[7] == "") {
                      list[7] = list[6];
                      list[6] = "";
                    }
                  }
                } else if (btnnumber == list[7]) {
                  if (list[7] != "") {
                    if (list[6] == "") {
                      list[6] = list[7];
                      list[7] = "";
                    } else if (list[4] == "") {
                      list[4] = list[7];
                      list[7] = "";
                    } else if (list[8] == "") {
                      list[8] = list[7];
                      list[7] = "";
                    }
                  }
                } else if (btnnumber == list[8]) {
                  if (list[8] != "") {
                    if (list[5] == "") {
                      list[5] = list[8];
                      list[8] = "";
                    } else if (list[7] == "") {
                      list[7] = list[8];
                      list[8] = "";
                      print(list);
                      print(list1);
                    }
                  }
                }
                if (listEquals(list, list1)) {
                  msg = "YOU WIN !!";

                  print(msg);

                  c = 1;
                }
              }
            });
          },
          child: Card(
            elevation: 40,
            shape: OutlineInputBorder(),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: btnnumber == "" ? Color(0xFF01579B) : Color(btnclr),
              ),
              child: Center(
                child: Text("$btnnumber",
                    style: TextStyle(fontSize: 100, color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
