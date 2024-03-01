import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyProduct extends StatelessWidget {
   MyProduct({super.key,required this.productDetail});
String productDetail;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text("Meals Details"),
    titleTextStyle: GoogleFonts.aleo(
    fontWeight: FontWeight.w600,
    fontSize: 26,
    fontStyle: FontStyle.italic,
    color:Color(0xff265073)
    ),
    ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Text(
            productDetail,
            style: TextStyle(
              fontSize: 20,
              color: Colors.indigo
            ),
          ),
        ),
      ),
    );

  }
}
