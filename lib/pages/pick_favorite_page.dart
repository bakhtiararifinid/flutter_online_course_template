import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_online_course_template/pages/home_page.dart';
import 'package:flutter_svg/svg.dart';

class PickFavoritePage extends StatelessWidget {
  const PickFavoritePage({Key? key}) : super(key: key);

  static const routeName = '/pick_favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick your favorite topic',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Choose your favorite topic to help us deliver the most suitable course for you',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              const _Topics(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _gotoHomePage(context),
                  child: const Text('Start your journey'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'You can still change your topic again later',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      HomePage.routeName,
      (route) => false,
    );
  }
}

class _Topics extends StatelessWidget {
  const _Topics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: const [
          _TopicButton(
            label: 'Art',
            assetName: 'assets/icons/art.svg',
            selected: true,
          ),
          _TopicButton(
            label: 'Business',
            assetName: 'assets/icons/business.svg',
            selected: true,
          ),
          _TopicButton(
            label: 'Culinary',
            assetName: 'assets/icons/culinary.svg',
            selected: true,
          ),
          _TopicButton(
            label: 'Coding',
            assetName: 'assets/icons/coding.svg',
            selected: true,
          ),
          _TopicButton(
            label: 'Design',
            assetName: 'assets/icons/design.svg',
          ),
          _TopicButton(
            label: 'Gaming',
            assetName: 'assets/icons/gaming.svg',
          ),
          _TopicButton(
            label: 'Marketing',
            assetName: 'assets/icons/marketing.svg',
          ),
          _TopicButton(
            label: 'Music',
            assetName: 'assets/icons/music.svg',
          ),
          _TopicButton(
            label: 'Sport',
            assetName: 'assets/icons/sport.svg',
          ),
        ],
      ),
    );
  }
}

class _TopicButton extends StatelessWidget {
  const _TopicButton({
    Key? key,
    required this.label,
    required this.assetName,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final String assetName;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: selected
                        ? Border.all(
                            color: Theme.of(context).primaryColor,
                          )
                        : null,
                  ),
                  child: SvgPicture.asset(
                    assetName,
                    height: 32,
                    width: 32,
                  ),
                ),
                if (selected)
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Center(child: Text(label)),
          ),
        ],
      ),
    );
  }
}
