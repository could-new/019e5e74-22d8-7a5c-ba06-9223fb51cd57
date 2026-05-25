import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Presentasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SlideViewer(),
      },
    );
  }
}

class SlideData {
  final String title;
  final String content;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;

  SlideData({
    required this.title,
    required this.content,
    this.icon,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
  });
}

class SlideViewer extends StatefulWidget {
  const SlideViewer({super.key});

  @override
  State<SlideViewer> createState() => _SlideViewerState();
}

class _SlideViewerState extends State<SlideViewer> {
  final PageController _pageController = PageController();
  int _currentSlideIndex = 0;

  final List<SlideData> _slides = [
    SlideData(
      title: 'Selamat Datang',
      content: 'Ini adalah aplikasi presentasi sederhana yang dibuat dengan Flutter.',
      icon: Icons.slideshow,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
    ),
    SlideData(
      title: 'Fitur Utama',
      content: '• Navigasi Geser (Swipe)\n• Tombol Navigasi\n• Dukungan Keyboard (Panah Kiri/Kanan)\n• Desain Responsif',
      icon: Icons.featured_play_list,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
    ),
    SlideData(
      title: 'Multi-Platform',
      content: 'Aplikasi ini dapat berjalan di Web, Desktop, dan Perangkat Seluler (Android & iOS).',
      icon: Icons.devices,
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
    ),
    SlideData(
      title: 'Terima Kasih',
      content: 'Presentasi selesai. Silakan buat slide Anda sendiri!',
      icon: Icons.check_circle,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentSlideIndex < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousSlide() {
    if (_currentSlideIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _nextSlide();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _previousSlide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKeyEvent: _onKey,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _slides.length,
              onPageChanged: (index) {
                setState(() {
                  _currentSlideIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final slide = _slides[index];
                return Container(
                  color: slide.backgroundColor,
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (slide.icon != null)
                        Icon(
                          slide.icon,
                          size: 100,
                          color: slide.textColor,
                        ),
                      if (slide.icon != null) const SizedBox(height: 30),
                      Text(
                        slide.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: slide.textColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        slide.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.5,
                          color: slide.textColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            
            // Navigasi Bawah
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: 'prev',
                    onPressed: _currentSlideIndex > 0 ? _previousSlide : null,
                    backgroundColor: _currentSlideIndex > 0 ? Colors.white : Colors.grey,
                    child: Icon(Icons.arrow_back, color: _currentSlideIndex > 0 ? Colors.black : Colors.white54),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_currentSlideIndex + 1} / ${_slides.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'next',
                    onPressed: _currentSlideIndex < _slides.length - 1 ? _nextSlide : null,
                    backgroundColor: _currentSlideIndex < _slides.length - 1 ? Colors.white : Colors.grey,
                    child: Icon(Icons.arrow_forward, color: _currentSlideIndex < _slides.length - 1 ? Colors.black : Colors.white54),
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
