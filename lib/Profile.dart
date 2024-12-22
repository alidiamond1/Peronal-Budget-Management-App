import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/changePass.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  bool notificationsEnabled = true;
  bool twoFactorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
     
      
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(),

            const SizedBox(height: 10),

            // Preferences Section
            _buildSectionTitle('Preferences'),
            _buildPreferenceItem(
              icon: Icons.language,
              label: 'Currency',
              trailing: const Text('USD (\$)', style: TextStyle(fontSize: 16)),
            ),
            _buildPreferenceItem(
              icon: Icons.notifications,
              label: 'Notifications',
              trailing: FlutterSwitch(
                width: 50.0,
                height: 25.0,
                value: notificationsEnabled,
                onToggle: (val) {
                  setState(() {
                    notificationsEnabled = val;
                  });
                },
                activeColor: Colors.purple,
              ),
            ),

            const SizedBox(height: 10),

            // Security Section
            _buildSectionTitle('Security'),
            _buildPreferenceItem(
              icon: Icons.lock,
              label: 'Change Password',
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              
              
            ),
             const ChangePasswordScreen(),
            _buildPreferenceItem(
              icon: Icons.security,
              label: 'Two-Factor Auth',
              trailing: FlutterSwitch(
                width: 50.0,
                height: 25.0,
                value: twoFactorEnabled,
                onToggle: (val) {
                  setState(() {
                    twoFactorEnabled = val;
                  });
                },
              ),
            ),

            const SizedBox(height: 10),

            // Linked Accounts Section
            _buildSectionTitle('Linked Accounts'),
            _buildAccountItem('Chase Bank', '**4589', FontAwesomeIcons.buildingColumns),
            _buildAccountItem('Salam Bank', '**789', FontAwesomeIcons.creditCard),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.add, color: Colors.green),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Add New Account',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Michael Anderson',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'michael.anderson@example.com',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildPreferenceItem({required IconData icon, required String label, required Widget trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      trailing: trailing,
      tileColor: Colors.white,
    );
  }

  Widget _buildAccountItem(String bankName, String lastDigits, IconData icon) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.purple),
      title: Text(bankName, style: const TextStyle(fontSize: 16)),
      subtitle: Text(lastDigits),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      tileColor: Colors.white,
    );
  }
}