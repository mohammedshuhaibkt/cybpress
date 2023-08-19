
import 'package:flutter/material.dart';

import '../pdf/api_pdf.dart';
import '../pdf/pdf_api_main.dart';



class addappointment extends StatelessWidget {
  final String docname;
  final String docnum;
  final String docemail;
  final String docspec;

  addappointment(
      {
        required this.docname,
        required this.docnum,
        required this.docemail,
        required this.docspec,

      });


  TextEditingController regcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController mobilecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();

  String  email="",address=""
  ,age="",mobile="",name="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:   Text(
          "Book Appointment",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                "Patient Details",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,


                ),
              ),
              Container(
                //height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),



                child: TextFormField(


                  //minLines: 3,

                  maxLines: null,
                  autofocus: false,

                  keyboardType: TextInputType.text,

                  onSaved: (value) => name =value!,
                  controller: namecontroller,
                  decoration: new InputDecoration(
                    hintText: 'Name',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1,color: Colors.grey),

                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                ),),
              Container(
                //height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),



                child: TextFormField(


                  //minLines: 3,

                  maxLines: null,
                  autofocus: false,

                  keyboardType: TextInputType.number,

                  onSaved: (value) => age =value!,
                  controller: agecontroller,
                  decoration: new InputDecoration(
                    hintText: 'Age',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1,color: Colors.grey),

                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                ),),
              Container(
                //height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),



                child: TextFormField(

                  keyboardType: TextInputType.text,

                  onSaved: (value) => email =value!,
                  controller: emailcontroller,
                  //minLines: 3,

                  maxLines: null,
                  autofocus: false,


                  decoration: new InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1,color: Colors.grey),

                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                ),),
              Container(
                //height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),



                child: TextFormField(


                  //minLines: 3,

                  maxLines: null,
                  autofocus: false,

                  keyboardType: TextInputType.number,

                  onSaved: (value) => mobile =value!,
                  controller: mobilecontroller,
                  decoration: new InputDecoration(
                    hintText: 'Phone no',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1,color: Colors.grey),

                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                ),),
              Container(
                //height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),



                child: TextFormField(


                  //minLines: 3,

                  maxLines: null,
                  autofocus: false,

                  keyboardType: TextInputType.text,

                  onSaved: (value) => address =value!,
                  controller: addresscontroller,
                  decoration: new InputDecoration(
                    hintText: 'Address',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1,color: Colors.grey),

                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                ),),

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
                    async {
                      final pdfFile = await PdfParagraphApi.generate(namecontroller.text,mobilecontroller.text,agecontroller.text,emailcontroller.text,addresscontroller.text,docname,docemail,docnum,docspec);

                      PdfApi.openFile(pdfFile);
                    },
                    color: Color(0xFF03BF9C),
                    textColor: Colors.white,

                    child: Text("Generate PDF/Send"),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),

    );
  }
}

