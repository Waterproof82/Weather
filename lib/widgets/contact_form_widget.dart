import 'package:flutter/material.dart';
import 'package:weather/functions/functions.dart';
import 'package:weather/widgets/send_button_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, required this.isEnglish});
  final bool isEnglish;

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _showSubmitButton = false;

  void _updateSubmitButtonVisibility() {
    bool isValid = _formKey.currentState!.validate();
    setState(() {
      _showSubmitButton = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: (widget.isEnglish) ? 'Name' : 'Nombre'),
            onChanged: (value) {
              _updateSubmitButtonVisibility();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              if (!isTextOnly(value)) {
                return 'Sólo se permite texto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _birthdateController,
            decoration: InputDecoration(labelText: (widget.isEnglish) ? 'Date of Birth' : 'Fecha de Nacimiento'),
            onChanged: (value) {
              _updateSubmitButtonVisibility();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingresa tu fecha de nacimiento';
              }
              if (!isValidDate(value)) {
                return 'Ingresa una fecha válida en el formato dd/mm/yyyy';
              }
              return null;
            },
            keyboardType: TextInputType.datetime,
          ),
          TextFormField(
            controller: _cityController,
            decoration: InputDecoration(labelText: (widget.isEnglish) ? 'City' : 'Ciudad'),
            onChanged: (value) {
              _updateSubmitButtonVisibility();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingresa tu ciudad';
              }
              if (!isTextOnly(value)) {
                return 'Sólo se permite texto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: (widget.isEnglish) ? 'Email' : 'Correo Electrónico'),
            onChanged: (value) {
              _updateSubmitButtonVisibility();
            },
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'El correo no es correcto';
            },
          ),
          TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: (widget.isEnglish) ? 'Telephone' : 'Teléfono'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateSubmitButtonVisibility();
              },
              validator: (value) {
                if (!isNumberOnly(value ?? '')) {
                  return 'Sólo se permiten números';
                }
                if (value?.length != 9) {
                  return 'El teléfono debe tener 9 dígitos';
                }
                return null;
              }),
          const SizedBox(height: 20),
          if (_showSubmitButton)
            SendButton(
              child:
                  Text((widget.isEnglish) ? 'Send' : 'Enviar', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white), textAlign: TextAlign.center),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _nameController.clear();
                  _birthdateController.clear();
                  _cityController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                }
              },
            ),
        ],
      ),
    );
  }
}

class ContactData {
  final String name;
  final String birthdate;
  final String city;
  final String email;
  final String phone;

  ContactData({
    required this.name,
    required this.birthdate,
    required this.city,
    required this.email,
    required this.phone,
  });
}
