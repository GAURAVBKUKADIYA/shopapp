import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController _amt = TextEditingController();


  var platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    //Thank you
    //
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    //fail
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _amt,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Add Your Ammount",
                      fillColor: Colors.white70),

                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed: (){

                  var amt = _amt.text.toString();
                  var options = {
                    'key': 'rzp_test_7DPcvPkcdvdeAg',
                    'amount': double.parse(amt) * 100,
                    'name': 'Gaurav Corp.',
                    'description': 'Online Shopping',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                    'external': {
                      'wallets': ['paytm']
                    }
                  };

                  try {
                    _razorpay.open(options);
                  } catch (e) {
                    debugPrint('Error: e');
                  }

                }, child: Text("Pay"))
              ],
            ),
          ),
        )
    );
  }
}
