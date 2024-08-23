import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rjd_app/Screens/HomeScreen.dart';
import 'package:rjd_app/Screens/widgets/Drawer.dart';
import 'package:rjd_app/Screens/widgets/false.dart';
import 'package:rjd_app/Screens/widgets/true.dart';
import 'package:rjd_app/main.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

TextEditingController place_controller = TextEditingController(text: '');
TextEditingController kind_controller = TextEditingController(text: '');
TextEditingController desc_controller = TextEditingController(text: '');

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 50.0,
        backgroundColor: Color.fromARGB(199, 212, 211, 247),
        title: Text(
          'إضافة بلاغ',
          style: TextStyle(
              fontFamily: 'font1', fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 60),
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.21, 0.98),
              end: Alignment(-0.21, -1.2),
              colors: [
                Color(0xFF17161C),
                Color(0xFF323751),
                Color(0x6F3949A1),
                Color(0x000026FF)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      'موقع العطل',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.800000011920929),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width - 60,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0xFF717AA4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 23,
                          offset: Offset(0, 12),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6499999761581421),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.name,
                      controller: place_controller,
                      decoration: InputDecoration(
                        hintText: 'ما بعرف شو حط هون',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(105, 0, 0, 0)
                              .withOpacity(0.6499999761581421),
                          fontSize: 16,
                          fontFamily: 'font1',
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(right: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      'نوع العطل',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.800000011920929),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width - 60,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0xFF717AA4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 23,
                          offset: Offset(0, 12),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6499999761581421),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.name,
                      controller: kind_controller,
                      decoration: InputDecoration(
                        hintText: 'ما بعرف شو حط هون',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(105, 0, 0, 0)
                              .withOpacity(0.6499999761581421),
                          fontSize: 16,
                          fontFamily: 'font1',
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(right: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      'وصف العطل',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.800000011920929),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width - 60,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0xFF717AA4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 23,
                          offset: Offset(0, 12),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6499999761581421),
                        fontSize: 16,
                        fontFamily: 'font1',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.multiline,
                      controller: desc_controller,
                      decoration: InputDecoration(
                        hintText: 'ما بعرف شو حط هون',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(105, 0, 0, 0)
                              .withOpacity(0.6499999761581421),
                          fontSize: 16,
                          fontFamily: 'font1',
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(right: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: SendReport,
                child: Container(
                  width: width - 160,
                  height: 55,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 4.0, color: Color(0xFF2B3185)),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF2B3185),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'إرسال البلاغ',
                          style: TextStyle(
                            color: Color(0xFF2B3185),
                            fontSize: 16,
                            fontFamily: 'font1',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SendReport() async {
    if (kind_controller.text.isNotEmpty &&
        desc_controller.text.isNotEmpty &&
        place_controller.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse("https://fastapi-back-rjd-reports.onrender.com/add"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'place': place_controller.text.toString(),
            'desc': desc_controller.text.toString(),
            'kind': kind_controller.text.toString(),
            'name': name.value.toString(),
            'userid': user_id.value.toString(),
            'done': false.toString()
          },
        ),
      );

      if (response.statusCode == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homescreen()));
        showDialog(
            context: context,
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: MediaQuery.of(context).size.width - 40,
                      child: True(text: "تم ارسال البلاغ"),
                    ),
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: MediaQuery.of(context).size.width - 40,
                      child: False(text: "حدث خطأ ما"),
                    ),
                  ],
                ));
      }
    }
  }
}
