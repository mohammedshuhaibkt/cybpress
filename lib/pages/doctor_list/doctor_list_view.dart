
import 'package:cybpress/pages/doctor_list/doctor_list_model.dart';
import 'package:cybpress/pages/single_doctor/single_doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pdf/pdf_main.dart';
import 'doctor_list_binding.dart';


class doctorlist extends StatelessWidget {

  final docs = Get.put(listController());
  List<String> reportList = ["M", "F"];
  List<String> reportLists = ["10:00", "11:00"];
  late String cmsc;
  late String cmscs;
  late String type;
  String? patientName,registrationId,
      mobileNo;
  String  email="",address=""
  ,age="";
  String dateOfBirth="";
  String gender="";
  String time="";
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
          IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
            ),
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(
              Icons.filter_b_and_w_outlined,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context){
                    return Dialog(
                      child: Container(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // width: 400,

                              child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    MultiSelectChip(
                                      reportList,
                                      onSelectionChanged: (selectedList) {
                                          gender = selectedList;
                                          print(gender);
                                          onSaved: (value) => cmsc =gender.toString();
                                          obscureText: false;
                                          validator: (value) =>
                                          value.isEmpty
                                              ? "Please select gender"
                                              : null;
                                          decoration: InputDecoration(
                                            filled: true,
                                            // fillColor: Color.fromRGBO(39,150,226, 0.8),
                                            //hintText: 'University',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none,
                                            ),

                                            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          );


                                      },
                                    ),
                                    ],
                        ),
                            ),
                                    Container(
                                      // width: 400,

                                      child: Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                    MultiSelectChips(
                                      reportLists,
                                      onSelectionChanged: (selectedLists) {
                                        time = selectedLists;
                                        print(gender);
                                        onSaved: (value) => cmscs =time.toString();
                                        obscureText: false;
                                        validator: (value) =>
                                        value.isEmpty
                                            ? "Please select gender"
                                            : null;
                                        decoration: InputDecoration(
                                          filled: true,
                                          // fillColor: Color.fromRGBO(39,150,226, 0.8),
                                          //hintText: 'University',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),

                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        );


                                      },
                                    ),

                                    // Text(selectedReportList.toString())
                                  ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);

                                },
                                child: Container(
                                  height: 30,width:100,
                                  decoration: BoxDecoration(
                                    color:Color.fromRGBO(34, 159, 113, 1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text("Submit",style: TextStyle(fontSize: 15,color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontFamily: "QuicksandRegular",),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
          ),

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
                            builder: (context) =>
                                singledoctor(id:plan.id.toString()
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

class MultiSelectChip extends StatefulWidget {
  List<String> reportList;

  Function(String) onSelectionChanged;
  MultiSelectChip(this.reportList, { Key? key,  required this.onSelectionChanged}) : super(key: key);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  // String test;
  _buildChoiceList() {
    List<Widget> choices =[];
    widget.reportList.forEach((item) {
      choices.add(Container(
        width:100,

        padding: const EdgeInsets.all(10.0),
        child: ChoiceChip(


          selectedColor:Color.fromRGBO(94, 203, 163, 0.9),
          label: Container(
            //width:180,
            decoration: const BoxDecoration(
              border: Border(

              ),
            ),
            child:Center(

              child: Text(item),),

          ),
          labelPadding: const EdgeInsets.all(0),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              //print(item);
              //onSaved: (value) => item =test;

              widget.onSelectionChanged(selectedChoice);
            });
          },
          backgroundColor: Color.fromRGBO(238, 255, 249,2),
          labelStyle: const TextStyle(color: Color.fromRGBO(66, 78, 98, 2),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                width: 1,
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
              )),
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class MultiSelectChips extends StatefulWidget {
  List<String> reportLists;

  Function(String) onSelectionChanged;
  MultiSelectChips(this.reportLists, { Key? key,  required this.onSelectionChanged}) : super(key: key);
  @override
  _MultiSelectChipStates createState() => _MultiSelectChipStates();
}
class _MultiSelectChipStates extends State<MultiSelectChips> {
  String selectedChoices = "";
  // String test;
  _buildChoiceList() {
    List<Widget> choices =[];
    widget.reportLists.forEach((item) {
      choices.add(Container(
        width:100,

        padding: const EdgeInsets.all(10.0),
        child: ChoiceChip(


          selectedColor:Color.fromRGBO(94, 203, 163, 0.9),
          label: Container(
            //width:180,
            decoration: const BoxDecoration(
              border: Border(

              ),
            ),
            child:Center(

              child: Text(item),),

          ),
          labelPadding: const EdgeInsets.all(0),
          selected: selectedChoices == item,
          onSelected: (selected) {
            setState(() {
              selectedChoices = item;
              //print(item);
              //onSaved: (value) => item =test;

              widget.onSelectionChanged(selectedChoices);
            });
          },
          backgroundColor: Color.fromRGBO(238, 255, 249,2),
          labelStyle: const TextStyle(color: Color.fromRGBO(66, 78, 98, 2),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                width: 1,
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
              )),
        ),
      ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

