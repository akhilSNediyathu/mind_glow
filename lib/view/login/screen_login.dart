// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mind_glow/utils/colo_extension.dart';
import 'package:mind_glow/utils/common_padding.dart';
import 'package:mind_glow/utils/common_text_styles.dart';
import 'package:mind_glow/utils/fire_base_helper.dart';
import 'package:mind_glow/utils/validations.dart';
import 'package:mind_glow/view/common_widgets/round_buttons.dart';
import 'package:mind_glow/view/common_widgets/text_fields.dart';
import 'package:mind_glow/view/sign_up/screen_sign_up.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool a = true;

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
            // const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Hey there,', style: AppTextStyles.loginHeading1),
                  Text(
                    'Welcome Back',
                    style: AppTextStyles.titleTextStyle,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Form(
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundTextField(
                            validator: validateEmail,
                            hintText: 'Email',
                            icon: 'assets/images/Message.png',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          RoundTextField(
                            validator: validatePassword,
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
                        ],
                      )),
                  SizedBox(
                    height: media.width * 0.6,
                  ),
                  RoundButton(
                    textColor: Tcolo.white,
                    title: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginUser(emailController.text, passwordController.text,
                            context);
                      } else {}
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => ScreenSignUp()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account yet? ",
                          style: AppTextStyles.loginEnding,
                        ),
                        Expanded(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Tcolo.Secondarycolor1,
                              fontSize: media.height * 0.02,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
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
