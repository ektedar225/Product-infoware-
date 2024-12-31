import 'package:flutter/material.dart';
import '../widgets/form_field_widget.dart';

class UserFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Form',
          style: TextStyle(color: Colors.white), // Ensure title is visible
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // Ensure icons are visible
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade700, Colors.purple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fill Your Details',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Name Field
                  FormFieldWidget(
                    label: 'Name',
                    hint: 'Enter your full name',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // Email Field
                  FormFieldWidget(
                    label: 'Email',
                    hint: 'Enter your email address',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // Phone Field
                  FormFieldWidget(
                    label: 'Phone',
                    hint: 'Enter your phone number',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // Gender Field
                  FormFieldWidget(
                    label: 'Gender',
                    hint: 'Enter your gender',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // Country Field
                  FormFieldWidget(
                    label: 'Country',
                    hint: 'Enter your country',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // State Field
                  FormFieldWidget(
                    label: 'State',
                    hint: 'Enter your state',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 10),
                  // City Field
                  FormFieldWidget(
                    label: 'City',
                    hint: 'Enter your city',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    textStyle: TextStyle(color: Colors.white),
                    decoration: _inputDecoration(),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 8,  // Adding elevation for a subtle shadow
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Form submitted successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.deepPurple.shade600, // Lighter purple for input fields
      labelStyle: TextStyle(color: Colors.white, fontSize: 16),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }
}
