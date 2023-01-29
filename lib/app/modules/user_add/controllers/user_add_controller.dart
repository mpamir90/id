import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/api_path.dart';
import '../../../data/models/post/user_add_post_model.dart';
import '../../../routes/app_pages.dart';

class UserAddController extends GetxController {
  final nameTextC = TextEditingController();
  final emailTextC = TextEditingController();
  final statusTextC = TextEditingController();
  final genderTextC = TextEditingController();

  Future<void> addUser() async {
    final userAddPostModel = UserAddPostModel(
      name: nameTextC.text,
      email: emailTextC.text,
      status: statusTextC.text,
      gender: genderTextC.text,
    );

    try {
      final dio = Dio();
      final res = await dio.post(
        ApiPath.users,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 05b4bab93d1783ecbc2a7cc99abb1f7c7580872dee03862a40d549bd79cec98a"
          },
        ),
        data: userAddPostModel.toJson(),
      );
      log(res.data.toString());

      if (res.statusCode! >= 200) {
        await Get.dialog(
          const Dialog(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Create User Berhasil",
              ),
            ),
          ),
        );
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
}
