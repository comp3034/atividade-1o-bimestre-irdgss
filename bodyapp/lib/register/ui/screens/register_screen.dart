import 'package:bodyapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[300],
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70,
                //Arrumar imagem
                backgroundImage: NetworkImage(
                    'https://www.vippng.com/png/full/412-4125354_person-circle-comments-profile-icon-png-white-transparent.png'),
              ),
            ),
          ),
          RegisterFormWidget(),
          Divider(
            indent: 32,
            endIndent: 32,
            thickness: 4,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Brandico.facebook_1),
                iconSize: 32,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Brandico.twitter_bird),
                iconSize: 32,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Brandico.googleplus_rect),
                iconSize: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  RegisterFormWidget({Key? key}) : super(key: key);

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  RegExp _upper = RegExp(r'[A-Z]');
  RegExp _lower = RegExp(r'[a-z]');
  RegExp _numeric = RegExp(r'[0-9]');
  bool isPasswordObscured = true;
  String? fuckingKey = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputWidget(
              hintText: 'Nome',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Insira o seu nome';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputWidget(
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                if (value != null && !isEmail(value)) {
                  return 'Preencha um e-mail válido';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputWidget(
              hintText: 'Senha',
              prefixIcon: Icons.lock,
              sufixIcon:
                  isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              obscureText: isPasswordObscured,
              suffixIconOnPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
              validator: (value) {
                if (value != null && value.length < 6) {
                  return 'A senha deve conter no mínimo 6 caracteres';
                }
                if (value != null && !value.contains(_upper)) {
                  return 'A senha deve conter pelo menos um caractere uppercase.';
                }
                if (value != null && !value.contains(_lower)) {
                  return 'A senha deve conter pelo menos um caractere lowercase.';
                }
                if (value != null && !value.contains(_numeric)) {
                  return 'A senha deve conter pelo menos um caractere numerico.';
                }
                fuckingKey = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputWidget(
              hintText: 'Confirmar senha',
              prefixIcon: Icons.lock,
              sufixIcon:
                  isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              obscureText: isPasswordObscured,
              suffixIconOnPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
              validator: (value) {
                if (value != null && value != fuckingKey) {
                  return 'As senhas não estão iguais';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  'Criar conta',
                  style: GoogleFonts.rokkitt(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  String? hintText;
  IconData? prefixIcon;
  IconData? sufixIcon;
  bool obscureText;
  VoidCallback? suffixIconOnPressed;
  String? Function(String?)? validator;
  void Function(String)? onChanged;

  InputWidget({
    this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.obscureText = false,
    this.suffixIconOnPressed,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.grey[300],
        filled: true,
        focusColor: Colors.grey[300],
        hoverColor: Colors.grey[300],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.teal,
        ),
        suffixIcon: IconButton(
          icon: Icon(sufixIcon),
          color: AppColors.teal,
          onPressed: suffixIconOnPressed,
        ),
      ),
      validator: validator,
    );
  }
}
