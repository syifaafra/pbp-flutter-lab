import 'package:counter_7/main.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/page/budget_form_page.dart';
import 'package:counter_7/page/budgets_data_page.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

class MyDataBudgetPage extends StatelessWidget {
  const MyDataBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Budgets.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: Budgets.data.map((budget) {
                return Card(
                  child: ListTile(
                      title: Text(budget.judul),
                      subtitle: Text(budget.nominal),

                      trailing: Column(
                        children: [
                            Text(budget.jenis),
                            Text(budget.tanggal),
                          ],
                      ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}