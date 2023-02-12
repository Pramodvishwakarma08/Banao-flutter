class LessonsForYouModel1{
  String image;
  String title;
  String desc;
  String lessons;
  LessonsForYouModel1({required this.title,required this.desc,required this.lessons,required this.image});  //construtor

  factory LessonsForYouModel1.formJson(Map<String,dynamic> paredJson){
    return  LessonsForYouModel1(
        image : paredJson["image"],
        title:paredJson["title"],
        desc : paredJson["desc"],
        lessons:  paredJson["lessons"]
    );
  }
}
