import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // =========================
              // HEADER
              // =========================
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ), //untuk memberi jarak antara lingkaran dan text
                        const Text(
                          'PHOTO BOOTH',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600, // Menebalkan teks
                            letterSpacing: 0.3, // Memberikan jarak antar huruf
                          ),
                        ),
                      ],
                    ),

                    // Foto profil
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/person.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // HEADLINE
              // =========================
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Make\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            height: 1.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'your moment\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            height: 1.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'count',
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 34,
                            height: 1.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // =========================
              // CAMERA PREVIEW
              // =========================
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: const Color(0xFFE5E1DC),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Stack(
                          children: [
                            // Sementara menggunakan gambar.
                            // Nanti bisa diganti CameraPreview.
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/camera_preview.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Badge 4:3
                            Positioned(
                              top: 14,
                              left: 14,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  '4:3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            // Flip camera
                            Positioned(
                              top: 14,
                              right: 14,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.flip_camera_ios_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // =========================
                    // CAMERA BUTTON
                    // =========================
                    Positioned(
                      bottom: -42,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 76,
                          height: 76,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF7F6F3),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // BOTTOM MENU
              // =========================
              Padding(
                padding: const EdgeInsets.only(
                  top: 48,
                  bottom: 20,
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Gallery
                    _BottomMenu(
                      icon: Icons.image_outlined,
                      label: 'Gallery',
                      onTap: () {},
                    ),

                    // Prints
                    _BottomMenu(
                      icon: Icons.star_border_rounded,
                      label: 'Prints',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================
// BOTTOM MENU WIDGET
// ========================================

class _BottomMenu extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _BottomMenu({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 21, color: Colors.black),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
