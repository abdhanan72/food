import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              accountName: const Text('ABD HANAN'),
              accountEmail: const Text('abdhanan@gmail.com'),
              currentAccountPictureSize: const Size.square(100),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: ClipOval(
                    child: Image.network(
                      'https://static.wikia.nocookie.net/callofduty/images/5/56/Ghost_Infobox_MWII.png/revision/latest?cb=20221021183623',
                      fit: BoxFit.cover,
                      width: 80,
                      height: 110,
                    ),
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://t3.ftcdn.net/jpg/03/35/51/06/360_F_335510693_HY7mLg3ARdLccKoXk3m66NLDpJRJh51p.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(
              'Favorite',
              
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.car),
          //   title: Text(
          //     'Electric Car',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          // const SizedBox(
          //   height: 9,
          // ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.car),
          //   title: Text(
          //     'Used car',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          // const SizedBox(
          //   height: 9,
          // ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: Text(
              'Profile',
              
            ),
            onTap: () {},
          ),
          // const SizedBox(
          //   height: 9,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: Text(
          //     'Orders ',
          //     style: GoogleFonts.adamina(color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text(
              'Share',
              
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(
              'Notifications',
             
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '7',
                   
                    // TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Settings',
              
            ),
            onTap: () {
              
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout',
              
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}