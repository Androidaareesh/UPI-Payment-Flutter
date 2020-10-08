import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:upi_payment/upi_india.dart';

void main() {
  const MethodChannel channel = MethodChannel('upi_india');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    UpiIndia upi = UpiIndia();
    expect(
        await upi.startTransaction(
          app: UpiApp.PhonePe,
          receiverUpiId: "8767582387@ybl",
          receiverName: "Keval Senghani",
          transactionRefId: "AzTest123",
          transactionNote: "Test Transfer",
          amount: 1.00,
        ),
        '42');
  });
}
