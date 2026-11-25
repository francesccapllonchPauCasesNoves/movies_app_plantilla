# Movies App 🎬🍿

A cross-platform **Flutter** application for discovering trending and now-playing movies, exploring film details and cast members, and searching titles in real time.

## ✨ Features

- **Now Playing & Popular Movies:** Interactive card swiper for movies currently in theaters and horizontal sliders for popular titles.
- **Movie Details & Cast:** Dedicated detail screen displaying the movie poster, backdrop, rating, overview, and a horizontal scrolling list of cast actors.
- **Real-Time Movie Search:** Built-in search delegate with debounced API requests to find movies quickly.
- **Smooth Animations & Placeholders:** Hero transitions between screens and fade-in network image loading using local assets (`assets/`).

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **State Management & Networking:** `Provider` & `http` (REST API consumption, e.g., TMDB API)
- **UI Components:** `card_swiper` (or custom page views) and Material Design widgets

## 📂 Project Structure

```text
lib/
├── main.dart            # App entry point, routing & MultiProvider setup
├── models/              # JSON serialization models (Movie, Credits, SearchResponse)
├── providers/           # MoviesProvider for API requests and state management
├── screens/             # HomeScreen & DetailsScreen
├── search/              # SearchDelegate implementation for movie queries
└── widgets/             # Reusable widgets (CardSwiper, MovieSlider, CastingCards)
