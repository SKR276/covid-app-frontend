import 'package:covid_app/services/patientServices.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    String getName="",getPhone="",getAddress="",getSymptom="",getStatus="";
    TextEditingController patientName=new TextEditingController();
    TextEditingController patientPhone=new TextEditingController();
    TextEditingController patientAddress=new TextEditingController();
    TextEditingController patientSymptom=new TextEditingController();
    TextEditingController patientStatus=new TextEditingController();

    void SendValueToApi() async{
      final response=await PatientListApi().sendData(
          patientName.text,
          patientPhone.text,
          patientAddress.text,
          patientSymptom.text,
          patientStatus.text);
      if(response["status"]=="success"){
        print("Succesfully added");
      }
      else
      {
        print("error");
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(height: 60,),
              Text("Add Patients",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                controller: patientName,
                decoration: InputDecoration(
                    labelText: "Name of patient",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: patientPhone,
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: patientAddress,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: patientSymptom,
                decoration: InputDecoration(
                    labelText: "Symptom",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: patientStatus,
                decoration: InputDecoration(
                    labelText: "Status",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      )
                  ),
                  onPressed: SendValueToApi,
                  child: Text("ADD"),),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      )
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Back to Menu"),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
