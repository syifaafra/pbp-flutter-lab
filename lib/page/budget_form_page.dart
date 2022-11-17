import 'package:counter_7/main.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/page/budget_form_page.dart';
import 'package:counter_7/page/budgets_data_page.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _judul = "";
    String _nominal = "";
    String _jenis = 'Pemasukan';
    DateTime? _date;
    List<String> listJenis = ['Pemasukan', 'Pengeluaran'];


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Budget'),
            ),
            // Menambahkan drawer menu
            drawer:  MyDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                          children: [
                                Padding(
                                  // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: Beli Pulpen",
                                          labelText: "Judul",
                                          // Menambahkan circular border agar lebih rapi
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                          ),
                                      ),
                                      // Menambahkan behavior saat nama diketik
                                      onChanged: (String? value) {
                                          setState(() {
                                              _judul = value!;
                                          });
                                      },
                                      // Menambahkan behavior saat data disimpan
                                      onSaved: (String? value) {
                                          setState(() {
                                              _judul = value!;
                                          });
                                      },
                                      // Validator sebagai validasi form
                                      validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                              return 'Judul tidak boleh kosong!';
                                          }
                                          return null;
                                      },
                                  ),
                                ),
                                Padding(
                                  // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: 100",
                                          labelText: "Nominal",
                                          // Menambahkan circular border agar lebih rapi
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                          ),
                                      ),
                                      // Menambahkan behavior saat nama diketik
                                      onChanged: (String? value) {
                                          setState(() {
                                              _nominal = value!;
                                          });
                                      },
                                      // Menambahkan behavior saat data disimpan
                                      onSaved: (String? value) {
                                          setState(() {
                                              _nominal = value!;
                                          });
                                      },
                                      // Validator sebagai validasi form
                                      validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                              return 'Nominal tidak boleh kosong!';
                                          }
                                          else if (int.tryParse(value) == null) {
                                            return 'Nominal harus berupa angka';
                                          }
                                          return null;
                                      },
                                  ),
                                ),

                                Padding(
                                  // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton(
                                        value: _jenis,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: listJenis.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                        );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                        setState(() {
                                            _jenis = newValue!;
                                        });
                                        },
                                    ),
                                ),
                                Padding(
                                  // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                    onPressed: () {
                                        showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2005),
                                        lastDate: DateTime(2025),
                                        ).then((value) {
                                        setState(() {
                                            _date = value;
                                        });
                                        });
                                    },
                                    child: Text("Pilih Tanggal"),
                                    ),
                                ),

                    
                                TextButton(
                                    child: const Text(
                                    "Simpan",
                                    style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                    ),

                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            setState(() {
                                            String tanggal = _date.toString();
                                            tanggal = tanggal.substring(0, 10);
                                            Budget newBudget = Budget(_judul, _nominal, _jenis, tanggal);
                                            Budgets.data.add(newBudget);
                                            });
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    elevation: 15,
                                                    child: Container(
                                                    child: ListView(
                                                        padding: const EdgeInsets.only(top: 20, bottom: 20, left:10, right:10),
                                                        shrinkWrap: true,
                                                        children: <Widget>[
                                                        Center(child: const Text('Berhasil menambahkan data budget')),
                                                        SizedBox(height: 20),
                                                        Text("Judul: $_judul"),
                                                        Text("Nominal: $_nominal"),
                                                        Text("Jenis: $_jenis"),
                                                        
                                                        TextButton(
                                                            child: Text('Kembali'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                                setState(() {
                                                                    _judul = "";
                                                                    _nominal = "";
                                                                    _jenis = "Pemasukan";
                                                                });
                                                                },
                                                        ),
                                                        ],
                                                    ),
                                                    ),
                                                );
                                                });     
                                        }
                                    },
                                ),
                            ],
                        ),   
                    ),
                ),
            ),
        );
    }
}