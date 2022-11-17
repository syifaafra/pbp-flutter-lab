class Budget {
  String judul;
  String nominal;
  String jenis;
  String tanggal;

  Budget(this.judul, this.nominal, this.jenis, this.tanggal);
}

class Budgets {
    static List<Budget> data = [];

    get getDataBudgets => data;
}