import 'package:amazon_app/features/account/widgets/button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Buttons(
              text: 'Your Orders',
              onTap: () {},
            ),
            Buttons(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Buttons(
              text: 'Log Out',
              onTap: () {},
            ),
            Buttons(
              text: 'Your Wishlist',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
