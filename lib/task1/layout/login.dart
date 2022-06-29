import 'dart:developer';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firist_project/task1/layout/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/component/Colors.dart';
import '../shared/component/components.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/component/styles.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color5,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width:MediaQuery.of(context).size.width,

                child: Image(
                  image: AssetImage(
                      'assets/images/59278.jpg'),
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
                                'Sign in',
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


                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2.0),
                          color: Colors.white,
                          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                            selectorTextStyle: TextStyle(color:Colors.grey),
                            initialValue: number,
                            textFieldController: controller,
                            formatInput: false,
                            inputBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                            keyboardType:
                            TextInputType.numberWithOptions(signed: true, decimal: true),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
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
                                text: 'Sign In',
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 20.0,
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
                                  '''Doesn't has any account?''',
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
                                          builder: (context) => Register()));
                                    },
                                    child: Text(
                                      'Register here',
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
                                Text(
                                  '''Use the application according to policy rules. Any 
kinds of violations will be subject to sanctions.''',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'ElMessiri',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
