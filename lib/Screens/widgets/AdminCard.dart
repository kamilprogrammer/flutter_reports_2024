import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  AdminCard({
    Key? key,
    required this.name,
    required this.onTap1,
    required this.onTap2,
    required this.section,
    required this.type,
    required this.desc,
    required this.floor,
    required this.done,
    required this.admin,
    required this.user,
  }) : super(key: key);
  final String name; // Username
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final String section; // String for section
  final String type; // String for type
  final String desc; // String for description
  final int floor;
  final bool done;
  final bool admin;
  final bool user;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width - 44,
            height: user == true ? 290 : 362,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 21,
                  offset: Offset(0, 17),
                  spreadRadius: 6,
                )
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1.00, -0.04),
                          end: Alignment(1, 0.04),
                          colors: [
                            Color.fromARGB(255, 54, 62, 169),
                            Color(0xFF2B3185)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 98,
                          height: 98,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            color: done == true
                                ? Color(0xFF65B741)
                                : Color(0xFFC21010),
                            shadows: [
                              BoxShadow(
                                color: done == true
                                    ? Color(0xFF65B741)
                                    : Color(0xFFC21010),
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      floor.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        fontFamily: 'font2',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: user == false ? 0 : 10,
                ),
                Text(
                  name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'font1',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  section.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6000000238418579),
                    fontSize: 14,
                    fontFamily: 'font1',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: user == false ? 8 : 30,
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  width: width - 74,
                  height: user == true ? 60 : 50,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        type.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'font1',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: user == true ? 0 : 10,
                ),
                user == false
                    ? Container(
                        padding: EdgeInsets.all(10),
                        width: width - 74,
                        height: 68,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              desc.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'font1',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 18.0,
                ),
                user == false
                    ? Row(
                        children: [
                          Container(
                            width: width - 44,
                            height: 54,
                            child: admin == true
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 54,
                                        width: ((width - 44) / 2) - 1,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFC21010),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(19),
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: onTap2,
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.only(
                                                      left: 40,
                                                      right: 40,
                                                      top: 10,
                                                      bottom: 10)),
                                              child: Text(
                                                'ليس بعد',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'font1',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 54,
                                        width: (width - 44) / 2,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF65B741),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(19),
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: onTap1,
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.only(
                                                      left: 40,
                                                      right: 40,
                                                      top: 10,
                                                      bottom: 10)),
                                              child: Text(
                                                'تم الحل',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'font1',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : done == false
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 54,
                                            width: width - 44,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFC21010),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(19),
                                                  bottomRight:
                                                      Radius.circular(19),
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: onTap2,
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.only(
                                                          left: 100,
                                                          right: 100,
                                                          top: 10,
                                                          bottom: 10)),
                                                  child: Text(
                                                    'ليس بعد',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: 'font1',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 54,
                                            width: width - 44,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF65B741),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(19),
                                                  bottomRight:
                                                      Radius.circular(19),
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: onTap2,
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.only(
                                                          left: 100,
                                                          right: 100,
                                                          top: 10,
                                                          bottom: 10)),
                                                  child: Text(
                                                    "تم الحل",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: 'font1',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
