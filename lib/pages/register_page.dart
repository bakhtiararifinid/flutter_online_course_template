import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_online_course_template/pages/pick_favorite_page.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const routeName = '/register';

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
                'Create Account ✌️',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create your account to start your course lessons.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _SocialMediaButton('assets/icons/google.svg'),
                  _SocialMediaButton('assets/icons/facebook.svg'),
                  _SocialMediaButton('assets/icons/apple.svg'),
                ],
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Or sign up with your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 32),
              const _CustomTextField(
                hint: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 8),
              const _CustomTextField(
                hint: 'Password',
                prefixIcon: Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _gotoPickFavoritePage(context),
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing, you agree to our ',
                  style: const TextStyle(color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Term & Conditions',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'I already have an account',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoPickFavoritePage(BuildContext context) {
    Navigator.of(context).pushNamed(PickFavoritePage.routeName);
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  const _SocialMediaButton(
    this.assetName, {
    Key? key,
  }) : super(key: key);

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 64,
        width: 96,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          assetName,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
