// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************

// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************
// //
// // ignore_for_file: type=lint

// import 'package:auto_route/auto_route.dart' as _i3;
// import 'package:flutter/material.dart' as _i4;

// import '../screens/character_info.dart' as _i2;
// import '../screens/character_screen.dart' as _i1;

// class AppRouter extends _i3.RootStackRouter {
//   AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
//       : super(navigatorKey);

//   @override
//   final Map<String, _i3.PageFactory> pagesMap = {
//     Character.name: (routeData) {
//       return _i3.MaterialPageX<dynamic>(
//           routeData: routeData, child: const _i1.Character());
//     },
//     CharacterInfo.name: (routeData) {
//       final args = routeData.argsAs<CharacterInfoArgs>();
//       return _i3.MaterialPageX<dynamic>(
//           routeData: routeData,
//           child: _i2.CharacterInfo(
//               key: args.key,
//               origin: args.origin,
//               image: args.image,
//               name: args.name,
//               isAlive: args.isAlive,
//               description: args.description,
//               gender: args.gender,
//               race: args.race,
//               location: args.location));
//     }
//   };

//   @override
//   List<_i3.RouteConfig> get routes => [
//         _i3.RouteConfig(Character.name, path: '/'),
//         _i3.RouteConfig(CharacterInfo.name, path: '/character-info')
//       ];
// }

// /// generated route for
// /// [_i1.Character]
// class Character extends _i3.PageRouteInfo<void> {
//   const Character() : super(Character.name, path: '/');

//   static const String name = 'Character';
// }

// /// generated route for
// /// [_i2.CharacterInfo]
// class CharacterInfo extends _i3.PageRouteInfo<CharacterInfoArgs> {
//   CharacterInfo(
//       {_i4.Key? key,
//       required String origin,
//       required String image,
//       required String name,
//       required String isAlive,
//       String? description,
//       required String gender,
//       required String race,
//       required String location})
//       : super(CharacterInfo.name,
//             path: '/character-info',
//             args: CharacterInfoArgs(
//                 key: key,
//                 origin: origin,
//                 image: image,
//                 name: name,
//                 isAlive: isAlive,
//                 description: description,
//                 gender: gender,
//                 race: race,
//                 location: location));

//   static const String name = 'CharacterInfo';
// }

// class CharacterInfoArgs {
//   const CharacterInfoArgs(
//       {this.key,
//       required this.origin,
//       required this.image,
//       required this.name,
//       required this.isAlive,
//       this.description,
//       required this.gender,
//       required this.race,
//       required this.location});

//   final _i4.Key? key;

//   final String origin;

//   final String image;

//   final String name;

//   final String isAlive;

//   final String? description;

//   final String gender;

//   final String race;

//   final String location;

//   @override
//   String toString() {
//     return 'CharacterInfoArgs{key: $key, origin: $origin, image: $image, name: $name, isAlive: $isAlive, description: $description, gender: $gender, race: $race, location: $location}';
//   }
// }
