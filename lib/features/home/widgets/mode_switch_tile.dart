import 'package:flutter/material.dart';

class ModeSwitchTile extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;

  const ModeSwitchTile({
    super.key,
    required this.isSwitched,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SwitchListTile.adaptive(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          title: const Text(
            'Turn On/Off two \nplayer mode',
            style: TextStyle(fontSize: 25, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          value: isSwitched,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
