import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String imageUrl;

  const ImageFromUrl(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(imageUrl), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return const Text('Error al cargar la imagen');
          } else {
            return Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
