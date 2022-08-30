import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_abdallah/layout/shop_app/login/cubit/cubit.dart';
import 'package:shop_app_abdallah/layout/shop_app/register/shop_register_screen.dart';
import 'package:shop_app_abdallah/shared/components/components/components.dart';

import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel!.status!) {
              debugPrint(state.loginModel!.message);
              debugPrint(state.loginModel!.data?.token);
            } else {
              debugPrint(state.loginModel!.message);
              Fluttertoast.showToast(
                  msg: state.loginModel!.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          label: 'Email Address',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          type: TextInputType.emailAddress,
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          label: 'Password',
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSuffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                          },
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          builder: (context) => defaultButton(
                            text: 'login',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isUpperCase: true,
                          ),
                          condition: state is! ShopLoginLoadingState,
                          fallback: (BuildContext context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                            ),
                            TextButton(
                              onPressed: () {},
                              child: defaultTextButton(
                                function: () {
                                  navigateTo(
                                    context,
                                    ShopRegisterScreen(),
                                  );
                                },
                                text: 'Register Now',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
