import 'package:cybpress/pages/single_doctor/single_doctor_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../api_services/api_services.dart';


class singleBinding extends Bindings {
  void dependencies() => Get.lazyPut(() => singleController());
}

class singleController extends GetxController {
  static singleController get to => Get.find();


  List<  singlecontrol >planneds = < singlecontrol >[];


  Future<List<singlecontrol>>single(String id) async {
    final results =  await Webservice().single(id);
    print(results);

    this.planneds=results.map((item)=>singlecontrol( plannings: item)).toList();
    print("categories.length :::"+this.planneds.length.toString());
    return this.planneds;



  }

}

class singlecontrol {

  late final sin
  plannings
  ;

  singlecontrol({required this.plannings});

  String? get
  id {
    return this.plannings.sId;
  }

  String? get name {
    return this.plannings.name;
  }

  String? get mobile {
    return this.plannings.mobile;
  }

  String? get
  email {
    return this.plannings.email;
  }

  String? get image {
    return this.plannings.imgUrl;
  }

  String? get spec {
    return this.plannings.specialization;
  }
  String? get gender {
    return this.plannings.gender;
  }

}