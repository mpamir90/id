import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idstar/app/constant/api_path.dart';
import 'package:idstar/app/data/models/user_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserController extends GetxController {
  List<UserModel> listUser = [];
  final listSearch = RxList<UserModel>([]);
  final searchFieldController = TextEditingController();

  final PagingController<int, UserModel> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchUsers(int pageKey) async {
    final dio = Dio();
    final res = await dio.get(
      ApiPath.users,
      queryParameters: {
        "page": "$pageKey",
        "per_page": "20",
      },
    );

    if (res.statusCode != 200) {
      return;
    }

    List<UserModel> listUserModel =
        (res.data as List).map((e) => UserModel.fromMap(e)).toList();
    listUser.addAll(listUserModel);
    log(listUser.length.toString());

    pagingController.appendPage(listUserModel, pageKey + 1);
  }

  void search(String? value) {
    final search = pagingController.itemList
        ?.where((element) => element.name.contains(value!))
        .toList();

    listSearch.value = search ?? [];
  }

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchUsers(pageKey);
    });

    searchFieldController.addListener(() {
      if (searchFieldController.text == "") {
        listSearch.value = [];
        listUser = [];
        pagingController.refresh();
      }
    });
    super.onInit();
  }
}
