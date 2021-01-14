import 'package:flutter/material.dart';
import 'package:flutter_app_test/database_helper.dart';
import 'package:flutter_app_test/models/task.dart';
import 'package:flutter_app_test/screens/taskinputpage.dart';
import 'package:flutter_app_test/screens/widgets.dart';

class Homepage extends StatefulWidget {


  @override
  _HomepageState createState() => _HomepageState();

}
class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  List<Task> _searchRes = [];
  List<Task> _taskDetails = [];

  Future<Null> getTasks() async {


  }

  @override
  void initState(){
    super.initState();
    print(_dbHelper.getTasks());
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.0),
          child: Stack(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  TitleWidget(),
                  // SearchBarWidget(),
                  new Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                      child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Search',
                            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                          ),
                        onSubmitted: (value) async{
                            SearchSubmitted(value);
                        },
                      ),

                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot){
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TaskInputPage(
                                        task: snapshot.data[index],
                                        ),
                                      ),
                                  ).then((value){
                                    setState(() {});
                                   },
                                  );
                                },
                                child: TaskCardWidget(
                                  title: snapshot.data[index].title,
                                  desc: snapshot.data[index].mileage,
                                ),
                              );
                              },
                        );
                      },
                    ),
                  )

                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskInputPage(task: null,)),
                    ).then((value) {
                      setState(() {

                      });
                    });
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
              )
            ],
          ),
        ),
      )
    );
  }

  SearchSubmitted(String keyword) async{

    print(_searchRes.length);

    _searchRes.clear();
    if(keyword.isEmpty){
      setState(() {});
      return;
    }

    _taskDetails.forEach((tasks) {

    });

    setState(() {});
  }

}
