import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Estas seguro?"),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("Cancelar")),
          FilledButton(
              onPressed: () => context.pop(key), child: const Text("Aceptar"))
        ],
        content: const Text(
            "Elit Lorem elit commodo eiusmod ipsum. Officia sit labore nulla fugiat est anim sunt sint esse dolore deserunt pariatur nisi ut. Amet elit incididunt sint consectetur quis. Magna non eu ad officia ullamco et qui laborum. Duis do tempor commodo officia nisi cupidatat laborum aute labore culpa veniam. Commodo sint esse ipsum veniam ullamco non id veniam ut voluptate dolore do Lorem ut. Reprehenderit non elit commodo tempor laborum nulla sunt aute id tempor adipisicing."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Mollit reprehenderit mollit dolore commodo incididunt occaecat Lorem ex. Anim consequat sint aliquip incididunt voluptate veniam. Ex Lorem nostrud quis velit proident nisi do irure. Ullamco mollit quis ea irure culpa duis tempor exercitation excepteur culpa. Est in ea incididunt ex labore incididunt ad amet ad est cillum officia. Ut occaecat amet dolore laborum.")
                  ]);
                },
                child: const Text("Licencias Usadas")),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text("Mostrar dialogos"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Mostrar snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
