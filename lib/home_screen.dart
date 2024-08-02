import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb/API_service/api.dart';
import 'package:moviedb/Widgets/movies_slider.dart';
import 'package:moviedb/Widgets/search_bar.dart';
import 'package:moviedb/Widgets/trendingslider.dart';
import 'package:moviedb/colors.dart';
import 'package:moviedb/firebase_options.dart';
import 'package:moviedb/models/movie.dart';
import 'package:moviedb/models/tv_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<TVShow>> topRatedTvShow;
  final API _api = API();

  @override
  void initState() {
    super.initState();
    trendingMovies = API().getTrendingMovies();
    topRatedMovies = API().getTopRatedMovies();
    upcomingMovies = API().getUpcoming();
    topRatedTvShow = API().getTopRatedTVShows();
  }

  void handleSearch(String query) {
    setState(() {
      trendingMovies = _api.searchMovies(
          query); // Assuming search results are displayed in the trending section
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colours.scaffoldBgColor,
        elevation: 0,
        title: const Text(
          'MovieDB',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              SearchBr(
                onSearch: handleSearch,
              ),
              const SizedBox(height: 32),
              Text(
                "What's trending",
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              const SizedBox(height: 32),
              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              const SizedBox(height: 32),
              Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              const SizedBox(height: 32),
              Text(
                'Top Rated TV Shows',
                style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
