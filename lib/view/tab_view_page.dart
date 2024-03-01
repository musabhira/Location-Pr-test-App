import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/controller/controller.dart';
import 'package:test_app/controller/home_state_provider.dart';

class TabViewPage extends ConsumerWidget {
  const TabViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Test App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            color: const Color.fromARGB(255, 44, 43, 43),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () async {
                            // /// Check if location service is enabled
                            // if (await isLocationEnabled()) {
                            //   /// Check if the app has permission
                            //   if (await requestLocationPermission()) {
                            //     // ignore: avoid_print
                            //     print('Location permission granted');
                            //   } else {
                            //     // ignore: avoid_print
                            //     print('Location permission denied');
                            //   }
                            // } else {
                            //   // ignore: avoid_print
                            //   print('Location not enabled');
                            // }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Request Location Permission',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 210, 55),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Request Notification Permission',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Start Location Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InkWell(onTap: () async {
                          if (await requestLocationPermission()) {
                            /// Check if the app has permission
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text('Alert'),
                                  content: const Text('Are you sure'),
                                  actions: [
                                    TextButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        child: const Text('No')),
                                    TextButton(
                                      onPressed: () {
                                        // ref
                                        //     .read(homeStateProvider.notifier)
                                        //     .startLocationPolling();
                                        // AwesomeNotifications()
                                        //     .createNotification(
                                        //   content: NotificationContent(
                                        //     id: 10,
                                        //     channelKey: 'location-update',
                                        //     actionType: ActionType.Default,
                                        //     title: 'Location update started',
                                        //   ),
                                        // );
                                        // Navigator.pop(context);
                                      },
                                      child: const Text('Yes'),
                                    )
                                  ],
                                );
                              }),
                            );
                          } else {
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: ((context) {
                                return const AlertDialog(
                                  title: Text('Alert'),
                                  content:
                                      Text('Place Enable Location permission'),
                                );
                              }),
                            );
                          }
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(244, 67, 54, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Stop Location Upadate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: ref.watch(homeStateProvider).locations.length,
              itemBuilder: (context, index) {
                final data = ref.watch(homeStateProvider).locations[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 212, 212),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Request ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text(
                            'Lat:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(data.lat.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400)),
                          const SizedBox(width: 10),
                          const Text(
                            'Lng:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(data.lon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400)),
                          const SizedBox(width: 10),
                          const Text(
                            'Speed:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(data.speed.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
