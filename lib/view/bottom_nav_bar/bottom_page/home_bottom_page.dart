import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedexapp/core/components/color/my_colors.dart';
import 'package:pokedexapp/service/pokedex_service.dart';

//!cached_network_images => plugins bo'lib internetdan kelgan imagesni cashda saqlaydi keyingi safar keshdan olib ishlatadi qayta internetga murojat qilmaydi
class HomeBottomPage extends StatefulWidget {
  const HomeBottomPage({super.key});
  @override
  State<HomeBottomPage> createState() => _HomeBottomPageState();
}

class _HomeBottomPageState extends State<HomeBottomPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: MyColors.C_2E3353,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.25,
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random"),
                ),
                title: Text(
                  "Razzoqov Shohjahon",
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,fontSize: 20
                  ),
                ),
                trailing: Icon(
                  Icons.location_disabled,
                  color: MyColors.white,
                ),
              ),
            ),
            FutureBuilder(
              future: ServicePokedex.getPokedex(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text("ERROR"),
                  );
                } else {
                  var data = snap.data!.pokemon;
                  return SizedBox(
                    height: 340,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 380,
                            width: 240,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 220,
                                  height: 270,
                                  decoration: BoxDecoration(
                                    color: MyColors.C_353E65,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      const Expanded(
                                          flex: 3, child: SizedBox()),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                data[index].name.toString(),
                                                style: const TextStyle(
                                                  color: MyColors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Height",
                                                        style: TextStyle(
                                                            color:
                                                                MyColors.white),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .height
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              MyColors.C_F7BB17,
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text("Weight",
                                                          style: TextStyle(
                                                              color: MyColors
                                                                  .white)),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .weight
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              MyColors.C_F7BB17,
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "candy",
                                                        style: TextStyle(
                                                            color:
                                                                MyColors.white),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .candyCount
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              MyColors.C_F7BB17,
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text("birth",
                                                          style: TextStyle(
                                                              color: MyColors
                                                                  .white)),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .spawnChance
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              MyColors.C_F7BB17,
                                                          fontSize: 17),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text("avg spawns",
                                                          style: TextStyle(
                                                              color: MyColors
                                                                  .white)),
                                                    ),
                                                    Text(
                                                      data[index]
                                                          .height
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          color: MyColors
                                                              .C_F7BB17),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image(
                                    image: NetworkImage(
                                      data[index].img.toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: data!.length,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
