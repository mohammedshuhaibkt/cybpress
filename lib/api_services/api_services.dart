import 'dart:convert';
import 'dart:io';
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

  var pic;
  Future<Map<String, dynamic>> addpdf(
      String id,
      File pdfin,) async {
    // var request = http.MultipartRequest("POST", Uri.parse("<https://arioninfotech.com/registration/>"));
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRlZmE3NjQxOTgyODcyYTNiYWVkNTYiLCJpYXQiOjE2OTI0MTg2NzgsImV4cCI6MTcyMzk1NDY3OH0.X-dDqvBbz4PtsBTv9TEM_Rdv6oE7sjVp6ahFgdcsmdA";
    var request = http.MultipartRequest(
        "PUT", Uri.parse("http://43.204.221.212/api/v1/test/updatePdf"));
    //var request = http.MultipartRequest("POST", Uri.parse("http://192.168.136.62:8080/dr_thayyari/dr_reg_withimage"));
    request.headers['Authorization'] = 'Bearer $token';



    pic = await http.MultipartFile.fromPath(
        "pdf", pdfin.path.toString() );
    request.fields['_id'] = id;


    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("aks" + responseString.toString());
    Map<String, dynamic> result;

    if (response.statusCode == 200) {
      //print("response      :"+response.body.toString());

      /* final Map<String, dynamic> responseData =jsonDecode(responseString);
      var userData = responseData;

      print("userdata"+userData.toString());

      reg authUser = reg.fromJson(userData);*/
      result = {
        'status': true,
        'message': 'Successful',
        'user': responseString
      };
    } else {
      result = {'status': false, 'message': "error"};
    }
    return result;
  }


}