import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/serviceclass.dart';



class ServiceTile extends StatelessWidget {
  final Services service;
  ServiceTile(this.service);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            height: double.infinity,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 239, 234, 234),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: service.categoryImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            service.categoryName,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'avenir', fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
      ],
    );
  }
}