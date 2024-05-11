import 'package:flutter/material.dart';
import 'package:water_tracker/water_consume.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNumberTEController = TextEditingController();

  List<WaterConsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker',style: TextStyle(fontWeight: FontWeight.w500),),
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
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 10,color: const Color(0xffAD88C6))
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Icon(Icons.water_drop_outlined,size: 40,color: Color(0xff7469B6),),
                            Text('Tap Here',style: TextStyle(color: Color(0xff7469B6),fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15,),

                  const SizedBox(
                    width: 60,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 15,),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('History',style: TextStyle(color: Color(0xff7469B6))),
                Text('Total Glass',style: TextStyle(color: Color(0xff7469B6)))
              ],
            ),

            Expanded(child: ListView.builder(
              itemCount: 25,
                itemBuilder: (context, index){

                })
            )
          ],
        ),
      ),
    );
  }
}
