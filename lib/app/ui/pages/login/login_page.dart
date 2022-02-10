import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:SizedBox(
          width:double.infinity,
          child:Stack(
            children: [
              Column(
                children: [
                  TextField(
                    onChanged: loginProvider.read.onEmailChanged,
                    decoration: const InputDecoration(
                      hintText:'Email'
                    ),
                  ),
                  TextField(
                    onChanged: loginProvider.read.onPasswordChanged,
                    decoration: const InputDecoration(
                      hintText:'Password'
                    ),
                  ),
                  ElevatedButton(
                    onPressed: loginProvider.read.submit, 
                    child: const Text('Send')
                  ),
                  Consumer(
                    builder:(_,ref,__){
                      final controller = ref.watch(loginProvider);
                      return Column(
                        children: [
                          Text('Email: ${controller.state.email}'),
                          Text('Password: ${controller.state.password}'),
                        ],
                      );
                    }
                  )
                ],
              ),
              Consumer(
                builder:(_,ref,__){
                  final loading = ref.select(
                    loginProvider.select(
                      (_) => _.loading
                    )

                    // loginProvider.when((prev,current) => prev.loading != current.loading)
                  );

                  if(loading){
                    return Positioned.fill(
                      child:Container(
                        color:Colors.black26,
                        child: const Center(
                          child:CircularProgressIndicator()
                        )
                      )
                    );
                  }

                  return Container();
                }
              )
            ],
          )
        )
      )
    );
  }
}