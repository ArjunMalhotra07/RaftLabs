import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  var hintText;
  CustomFormFieldWidget({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffBCE0FD).withOpacity(.38),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 20, top: 8),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  var nameText;
  CustomText({Key? key, this.nameText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      nameText,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.blue,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CustomGreetingsColumn extends StatelessWidget {
  CustomGreetingsColumn({Key? key, this.greetingName, this.imageName})
      : super(key: key);
  var imageName, greetingName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageName,
          height: 300.0,
          width: 300.0,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          greetingName,
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
