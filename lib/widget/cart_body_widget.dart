import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({super.key, required this.item});

  var item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xffdfdfdf),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: Color(0xff4b4b4b),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.delete_outline,
              color: Color(0xff4b4b4b),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
