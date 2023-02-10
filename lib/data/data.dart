class Data{
  List<Map<String,dynamic>> data = [];

  int get length => data.length;

  addData(Map<String,dynamic> value){
    data.add(value);
  }

  removeData({int index = 0}){
    data.removeAt(index);
  }
}