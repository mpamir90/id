import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/api_path.dart';
import '../../../data/models/post/user_post_model.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class UserDetailController extends GetxController {
  final UserModel userModel = Get.arguments;
  // final token = String.fromEnvironment("user");
  final nameTextC = TextEditingController();
  final emailTextC = TextEditingController();
  final statusTextC = TextEditingController();

  Future<void> save(int id) async {
    final userPostModel = UserPostModel(
      name: nameTextC.text,
      email: emailTextC.text,
      status: statusTextC.text,
    );

    try {
      final dio = Dio();
      final res = await dio.put(
        "${ApiPath.users}/$id",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 05b4bab93d1783ecbc2a7cc99abb1f7c7580872dee03862a40d549bd79cec98a"
          },
        ),
        data: userPostModel.toJson(),
      );
      log(res.data.toString());
      if (res.statusCode == 200) {
        await Get.dialog(const Dialog(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Update Berhasil",
          ),
        )));
        Get.offAllNamed(Routes.user);
      }
    } on DioError catch (e) {
      Get.dialog(
        Dialog(
          child: Text(e.message),
        ),
      );
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final dio = Dio();
      final res = await dio.delete(
        "${ApiPath.users}/$id",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 05b4bab93d1783ecbc2a7cc99abb1f7c7580872dee03862a40d549bd79cec98a"
          },
        ),
      );

      if (res.statusCode == 204) {
        await Get.dialog(const Dialog(child: Text("Delete Berhasil")));

        Get.offAllNamed(Routes.user);
      }
    } on DioError catch (e) {
      Get.dialog(
        Dialog(
          child: Text(e.message),
        ),
      );
    }
  }

  @override
  void onInit() {
    nameTextC.text = userModel.name;
    emailTextC.text = userModel.email;
    statusTextC.text = userModel.status;
    super.onInit();
  }
}
