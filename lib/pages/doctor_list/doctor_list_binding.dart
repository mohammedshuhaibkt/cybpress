import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../api_services/api_services.dart';
import 'doctor_list_model.dart';

class listBinding extends Bindings {
  void dependencies() => Get.lazyPut(() => listController());
}

class listController extends GetxController {
  static listController get to => Get.find();


  List<  doctorcontrol >planned = < doctorcontrol >[];


  Future<List<doctorcontrol>>doctors() async {
    final results =  await Webservice().doctors();
    print(results);

    this.planned=results.map((item)=>doctorcontrol( planning: item)).toList();
    print("categories.length :::"+this.planned.length.toString());
    return this.planned;



  }

}

class doctorcontrol {

   late final doc
  planning
  ;

   doctorcontrol({required this.planning});

  String? get
  id {
    return this.planning.sId;
  }

  String? get name {
    return this.planning.name;
  }

  String? get mobile {
    return this.planning.mobile;
  }

  String? get
  email {
    return this.planning.email;
  }

  String? get image {
    return this.planning.imgUrl;
  }

}