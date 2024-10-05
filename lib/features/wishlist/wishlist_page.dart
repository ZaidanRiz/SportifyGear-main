import 'package:flutter/material.dart';

   class WishlistPage extends StatefulWidget {
     final List<String> wishlist;

     const WishlistPage({super.key, required this.wishlist});

     @override
     _WishlistPageState createState() => _WishlistPageState();
   }

   class _WishlistPageState extends State<WishlistPage> {
     void _removeFromWishlist(String item) {
       setState(() {
         widget.wishlist.remove(item);
       });
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.yellow[700],
           title: const Text('Wishlist', style: TextStyle(color: Colors.black)),
         ),
         body: widget.wishlist.isEmpty
             ? const Center(child: Text('Your wishlist is currently empty.'))
             : ListView.builder(
                 itemCount: widget.wishlist.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(widget.wishlist[index]),
                     trailing: IconButton(
                       icon: const Icon(Icons.delete, color: Colors.red),
                       onPressed: () {
                         _removeFromWishlist(widget.wishlist[index]);
                       },
                     ),
                   );
                 },
               ),
       );
     }
   }