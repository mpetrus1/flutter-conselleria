import 'package:flutter/material.dart';
import 'package:projecte_final/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(
            
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: (){
              Navigator.pushNamed(context, '/');

            },
          ),
          ListTile(
            leading: const Icon(Icons.movie_outlined),
            title: Text('Movies'),
            onTap: (){
              Navigator.pushNamed(context, '/movies');
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: Text('Weather'),
            onTap: (){
              Navigator.pushNamed(context, '/weather');
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),

        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}