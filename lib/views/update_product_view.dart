import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snackbar.dart';
import 'package:store_app/models/all_products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/views/widgets/custom_button.dart';
import 'package:store_app/views/widgets/custom_textfield.dart';

// ignore: must_be_immutable
class UpdateProductView extends StatefulWidget {
  const UpdateProductView({super.key});
  static const String id = "update_product_view";

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productName, productDescription, productImageUrl;

  double? productPrice;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(
                    labelText: 'Product Name',
                    onChanged: (value) {
                      productName = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Product Description',
                    onChanged: (value) {
                      productDescription = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Product Price',
                    onChanged: (value) {
                      productPrice = double.parse(value);
                    },
                    keyboardType: 'number',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Product Image Url',
                    onChanged: (value) {
                      productImageUrl = value;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    buttonText: 'Update',
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        if (!mounted) return;
                        showSnackBar(
                            this.context, 'Product Updated Successfully');

                        Navigator.pop(this.context);
                      } catch (e) {
                        showSnackBar(this.context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName ?? product.title,
        description: productDescription ?? product.description,
        category: product.category,
        image: productImageUrl ?? product.image,
        price: productPrice ?? product.price);
  }
}
