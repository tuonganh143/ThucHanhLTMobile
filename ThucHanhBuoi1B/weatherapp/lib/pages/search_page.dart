import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? _city;
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    void _submit() {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });

      final form = _formKey.currentState;

      if (form != null && form.validate()) {
        form.save();
        Navigator.pop(context, _city!.trim());
      }
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Search')),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  labelText: 'Ten thanh pho',
                  hintText: 'It nhat 2 ky tu',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (String? input) {
                  if (input == null || input.trim().length < 2) {
                    return 'Ten thanh phi phai it nhat 2 ky tu';
                  }
                  return null;
                },
                onSaved: (String? input) {
                  _city = input;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submit,
              child: const Text(
                "Kiem Tra",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
