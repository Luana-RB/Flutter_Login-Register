import 'package:flutter/material.dart';
import 'package:loginapp/components/user_tile.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key, this.idUsuario, required this.fromHomePage});
  final bool fromHomePage;
  final String? idUsuario;

  @override
  State<UsersList> createState() => _PostsListState();
}

class _PostsListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: Provider.of<UsersProvider>(context).getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Erro: ${snapshot.error}'),
            ),
          );
        } else {
          List<User> allUsers = snapshot.data!;

          return Scaffold(
            body: Container(
              color: Theme.of(context).colorScheme.background,
              child: ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (ctx, i) => UserTile(
                  user: allUsers[i],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
