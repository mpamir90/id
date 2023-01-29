import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/outlined_input.dart';
import '../controllers/user_controller.dart';
import 'widgets/user_list.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userC = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedInput(
              hint: "Search",
              onChanged: userC.search,
              controller: userC.searchFieldController,
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(child: UserList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.userAdd),
        child: const Icon(Icons.add),
      ),
    );
  }
}
