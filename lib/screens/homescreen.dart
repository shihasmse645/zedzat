import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productcontroller.dart';
import '../controller/servicecontroller.dart';
import '../widget/currentloc.dart';
import '../widget/producttile.dart';
import '../widget/servicetile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final ProductController productController = Get.put(ProductController());
  final ServiceController serviceController = Get.put(ServiceController());


  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("ZEDZAT",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.blue),),
                ],
              ),
              const SizedBox(height: 20,),
              MyLocationWidget(),
              const SizedBox(height: 20,),
              CarouselSlider(
			        items: [
				
				            //1st Image of Slider
                    Container(
                    margin:const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset("assets/images/b1.jpg"),
                    ),
				
				            //2nd Image of Slider
                    Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset("assets/images/b2.jpg"),
                    ),
				
                    //3rd Image of Slider
                    Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      
                    ),
                    child: Image.asset("assets/images/b3.jpg"),
                    ),
		                ],
			
			              //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
		            ),
              const SizedBox(height: 30,),

                TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  tabs:const [
                    Tab(text: 'Products'),
                    Tab(text: 'Service'),
                  ],
                  indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Content for Tab 1
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Obx(() {
                        if (productController.isLoading.value) {
                                        return const Center(child: CircularProgressIndicator());
                                      } else
                                          {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: productController.productList.length,
                          itemBuilder: (context, index){
                                  return ProductTile(productController.productList[index]);
                          });
                                          }
                                        
                                          }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Obx(() {
                        if (serviceController.isLoading.value) {
                                        return const Center(child: CircularProgressIndicator());
                                      } else
                                          {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: serviceController.serviceList.length,
                          itemBuilder: (context, index){
                                  return ServiceTile(serviceController.serviceList[index]);
                          });
                                          }
                                        
                                          }),
                      ),
                    ],
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}