import 'dart:io';

import 'package:cybpress/pages/pdf/pdf_api_main.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  static Future<File> generate(String name,String mobile,String address,String email,String age,String docname,String docemail,String docnum,String docspec) async {

    var myTheme = ThemeData.withFont(
      base: Font.ttf(await rootBundle.load('assets/fonts/Quicksand-Regular.ttf')),
      bold: Font.ttf(await rootBundle.load('assets/fonts/Quicksand-Regular.ttf')),
      italic: Font.ttf(await rootBundle.load('assets/fonts/Quicksand-Regular.ttf')),
      boldItalic: Font.ttf(await rootBundle.load('assets/fonts/Quicksand-Regular.ttf')),
    );
    var pdf = Document(
      theme: myTheme,
    );

    // var data = await rootBundle.load("assets/open-sans.ttf");

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
         // buildCustomHeader(),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          // Paragraph(
          //   text:
          //   'This is my custom font that displays also characters such as €, Ł, ...',
          //
          // ),
          // buildCustomHeadline(),
          // buildLink(),
          // ...buildBulletPoints(),
          // Header(child: Text('My Headline')),
          Paragraph(text: "Patient details"),
          Paragraph(text: name),
          Paragraph(text: age),
          Paragraph(text: mobile),
          Paragraph(text: email),
          Paragraph(text: address),
          Paragraph(text: "doctor details"),
          Paragraph(text: docname),
          Paragraph(text: docnum),
          Paragraph(text: docemail),
          Paragraph(text: docspec),

        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    return PdfApi.saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Widget buildCustomHeader() => Container(
    padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
    ),
    child: Row(
      children: [
        PdfLogo(),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
          'Create Your PDF',
          style: TextStyle(fontSize: 20, color: PdfColors.blue),
        ),
      ],
    ),
  );

  static Widget buildCustomHeadline() => Header(
    child: Text(
      'My Third Headline',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.red),
  );

  static Widget buildLink() => UrlLink(
    destination: 'https://flutter.dev',
    child: Text(
      'Go to flutter.dev',
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: PdfColors.blue,
      ),
    ),
  );

  static List<Widget> buildBulletPoints() => [
    Bullet(text: 'First Bullet'),
    Bullet(text: 'Second Bullet'),
    Bullet(text: 'Third Bullet'),
  ];
}
