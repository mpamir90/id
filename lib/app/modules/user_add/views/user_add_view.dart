import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/outlined_input.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/user_add_controller.dart';

class UserAddView extends GetView<UserAddController> {
  const UserAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat User'),
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
              controller: controller.genderTextC,
            ),
            const SizedBox(height: 16),
            OutlinedInput(
              prefixText: "STATUS",
              controller: controller.statusTextC,
            ),
            const Spacer(),
            PrimaryButton(
              label: "BUAT PENGGUNA",
              onPressed: () => controller.addUser(),
            ),
          ],
        ),
      ),
    );
  }
}
