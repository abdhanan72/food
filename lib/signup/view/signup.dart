import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/signup/bloc/signup_bloc.dart';
import '../../login/view/login.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      passwordController = TextEditingController();

  final _signupbloc = SignupBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signupbloc,
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
           if (state is SignupState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Login(),
            ),);
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Sucessfullt login")));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Please enter your details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                      controller: nameController,
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.person,
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
                          Icons.password,
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
                      controller: mobileController,
                      cursorColor: const Color(0xFFF50514),
                      decoration: InputDecoration(
                        hintText: 'Mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xFFF50514),
                        ),
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF50514),
                        ),
                         onPressed: () => _signupbloc.add(SignupauthEvent(
                              name: nameController.text,
                              email: emailController.text,
                              mobileNo: mobileController.text,
                              password: passwordController.text,
                              ),
                              ),
                        child: const Text('Signup'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
