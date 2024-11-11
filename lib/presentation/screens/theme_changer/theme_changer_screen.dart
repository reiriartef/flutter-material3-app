import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_changer_screen";
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkmode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkmode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final selectedIndexColor = ref.watch(selectedIndexColorProvider);
    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text(
                "Este color",
                style: TextStyle(color: color),
              ),
              subtitle: Text("${color.value}"),
              activeColor: color,
              value: index,
              groupValue: selectedIndexColor,
              onChanged: (value) {
                ref
                    .read(selectedIndexColorProvider.notifier)
                    .update((state) => state = index);
              });
        });
  }
}
