import 'package:flutter/material.dart';
import 'package:first_flutter_app/product.dart';
import 'package:first_flutter_app/app_colors.dart';
import 'package:first_flutter_app/app_icons.dart';
import 'package:share_plus/share_plus.dart';

class ProductSummary extends StatefulWidget {
  static const double kImageHeight = 300.0;
  final ScrollController _controller;

  ProductSummary({
    Key? key,
  })  : _controller = ScrollController(),
        super(key: key);

  @override
  State<ProductSummary> createState() => _ProductSummaryState();
}

class _ProductSummaryState extends State<ProductSummary> {

  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      ProductDetailsCurrentTab newTab = ProductDetailsCurrentTab.values[_selectedIndex];
      currentTab = newTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = FicheScreen(widget: widget);

    switch (currentTab) {
      case ProductDetailsCurrentTab.summary:
        currentScreen = FicheScreen(widget: widget);
        break;
      case ProductDetailsCurrentTab.info:
        currentScreen = const Text("TODO : Caractéristiques");
        break;
      case ProductDetailsCurrentTab.nutrition:
        currentScreen = const Text("TODO : Nutrition");
        break;
      case ProductDetailsCurrentTab.nutritionalValues:
        currentScreen = const Text("TODO : Tableau");
        break;
    };

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
            color: AppColors.gray3
        ),
        unselectedItemColor: AppColors.gray3,
        selectedLabelStyle: const TextStyle(
            color: AppColors.blue
        ),
        selectedItemColor: AppColors.blue,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_barcode),
              label: "Fiche"
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_fridge),
              label: "Caractéristiques"
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_nutrition),
              label: "Nutrition"
          ),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_array),
              label: "Tableau"
          )
        ],
      ),
      body: currentScreen,
    );
  }
}

class FicheScreen extends StatelessWidget {
  const FicheScreen({
    super.key,
    required this.widget,
  });

  final ProductSummary widget;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
        'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1610&q=80',
        width: double.infinity,
        height: ProductSummary.kImageHeight,
        fit: BoxFit.cover,
      ),
      Positioned.fill(
        child: SingleChildScrollView(
          controller: widget._controller,
          child: Scrollbar(
            controller: widget._controller,
            isAlwaysShown: true,
            child: Container(
              margin:
              const EdgeInsetsDirectional.only(top: ProductSummary.kImageHeight - 30.0),
              child: const _Body(),
            ),
          ),
        ),
      ),
      Align(
        alignment: AlignmentDirectional.topStart,
        child: _HeaderIcon(
          icon: AppIcons.close,
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: 'Fermer l\'écran',
        ),
      ),
      Align(
        alignment: AlignmentDirectional.topEnd,
        child: _HeaderIcon(
          icon: AppIcons.share,
          onPressed: () {
            Share.share('https://fr.openfoodfacts.org/produit/3017620422003/');
          },
          tooltip: 'Partager',
        ),
      ),
    ]);
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _HeaderIcon({required this.icon, this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        padding: const EdgeInsets.all(15.0),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
        tooltip: tooltip,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  static const double _kHorizontalPadding = 20.0;
  static const double _kVerticalPadding = 30.0;

  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _kHorizontalPadding,
              vertical: _kVerticalPadding,
            ),
            child: _Header(),
          ),
          _Scores(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _kHorizontalPadding,
              vertical: _kVerticalPadding,
            ),
            child: _Info(),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Petits pois et carottes',
          style: textTheme.headline1,
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          'Cassegrain',
          style: textTheme.headline2,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          'Petits pois & carottes à l\'étuvée avec garniture',
          style: textTheme.headline3,
        ),
      ],
    );
  }
}

class _Scores extends StatelessWidget {
  static const double _horizontalPadding = _Body._kHorizontalPadding;
  static const double _verticalPadding = 18.0;

  const _Scores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray1,
      width: double.infinity,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 44,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 5.0),
                    child: _Nutriscore(
                      nutriscore: ProductNutriscore.A,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 100.0,
                color: Theme.of(context).dividerColor,
              ),
              const Expanded(
                flex: 66,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 25.0),
                    child: _NovaGroup(
                      novaScore: ProductNovaScore.Group1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1.0,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: _EcoScore(
            ecoScore: ProductEcoScore.D,
          ),
        ),
      ]),
    );
  }
}

class _Nutriscore extends StatelessWidget {
  final ProductNutriscore nutriscore;

