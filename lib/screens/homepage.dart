import 'package:flutter/material.dart';
import 'package:flutter_app_test/database_helper.dart';
import 'package:flutter_app_test/screens/searchbar.dart';
import 'package:flutter_app_test/screens/taskinputpage.dart';
import 'package:flutter_app_test/screens/widgets.dart';

class Homepage extends StatefulWidget {


  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  SearchBarWidget(),
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
                                  //desc: snapshot.data[index].mileage,
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
}
