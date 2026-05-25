import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentasi Administrasi Publik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A), // Warna biru profesional
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Segoe UI',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationViewer(),
      },
    );
  }
}

class PresentationViewer extends StatefulWidget {
  const PresentationViewer({super.key});

  @override
  State<PresentationViewer> createState() => _PresentationViewerState();
}

class _PresentationViewerState extends State<PresentationViewer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _slides = [
    const TitleSlide(),
    const Slide1Background(),
    const Slide2Paradigms(),
    const Slide3ParadigmsCont(),
    const Slide4GoodGov(),
    const Slide5Conclusion(),
    const Slide6References(),
  ];

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            // Slide Content Area
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: _slides,
                    ),
                  ),
                ),
              ),
            ),
            
            // Bottom Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _currentPage > 0 ? _prevPage : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Sebelumnya'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  Text(
                    'Slide ${_currentPage + 1} dari ${_slides.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _currentPage < _slides.length - 1 ? _nextPage : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Selanjutnya'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

// ---------------- Slides Content ----------------

class TitleSlide extends StatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MAKALAH',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Arah Perkembangan Administrasi Publik:\nDari Paradigma Klasik Hingga Tata Kelola Pemerintahan Modern',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  'Kelompok 5',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Ketua: Moh Taufik (250240125)\nDosen: Dr. Hj Erna Suryana, M.Si',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            'Universitas Abdul Aziz Lamadjido Panca Bhakti\n2026',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class Slide1Background extends StatelessWidget {
  const Slide1Background({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSlideTemplate(
      title: 'Bab I: Pendahuluan',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle('Latar Belakang'),
          _buildBulletPoint('Administrasi publik berkaitan dengan pengelolaan urusan rakyat dan pembuatan kebijakan.'),
          _buildBulletPoint('Dulu hanya dipandang sebagai prosedur teknis, kini lebih luas melibatkan partisipasi dan keadilan.'),
          _buildBulletPoint('Ilmu ini terus berkembang mengikuti zaman dan dinamika sosial-politik.'),
          const SizedBox(height: 20),
          _buildSubtitle('Tujuan Penulisan'),
          _buildBulletPoint('Menjelaskan ruang lingkup administrasi publik.'),
          _buildBulletPoint('Memaparkan tahapan paradigma administrasi dari masa ke masa.'),
          _buildBulletPoint('Menguraikan konsep Good Government vs Good Governance.'),
          _buildBulletPoint('Menjelaskan penerapannya di Indonesia.'),
        ],
      ),
    );
  }
}

