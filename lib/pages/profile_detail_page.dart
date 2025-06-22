import 'package:flutter/material.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 229, 250),
      appBar: AppBar(
        title: Text("Profil Pengguna"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foto profil
            Container(
              margin: EdgeInsets.only(top: 24),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/image/WhatsApp Image 2025-06-20 at 16.16.20_cf50605b.jpg',
                ), // ganti sesuai aset Anda
              ),
            ),
            SizedBox(height: 16),

            // Nama
            Text(
              'Admin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // Email
            Text(
              'Admin.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            SizedBox(height: 24),

            // Informasi lainnya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.phone,
                    title: 'Nomor Telepon',
                    value: '+62 812 3456 7890',
                  ),
                  InfoTile(
                    icon: Icons.home,
                    title: 'Alamat',
                    value: 'Jl. Merdeka No. 123, Jakarta',
                  ),
                  InfoTile(
                    icon: Icons.info,
                    title: 'Tentang',
                    value:
                        'Player Pubg.',
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigasi ke halaman edit profil
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 131, 188, 235),
                      minimumSize: Size(double.infinity, 48),
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
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
