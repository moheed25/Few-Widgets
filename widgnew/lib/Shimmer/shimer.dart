// //import skeleton class here
// import 'package:flutter/material.dart';
// import 'package:page/Shimmer/skelton.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerEffect extends StatelessWidget {
//   const ShimmerEffect({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: 200.0,
//           height: 100.0,
//           child: Shimmer.fromColors(
//             baseColor: Colors.red,
//             highlightColor: Colors.yellow,
//             child: Text(
//               'Shimmer',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     // Container(
//     //   height: 100,
//     //   padding: const EdgeInsets.only(left: 15, right: 15),
//     //   child:

//     //   Row(
//     //     children: [
//     //       const Skeleton(height: 120, width: 150),
//     //       const SizedBox(width: 10),
//     //       Expanded(
//     //         child: Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //           children: [
//     //             const Skeleton(width: 100),
//     //             const Skeleton(width: 120),
//     //             const SizedBox(height: 5),
//     //             const Skeleton(),
//     //             const SizedBox(height: 5),
//     //             Row(
//     //               children: const [
//     //                 Expanded(
//     //                   child: Skeleton(
//     //                     height: 20,
//     //                   ),
//     //                 ),
//     //                 SizedBox(width: 30),
//     //                 Expanded(
//     //                   child: Skeleton(
//     //                     height: 20,
//     //                   ),
//     //                 ),
//     //               ],
//     //             )
//     //           ],
//     //         ),
//     //       )
//     //     ],
//     //   ),
//     // );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Loading List'),
            onTap: () =>
                Navigator.of(context).pushNamed(LoadingListPage() as String),
          ),
        ],
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 128, 125, 125),
                highlightColor: const Color.fromARGB(255, 226, 209, 209),
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _enabled = !_enabled;
                    });
                  },
                  child: Text(
                    _enabled ? 'Stop' : 'Play',
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontSize: 18.0,
                        color: _enabled ? Colors.redAccent : Colors.green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
