import 'package:flutter/material.dart';
import 'package:rjd_app/Screens/HomeScreen.dart';
import 'package:rjd_app/Screens/admin/AdminHomeScreen.dart';
import 'package:rjd_app/main.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50.0,
          actions: [],
          title: Text(
            "عن التطبيق",
            style: TextStyle(
                fontFamily: "font1",
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (admin1.value == 'true') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Adminhomescreen()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              }
            },
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.21, 0.98),
            end: Alignment(-0.21, -0.98),
            colors: [
              Color(0xFF17161C),
              Color(0xFF323751),
              Color(0x6F3949A1),
              Color(0x000026FF)
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bir.jpg"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x7F000000),
                        blurRadius: 10,
                        offset: Offset(4, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rj-Data x Al-Bir Hospital \n Reports App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Janna LT',
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: ShapeDecoration(
                  color: Colors.black26,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              padding: EdgeInsets.all(10),
              child: Text(
                textAlign: TextAlign.center,
                'version: 1.0.5',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7599999904632568),
                  fontSize: 18,
                  fontFamily: 'Janna LT',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
