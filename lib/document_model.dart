class Document {
  String? doc_title;
  //String ? doc_url;
  String? doc_loco;
  String? doc_date;
  int? page_num;

  //Document(this.doc_title, this.doc_url, this.doc_date, this.page_num);
  Document(this.doc_title, this.doc_loco, this.doc_date, this.page_num);

  // ignore: non_constant_identifier_names
  static List<Document> doc_list = [
    //Document("Test 123" , "https://www.nber.org/system/files/working_papers/w24449/w24449.pdf" , "28-03-2018" , 40),
    Document("احياء", "assets/biology_12.pdf", "", 173),
    Document("تاريخ الاردن", "assets/jordan_history_12.pdf", "", 181),
  ];
}
