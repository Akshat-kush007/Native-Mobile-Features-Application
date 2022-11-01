import 'package:flutter/material.dart';
import 'package:native_feature_app/providers/places_provider.dart';
import 'package:native_feature_app/screens/add_places.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Add_Place_Screen.routeName);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<PlacesProvider>(context, listen: false)
              .fetchAndSetPlace(),
          builder: ((context, snapshot) =>
          snapshot.connectionState== ConnectionState.waiting 
          ? const Center(child:CircularProgressIndicator())
          : Consumer<PlacesProvider>(
                builder: ((context, provider, child) {
                  return provider.items.length <= 0
                  ? Center(child:child)
                  : ListView.builder(
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                FileImage(provider.items[index].image)),
                        title: Text(provider.items[index].title),
                      );
                    },
                  );
                }),
                child: const Text('Add new Places!'),
              )),
        ));
  }
}
