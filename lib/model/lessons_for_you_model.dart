
class LessonsForYouModel{
  String image;
  String title;
  String desc;
  String lessons;
  LessonsForYouModel({required this.title,required this.desc,required this.lessons,required this.image});  //construtor

  factory LessonsForYouModel.formJson(Map<String,dynamic> paredJson){
    return  LessonsForYouModel(
        image : paredJson["image"],
        title:paredJson["title"],
        desc : paredJson["desc"],
        lessons:  paredJson["lessons"]
    );
  }
}
