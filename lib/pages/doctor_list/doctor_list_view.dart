
import 'package:cybpress/pages/doctor_list/doctor_list_model.dart';
import 'package:cybpress/pages/single_doctor/single_doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'doctor_list_binding.dart';


class doctorlist extends StatelessWidget {

  final docs = Get.put(listController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:Text("Doctors List",style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1,

        ),),

        actions: <Widget>[


        ],

        backgroundColor: Color.fromRGBO(94, 203, 163, 1),

      ),

      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        FutureBuilder(
        future: docs.doctors(),
    builder: (
    BuildContext context,
    AsyncSnapshot<List<
    doctorcontrol>> snapshot) {
    switch (snapshot
        .connectionState) {
    case ConnectionState
        .done:
    {
    if (snapshot
        .hasError) {
    return Scaffold(
    body: Center(
    child: Text(
    'loading'),
    ),
    );
    } else {

    }

    return ListView
        .builder(
    itemCount: docs.planned.length,

    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,


    // Container height ratio
    itemBuilder: (context,
    index) {
      final plan = this
          .docs
          .planned[index];

    return  GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => singledoctor(id:plan.id.toString()
                            )),
                      );
                    },
                    child:Padding(padding: EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color:Color(0x0F780BCE),
                        //elevation: 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: <Widget>[
                            SizedBox(height: 5,),
                            Row(

                              children:[
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                      child:
                                      // provider.profilePicture[index] !=
                                      //     ""
                                      //     ?
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(50),
                                        child: Image.network(
                                          plan.image.toString(),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),

                                        // Image.file(
                                        //   _image,
                                        //   width: 100,
                                        //   height: 100,
                                        //   fit: BoxFit.fitHeight,
                                        // ),
                                      )
                                      //     :
                                      //   Container(
                                      //   decoration: BoxDecoration(
                                      //       color: Color.fromRGBO(
                                      //           34, 159, 113, 1),
                                      //       borderRadius:
                                      //       BorderRadius.circular(
                                      //           50)),
                                      //   // width: 55,
                                      //   // height: 55,
                                      //   child: Center(
                                      //     child: Text(
                                      //      plan,
                                      //       style: TextStyle(
                                      //         fontSize: 20,
                                      //         color: Colors.white,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontFamily:
                                      //         "QuicksandRegular",
                                      //         fontStyle: FontStyle.normal,
                                      //         letterSpacing: 1,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    Container(
                                      //color: Colors.red,
                                      //  height: 80,
                                      //width: 700,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, top: 5,right: 10),
                                        child: Align(alignment: Alignment.topLeft,
                                          child: Text(plan.name.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.red,
                                      //  height: 80,
                                      //width: 700,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, top: 5,right: 10),
                                        child: Align(alignment: Alignment.topLeft,
                                          child: Text(plan.mobile.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.red,
                                      //  height: 80,
                                      //width: 700,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, top: 5,right: 10),
                                        child: Align(alignment: Alignment.topLeft,
                                          child: Text(plan.email.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),



                                  ],
                                ),





                              ],
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    ),
                  );
                }

            );
    }
      default:
        return Container(
          height: 300,

          child: Align(
              alignment: Alignment.bottomCenter,

              child:CircularProgressIndicator(
                value: 0.8,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
              )
          ),
        );
    }


    }
        ),


          ],
        ),


      ),
    );
  }


}

