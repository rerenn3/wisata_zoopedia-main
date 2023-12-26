import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;


  void signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    String storedFullName = prefs.getString('fullName') ?? ''; // Ambil nama lengkap dari SharedPreferences

    if (username.isNotEmpty) {
      setState(() {
        userName = username;
        fullName = storedFullName; // Menggunakan nama lengkap yang disimpan
        isSignedIn = true;
      });
    }
    // Lakukan operasi logout dan navigasi kembali ke halaman sign-in
    Navigator.pushReplacementNamed(context, '/sign_in');
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');

    setState(() {
      fullName = '';
      isSignedIn = false;
    });
  }


  // Metode untuk memperbarui tampilan profil
  void updateProfile(String newFullName, String newUsername,
      int newFavoriteCandiCount) {
    setState(() {
      fullName = newFullName;
      userName = newUsername;
      favoriteCandiCount = newFavoriteCandiCount;
    });
  }


  void navigateToSignIn() {
    Navigator.pushReplacementNamed(context, '/sign_in').then((result) {
      if (result != null && result is Map<String, String>) {
        // Ambil nama pengguna dan nama lengkap dari hasil login dan simpan ke SharedPreferences
        saveUserData(result['userName']!, result['fullName']!);
      }
    });
  }

  void saveUserData(String userName, String fullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userName);
    prefs.setString('fullName', fullName);

    setState(() {
      this.userName = userName;
      this.fullName = fullName;
      isSignedIn = true;
    });
  }


  void navigateToSignUp() {
    // Implementasi untuk navigasi ke halaman sign up
    Navigator.pushNamed(context, '/sign_up');
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan data pengguna dari argument navigasi
    final Map<String, dynamic>? args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>?;

    if (args != null) {
      fullName = args['fullName'] ?? '';
      userName = args['userName'] ?? '';
      favoriteCandiCount = args['favoriteCandiCount'] ?? 0;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightGreen, Colors.lightGreenAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreen,
                              width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/Profil.png'),
                        ),
                      ),
                      if (isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt, color: Colors.black45),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.lightGreen[100]),
                buildProfileInfo(
                  'Pengguna  ',
                  Icons.lock,
                  userName,
                  isEditable: false,
                  iconColor: Colors.amber,
                ),
                buildProfileInfo(
                  'Nama',
                  Icons.person,
                  fullName,
                  isEditable: isSignedIn,
                  iconColor: Colors.red,
                ),
                buildProfileInfo(
                  'Favorite',
                  Icons.favorite,
                  '$favoriteCandiCount',
                  iconColor: Colors.red,
                ),
                SizedBox(height: 20),
                buildProfileAction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileInfo(String label, IconData icon, String value,
      {bool isEditable = true, Color? iconColor}) {
    String displayedValue = label == 'Nama' ? fullName : value; // Menggunakan fullName untuk label 'Nama'

    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.black),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Divider(color: Colors.lightGreen),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                ': $displayedValue', // Menggunakan displayedValue di sini
                style: TextStyle(fontSize: 18, color: Colors.lightGreen),
              ),
            ),
            if (isEditable) Icon(Icons.edit, color: Colors.grey),
          ],
        ),
        SizedBox(height: 4),
        Divider(color: Colors.lightGreen),
        SizedBox(height: 4),
      ],
    );
  }


  Widget buildProfileAction() {
    return isSignedIn
        ? ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.deepPurple,
      ),
      child: Text('Sign Out', style: TextStyle(color: Colors.lightGreen)),
    )
        : OutlinedButton(
      onPressed: signIn,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey),
        primary: Colors.transparent,
      ),
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.lightGreen),
      ),
    );
  }
}