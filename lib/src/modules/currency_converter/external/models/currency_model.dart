class CurrencyModel {
  late String code;
  late String codeIn;
  late String name;
  late double high;
  late double low;
  late double varBid;
  late double pctChange;
  late double bid;
  late double ask;
  late String timestamp;
  late String createDate;

  CurrencyModel({
    required this.code,
    required this.codeIn,
    required this.name,
    required this.high,
    required this.low,
    required this.varBid,
    required this.pctChange,
    required this.bid,
    required this.ask,
    required this.timestamp,
    required this.createDate,
  });

  factory CurrencyModel.empty() {
    return CurrencyModel(
      code: '',
      codeIn: '',
      name: '',
      high: 0.0,
      low: 0.0,
      varBid: 0.0,
      pctChange: 0.0,
      bid: 0.0,
      ask: 0.0,
      timestamp: '',
      createDate: '',
    );
  }

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    final currency = CurrencyModel.empty();
    currency.code = json['code'];
    currency.codeIn = json['codein'];
    currency.name = json['name'];
    currency.high = double.parse(json['high']);
    currency.low = double.parse(json['low']);
    currency.varBid = double.parse(json['varBid']);
    currency.pctChange = double.parse(json['pctChange']);
    currency.bid = double.parse(json['bid']);
    currency.ask = double.parse(json['ask']);
    currency.timestamp = json['timestamp'];
    currency.createDate = json['create_date'];
    return currency;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['codein'] = codeIn;
    data['name'] = name;
    data['high'] = high;
    data['low'] = low;
    data['varBid'] = varBid;
    data['pctChange'] = pctChange;
    data['bid'] = bid;
    data['ask'] = ask;
    data['timestamp'] = timestamp;
    data['create_date'] = createDate;
    return data;
  }
}
