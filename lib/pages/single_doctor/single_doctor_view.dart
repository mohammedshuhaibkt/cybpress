
import 'package:cybpress/pages/single_doctor/single_doctor_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../add_appointment/add_appointment_view.dart';
import '../pdf/pdf_main.dart';



class singledoctor extends StatelessWidget {
  final String id;

  singledoctor(
      {required this.id,

      });


  final sim = Get.put(singleController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:   Text(
          "Doctor Details",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,


          ),
        ),

        //elevation: 0.7,
        backgroundColor: Colors.grey,
      ),
      // appBar: AppBar(title: Text('Recepit')),
      body:SingleChildScrollView(
        child:
        Padding(padding: EdgeInsets.all(20),
          child:  FutureBuilder(
              future: sim.single(id),
              builder: (
                  BuildContext context,
                  AsyncSnapshot<List<
                      singlecontrol>> snapshot) {
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
                      return

    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),

      Center(
                        child:CircleAvatar(
                          radius: 55,
                          backgroundColor:  Color(0xFFE6FCF8),
                          child:
                          // profilePicture != null
                          //     ?
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              sim
                                  .planneds[0].image.toString(),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //       color:  Color(0xFFE6FCF8),
                          //       borderRadius: BorderRadius.circular(50)),
                          //   width: 100,
                          //   height: 100,
                          //   child: Icon(
                          //     Icons.camera_alt_outlined,size: 30,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                        ),
                        ),


                        Container(
                          //color: Colors.red,
                          //  height: 80,
                          //width: 700,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Align(alignment: Alignment.topLeft,
                              child: Text( sim
                                  .planneds[0].name.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
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
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Align(alignment: Alignment.topLeft,
                    child: Text( sim
                        .planneds[0].gender.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
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
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Align(alignment: Alignment.topLeft,
                    child: Text( sim
                        .planneds[0].spec.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
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
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Align(alignment: Alignment.topLeft,
                    child: Text( sim
                        .planneds[0].mobile.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
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
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Align(alignment: Alignment.topLeft,
                    child: Text( sim
                        .planneds[0].email.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 80),
                child:Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: MaterialButton(
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addappointment(docname:sim
                                .planneds[0].name.toString(),docnum:sim
                                .planneds[0].mobile.toString(),docemail:sim
                                .planneds[0].email.toString(),docspec:sim
                                .planneds[0].spec.toString(),id:id
                            )),
                      );
                    },
                    color: Color(0xFF03BF9C),
                    textColor: Colors.white,

                    child: Text("Book Appointment"),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),

],
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

        ),
      ),

    );
  }
}

