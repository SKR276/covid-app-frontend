import 'package:covid_app/models/patientModel.dart';
import 'package:covid_app/services/patientServices.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<ViewList>> ? data;
  @override
  void initState()
  {
    super.initState();
    data=PatientListApi().getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title:  Text("Name: " + snapshot.data![index].patientName),
                              subtitle: Text("Phone: " + snapshot.data![index].patientPhone + "\n" + "Address: "
                                  + snapshot.data![index].patientAddress + "\n" + "Symptom: " +
                                  snapshot.data![index].patientSymptom + "\n" + "Status: " + snapshot.data![index].patientStatus),
                            ),
                          ],
                        ),
                      );
                    });
              }
              else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
    );
  }
}
