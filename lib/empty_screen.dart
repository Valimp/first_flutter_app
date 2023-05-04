import 'package:first_flutter_app/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/product.dart';
import 'package:first_flutter_app/app_colors.dart';
import 'package:first_flutter_app/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes scans'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.barcode),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('res/svg/ill_empty.svg'),
            SizedBox(height: height * 0.10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.20),
              child: const Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.05),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => ProductSummary()),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF080040),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 30.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22.0),
                  ),
                ),
                backgroundColor: const Color(0xFFFBAF02),
              ),
              child: SizedBox(
                width: width * 0.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        'Commencer'.toUpperCase(),
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt_sharp)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}