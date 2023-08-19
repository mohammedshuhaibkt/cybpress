

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../api_services/api_services.dart';


class pdfBinding extends Bindings {
  void dependencies() => Get.lazyPut(() => pdfController());
}

class pdfController extends GetxController {
  static pdfController get to => Get.find();

  Future<Map<String, dynamic>> addpdf(
      String id,
      pdfin,
     ) async {
    final results = await Webservice().addpdf(
        id,
        pdfin,);

    return results;
  }



}
