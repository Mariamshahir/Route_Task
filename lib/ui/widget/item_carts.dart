import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mariam/model/products.dart';
import 'package:mariam/utils/colors_app.dart';
import 'package:mariam/utils/theme_app.dart';

class ItemCarts extends StatelessWidget {
  final Products product;

  const ItemCarts({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width*0.5,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColor.primary),
        color: AppColor.white,
      ),
      child: GridTile(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.height*0.1,
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width*0.50,
                      height: MediaQuery.of(context).size.height*0.25,
                      imageUrl: product.thumbnail ?? '',
                       fit: BoxFit.cover,
                      placeholder: (_, __) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                      errorWidget: (_, __, ___) => const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.shadow,
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColor.primary,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              product.title ?? '',
              style: AppTheme.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.description ?? '',
              style: AppTheme.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  "EGP ${product.discountPercentage ?? ''}",
                  style: AppTheme.text,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Text(
                  "${product.price ?? ''} EGP",
                  style: AppTheme.oldPrice,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Review (${product.rating ?? ''})",
                      style: AppTheme.review,
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star_outlined,
                      color: AppColor.starIcon,
                      size: 20,
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primary,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
