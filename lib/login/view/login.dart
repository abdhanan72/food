import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/dashboard/view/dashboard.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../home/view/home.dart';
import '../../signup/view/signup.dart';
import '../bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController emailController = TextEditingController(),
    passwordController = TextEditingController();

final _loginBloc = LoginBloc();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSucesses) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          } else if (state is LoginFailed) {
             MotionToast(
                    primaryColor: Color(0xFFF50514),
                    title: Text(state.message),
                    description: Text(""),
                    icon: Icons.error,
                    )
                .show(context);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // ignore: lines_longer_than_80_chars
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Welcome Back!!!',
                    style: TextStyle(
                      color: Color(
                        0xFFF50514,
                      ),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: emailController,
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Color(0xFFF50514),
                        ),
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFF50514),
                        ),
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Forget pasword?',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF50514),
                        ),
                        onPressed: () => _loginBloc.add(LoginStateEvent(

                            email: emailController.text,
                            password: passwordController.text,
                            
                          )),
                        child: const Text('Sign in'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        const Center(
                          child: Text(
                            'Don\'t have an acount?',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),)),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
