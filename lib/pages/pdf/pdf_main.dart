// import 'package:cybpress/pages/pdf/pdf_api_main.dart';
// import 'package:flutter/material.dart';
//
//
//
// import '../widget/button_widget.dart';
// import 'api_pdf.dart';
//
// class PdfPage extends StatefulWidget {
//   @override
//   _PdfPageState createState() => _PdfPageState();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   @override
//   String complaint="helllo";
//   Widget build(BuildContext context) => Scaffold(
//
//     body: Container(
//       padding: EdgeInsets.all(32),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ButtonWidget(
//               text: 'Simple PDF',
//               onClicked: () async {
//                 final pdfFile =
//                 await PdfApi.generateCenteredText('Sample Text');
//
//                 PdfApi.openFile(pdfFile);
//               },
//             ),
//             const SizedBox(height: 24),
//             ButtonWidget(
//               text: 'Paragraphs PDF',
//               onClicked: () async {
//                 final pdfFile = await PdfParagraphApi.generate();
//
//                 PdfApi.openFile(pdfFile);
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
