import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  required String text,
  bool isUpperCase = true,
  required Function() function,
  double radius = 10,
}) =>
    Container(
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius)),
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: function,
      ),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required String label,
  bool isPassword = false,
  Function(String)? onChange,
  Function()? onTap,
  Function(String)? onSubmit,
  required String? Function(String?)? validate,
  Function()? onSuffixPressed,
  required TextInputType type,
  IconData? suffix,
  required IconData? prefix,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: defaultColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: defaultColor,
                ),
                onPressed: onSuffixPressed,
              )
            : null,
        hintText: label,
        //labelText: label,
        border: InputBorder.none,
      ),
      keyboardType: type,
    );

// Widget buildTaskItem(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.black,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.amberAccent),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.grey.shade900,
//                 radius: 40,
//                 child: Text("${model['time']}"),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${model['title']}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     ),
//                     Text(
//                       "${model['date']}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               IconButton(
//                 onPressed: () {
//                   AppCubit.get(context)
//                       .updateData(status: 'done', id: model['id']);
//                 },
//                 icon: const Icon(Icons.check_box),
//                 color: Colors.blue,
//               ),
//               IconButton(
//                 onPressed: () {
//                   AppCubit.get(context)
//                       .updateData(status: 'archive', id: model['id']);
//                 },
//                 icon: const Icon(Icons.archive),
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//       ),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteData(id: model['id']);
//       },
//     );

// Widget tasksBuilder({
//   required List<Map> tasks,
// }) =>
//     ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (context) => ListView.separated(
//           itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
//           separatorBuilder: (context, index) => myDivider(),
//           itemCount: tasks.length),
//       fallback: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.menu,
//               color: Colors.grey,
//               size: 100.0,
//             ),
//             Text(
//               "No Tasks Yet, Please Add Some Tasks",
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey),
//             )
//           ],
//         ),
//       ),
//     );

// Widget buildArticleItem(article, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(article["url"]));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       '${article["urlToImage"] ?? "https://c4.wallpaperflare.com/wallpaper/39/346/426/digital-art-men-city-futuristic-night-hd-wallpaper-preview.jpg"}',
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             const SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120.0,
//                 child: Column(
//                   //mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         "${article["title"]}",
//                         style: Theme.of(context).textTheme.bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       "${article["publishedAt"]}",
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );

// Widget myDivider() => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Divider(
//         height: 1,
//         color: Colors.grey[300],
//       ),
//     );

// Widget articleBuilder(_list, context, {isSearch = false}) => ConditionalBuilder(
//     condition: _list.length > 0,
//     builder: (context) {
//       return ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) =>
//             buildArticleItem(_list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       );
//     },
//     fallback: (context) => isSearch
//         ? Container()
//         : const Center(child: CircularProgressIndicator()));

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultTextButton({
  required Function() function,
  required String text,
}) =>
    TextButton(onPressed: function, child: Text(text.toUpperCase()));

void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Divider(
        height: 1,
        color: Colors.grey[300],
      ),
    );
