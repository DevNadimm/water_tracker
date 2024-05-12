import 'package:flutter/material.dart';
import 'package:water_tracker/water_consume.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNumberTEController =
  TextEditingController();
  List<WaterConsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _tapButton,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 10, color: const Color(0xffAD88C6)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Icon(Icons.water_drop_outlined, size: 40, color: Color(0xff7469B6)),
                            Text('Tap Here', style: TextStyle(color: Color(0xff7469B6), fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _glassNumberTEController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('History', style: TextStyle(color: Color(0xff7469B6))),
                Text('Total Glass ${_getTotalWaterConsumeCount()}', style: const TextStyle(color: Color(0xff7469B6))),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: waterConsumeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text((DateFormat.yMEd().add_jms().format(DateTime.now())).toString()),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xff7469B6),
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    trailing: Text((waterConsumeList[index].waterGlasses).toString(),style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getTotalWaterConsumeCount() {
    int totalGlass = 0;
    for (WaterConsume waterConsume in waterConsumeList) {
      totalGlass += waterConsume.waterGlasses;
    }
    return totalGlass;
  }

  void _tapButton() {
    int glassCount = int.tryParse(_glassNumberTEController.text) ?? 1;
    WaterConsume waterConsume = WaterConsume(date: DateTime.now(), waterGlasses: glassCount);
    waterConsumeList.add(waterConsume);
    setState(() {});
  }
}