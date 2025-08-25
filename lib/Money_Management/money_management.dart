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

  void _showFABOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(isEarning: true);
                },
                child: Text(
                  'Add Earning',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(isEarning: false);
                },
                child: Text(
                  'Add Expense',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showForm({required bool isEarning}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                isEarning ? 'Add Earning' : 'Add Expense',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEarning ? Colors.green : Colors.red,
                  ),
                  onPressed: () {},
                  child: Text(
                    isEarning ? 'Add Earning' : 'Add Expense',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFABOptions(context),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),

      body: Column(
        children: [
          Row(
            children: [
              _buildSummaryCard(
                title: 'Earning',
                value: 2000.0,
                color: Colors.green,
              ),
              _buildSummaryCard(
                title: 'Expense',
                value: 4000.0,
                color: Colors.red,
              ),
              _buildSummaryCard(
                title: 'Balance',
                value: 8000.0,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSummaryCard({
  required String title,
  required double value,
  required Color color,
}) {
  return Expanded(
    child: Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
