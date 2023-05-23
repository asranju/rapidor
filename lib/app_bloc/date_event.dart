// ignore_for_file: must_be_immutable

part of 'date_bloc.dart';

@immutable
abstract class DateEvent {}

class SelectedDateLoading extends DateEvent{
  DateTime dStartDate,dEndDate;
  int nFlag;
  SelectedDateLoading({required this.dStartDate,required this.dEndDate,required this.nFlag});
}


