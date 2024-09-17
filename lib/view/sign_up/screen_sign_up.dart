// sign_up_view.dart

import 'package:flutter/material.dart';
import 'package:mind_glow/utils/colo_extension.dart';
import 'package:mind_glow/utils/common_padding.dart';
import 'package:mind_glow/utils/common_text_styles.dart';
import 'package:mind_glow/utils/fire_base_helper.dart';
import 'package:mind_glow/utils/validations.dart';
import 'package:mind_glow/view/common_widgets/round_buttons.dart';
import 'package:mind_glow/view/common_widgets/text_fields.dart';
import 'package:mind_glow/view/login/screen_login.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool a = true;
  bool b = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    EdgeInsetsGeometry padding = ResponsivePadding.getPadding(context);
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: padding,
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hey there,', style: AppTextStyles.loginHeading1),
                  Text(
                    'Create an Account',
                    style: AppTextStyles.titleTextStyle,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'User Name',
                    icon: 'assets/images/Profile.png',
                    controller: firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'Email',
                    icon: 'assets/images/Message.png',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: validateEmail,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'Password',
                    icon: 'assets/images/Lock.png',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: a,
                    controller: passwordController,
                    rightIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          a = !a;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/Hide-Password.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Tcolo.gray,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: 'Confirm Password',
                    icon: 'assets/images/confirm-password3.png',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: b,
                    controller: confirmpasswordController,
                    rightIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          b = !b;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/images/Hide-Password.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: Tcolo.gray,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                  RoundButton(
                    textColor: Tcolo.white,
                    title: 'Register',
                    onPressed: () {
                      if (passwordController.text ==
                          confirmpasswordController.text) {
                        if (_formKey.currentState!.validate()) {
                          registerUser(
                            emailController.text,
                            passwordController.text,context
                          );
                        }
                      } else {
                        passwordController.clear();
                        confirmpasswordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password doesn\'t match',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.yellow,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    buttonColor: Tcolo.Primarycolor1,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Tcolo.gray.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        "  Or  ",
                        style: TextStyle(color: Tcolo.black, fontSize: 12),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Tcolo.gray.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenLogin(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppTextStyles.loginEnding,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Tcolo.Secondarycolor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}


