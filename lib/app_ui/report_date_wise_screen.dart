// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:rapidor/utils/app_color.dart';
import 'package:rapidor/utils/app_style.dart';
import 'package:rapidor/utils/date_format.dart';

import '../app_bloc/date_bloc.dart';

class ReportDateWiseScreen extends StatefulWidget{
  const ReportDateWiseScreen({super.key});



  @override
  ReportDateWiseUI createState()=> ReportDateWiseUI();
}

class ReportDateWiseUI extends State<ReportDateWiseScreen>{

  DateTime selectedDate=DateTime.now();
  DateTime selectedDateTo=DateTime.now();
  var isPortrait=false;
  TextEditingController toDateController=TextEditingController();
  TextEditingController fromDateController=TextEditingController();

  List<String> weekName=['Total (Sun-Sat)','Sun','Mon','Tue','Wen','Thu','Fri','Sat'];
  List<String> weekInfoList=['Total Info for the WEEK','','Running Time','Jogging Time','Exercise Time','Total Time','Running Time engagement %',
  'JoggingTime engagement %','Exercise Time engagement %'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dateTemp=DateTime.now();
    DateTime sunday= getDate(dateTemp.subtract(Duration(days: dateTemp.weekday - 1)));
    fromDateController.text=DateFormat('dd/MM/yyyy').format(dateTemp);
    toDateController.text=DateFormat('dd/MM/yyyy').format(DateTime.now());


    isPortrait = false;
    setState(() {
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ]);

 BlocProvider.of<DateBloc>(context).add(SelectedDateLoading(dStartDate: DateTime.now(), dEndDate: DateTime.now(), nFlag: 1));
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  Future<void> _selectFromDate(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child){
          return AppStyle.datePickerTheme(child: child, context: context);
        },
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) selectedDate = picked;
    DateTime sunday= getDate(selectedDate.subtract(Duration(days: selectedDate.weekday)));
    print(sunday);
    setState(() {
      fromDateController.text = DateFormatClass.selectedDateParse(value: selectedDate.toString());
    });
    BlocProvider.of<DateBloc>(context).add(SelectedDateLoading(dStartDate: sunday, dEndDate: selectedDateTo, nFlag: 1));
  }

  Future<void> _selectToDate(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child){
          return AppStyle.datePickerTheme(child: child, context: context);
        },
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: selectedDateTo,
        firstDate: DateTime(2015, 8),
        lastDate:DateTime.now());
    if (picked != null && picked != selectedDateTo) selectedDateTo = picked;

    setState(() {
      toDateController.text = DateFormatClass.selectedDateParse(value: selectedDateTo.toString());
    });
    BlocProvider.of<DateBloc>(context).add(SelectedDateLoading(dStartDate: selectedDate, dEndDate: selectedDateTo, nFlag: 1));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Report"),
      actions: [

        IconButton(onPressed: (){
           isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

          if(isPortrait) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeLeft,
            ]);
          }else{
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitDown,
              DeviceOrientation.portraitUp,
            ]);
          }
           setState(() {
           });
        }, icon: Icon(Icons.screen_rotation_outlined,color: AppColor.whiteColor,))
      ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(children: [

          Row(children: [
           const Expanded(flex:1,child: Text("Form Date : ")),
           const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child:  TextFormField(
                textAlign: TextAlign.center,
              readOnly: true,
              style: TextStyle(color: AppColor.primaryColor),
              controller: fromDateController,
              onTap: (){
                _selectFromDate(context);
              },
              decoration:const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month)
              ),
            ),),
            const SizedBox(width: 10,),
            const Expanded(
              flex: 1,
                child: Text("To Date : ")),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child:  TextFormField(
                textAlign: TextAlign.center,
              controller: toDateController,
              style: TextStyle(color: AppColor.primaryColor),
              readOnly: true,
              onTap: (){
                _selectToDate(context);
              },
              decoration:const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month)
              ),
            ),),
          ],),

          Container(
            width: MediaQuery.of(context).size.width,
            margin:const EdgeInsets.only(top:  20,bottom: 50),
              height: MediaQuery.of(context).size.height * .80,
              child: ListView.builder(
            // shrinkWrap: true,
              //physics:const NeverScrollableScrollPhysics(),
            itemCount: 1,
              itemBuilder: (BuildContext context,int index){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Expanded(
                    flex:2,
                      child: Column(children: [

                        SizedBox(
                         height: MediaQuery.of(context).size.height ,
                            child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                          itemCount: weekInfoList.length,
                            itemBuilder: (BuildContext context,int index){
                            return
                              Container(

                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: HexColor("#880808")),
                                    color: AppColor.primaryColor
                                ),
                                height: 50,
                                child:Text(weekInfoList[index],style: AppStyle.headingStyle,textAlign: TextAlign.center,)
                            );

                        }))
                  ],)),
                Expanded(
                flex:5,
                child:Column(children: [

                  Container(
                    height: 50,

                    width: MediaQuery.of(context).size.width /1.6,
                    alignment: Alignment.topCenter,

                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: weekName.length,
                        //shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context,int index){
                          return
                            Container(
                              width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: HexColor("#880808")),
                                    color: AppColor.primaryColor
                                ),
                                height: 50,
                                child:Text(weekName[index],style: AppStyle.headingStyle,textAlign: TextAlign.center,)
                            );

                        })),

                  const SizedBox(height: 5,),
                  Container(
                margin:const EdgeInsets.only(top: 5),
                height: 50,
                width: MediaQuery.of(context).size.width /1.6,


                child:
                BlocBuilder<DateBloc,DateState>(builder:(context,state){
                return state is DateLoadingSuccess ? ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: state.selectedDateRange.length,
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                return
                Container(
                width: 100,
                alignment: Alignment.center,
                margin:const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
                // color: AppColor.primaryColor
                ),
                height: 50,
                child:Text(state.selectedDateRange[index],style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                );

                }):Container();}),
                ),
                 Container(
                     height: MediaQuery.of(context).size.height * .80,
                     margin:const EdgeInsets.only(top: 5),

                     width: MediaQuery.of(context).size.width /1.6,

                     child:ListView.builder(
                         physics: const ClampingScrollPhysics(),
                       itemCount: 7,
                         itemBuilder: (BuildContext context,int index2){
                       return  Container(
                         margin:const EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height /1,
                    width: MediaQuery.of(context).size.width /1.6,


                    child: BlocBuilder<DateBloc,DateState>(builder:(context,state){
                      return state is DateLoadingSuccess ? ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.selectedDateRange.length,
                        //shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context,int index){
                          return  Column(children: [ Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  // color: AppColor.primaryColor
                                ),
                                height: 43,
                                child:Text(state.dateReportData[index].sumOfWeek.toString(),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                            ),
                          Container(
                          width: 100,
                          alignment: Alignment.center,
                          margin:const EdgeInsets.only(left: 5,top: 5),
                          decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          // color: AppColor.primaryColor
                          ),
                          height: 43,
                          child:Text(state.dateReportData[index].running.toString(),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                          ),
                            Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5,top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  // color: AppColor.primaryColor
                                ),
                                height: 43,
                                child:Text(state.dateReportData[index].jogging.toString(),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                            ),
                            Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5,top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  // color: AppColor.primaryColor
                                ),
                                height: 43,
                                child:Text(state.dateReportData[index].exercise.toString(),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                            ),
                            Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5,top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  // color: AppColor.primaryColor
                                ),
                                height: 43,
                                child:Text(state.dateReportData[index].totalTime.toString() ,style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                            ),
                          Container(
                          width: 100,
                          alignment: Alignment.center,
                          margin:const EdgeInsets.only(left: 5,top: 5),
                          decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          // color: AppColor.primaryColor
                          ),
                          height: 43,
                          child:Text( ((state.dateReportData[index].running!/state.dateReportData[index].totalTime!)*100).toStringAsFixed(2),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                          ),
                          Container(
                          width: 100,
                          alignment: Alignment.center,
                          margin:const EdgeInsets.only(left: 5,top: 5),
                          decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          // color: AppColor.primaryColor
                          ),
                          height: 43,
                          child:Text( ((state.dateReportData[index].jogging!/state.dateReportData[index].totalTime!)*100).toStringAsFixed(2),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                          ),
                            Container(
                                width: 100,
                                alignment: Alignment.center,
                                margin:const EdgeInsets.only(left: 5,top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  // color: AppColor.primaryColor
                                ),
                                height: 43,
                                child:Text(  ((state.dateReportData[index].exercise!/state.dateReportData[index].totalTime!)*100).toStringAsFixed(2),style: AppStyle.contentStyle,textAlign: TextAlign.center,)
                            )


                          ]);

                        }):Container();}),
                    );})),
                  //const SizedBox(height: 5,),


                ],))
                ],);



          })),


      ],),),
    );
  }

}