import 'package:flutter/material.dart';

class TabViewPage extends StatelessWidget {
  const TabViewPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 280,
            color: const Color.fromARGB(255, 44, 43, 43),
            child: Column(
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
