import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Tourist Guide',
            ),
            backgroundColor: Colors.pink[300]),
        body: ListView(
          children: locations
              .map((location) => GestureDetector(
                  child: Container(
                      height: 245.0,
                      child: Stack(children: [
                        ImageBanner(
                            assetPath: location.imagePath, height: 245.0),
                        TileOverlay(location)
                      ])),
                  onTap: () => _onLocationTap(context, location.id)))
              .toList(),
        ));
  }

  void _onLocationTap(BuildContext context, int locationId) {
    Navigator.of(context)
        .pushNamed(LocationDetailRoute, arguments: {"id": locationId});
  }
}
