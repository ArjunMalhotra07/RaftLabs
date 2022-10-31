import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFieldWidget extends StatelessWidget {
  const CustomFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 311,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row : Back Button + Edit Offer text + Delete
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.arrow_left_circle,
                      size: 32, color: Colors.lightBlueAccent)),
              // const SizedBox(width: 30),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Edit Offer',
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Name of product',
            style: TextStyle(
              fontSize: 14,
              color: Colors.lightBlueAccent,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          //  Name Field
          Container(
            decoration: BoxDecoration(
              color: Color(0xffBCE0FD).withOpacity(.38),
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: Colors.blueAccent, width: 1.5),
            ),
            height: 50,
            child: Card(
                child: TextFormField(
              readOnly: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: true,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20, top: 8),
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  hintMaxLines: 2,
                  hintText: 'offername'),
            )),
          ),
          const SizedBox(height: 15),
          const Text(
            'Points',
            style: TextStyle(
              fontSize: 14,
              color: Colors.lightBlueAccent,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          //  Points Field
          Container(
            decoration: BoxDecoration(
              color: Color(0xffBCE0FD).withOpacity(.38),
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: Colors.blueAccent, width: 1.5),
            ),
            height: 50,
            child: Card(
                child: TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                RegExp regex = RegExp(r'^.{1,}$');
                if (value!.isEmpty) {
                  return null;
                }
                if (!regex.hasMatch(value)) {
                  return ("Minimum of 1 character Required");
                }
                return null;
              },
              autofocus: true,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20, top: 8),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  hintMaxLines: 2,
                  hintText: 'cost'),
            )),
          ),
          const SizedBox(height: 15),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 14,
              color: Colors.lightBlueAccent,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          // Description Field
          Container(
            decoration: BoxDecoration(
              color: Color(0xffBCE0FD).withOpacity(.38),
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: Colors.blueAccent, width: 1.5),
            ),
            height: 50,
            child: Card(
                child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: true,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              maxLength: 30,
              maxLines: 3,
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 20, top: 8),
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  hintMaxLines: 2,
                  hintText: 'description'),
            )),
          ),
        ],
      ),
    );
  }
}
