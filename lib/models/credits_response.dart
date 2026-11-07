import 'package:movies_app/models/models.dart';

class CreditResponse {
    int id;
    List<Cast> cast;
    

    CreditResponse({
        required this.id,
        required this.cast,
        
    });

    factory CreditResponse.fromJson(String str) => CreditResponse.fromMap(json.decode(str));


    factory CreditResponse.fromMap(Map<String, dynamic> json) => CreditResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        
    );

}

