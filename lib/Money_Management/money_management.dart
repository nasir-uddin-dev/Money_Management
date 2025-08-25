import 'package:flutter/material.dart';

class MoneyManagement extends StatefulWidget {
  const MoneyManagement({super.key});

  @override
  State<MoneyManagement> createState() => _MoneyManagementState();
}

class _MoneyManagementState extends State<MoneyManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.deepPurple.shade500),
        ),
        title: Text(
          'Money Management',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: Colors.red,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Earning',
              icon: Icon(Icons.arrow_upward, color: Colors.white),
            ),
            Tab(
              text: 'Expense',
              icon: Icon(Icons.arrow_downward, color: Colors.white),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Card(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Earning',
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      Text(
                        '15,000',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
