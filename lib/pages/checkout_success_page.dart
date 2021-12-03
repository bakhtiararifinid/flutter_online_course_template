import 'package:flutter/material.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  static const routeName = '/checkout_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Image.asset('assets/images/success.png'),
              const SizedBox(height: 16),
              Text(
                'Transaction Success',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 16),
              Text(
                'Congratulation! Your transaction is successful, you can start your course now',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.grey),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _gotoHomePage(context),
                  child: const Text('Go to my course'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => _gotoHomePage(context),
                child: const Text('Back to Home'),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoHomePage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
