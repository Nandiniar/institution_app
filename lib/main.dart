import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Institute {
  final String name;
  final String location;
  final String domain;
  final String imagePath;
  final String Sub1;
  final String Sub2;
  final String Sub3;
  final String Discount;
  final String Rating;
  final String Distance;

  Institute({required this.name, required this.location,required this.domain,required this.Sub1,required this.Sub2,required this.Sub3,required this.Discount,required this.Rating, required this.Distance,required this.imagePath});
}

class InstituteProvider with ChangeNotifier {
  List<Institute> _institutes = [
    Institute(name: "IASbaba", location: "Prem Nagar ,Delhi",domain:"UPSC", Sub1:"Maths",Sub2:"Civics",Sub3:"Geo",Discount:"20% off",Rating: "4.5",Distance:"2km  away",imagePath:"images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "DristiBaba", location: "Noor Nagar ,Delhi",domain:"UPSC",Sub1:"Maths",Sub2:"Civics",Sub3:"Geo",Discount:"30% off",Rating: "4.5",Distance:"3km  away", imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Rau's IAS", location: "Sangam Vihar ,Delhi",domain:"UPSC",Sub1:"Maths",Sub2:"Civics",Sub3:"Geo",Discount:"40% off", Rating: "4.5",Distance:"4km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Bjjus IAS", location: "Akbar Road,Delhi",domain:"UPSC", Sub1:"Maths",Sub2:"Civics",Sub3:"Geo",Discount:"50% off",Rating: "4.5",Distance:"1km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Fitjee", location: "Prem Nagar ,Delhi",domain:"JEE MAINS",Sub1:"Maths",Sub2:"Chem",Sub3:"Physics",Discount:"20% off",Rating: "4.5",Distance:"2km  away", imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Clear IIT ", location: "Noor Nagar ,Delhi ",domain:"JEE MAINS", Sub1:"Maths",Sub2:"Chem",Sub3:"Physics",Discount:"30% off",Rating: "4.5",Distance:"3km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Bansal Classes", location: "Sangam Vihar ,Delhi",domain:"JEE MAINS", Sub1:"Maths",Sub2:"Chem",Sub3:"Physics",Discount:"40% off",Rating: "4.5",Distance:"4km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Brilliant Tutorial", location: "Akbar Road,Delhi",domain:"JEE MAINS",Sub1:"Maths",Sub2:"Chem",Sub3:"Physics",Discount:"50% off", Rating: "4.5",Distance:"1km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Resonance", location: "Prem Nagar ,Delhi",domain:"NEET",Sub1:"Bio",Sub2:"Chem",Sub3:"Physics",Discount:"20% off", Rating: "4.5",Distance:"2km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Sankalp", location: "Noor Nagar ,Delhi",domain:"NEET", Sub1:"Bio",Sub2:"Chem",Sub3:"Physics",Discount:"30% off",Rating: "4.5",Distance:"3km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Allen", location: "Sangam Vihar ,Delhi",domain:"NEET", Sub1:"Bio",Sub2:"Chem",Sub3:"Physics",Discount:"40% off",Rating: "4.5",Distance:"4km  away",imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),
    Institute(name: "Carrer Orbits", location: "Akbar Road,Delhi",domain:"NEET",Sub1:"Bio",Sub2:"Chem",Sub3:"Physics",Discount:"50% off",Rating: "4.5",Distance:"1km  away", imagePath: "images/WhatsApp Image 2023-09-02 at 18.18.50.jpeg"),





    // Add more institute data here
  ];

  List<Institute> get institutes => _institutes;
  List<Institute> _filteredInstitutes = [];

  List<Institute> get filteredInstitutes => _filteredInstitutes;

  void searchInstitutes(String query) {
    _filteredInstitutes = _institutes.where((institute) =>
    institute.name.toLowerCase().contains(query.toLowerCase()) ||
        institute.location.toLowerCase().contains(query.toLowerCase()) || institute.domain.toLowerCase().contains(query.toLowerCase()) ).toList();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Institute Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => InstituteProvider(),
        child: InstituteSearchPage(),
      ),
    );
  }
}

class InstituteSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final instituteProvider = Provider.of<InstituteProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text('For JEE Mains', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading:IconButton(
            icon:Icon(Icons.arrow_back,
                color:Colors.purple),
            onPressed: (){

            },
          )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Adjust the value to control roundness
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (query) {
                  instituteProvider.searchInstitutes(query);
                },

                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.purple),
                  hintText :'Search for Coaching',

                  suffixIcon: Row(
                    mainAxisSize:MainAxisSize.min,
                    children:[
                      Icon(Icons.search,color:Colors.purple),
                      IconButton(
                        icon:Icon(
                          Icons.mic,
                          color:Colors.purple,// Remove the default border
                        ),
                        onPressed:(){

                        },
                      ),
                    ],
                  ),
                  border :InputBorder.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: InstituteList(),
          ),

        ],
      ),
    );
  }
}

class InstituteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final instituteProvider = Provider.of<InstituteProvider>(context);
    final filteredInstitutes = instituteProvider.filteredInstitutes;

    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: filteredInstitutes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            color : Color(0xFFF6EFFE),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Image.asset(filteredInstitutes[index].imagePath),
              title: Text(filteredInstitutes[index].name),
              subtitle: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[Text(filteredInstitutes[index].location,),
                  Text( filteredInstitutes[index].domain)
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstituteDetailsPage(
                      institute: filteredInstitutes[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class InstituteDetailsPage extends StatelessWidget {
  final Institute institute;

  InstituteDetailsPage({required this.institute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Institute Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(institute.imagePath, height: 100.0),
            Text(
              'Name: ${institute.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Location: ${institute.location}',
                style: TextStyle(fontSize: 16)),
            Text('domain: ${institute.domain}',
                style: TextStyle(fontSize: 16)),
            Text('Sub1: ${institute.Sub1}',
                style: TextStyle(fontSize: 16)),
            // it is used to provide the details at institute detail corner
            Text('Sub2: ${institute.Sub2}',
                style: TextStyle(fontSize: 16)),
            Text('Sub3: ${institute.Sub3}',
                style: TextStyle(fontSize: 16)),
            Text('Discount: ${institute.Discount}',
                style: TextStyle(fontSize: 16)),
            Text('Rating: ${institute.Rating}',
                style: TextStyle(fontSize: 16)),
            Text('Distance: ${institute.Distance}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
