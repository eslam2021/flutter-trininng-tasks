import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/component/Colors.dart';
import '../shared/component/components.dart';
import '../shared/component/styles.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> items3 = [
    'ذكر',
    'انثي',
  ];
  String? Value3;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phonController = TextEditingController();
  var numberController = TextEditingController();

  bool isPassword = true;

  final formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Login()));  },
          backgroundColor: Colors.black,
child:Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        backgroundColor: Color5,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.2,
width:MediaQuery.of(context).size.width ,

                  child: Image(
                    image: AssetImage(
                        'assets/images/59278.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Fashion Daily',
                            style: TextStyle(
                                fontSize: 16,
                                color:Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              Text(
                                'Help',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                              SizedBox(
                                width: 3.0,
                              ),
                              SizedBox(
                                height: 40.0,
                                width: 20.0,
                                child: SvgPicture.asset(Qustion,color: kPrimaryColor,),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        label: 'Email',
                        prefix: Icons.email,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'email enter your email';
                          }
                          if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2.0),
                          color: Colors.white,
                          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
                        ),
                        child: Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: controller,
                            inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Colors.red,width: 0.0)),
                            keyboardType:
                            TextInputType.numberWithOptions(signed: true, decimal: true),

                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {

                          }
                        },
                        isPassword: isPassword,
                        suffixPressed: () {},
                        type: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'كلمةالمرور قصيرة';
                          }
                          if (passwordController.text.length <= 8) {
                            return 'كلمةالمرور لا تقل عن 8 حروف';
                          }
                          return null;
                        },
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition: true,
                              builder: (context) => CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    log('send link pressed');
                                  }
                                },
                                text: 'Register',
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '''______________  or ______________''',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'ElMessiri',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                launch('');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.0,
                                    width: 20.0,
                                    child: SvgPicture.asset(icongoogle),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('sign with by google',
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: 'ElMessiri',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Color5),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                      color:kPrimaryColor,
                                      width: 2.0,
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ''' has any account?''',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'ElMessiri',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Login()));
                                    },
                                    child: Text(
                                      'Sgin in here',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('''By regestering your account, you are agree to our''',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'ElMessiri',
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text('terms and condition',    style: TextStyle(
                                    color: kPrimaryColor),),
                              ],
                            )
                          ],
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
    );
  }
}
