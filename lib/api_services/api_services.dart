import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/doctor_list/doctor_list_model.dart';
import '../pages/single_doctor/single_doctor_model.dart';


class Webservice {



  Future<List<doc>> doctors() async {


    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRlZmE3NjQxOTgyODcyYTNiYWVkNTYiLCJpYXQiOjE2OTI0MTg2NzgsImV4cCI6MTcyMzk1NDY3OH0.X-dDqvBbz4PtsBTv9TEM_Rdv6oE7sjVp6ahFgdcsmdA";



    final url = "http://43.204.221.212/api/v1/test/getAllDoctors";
    final response = await http.get(Uri.parse(url),


        headers: {'Authorization': 'Bearer $token'});



    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      print("request reply :" + response.body);
      final body = jsonDecode(response.body);
      print(body);
      final Iterable json = body;


      return json.map((item) => doc.fromJson(item)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }


  Future<List<sin>> single(String id) async {
    final Map<String, dynamic> data = {
      '_id': id
    };

    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRlZmE3NjQxOTgyODcyYTNiYWVkNTYiLCJpYXQiOjE2OTI0MTg2NzgsImV4cCI6MTcyMzk1NDY3OH0.X-dDqvBbz4PtsBTv9TEM_Rdv6oE7sjVp6ahFgdcsmdA";



    final url = "http://43.204.221.212/api/v1/test/getSingleDoctor";
    final response = await http.post(Uri.parse(url),

        body: data,
        headers: {'Authorization': 'Bearer $token'});



    if (response.statusCode == 200) {
      print("response.statusCode :" + response.statusCode.toString());

      print("request reply :" + response.body);
      final body = jsonDecode(response.body);
      print(body);
      final Iterable json = body;


      return json.map((item) => sin.fromJson(item)).toList();
    } else {
      print("Unable to perform request!");
      throw Exception("Unable to perform request!");
    }
  }
}