import 'package:dcs_inventory_system/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc auth) => auth.state.user!);
    final fullName = '${user.firstName} ${user.middleName} ${user.lastName}';
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        //padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                GoRouter.of(context).push('/profile');
              },
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                margin: const EdgeInsets.all(0.0),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: (50),
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(user.avatarUrl),
                          )),
                      Text(fullName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white)),
                      Text(user.email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomListTile(
            title: "Account Management",
            icon: Icons.manage_accounts_outlined,
            onTap: () {
              GoRouter.of(context).push('/manage_account');
            },
          ),
          CustomListTile(
            title: "Logs",
            icon: Icons.note_alt_outlined,
            onTap: () {
              GoRouter.of(context).push('/activity_log');
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CustomListTile(
                title: "Logout",
                icon: Icons.logout_outlined,
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthLogoutRequested());
                  GoRouter.of(context).go('/login');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(title, style: Theme.of(context).textTheme.headline5),
        onTap: onTap);
  }
}
