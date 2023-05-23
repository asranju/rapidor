class TimeInfoModel {
  String timeInfoName;
  List<DateReportModel> dateReportModel;

  TimeInfoModel(this.timeInfoName, this.dateReportModel);
}
class DateReportModel{
  String? date;
  int? running;
  int? jogging;
  int? exercise;
  int? totalTime;
  int? sumOfWeek;
  DateReportModel(this.date,this.exercise,this.jogging,this.running,this.totalTime,this.sumOfWeek);

  }