  const _Nutriscore({
    required this.nutriscore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutri-Score',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Image.asset(
          _findAssetName(),
          width: 100.0,
        ),
      ],
    );
  }

  String _findAssetName() {
    switch (nutriscore) {
      case ProductNutriscore.A:
        return "res/drawables/nutriscore_a.png";
      case ProductNutriscore.B:
        return "res/drawables/nutriscore_b.png";
      case ProductNutriscore.C:
        return "res/drawables/nutriscore_c.png";
      case ProductNutriscore.D:
        return "res/drawables/nutriscore_d.png";
      case ProductNutriscore.E:
        return "res/drawables/nutriscore_e.png";
      default:
        throw Exception('Unknown nutriscore value!');
    }
  }
}

class _NovaGroup extends StatelessWidget {
  final ProductNovaScore novaScore;

  const _NovaGroup({
    required this.novaScore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Groupe Nova',
          style: Theme.of(context).textTheme.headline4?.copyWith(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          _findLabel(),
          style: const TextStyle(
            color: AppColors.gray2,
          ),
        ),
      ],
    );
  }

  String _findLabel() {
    switch (novaScore) {
      case ProductNovaScore.Group1:
        return 'Aliments non transformés ou transformés minimalement';
      case ProductNovaScore.Group2:
        return 'Ingrédients culinaires transformés';
      case ProductNovaScore.Group3:
        return 'Aliments transformés';
      case ProductNovaScore.Group4:
        return 'Produits alimentaires et boissons ultra-transformés';
      default:
        throw Exception('Unknown nova group!');
    }
  }
}

class _EcoScore extends StatelessWidget {
  final ProductEcoScore ecoScore;

  const _EcoScore({
    required this.ecoScore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EcoScore',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Icon(
              _findIcon(),
              color: _findIconColor(),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              _findLabel(),
              style: const TextStyle(
                color: AppColors.gray2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon() {
    switch (ecoScore) {
      case ProductEcoScore.A:
        return AppIcons.ecoscore_a;
      case ProductEcoScore.B:
        return AppIcons.ecoscore_b;
      case ProductEcoScore.C:
        return AppIcons.ecoscore_c;
      case ProductEcoScore.D:
        return AppIcons.ecoscore_d;
      case ProductEcoScore.E:
        return AppIcons.ecoscore_e;
      default:
        throw Exception('Unknown nova group!');
    }
  }

  Color _findIconColor() {
    switch (ecoScore) {
      case ProductEcoScore.A:
        return AppColors.ecoScoreA;
      case ProductEcoScore.B:
        return AppColors.ecoScoreB;
      case ProductEcoScore.C:
        return AppColors.ecoScoreC;
      case ProductEcoScore.D:
        return AppColors.ecoScoreD;
      case ProductEcoScore.E:
        return AppColors.ecoScoreE;
      default:
        throw Exception('Unknown nova group!');
    }
  }

  String _findLabel() {
    switch (ecoScore) {
      case ProductEcoScore.A:
        return 'Très faible impact environnemental';
      case ProductEcoScore.B:
        return 'Faible impact environnemental';
      case ProductEcoScore.C:
        return 'Impact modéré sur l\'environnement';
      case ProductEcoScore.D:
        return 'Impact environnemental élevé';
      case ProductEcoScore.E:
        return 'Impact environnemental très élevé';
    }
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _ProductItemValue(
          label: 'Quantité',
          value: '200g (égoutté 130g)',
        ),
        const _ProductItemValue(
          label: 'Vendu',
          value: 'France',
          includeDivider: false,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: 'Végétalien',
                value: _ProductBubbleValue.on,
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: 'Végétarien',
                value: _ProductBubbleValue.off,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ProductItemValue extends StatelessWidget {
  final String label;
  final String value;
  final bool includeDivider;

  const _ProductItemValue({
    required this.label,
    required this.value,
    this.includeDivider = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        if (includeDivider) const Divider(height: 1.0)
      ],
    );
  }
}

class _ProductBubble extends StatelessWidget {
  final String label;
  final _ProductBubbleValue value;

  const _ProductBubble({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            value == _ProductBubbleValue.on
                ? AppIcons.checkmark
                : AppIcons.close,
            color: AppColors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}

enum _ProductBubbleValue { on, off }

enum ProductDetailsCurrentTab { summary, info, nutrition, nutritionalValues }