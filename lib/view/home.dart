
import 'package:api_connection/models/user_model.dart';
import 'package:api_connection/services/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.userData.isEmpty) {
            provider.fetchUserData(); // Fetch data when userData is empty
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: provider.userData.length,
              itemBuilder: (context, index) {
                Users user = provider.userData[index];
                Address address = user.address;
                Company company = user.company;
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('id: ${user.id}'),
                      Text('name: ${user.name}'),
                      Text('Username: ${user.username}'),
                      Text('Email: ${user.email}'),
                      Text('Phone: ${user.phone}'),
                      Text(
                          'Address: ${address.street}, ${address.suite}, ${address.city}'),
                      Text('Website: ${user.website}'),
                      Text(
                          'Company: ${company.name} - ${company.catchPhrase}, ${company.bs}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}