// Widget buildListItem( model,context,{bool? isOldPrice = true}){
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       height: 120,
//       child: Row(
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children: [
//               Image(

//                 image: NetworkImage('${model.image}'),
//                 width: 120,
//                 height: 120.0,
//               ),
//               if (model.discount != 0&& isOldPrice! )
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   color: Colors.red,
//                   child: const Text(
//                     'DISCOUNT',
//                     style: TextStyle(
//                         fontSize: 8.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 )
//             ],
//           ),
//           SizedBox(width: 20,),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${model.name}',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   style:  const TextStyle(
//                       fontSize: 14, fontWeight: FontWeight.bold, height: 1.3),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Text(
//                       model.price.toString(),
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: defaultColor,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     if (model.discount != 0&& isOldPrice!)
//                       Text(
//                         model.oldPrice.toString(),
//                         style: const TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                     const Spacer(),
//                     CircleAvatar(
//                       backgroundColor: ShopCubit.get(context).favourites![model.id]!? defaultColor : Colors.grey,
//                       child: IconButton(
//                         onPressed: () {
//                           ShopCubit.get(context).changeFavourites(model.id!);
//                           // print(model.id);
//                         },
//                         icon: const Icon(
//                             Icons.favorite_border),
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


// Widget buildFavoriteListItem(FavoritesData model,context,{bool? isOldPrice = true}){
//   // print("ID : ${model.product!.id}");
//   // print("ID : ${model.id}");
//   return GestureDetector(
//     onTap: (){},
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(

//                   image: NetworkImage('${model.product!.image}'),
//                   width: 120,
//                   height: 120.0,
//                 ),
//               ],
//             ),
//             const SizedBox(width: 20,),
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (model.product!.discount != 0)
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(28),
//                               color: Colors.red,
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 5.0),

//                             child: Text(
//                               '${model.product!.discount}' + '%',
//                               style: const TextStyle(
//                                   fontSize: 12.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         const SizedBox(height: 10,),
//                         Text(
//                           '${model.product!.name}',
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           style:  const TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold, height: 1.3),
//                         ),
//                        const Spacer(),
//                         Row(
//                           children: [
//                             Text(
//                               '\$'+model.product!.price.toString(),
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                                 color: defaultColor,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10.0,
//                             ),
//                             if (model.product!.discount != 0&& isOldPrice!)
//                               Text(
//                                 '\$'+model.product!.oldPrice.toString(),
//                                 style: const TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey,
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//                             const Spacer(),
//                             IconButton(
//                               onPressed: () {
//                                 ShopCubit.get(context).changeFavourites(model.product!.id!);
//                                 // print(model.id);
//                               },
//                               icon: ShopCubit.get(context).favourites![model.product!.id]!? const Icon(Icons.favorite): const Icon(Icons.favorite_border),
//                               color: defaultColor,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Container(
//                   //   decoration:  BoxDecoration(
//                   //     color: kPrimaryColor,
//                   //     borderRadius: BorderRadius.circular(28),
//                   //   ),
//                   //   child: IconButton(
//                   //     onPressed: () {
//                   //       ShopCubit.get(context).changeFavourites(model.product!.id!);
//                   //       // print(model.id);
//                   //     },
//                   //     icon: const Icon(Icons.add,color: Colors.white,),
//                   //     color: defaultColor,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget buildCatItem(DataModel model)=>Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Row(
//     children:   [
//       Image(
//         image: NetworkImage('${model.image}'),
//         width: 50,
//         height: 50,
//         fit: BoxFit.cover,

//       ),
//       const SizedBox(
//         width: 20,
//       ),
//       Text(
//         model.name!,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style:const  TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const Spacer(),
//       const Icon(
//           Icons.arrow_forward_ios
//       )
//     ],
//   ),
// );

// Widget buildDrawer(context){
//   return Drawer(
//     child: Column(
//       children: [
//         AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           automaticallyImplyLeading: false,
//           title:const Text('Hello Friend'),),
//         myDivider(),
//         ListTile(
//           leading: const Icon(Icons.shop),
//           title:  const Text('Shop'),
//           onTap: ()=>Navigator.of(context).pushReplacementNamed('/3'),
//         )
//       ],
//     )
//   );
// }


// PreferredSizeWidget defaultAppBar({
//   Widget? titleWidget,
//   Widget? actionWidget,
//   Widget? leadWidget,
//   int? currentScreenIndex,
//   bool isSearch = false,
//   bool isHome = false,
//   Widget? leading,
//   var onLeadPress,
//   required BuildContext context,
// }) =>
//     AppBar(
//       elevation: 0,
//       leadingWidth: isSearch ? 0 : null,
//       backgroundColor: Colors.white,
//       leading: !isHome
//           ? IconButton(
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           size: 18,
//         ),
//         onPressed: onLeadPress == null
//             ? () {
//           ShopCubit.get(context).changeCurrentIndex(
//               ShopCubit.get(context).lastScreenIndex);
//         }
//             : onLeadPress,
//       )
//           : null,
//       title: titleWidget,
//       actions: [
//         actionWidget ?? Container(),
//       ],
//       centerTitle: true,
//     );
// void showMessageBox({
//   required String message,
//   required BuildContext context,
//   String title = 'error',
// }) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           FlatButton(
//             child: const Text("Ok"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }


