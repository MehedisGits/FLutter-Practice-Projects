import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showInfo = false;
  String btnText = 'Show Info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImage(),
          const SizedBox(height: 20),
          _buildInfo(),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  showInfo = !showInfo;
                });
              },
              child: Text(showInfo ? 'Hide Info' : 'Show Info')),
        ],
      ),
    );
  }

  Stack _buildProfileImage() {
    return Stack(children: [
      const CircleAvatar(
        radius: 100,
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/125388734?s=400&u=15c3fb85c853af87872701df8b1b9cadb5e2a810&v=4'),
      ),
      Positioned(
        bottom: 32,
        right: 32,
        child: InkWell(
          onTap: () {},
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildInfo() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: showInfo
          ? const Column(
        children: [
          Text(
            'Rakibul Islam Mehedi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Age: 22 Years.'),
              SizedBox(width: 10),
              Text('From Bagerhat, Bangladesh'),
            ],
          ),
        ],
      )
          : const Text(
        'Rakibul Islam Mehedi',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}
