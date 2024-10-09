import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    super.key,
    required this.addTask,
  });

  final Function addTask;

  TextEditingController controller = TextEditingController();

  void _handleOnclick(context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        // color: Colors.amber,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your task"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _handleOnclick(context),
                child: const Text("Add task"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