class Slide2Paradigms extends StatelessWidget {
  const Slide2Paradigms({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSlideTemplate(
      title: 'Bab II: Tahapan Paradigma (1 & 2)',
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('1. Paradigma Klasik (1900-1926)'),
                _buildBulletPoint('Fokus: Efisiensi, ketertiban, dan kepatuhan prosedur.'),
                _buildBulletPoint('Pemisahan tegas politik dan administrasi.'),
                _buildBulletPoint('Birokrasi hirarkis, kaku, aparat dianggap bak mesin.'),
                _buildBulletPoint('Dasar lahirnya SOP dan struktur baku.'),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('2. Teori Perilaku Manusia (1927-1950)'),
                _buildBulletPoint('Pelaku administrasi adalah manusia (sosiologi/psikologi).'),
                _buildBulletPoint('Fokus: Kepuasan kerja, kerjasama, budaya organisasi.'),
                _buildBulletPoint('Dilihat sebagai sistem sosial, bukan sekadar teknis.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slide3ParadigmsCont extends StatelessWidget {
  const Slide3ParadigmsCont({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSlideTemplate(
      title: 'Bab II: Tahapan Paradigma (3, 4, 5)',
      content: ListView(
        children: [
          _buildSubtitle('3. Teori Kebijakan & Sistem (1950-1980)'),
          _buildBulletPoint('Fokus pada cara kebijakan dibuat & dipandang sebagai sistem terbuka.'),
          _buildBulletPoint('Input masyarakat → Proses Pemerintah → Output layanan.'),
          const SizedBox(height: 16),
          _buildSubtitle('4. New Public Management / NPM (1980-2000)'),
          _buildBulletPoint('Gaya sektor swasta masuk ke pemerintahan.'),
          _buildBulletPoint('Warga sebagai pelanggan. Fokus pada hasil dan efisiensi.'),
          const SizedBox(height: 16),
          _buildSubtitle('5. Pelayanan Publik Baru & Tata Kelola (2000-Skrg)'),
          _buildBulletPoint('Menyempurnakan NPM, pemerintah sebagai fasilitator & pemimpin.'),
          _buildBulletPoint('Nilai: Keadilan, hak asasi, hubungan kemitraan, transparansi.'),
        ],
      ),
    );
  }
}

class Slide4GoodGov extends StatelessWidget {
  const Slide4GoodGov({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSlideTemplate(
      title: 'Good Government vs Governance & Konteks Indonesia',
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('Perbedaan Inti:'),
                _buildBulletPoint('Good Government = Wujud / Hasil (Pemerintah yang bersih & berwibawa).'),
                _buildBulletPoint('Good Governance = Cara / Sistem (Melibatkan Pemerintah + Swasta + Masyarakat).'),
                const SizedBox(height: 16),
                const Text(
                  '"Sistem tata kelola yang baik akan melahirkan pemerintah yang baik pula."',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('Konteks Indonesia:'),
                _buildBulletPoint('Administrasi Negara Pancasila (Musyawarah, gotong royong).'),
                _buildBulletPoint('Pergeseran: Sentralisasi ke Desentralisasi (Otonomi).'),
                _buildBulletPoint('Penerapan: Musrenbang, SOP Pelayanan Prima, Reformasi Birokrasi.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slide5Conclusion extends StatelessWidget {
  const Slide5Conclusion({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSlideTemplate(
      title: 'Bab III: Penutup (Kesimpulan & Saran)',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle('Kesimpulan'),
          _buildBulletPoint('Bergeser dari orientasi aturan semata menjadi pelayanan berbasis nilai keadilan.'),
          _buildBulletPoint('Hubungan birokrasi menjadi terbuka, partisipatif, dan bermitra.'),
          _buildBulletPoint('Fokus beralih dari sekadar Good Government menuju Good Governance yang holistik.'),
          const SizedBox(height: 20),
          _buildSubtitle('Saran'),
          _buildBulletPoint('Mahasiswa perlu memahami sejarah agar tepat menerapkan teori yang dinamis.'),
          _buildBulletPoint('Pemerintah harus terus adaptif menyesuaikan SOP dengan kebutuhan modern.'),
          _buildBulletPoint('Nilai luhur bangsa (musyawarah) wajib dipertahankan agar tidak kehilangan jati diri.'),
        ],
      ),
    );
  }
}

class Slide6References extends StatelessWidget {
  const Slide6References({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'DAFTAR PUSTAKA',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            '1. Dwiyanto, Agus (2015). Reformasi Birokrasi dan Tata Kelola Pemerintahan.\n'
            '2. LAN & BPKP (2020). Modul Pelatihan Dasar: Good Governance & Akuntabilitas.\n'
            '3. Siagian, Sondang P. (2016). Filsafat Administrasi.\n'
            '4. Wahab, Solichin Abdul (2014). Analisis Kebijakan.\n'
            '5. Wikipedia Bahasa Indonesia. (2025). Administrasi Publik.\n'
            '6. Materi Kuliah Pengantar Ilmu Administrasi (2026).',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, height: 1.8),
          ),
          const SizedBox(height: 60),
          const Text(
            'TERIMA KASIH',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Helper Methods ----------------

Widget _buildSlideTemplate({required String title, required Widget content}) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const Divider(color: Colors.blueAccent, thickness: 2, height: 32),
        const SizedBox(height: 16),
        Expanded(child: content),
      ],
    ),
  );
}

Widget _buildSubtitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
  );
}

Widget _buildBulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•', style: TextStyle(fontSize: 24, height: 1.2, color: Colors.blue)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, height: 1.4, color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}
