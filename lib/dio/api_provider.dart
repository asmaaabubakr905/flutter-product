import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:my_app/models/product_model.dart';

class ApiProvider {
  final String baseUrl="https://dummyjson.com";
  ProductModel? producstFromApi;  //storage data

  Future <ProductModel?> getAllProductsFromApi() async { 
    Response response = await Dio().get("$baseUrl/products",queryParameters:{ "select" : "id,title,description,category,price,thumbnail"});
    try{
      log(response.data.toString());
      producstFromApi = ProductModel.fromJson(response.data);
      print(producstFromApi!.products[0].title);
      return producstFromApi;
    } catch(e){
      print(e.toString());
    }
  }
}