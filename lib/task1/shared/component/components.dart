import 'package:firist_project/task1/shared/component/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? type,
  Function(String title)? onSubmit,
  Function(String title)? onChange,
  Function(String? title)? validate,
  bool isPassword = false,
  int? Maxlength,
  String? label,
  String? hint,
  IconData? prefix,
  Function()? suffixPressed,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      maxLength: Maxlength,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (T) => validate!(T),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix, color:Colors.grey),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );

class IconItem {
  final String urlImage;

  const IconItem({required this.urlImage});
}

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height = 40,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.buttonColor = kPrimaryColor,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Tajawal',
          ),
        ),
      ),
    );
  }
}
class IconItem1 {
  final String urlImage;

  const IconItem1({required this.urlImage});
}

class CustomButton1 extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;

  const CustomButton1({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.width ,
    required this.height ,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 15,
    this.buttonColor = Colors.grey,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        height: height,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Tajawal',
          ),
        ),
      ),
    );
  }
}