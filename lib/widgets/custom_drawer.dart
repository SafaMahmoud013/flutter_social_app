import 'package:flutter/material.dart';
import 'package:flutter_social_app/data/data.dart';
import 'package:flutter_social_app/screens/home_screen.dart';
import 'package:flutter_social_app/screens/login_screen.dart';
import 'package:flutter_social_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      onTap: ()=>onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl!),
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                          )),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
              Icon(Icons.dashboard),
              'Home',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
              Icon(Icons.account_circle),
              'Your Profile',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser,)))),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(
                Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()))),
          )),
        ],
      ),
    );
  }
}
