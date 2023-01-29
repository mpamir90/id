import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../data/models/user_model.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/user_controller.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userC = Get.find<UserController>();

    return Obx(
      () {
        final listSearch = userC.listSearch;

        if (listSearch.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listSearch.length,
            itemBuilder: (context, index) =>
                _UserItem(userModel: listSearch[index]),
          );
        }

        return PagedListView<int, UserModel>(
          padding: const EdgeInsets.all(16),
          pagingController: userC.pagingController,
          builderDelegate: PagedChildBuilderDelegate<UserModel>(
            itemBuilder: (context, item, index) => _UserItem(userModel: item),
          ),
        );
      },
    );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.userDetail,
        arguments: userModel,
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${userModel.id}"),
            Text("Nama: ${userModel.name}"),
            Text("Email: ${userModel.email}"),
            Text("Gender: ${userModel.gender}"),
            Text("Status: ${userModel.status}"),
          ],
        ),
      ),
    );
  }
}
