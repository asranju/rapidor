// ignore_for_file: must_be_immutable

part of 'date_bloc.dart';

@immutable
abstract class DateState {}

class DateInitial extends DateState {}

class DateLoadingSuccess extends DateState{

  List<String> selectedDateRange;
  List<DateReportModel> dateReportData;
  DateLoadingSuccess({required this.selectedDateRange,required this.dateReportData});
}
