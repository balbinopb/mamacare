
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mamacare/controllers/user/home_controller.dart';
import 'package:mamacare/widgets/pop_up_menu.dart';
import 'package:mamacare/widgets/user/home/indicator_card.dart';
import 'package:mamacare/widgets/user/home/map_rot_chart.dart';
import 'package:mamacare/widgets/user/home/risk_card.dart';
import 'package:mamacare/widgets/user/home/week_card.dart';

class UserDetailsScreen extends GetView<HomeController>{
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/user.png",
                          height: 54,
                          width: 54,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hai, ${controller.name.value}",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${controller.hour.value}  ${controller.date.value}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int week = 9; week < 17; week++)
                          Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: WeekCard(week: week),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  RiskCard(data: controller.risk.value),

                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IndicatorCard(
                        icon: Icons.bloodtype,
                        iconColor: Color(0xFFC73133),
                        label: "MAP",
                        value: "93",
                        unit: "mmHg",
                        status: "Hipertensi",
                        backgroundColor: Color(0xFFFAEBEB),
                      ),
                      IndicatorCard(
                        icon: Icons.rotate_right,
                        iconColor: Color(0xFFFBCC25),
                        label: "ROT",
                        value: "25",
                        unit: "deg",
                        status: "High",
                        backgroundColor: Color(0xFFFFFAEA),
                      ),
                      IndicatorCard(
                        icon: Icons.accessibility_new,
                        iconColor: Color(0xFF539660),
                        label: "BMI",
                        value: "23,4",
                        unit: "kg",
                        status: "Normal",
                        backgroundColor: Color(0xFFEEF5F0),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Report",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PopUpMenu()
                    ],
                  ),

                  MapRotChart(data: controller.chartData.value),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}