

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rapidor/data_model/date_report_model.dart';
import 'package:rapidor/utils/date_format.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateInitial()) {
    on<SelectedDateLoading>((event, emit) {

      if(event.nFlag==1) {
        List<String> selectedDateList = [];
        List<DateReportModel> dateReportDate=[];




        for (int i = 0; i <= event.dEndDate.difference(event.dStartDate).inDays; i++) {
          DateReportModel tempModel=DateReportModel(DateFormatClass.selectedDateParse(value: event.dStartDate.add(Duration(days: i)).toString()),i,i+1,i+2,(3*i+3),0);

          dateReportDate.add(tempModel);

          selectedDateList.add(DateFormatClass.selectedDateParse(
              value: event.dStartDate.add(Duration(days: i)).toString()));

        }

        emit(DateLoadingSuccess(selectedDateRange: selectedDateList,dateReportData: dateReportDate));
      }else{
        List<String> selectedDateList = [];
        emit(DateLoadingSuccess(selectedDateRange: selectedDateList,dateReportData:const []));
      }
    });
  }
}
