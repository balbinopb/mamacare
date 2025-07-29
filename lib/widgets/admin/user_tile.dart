import 'package:flutter/material.dart';
import 'package:mamacare/models/admin/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback onDelete;

  const UserTile({super.key, required this.user, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      child: SizedBox(
        height: 101,
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.yellow.shade800),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name),
              Text(user.email, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
