import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserForm extends StatefulWidget {
  TextEditingController? fullnameController;
  TextEditingController? emailController;
  TextEditingController? contactController;
  String? fullnameHintText;
  String? emailHintText;
  String? contactHintText;
  Widget? fullnameIcon;
  Widget? emailIcon;
  Widget? contactIcon;
  String? Function(String? val) validator;
  UserForm(
      {Key? key,
      this.fullnameController,
      this.emailController,
      this.contactController,
      this.fullnameHintText,
      this.emailHintText,
      this.contactHintText,
      this.fullnameIcon,
      this.emailIcon,
      this.contactIcon,
      required this.validator})
      : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.fullnameController,
              validator: widget.validator,
              decoration: InputDecoration(
                  hintText: widget.fullnameHintText,
                  icon: widget.fullnameIcon,
                  border: const OutlineInputBorder()),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: widget.validator,
              controller: widget.emailController,
              decoration: InputDecoration(
                  hintText: widget.emailHintText,
                  icon: widget.emailIcon,
                  border: const OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.contactController,
              validator: widget.validator,
              decoration: InputDecoration(
                  hintText: widget.contactHintText,
                  icon: widget.contactIcon,
                  border: const OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
