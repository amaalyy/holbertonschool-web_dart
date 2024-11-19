import "4-util.dart";
import "dart:convert";

Future<double> calculateTotal() async {
  try {
    String user = await fetchUserData();
    String id = json.decode(user)["id"];
    
    String productsData = await fetchUserOrders(id);
    List<dynamic> products = json.decode(productsData);

    double totalPrice = 0.0;

    for (String product in products) {
      String priceData = await fetchProductPrice(product);
      double price = double.parse(json.decode(priceData).toString());
      totalPrice += price;
    }

    return totalPrice;

  } catch (e) {
    return -1;
  }
}
