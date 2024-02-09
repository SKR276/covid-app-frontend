import 'dart:convert';

import 'package:http/http.dart' as http;

class PatientListApi
{
Future<dynamic> sendData(
    String patientName,String patientPhone,String patientAddress,String patientSymptom,String patientStatus)async{
  var client=http.Client();
  var apiUrl=Uri.parse("http://localhost:3009/api/patients/patient_entry");
  var response=await client.post(apiUrl,
  headers: <String,String>{
    "Content-Type":"application/json; charset=UTF-8"
  },
  body: jsonEncode(<String,String>{
    "patientName":patientName,
    "patientAddress":patientAddress,
    "patientPhone":patientPhone,
    "patientSymptom":patientSymptom,
    "patientStatus":patientStatus
  })
  );
  if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
  else
    {
      throw Exception("Failed to add");
    }
}
}