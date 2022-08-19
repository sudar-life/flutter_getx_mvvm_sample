import 'package:flutter_getx_mvvm_sample/src/model/random_user.dart';
import 'package:flutter_getx_mvvm_sample/src/model/random_user_simple.dart';
import 'package:flutter_getx_mvvm_sample/src/repository/random_user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RandomUserRepository _randomUserRepository;

  // RxList<RandomUser> userList = <RandomUser>[].obs;
  RxList<RandomUserSimple> userList = <RandomUserSimple>[].obs;

  @override
  void onInit() {
    super.onInit();
    _randomUserRepository = RandomUserRepository();
  }

  // void loadUser() async {
  //   var users = await _randomUserRepository.getAllUser();
  //   userList(users);
  // }

  void loadSimpleUser() async {
    var users = await _randomUserRepository.getAllUserWithSimple();
    userList(users);
  }
}
