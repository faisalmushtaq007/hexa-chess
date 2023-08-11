import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showAccountDialog(BuildContext context) {
  if (FirebaseAuth.instance.currentUser == null) {
    return;
  }
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('${FirebaseAuth.instance.currentUser!.displayName}'),
            actions: [
              // play game again
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.go('/login');
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Logout')),
            ],
          ));
}