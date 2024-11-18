class Result<T> {
  List<T> value = [];

  Result(this.value);

  factory Result.fromJson(Map<String, dynamic> json, Function fromJsonModel) {
    final items = json['value'].cast<Map<String, dynamic>>();
    return Result<T>(
        List<T>.from(items.map((itemsJson) => fromJsonModel(itemsJson))));
  }
}
