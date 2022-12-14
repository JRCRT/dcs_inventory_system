import 'package:dcs_inventory_system/bloc/auth/auth_bloc.dart';
import 'package:dcs_inventory_system/bloc/bloc.dart';
import 'package:dcs_inventory_system/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool _canSave = false;

  void setCanSave() {
    bool isPasswordNotSame =
        currentPasswordController.text != newPasswordController.text;
    if (currentPasswordController.text.isNotEmpty &&
        newPasswordController.text.isNotEmpty &&
        isPasswordNotSame) {
      setState(() {
        _canSave = true;
      });
    } else {
      setState(() {
        _canSave = false;
      });
    }
  }

  void changePassword(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(ChangePassword(
        currentPasswordController.text, newPasswordController.text, context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BackAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LabeledPasswordField(
                  hintText: "Current Password",
                  controller: currentPasswordController,
                  onChange: (_) {
                    setCanSave();
                  },
                ),
                LabeledPasswordField(
                  hintText: "New Password",
                  controller: newPasswordController,
                  onChange: (_) {
                    setCanSave();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomElevatedButton(
                      isDisable: !_canSave,
                      fontColor: Colors.white,
                      text: "Save Changes",
                      backgroundColor: Colors.black,
                      onPressed: () {
                        changePassword(context);
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
