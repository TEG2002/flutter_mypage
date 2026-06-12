import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // =======================================================
  // 1. ส่วนข้อมูลพื้นฐาน (แก้ไขข้อมูลที่นี่เพื่อเปลี่ยนคำบนหน้าจอได้ง่ายๆ)
  // =======================================================
  final String titleText = 'Strawberry Pavlova';

  final String descriptionText =
      'Pavlova is a meringue-based dessert named after the Russian '
      'ballerina Anna Pavlova. Pavlova features a crisp crust and soft, '
      'light inside, topped with fruit and whipped cream.';

  final int reviewsCount = 170;
  final double ratingStars = 5.0; // คะแนนดาว (1 - 5 ดาว)

  final String prepDuration = '25 min';
  final String cookDuration = '1 hr';
  final String feedsPeople = '4-6';

  // =======================================================
  // 2. ส่วนของการจัดแต่งหน้าจอหลัก (Widget Tree)
  // =======================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // ตกแต่งกรอบ Left Column (ใช้ขอบมนสีฟ้าครามเพื่อให้ดูพรีเมียมและสวยงามขึ้น)
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.teal.shade200, width: 2.0),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ส่วนที่ 1: หัวข้อเมนูอาหาร
                    _buildTitle(),
                    const SizedBox(height: 16.0),

                    // ส่วนที่ 2: คำอธิบาย/รายละเอียดอาหาร
                    _buildDescription(),
                    const SizedBox(height: 20.0),

                    // ส่วนที่ 3: แถวรีวิวและดาว (Review Row)
                    _buildReviewRow(),
                    const SizedBox(height: 24.0),

                    // ส่วนที่ 4: แถวข้อมูลเวลาและที่นั่งทาน (Info Row)
                    _buildInfoRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =======================================================
  // 3. ฟังก์ชันสร้าง Widget ย่อยเพื่อความเป็นระเบียบและอ่านง่าย
  // =======================================================

  // --- ฟังก์ชันสร้างข้อความหัวข้ออาหาร ---
  Widget _buildTitle() {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Georgia',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
        color: Colors.black87,
      ),
    );
  }

  // --- ฟังก์ชันสร้างข้อความอธิบายความสำคัญ ---
  Widget _buildDescription() {
    return Text(
      descriptionText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.5,
        height: 1.5,
        color: Colors.grey.shade700,
        letterSpacing: 0.2,
      ),
    );
  }

  // --- ฟังก์ชันสร้างแถวดาวและรีวิว ---
  Widget _buildReviewRow() {
    // ลูปสร้างดาว (สีเขียวเข้มเหมือนตัวอย่าง)
    List<Widget> starsList = List.generate(5, (index) {
      return Icon(
        index < ratingStars.floor() ? Icons.star : Icons.star_border,
        color: Colors.green.shade700,
        size: 18.0,
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: starsList),
        const SizedBox(width: 16.0),
        Text(
          '$reviewsCount Reviews',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  // --- ฟังก์ชันสร้างแผงข้อมูลสีเหลี่ยมด้านล่าง (Prep, Cook, Feeds) ---
  Widget _buildInfoRow() {
    const labelStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    );

    const valueStyle = TextStyle(
      fontSize: 12.0,
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // คอลัมน์ที่ 1: PREP
          _buildInfoColumn(
            Icons.kitchen,
            'PREP:',
            prepDuration,
            labelStyle,
            valueStyle,
          ),

          // เส้นแบ่งคอลัมน์แนวตั้ง
          Container(height: 30.0, width: 1.0, color: Colors.grey.shade300),

          // คอลัมน์ที่ 2: COOK
          _buildInfoColumn(
            Icons.timer,
            'COOK:',
            cookDuration,
            labelStyle,
            valueStyle,
          ),

          // เส้นแบ่งคอลัมน์แนวตั้ง
          Container(height: 30.0, width: 1.0, color: Colors.grey.shade300),

          // คอลัมน์ที่ 3: FEEDS
          _buildInfoColumn(
            Icons.restaurant,
            'FEEDS:',
            feedsPeople,
            labelStyle,
            valueStyle,
          ),
        ],
      ),
    );
  }

  // --- ฟังก์ชันย่อยที่ทำหน้าที่จัดวาง Icon และ Text แนวตั้งของแต่ละคอลัมน์ข้อมูล ---
  Widget _buildInfoColumn(
    IconData icon,
    String label,
    String value,
    TextStyle labelStyle,
    TextStyle valueStyle,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.green.shade700, size: 20.0),
        const SizedBox(height: 6.0),
        Text(label, style: labelStyle),
        const SizedBox(height: 4.0),
        Text(value, style: valueStyle),
      ],
    );
  }
}
