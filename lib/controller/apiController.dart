import 'package:mealsview/model/mealmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MealsApi extends ChangeNotifier{
  MealModel? model;
Future getMeals()async{
  var baseUrl="https://www.themealdb.com/api/json/v1/1/categories.php";
  var url=Uri.parse(baseUrl);
  final response=await http.get(url);
  if(response.statusCode==200){
    model=mealModelFromJson(response.body);
    // print(response.body);
    notifyListeners();
  }

}
}