import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_online_course_template/pages/checkout_success_page.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  static const routeName = '/course';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            _HeaderImage(),
            SizedBox(height: 16),
            _CourseInfo(),
            Spacer(),
            _Voucher(),
            SizedBox(height: 8),
            _Checkout(),
          ],
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.asset(
            'assets/images/design_thinking.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _goback(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(124),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(124),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red.shade300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void _goback(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _CourseInfo extends StatelessWidget {
  const _CourseInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Design Thinking Fundamental',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          const _AuthorAndRating(),
          const SizedBox(height: 16),
          const Text(
            'This is a simple description that explain the description about the class or bla bla bla and then bla bla bla of course',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const _CourseData1(),
          const SizedBox(height: 16),
          const _CourseData2(),
        ],
      ),
    );
  }
}

class _AuthorAndRating extends StatelessWidget {
  const _AuthorAndRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Halo Academy',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                '4.8',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseData1 extends StatelessWidget {
  const _CourseData1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Students',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '143,247',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Language',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'English',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseData2 extends StatelessWidget {
  const _CourseData2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last Update',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'Feb 3, 2021',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Subtitle',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'English and ',
                  style: Theme.of(context).textTheme.subtitle1,
                  children: <TextSpan>[
                    TextSpan(
                      text: '5 more',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Voucher extends StatelessWidget {
  const _Voucher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Voucher',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Chip(
            backgroundColor: Theme.of(context).primaryColorLight,
            label: Row(
              children: [
                Text(
                  'VEKTORBELAJAR',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(width: 8),
                Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Checkout extends StatelessWidget {
  const _Checkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                '\$520',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () => _gotoCheckoutSuccessPage(context),
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  void _gotoCheckoutSuccessPage(BuildContext context) {
    Navigator.of(context).pushNamed(CheckoutSuccessPage.routeName);
  }
}
