import 'models.dart';

class Movie {
    final bool adult;
    final String? backdropPath;
    final List<int> genreIds;
    final int id;
    final String title;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final bool? softcore;
    final bool video;
    final double voteAverage;
    final int voteCount;

    Movie({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.title,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.softcore,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    get fullPosterPath{

      if (this.posterPath != null){
        return 'https://image.tmdb.org/t/p/w500${posterPath}';
      }
      return 'https//i.stack.imagur.com/GNx0.png';
    }

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        softcore: json["softcore"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    // Map<String, dynamic> toMap() => {
    //     "adult": adult,
    //     "backdrop_path": backdropPath,
    //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    //     "id": id,
    //     "title": title,
    //     "original_language": originalLanguage,
    //     "original_title": originalTitle,
    //     "overview": overview,
    //     "popularity": popularity,
    //     "poster_path": posterPath,
    //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    //     "softcore": softcore,
    //     "video": video,
    //     "vote_average": voteAverage,
    //     "vote_count": voteCount,
    // };
}
