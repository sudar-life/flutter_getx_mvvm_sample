import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_sample/src/controller/home_controller.dart';
import 'package:flutter_getx_mvvm_sample/src/model/random_user.dart';
import 'package:flutter_getx_mvvm_sample/src/model/random_user_simple.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  Widget _bottomBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: controller.loadSimpleUser, child: const Text('사용자 로드')),
    );
  }

  Widget _userWidget(RandomUser user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(user.picture?.thumbnail ?? ''),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name?.first} ${user.name?.last}',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                '${user.phone}',
                style: const TextStyle(fontSize: 9),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userSimpleWidget(RandomUserSimple user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(user.thumbnail ?? ''),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.fullname}',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                '${user.phone}',
                style: const TextStyle(fontSize: 9),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userListWidget() {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: List.generate(
            controller.userList.length,
            (index) => _userSimpleWidget(controller.userList[index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _userListWidget(),
      bottomNavigationBar: _bottomBtn(),
    );
  }
}
