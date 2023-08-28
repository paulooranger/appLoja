import 'package:flutter/material.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Conta'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome Completo'),
              keyboardType: TextInputType.name,
              validator: (text) {
                if (text!.isEmpty) return 'Campo vazio';
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text!.isEmpty || !text.contains("@")) {
                  return "E-mail invalido - Seu email não possui '@'!";
                }

                if (text.isEmpty || !text.contains('.com')) {
                  return "Email invalido - Seu email não possui '.com'";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Senha",
              ),
              obscureText: true,
              validator: (text) {
                if (text!.isEmpty || text.length < 6) return "Senha invalida !";
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Endereço'),
              validator: (text) {
                if (text!.isEmpty) return 'Endereço invalido';
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "Criar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
