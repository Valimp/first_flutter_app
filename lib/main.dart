import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_flutter_app/app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF080040),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        fontFamily: 'Avenir'
      ),
      home: const ProductDetail(),
    );
  }
}

/// EMPTYSCREEN
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  //final double height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Mes scans",
          style: TextStyle(
            color: Color(0xFF080040),
            fontWeight: FontWeight.w600,
            fontFamily: 'AppIcons'
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.barcode),
          )
        ],
      ),
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("res/svg/ill_empty.svg"),
            SizedBox(height: height * 0.10),
            const Text(
              "Vous n'avez pas encore \n scanné de produit",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 2,
              ),
            ),
            SizedBox(height: height * 0.05),
            TextButton(
                onPressed: () {
                  print("Click");
                },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF080040),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                backgroundColor: const Color(0xFFFBAF02),
                padding: const EdgeInsets.all(20.0),
              ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "COMMENCER",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'AppIcons'
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.arrow_forward,
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}


/// SCREEN 1
class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: const [
            ProductImage(),
            Positioned.fill(
              child: ProductContainer(
                child: ProductBanner()
                )
              ),
          ],
        ),
      ),
    );
  }
}

class ProductBanner extends StatelessWidget {
  const ProductBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return SizedBox(
      // TODO: BACKGROUND BANNER -- SIZING BANNER -- ARRANGMENT BANNER
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ProductNutriscore(score: Nutriscore.A),
              ProductNovaScore(novascore: "Groupe 4"),
            ],
          ),
          const ProductEcoScore(ecoscore: "E")
        ],
      ),
    );
  }
}


class ProductEcoScore extends StatelessWidget {
  final String ecoscore;
  const ProductEcoScore({Key? key, required this.ecoscore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(ecoscore) {
      case "A": return Row(
        children: const [
          Icon(
            AppIcons.ecoscore_a,
            color: Color(0xFF1E8F4E),
          ),
          Text("Très faible impact environnemental"),
        ],
      );
      case "B": return Row(
        children: const [
          Icon(
            AppIcons.ecoscore_b,
            color: Color(0xFF2ECC71),
          ),
          Text("Faible impact environnemental")
        ],
      );
      case "C": return Row(
        children: const [
          Icon(
            AppIcons.ecoscore_c,
            color: Color(0xFFFFC900),
          ),
          Text("Impact modéré sur l'environnement")
        ],
      );
      case "D": return Row(
        children: const [
          Icon(
            AppIcons.ecoscore_d,
            color: Color(0xFFEF7E1A),
          ),
          Text("Impact environnemental élevé")
        ],
      );
      case "E": return Row(
      children: const [
        Icon(
          AppIcons.ecoscore_e,
          color: Color(0xFFE62D19),
        ),
        Text(" Impact environnemental très élevé")
      ],
    );
      default: return Text("Error Ecoscore");

    }
  }
}


class ProductNovaScore extends StatelessWidget {
  final String novascore;

  const ProductNovaScore({Key? key, required this.novascore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(novascore) {
      case "Groupe 1": return Column(
        children: const [
          Text("Groupe NOVA"),
          Text("Aliments non transformés ou transformés minimalement")
        ],
      );
      case "Groupe 2": return Column(
        children: const [
          Text("Groupe NOVA"),
          Text("Ingrédients culinaires transformés")
        ],
      );
      case "Groupe 3": return Column(
        children: const [
          Text("Groupe NOVA"),
          Text("Aliments transformés")
        ],
      );
      case "Groupe 4": return Column(
        children: const [
          Text("Groupe NOVA"),
          Text("Produits alimentaires et boissons ultra-transformés")
        ],
      );
      default: return Text("Error novascore");
    }
  }
}


enum Nutriscore {
  A("a"),
  B("b"),
  C("c"),
  D("d"),
  E("e");

  final String letter;

  const Nutriscore(this.letter);
}

class ProductNutriscore extends StatelessWidget {
  final Nutriscore score;

  const ProductNutriscore({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nutri-Score'),
        Image.asset(
          'res/drawables/nutriscore_${score.letter}.png',
          width: 78,
          height: 42,
        )
      ],
    );
  }
}


class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Image.network(
        'https://images.openfoodfacts.org/images/products/317/568/001/1480/front_fr.139.400.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  final Widget? child;

  const ProductContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BorderRadiusDirectional radius = BorderRadiusDirectional.only(
      topStart: Radius.circular(16.0),
      topEnd: Radius.circular(16.0),
    );
    return SingleChildScrollView(
      child: Scrollbar(
        child: Container(
          height: 10000,
          margin: const EdgeInsets.only(
            top: 150,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: child,
          ),
        ),
      ),
    );
  }
}
