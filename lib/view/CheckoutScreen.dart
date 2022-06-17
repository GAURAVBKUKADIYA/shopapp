import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopapp/view/PaymentScreen.dart';

class CheckoutScreen extends StatefulWidget {

  var total ="";
  CheckoutScreen({this.total});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  var delcharge=20.0;
  var gst =0.0;
   var payment=0.0;
  var platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorpay;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      gst = (double.parse(widget.total)+delcharge) * 0.18;
      payment = delcharge + gst + double.parse(widget.total);
    });
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
       child: Container(
         margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(10), child: Column(
       children: [
       Text("Total : "+ widget.total),
        Text("Delivery Charge : "+ delcharge.toString()),
        Text("GST : "+ gst.toString()),
        Text("Payment : "+ payment.toString()),

        ElevatedButton(onPressed: ()async{

          //Razorpay

          var amt = payment.toString();
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
      ),
    );
  }
}
