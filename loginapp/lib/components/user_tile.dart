import 'package:flutter/material.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    //User UI
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          //Edit Button
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black12,
            onPressed: () {},
          ),
          //Delete Button
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Excluir Usuário'),
                  content: const Text('Tem certeza?'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Sim'),
                        ),
                      ],
                    ),
                  ],
                ),
              ).then((confirmed) {
                if (confirmed) {
                  // Provider.of<UsersProvider>(context, listen: false)
                  //     .remove(user);
                }
              });
            },
          ),
        ]),
      ),
    );
  }
}

class UserNameListTile extends StatelessWidget {
  const UserNameListTile({super.key, required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user),
    );
  }
}
