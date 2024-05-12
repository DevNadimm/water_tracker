import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker/water_consume.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _waterGlassTEController = TextEditingController();

  List<WaterConsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                    onTap: _button,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 35,color: Colors.white,
                            ),
                            Text(
                              'Tap Here',style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 100,
                    child: TextField(
                      style: const TextStyle(fontSize: 17),
                      controller: _waterGlassTEController,
                      decoration: const InputDecoration(
                        hintText: 'Glass Number',
                        hintStyle: TextStyle(fontSize: 15,color: Colors.grey)
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('History',style: TextStyle(color: Colors.black),),
                Text('Total Glasses: ${_getTotalGlasses()}',style: const TextStyle(color: Colors.black),),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: waterConsumeList.length,
                  itemBuilder: (context , index){
                  return ListTile(
                    title: Text(DateFormat.yMEd().add_jms().format(waterConsumeList[index].time)),
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text('${index+1}'),
                    ),
                    trailing: Text(
                        waterConsumeList[index].glassCount.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    );
                }),
            )
          ],
        ),
      ),
    );
  }

  _getTotalGlasses(){
    int totalGlasses = 0;
    for(WaterConsume waterConsume in waterConsumeList){
      totalGlasses += waterConsume.glassCount ;
    }
    return totalGlasses;
  }

  _button(){
    int glassCount = int.tryParse(_waterGlassTEController.text) ?? 01;
    // WaterConsume(time: DateTime.now(), glassCount: glassCount);
    waterConsumeList.add(WaterConsume(time: DateTime.now(), glassCount: glassCount));
    setState(() {  });
  }

}