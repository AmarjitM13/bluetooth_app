import 'package:fin_infocom_project/app/modules/dog_image/data/dog_image_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DogImageScreen extends StatefulWidget {
  const DogImageScreen({super.key});

  @override
  State<DogImageScreen> createState() => _DogImageScreenState();
}

class _DogImageScreenState extends State<DogImageScreen> {
  final _dogImageStore = Modular.get<DogImageStore>();

  @override
  void initState() {
    super.initState();
    _dogImageStore.loadDogImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Observer(
          builder: (context) => _dogImageStore.fetchingData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _dogImageStore.dogImageUrl != null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _dogImageStore.dogImageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'Whoops! Some Error Occurred',
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dogImageStore.loadDogImage();
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
