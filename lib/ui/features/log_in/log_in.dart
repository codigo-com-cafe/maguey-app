import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magueyapp/ui/features/home/home_screen.dart';
import 'package:magueyapp/utils/extention.dart';
import 'package:magueyapp/widgets/global_padding.dart';
import 'package:magueyapp/widgets/sized_box.dart';
import 'package:provider/provider.dart';

import '../../../provider/external_sign_in_provider.dart';
import '../../../provider/log_in_sign_up_provider.dart';
import '../../../theme/my_colors.dart';
import '../../../theme/my_icons.dart';
import '../../../utils/app_route.dart';
import '../../../widgets/LoaderElevatedButton.dart';
import '../../../widgets/divider_with_text.dart';
import '../../../widgets/image_background_greetings_widget.dart';
import '../../../widgets/my_outline_button.dart';
import '../../../widgets/my_text_button.dart';
import '../../../widgets/my_text_form_field.dart';
import '../../../widgets/show_password_button.dart';
import '../../../widgets/text_button_row.dart';
import '../../../widgets/text_styling.dart';
import '../sign_up/sign_up_screen.dart';
import 'reset_password_screen.dart';

class LogInScreen extends StatefulWidget {
  static const String route = "sign_in";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late LogInSignUpProvider logInSignUpProvider;
  late ExternalSignInProvider googleSignInProvider;
  @override
  void initState() {
    logInSignUpProvider =
        Provider.of<LogInSignUpProvider>(context, listen: false);
    googleSignInProvider =
        Provider.of<ExternalSignInProvider>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    logInSignUpProvider.logInEmail.clear();
    logInSignUpProvider.logInPassword.clear();
    super.dispose();
  }

  bool showPassword = false;
  bool loader = false;
  bool loaderGoogle = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: MyColors.black2B2B2B,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return const MyHomePage(
                    key: ValueKey('HomeScreen'),
                    comoFromLogin: true,
                  );
                },
              ));
            },
          ),
        ),
        body: Form(
          key: logInSignUpProvider.formKeyAuthenticationLogIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImagedBackgroundGreetingsWidget(
                heading: "Welcome Back!",
                description: "Please enter your details to login.",
              ),
              MyTextFormField(
                title: "",
                margin: 16.paddingH(context),
                hintText: "Enter your email",
                bottomSpace: 21,
                controller: logInSignUpProvider.logInEmail,
                validator: logInSignUpProvider.validateEmailLogIn,
              ),
              MyTextFormField(
                title: "",
                margin: 16.paddingH(context),
                hintText: "Enter password",
                obscure: !showPassword,
                bottomSpace: 16,
                controller: logInSignUpProvider.logInPassword,
                validator: logInSignUpProvider.validatePasswordLogIn,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CheckBoxWithText(
                    text: "Show password",
                    onTap: (val) {
                      setState(() => showPassword = !showPassword);
                    },
                    margin:
                        20.paddingLeft(context).copyWith(top: 5.pxV(context)),
                    value: showPassword,
                  ),
                  MyTextButton(
                    topPadding: 5,
                    text: "Forgot Password?",
                    underlineText: true,
                    splashColor: null,
                    underlineColor: MyColors.black2B2B2B,
                    space: 16,
                    style: TextStyleCustom().font_14w500Black.copyWith(
                          color: MyColors.black2B2B2B,
                          fontSize: 13.pxV(context),
                        ),
                    onTap: () {
                      AppRoutes.replace(context, const ResetPasswordScreen());
                    },
                  ),
                ],
              ),
              32.vSpace(context),
              MyLoaderElvButton(
                text: "Sign In",
                loader: loader,
                onPressed: () async => _signIn(context),
                padding: 16.paddingH(context),
                textStyle: TextStyleCustom().font_14w400,
              ),
              32.vSpace(context),
              DividerWithText(
                style: TextStyleCustom().font_14w500Black,
                text: "Or",
              ),
              32.vSpace(context),
              MyOutlineButton(
                iconSpacing: 33.pxH(context),
                prefixIcon: SvgPicture.asset(MyIcons.googleIcon),
                text: "Continue with Google",
                onPressed: () async => await _onGoogleLogin(context),
                padding: 16.paddingH(context),
              ),
              MyOutlineButton(
                iconSpacing: 33.pxH(context),
                prefixIcon: SvgPicture.asset(
                  MyIcons.appleIcon,
                  height: 28,
                ),
                text: "Continue with Apple",
                onPressed: () async => await _onAppleLogin(),
                padding: 16.paddingH(context),
              ),
              const SizedBox(height: 16),
              TextButtonRow(
                buttonText: "Register",
                message: "Don't have an account?",
                onTap: () {
                  AppRoutes.replace(context, const SignUpScreen());
                },
              ),
              34.vSpace(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onGoogleLogin(BuildContext context) async {
    primaryFocus!.unfocus();
    setState(() => loaderGoogle = true);
    await googleSignInProvider.signInWithGoogle(context);
    // setState(() => loaderGoogle = false);
  }

  Future<void> _signIn(BuildContext context) async {
    primaryFocus!.unfocus();
    setState(() => loader = true);
    await logInSignUpProvider.checkConditionsLogInUser(
      context,
    );
    setState(() => loader = false);
  }

  Future<void> _onAppleLogin() async {
    primaryFocus!.unfocus();
    setState(() => loaderGoogle = true);
    await googleSignInProvider.signInWithApple(context);

    // setState(() => loaderGoogle = false);
  }

  // Future<void> _onAppleLogin() async {
  //   setState(() {
  //     isLoadingApple = true;
  //     errorMessage = null;
  //   });

  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ]);

  //     final aAuthCredential = OAuthProvider('apple.com').credential(
  //       idToken: credential.identityToken,
  //       accessToken: credential.authorizationCode,
  //     );

  //     final userCredential = await FirebaseAuth.instance.signInWithCredential(
  //       aAuthCredential,
  //     );

  //     if (userCredential.user != null) {
  //       await FirebaseService.createUser();
  //       await LocalStorage.instance.write(
  //         key: 'userCompletedOnboarding',
  //         value: 'true',
  //       );
  //       await _enterMacroScanner();
  //     } else {
  //       setState(() {
  //         isLoadingApple = false;
  //       });
  //     }
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     debugPrint('Error Apple Sign In: ${e.message}');
  //     setState(() {
  //       isLoadingApple = false;
  //     });
  //   } catch (e) {
  //     debugPrint('An error occurred. Please try again later.');
  //     toastification.show(
  //       title: const Text('Error:'),
  //       type: ToastificationType.info,
  //       alignment: Alignment.bottomCenter,
  //       animationDuration: const Duration(milliseconds: 300),
  //       description: const Text('An error occurred, please try again later'),
  //       autoCloseDuration: Constants.toastAutoCloseDuration,
  //     );
  //     setState(() {
  //       isLoadingApple = false;
  //     });
  //   }
  // }
}
