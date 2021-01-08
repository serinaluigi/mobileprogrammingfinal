import 'package:flutter/material.dart';
import 'package:flutter_app_test/database_helper.dart';
import 'package:flutter_app_test/models/task.dart';
import 'package:flutter/widgets.dart';

class TaskInputPage extends StatefulWidget {
  final Task task;
  TaskInputPage({@required this.task});

  @override
  _TaskInputPageState createState() => _TaskInputPageState();
}

class _TaskInputPageState extends State<TaskInputPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  int _taskId = 0;
  String _taskTitle = "";
  String _taskmileage = "";
  String _tasknextinterval = "";
  String _taskpartcost = "";
  String _tasklabor = "";
  String _taskdetails = "";

  FocusNode _titleFocus;
  FocusNode _mileageFocus;
  FocusNode _nextintervalFocus;
  FocusNode _partcostFocus;
  FocusNode _laborFocus;
  FocusNode _detailsFocus;


  bool _contentVisible = false;

  @override
  void initState() {
    if (widget.task != null) {
      // Set visibility to true
      _contentVisible = true;

      _taskTitle = widget.task.title;
      _taskId = widget.task.id;
      _taskmileage = widget.task.mileage;
      _tasknextinterval = widget.task.nextinterval;
      _taskpartcost = widget.task.partcost;
      _tasklabor = widget.task.labor;
      _taskdetails = widget.task.details;

    }

    _titleFocus = FocusNode();
    _mileageFocus = FocusNode();
    _nextintervalFocus = FocusNode();
    _partcostFocus = FocusNode();
    _laborFocus = FocusNode();
    _detailsFocus = FocusNode();



    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _mileageFocus.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage('assets/images/backarrow.png'),
                          ),
                        ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async{
                              print("Field Value $value");
                              //check if entry is not empty
                              if(value != "") {
                                //check if task is null
                                if(widget.task == null){
                                  Task _newTask = Task(title: value);
                                  _taskId = await _dbHelper.insertTask(_newTask);
                                  setState(() {
                                    _contentVisible = true;
                                    _taskTitle = value;
                                  });
                                }
                                else {
                                  await _dbHelper.updateTaskTitle(_taskId, value);
                                  print("update task");
                                }
                              }
                            },
                            controller: TextEditingController()..text = _taskTitle,
                            decoration: InputDecoration(
                              hintText: " New Maintenance Log",
                                border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                  TextField(
                    focusNode: _mileageFocus,
                    onSubmitted: (value) {
                      if(value != ""){
                        if(_taskId != 0){
                          _dbHelper.updateMileage(_taskId, value);
                          _taskmileage = value;
                        }
                      }

                    },
                    controller: TextEditingController()..text = _taskmileage,
                    decoration: InputDecoration(
                        hintText: " Mileage",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                    ),
                  ),
                  TextField(
                    focusNode: _nextintervalFocus,
                    onSubmitted: (value) {
                      if(value != ""){
                        if(_taskId != 0){
                          _dbHelper.updateNextInterval(_taskId, value);
                          _tasknextinterval = value;
                        }
                      }

                    },
                    controller: TextEditingController()..text = _tasknextinterval,
                    decoration: InputDecoration(
                        hintText: " Next Maintenance Interval",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                    ),
                  ),
                  TextField(
                    focusNode: _partcostFocus,
                    onSubmitted: (value) {
                      if(value != ""){
                        if(_taskId != 0){
                          _dbHelper.updatePartCost(_taskId, value);
                          _taskpartcost = value;
                        }
                      }

                    },
                    controller: TextEditingController()..text = _taskpartcost,
                    decoration: InputDecoration(
                        hintText: " Part Cost",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                    ),
                  ),
                  TextField(
                    focusNode: _laborFocus,
                    onSubmitted: (value) {
                      if(value != ""){
                        if(_taskId != 0){
                          _dbHelper.updateLabor(_taskId, value);
                          _tasklabor = value;
                        }
                      }

                    },
                    controller: TextEditingController()..text = _tasklabor,
                    decoration: InputDecoration(
                        hintText: " Labor Cost",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                    ),
                  ),
                  TextField(
                    focusNode: _detailsFocus,
                    onSubmitted: (value) {
                      if(value != ""){
                        if(_taskId != 0){
                          _dbHelper.updateDetails(_taskId, value);
                          _taskdetails = value;
                        }
                      }

                    },
                    controller: TextEditingController()..text = _taskdetails,
                    decoration: InputDecoration(
                        hintText: " Additional Details",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                    ),
                  ),
                ],

              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskInputPage()
                      ),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0x007AFF)
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/addbutton.png"
                          )
                      )
                  ),
                ),
              ),
              Positioned(
                bottom: 24.0,
                right: 100.0,
                child: GestureDetector(
                  onTap: () async{
                    if(_taskId !=0){
                      await _dbHelper.deleteTask(_taskId);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0x007AFF)
                      ),
                      child: Image(
                          image: AssetImage(
                              "assets/images/trash.png"
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}


