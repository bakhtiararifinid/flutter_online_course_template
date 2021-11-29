import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            _Header(),
            SizedBox(height: 32),
            _PopularCourses(),
            SizedBox(height: 32),
            _Categories()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'My Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Whishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (_) {},
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Dimas 👋',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lest start learning!',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              const _HeaderButton(icon: Icons.shopping_cart),
              const SizedBox(width: 8),
              const _HeaderButton(icon: Icons.notifications),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for anything',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Theme.of(context).primaryColorDark,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red.shade300,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PopularCourses extends StatelessWidget {
  const _PopularCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular courses',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'see all',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              _Course(
                imagePath: 'assets/images/design_thinking.jpg',
                title: 'Design thinking fundamental',
                author: 'Robert Fox',
                price: 150,
                rating: 4.8,
                isBestSeller: true,
              ),
              _Course(
                imagePath: 'assets/images/user_behaviour_research.jpg',
                title: 'User Behaviour Research',
                author: 'Esther Howard',
                price: 24,
                rating: 4.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Course extends StatelessWidget {
  const _Course({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    this.isBestSeller = false,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String author;
  final int price;
  final bool isBestSeller;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 192,
            width: 256,
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 8),
                            Text(rating.toString())
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink.shade300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                author,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$$price',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 8),
              if (isBestSeller)
                Chip(
                  backgroundColor: Colors.pink.shade50,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  label: Text(
                    'Best Seller',
                    style: TextStyle(
                      color: Colors.pink.shade300,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'see all',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _Category(
              label: 'Art',
              assetPath: 'assets/icons/art.svg',
            ),
            _Category(
              label: 'Coding',
              assetPath: 'assets/icons/coding.svg',
            ),
            _Category(
              label: 'Design',
              assetPath: 'assets/icons/design.svg',
            ),
            _Category(
              label: 'Business',
              assetPath: 'assets/icons/business.svg',
            ),
            _Category(
              label: 'Culinary',
              assetPath: 'assets/icons/culinary.svg',
            ),
          ],
        )
      ],
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({
    Key? key,
    required this.label,
    required this.assetPath,
  }) : super(key: key);

  final String label;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: SvgPicture.asset(assetPath),
      label: Text(label),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
