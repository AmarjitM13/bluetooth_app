import 'package:fin_infocom_project/app/modules/profile/data/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileStore = Modular.get<ProfileStore>();

  @override
  void initState() {
    super.initState();
    _profileStore.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Observer(
        builder: (context) => _profileStore.fetchingProfileData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            _profileStore.profileData!.picture!.large!),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${_profileStore.profileData!.name!.title!}. ${_profileStore.profileData!.name!.first!} ${_profileStore.profileData!.name!.last!}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(_profileStore.profileData!.email!),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      child: Text(
                        '${_profileStore.profileData!.location!.street!.number!}, '
                        '${_profileStore.profileData!.location!.street!.name!}\n'
                        '${_profileStore.profileData!.location!.city!}\n'
                        '${_profileStore.profileData!.location!.state!}\n'
                        '${_profileStore.profileData!.location!.country!} - '
                        '${_profileStore.profileData!.location!.postcode!.toString()}',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'DOB',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      child: Text(
                        DateFormat('dd MMM, yyyy').format(
                          DateTime.parse(_profileStore.profileData!.dob!.date!)
                              .toLocal(),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'User Since',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      child: Text(
                        '${DateTime.now().difference(DateTime.parse(_profileStore.profileData!.registered!.date!).toLocal()).inDays} days',
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
