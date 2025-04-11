import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_app1/util/vpn_provider.dart';

class AnalyticsTitleWidget extends StatelessWidget {
  const AnalyticsTitleWidget({
    super.key,
    required this.connection,
    required this.formattedDate,
    required this.index,
  });

  final Connection connection;
  final String formattedDate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: ListTile(
        contentPadding: EdgeInsets.all(4.w),
        title: Text(
          "Сессия ${index + 1}",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Дата: ",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
              TextSpan(text: " ", style: TextStyle(fontSize: 20.sp)),
              TextSpan(
                text: formattedDate,
                style: TextStyle(fontSize: 20.sp, color: Colors.green[700]),
              ),
              TextSpan(text: "\n", style: TextStyle(fontSize: 20.sp)),
              TextSpan(
                text: "Длительность: ",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
              TextSpan(text: " ", style: TextStyle(fontSize: 20.sp)),
              TextSpan(
                text:
                    "${connection.duration.inHours}:${(connection.duration.inMinutes % 60).toString().padLeft(2, '0')}:${(connection.duration.inSeconds % 60).toString().padLeft(2, '0')}",
                style: TextStyle(fontSize: 25.sp, color: Colors.green[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
