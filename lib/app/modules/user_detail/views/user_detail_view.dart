import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:idstar/app/data/models/user_model.dart';
import 'package:idstar/app/widgets/outlined_input.dart';

import '../../../widgets/primary_button.dart';
import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            OutlinedInput(
              prefixText: "NAMA",
              controller: controller.nameTextC,
            ),
            const SizedBox(height: 16),
            OutlinedInput(
              prefixText: "EMAIL",
              controller: controller.emailTextC,
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedInput(
              prefixText: "GENDER",
              initialValue: userModel.gender,
            ),
            const SizedBox(height: 16),
            OutlinedInput(
              prefixText: "STATUS",
              controller: controller.statusTextC,
            ),
            const Spacer(),
            PrimaryButton(
              label: "Simpan",
              onPressed: () => controller.save(userModel.id),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              label: "HAPUS PENGGUNA",
              onPressed: () => controller.deleteUser(userModel.id),
            )
          ],
        ),
      ),
    );
  }
}
