import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mealsview/controller/apiController.dart';
import 'package:provider/provider.dart';

import '../Utils/constants/screen_utils.dart';
import 'detailsPage.dart';
class MyMeals extends StatelessWidget {
  const MyMeals({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);
    double screenHight = ScreenUtil.Height(context);
    return  Consumer<MealsApi>(
      builder: (context, value, child) =>
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Meals Available now"),
              titleTextStyle: GoogleFonts.aleo(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                fontStyle: FontStyle.italic,
                color:Color(0xff265073)
              ),
            ),
            body: FutureBuilder(
              future: value.getMeals(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
                }
                else{
                  return value.model!=null ? GridView.builder(
                    itemCount: value.model!.categories.length,
                      gridDelegate:     SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: screenHight * 0.285,
                        crossAxisSpacing: screenWidth / 32.66,
                        mainAxisSpacing: screenWidth / 32.66,
                      ),
                      itemBuilder: (context, index) => 
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProduct(
                        productDetail: value.model!.categories[index].strCategoryDescription,),));
                    },
                    child: Card(
                      margin: EdgeInsets.all(5),
                      surfaceTintColor:Color(0xff265073),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(value.model!.categories[index].strCategory,
                          style: GoogleFonts.alkalami(
                            fontSize: 20,
                            color: Color(0xff265073)
                          ),
                          ),
                          Image.network(value.model!.categories[index].strCategoryThumb)
                        ],
                      ),
                    ),
                  )
                  )
                  :
                      Center(
                        child: Lottie.asset("assets/loading.json")
                      )
                  ;
                }
              },
            ),
          ),
    );
  }
}
