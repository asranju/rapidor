
import 'package:intl/intl.dart';

class DateFormatClass{


  static selectedDateParse({required String? value}){
    var e =DateFormat("dd/MM/yyyy").format(DateTime.parse(value!)) ;
    return e;
  }

}