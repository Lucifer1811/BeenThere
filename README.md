# Been There App

Been There is a mobile application designed to help users create notes tied to specific geographical locations. Users can add notes to locations they have visited or plan to visit, and these notes are displayed on a map interface.

## Features

- **Map Interface**: Users can view their current location on a map and add notes by tapping on the map.
- **Note Creation**: Users can add notes by tapping on a specific location on the map. Each note includes the latitude, longitude, and the user's message.
- **Note Details**: Users can view the details of a note by tapping on the marker associated with it on the map.
- **Backend Integration**: The app communicates with a Django backend to store and retrieve notes.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/your-repository.git
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repository
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Configuration

1. Django Backend: Ensure that you have a Django backend set up to handle the storage and retrieval of notes. Modify the backend URL in the `main.dart` file if necessary.

2. Google Maps API Key: Replace `'YOUR_GOOGLE_MAPS_API_KEY'` in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift` with your own Google Maps API key.

## Dependencies

- [http](https://pub.dev/packages/http): A composable, Future-based library for making HTTP requests.
- [geolocator](https://pub.dev/packages/geolocator): A Flutter plugin for fetching location coordinates.
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter): A Flutter plugin for integrating Google Maps.

## Usage

1. Launch the app on a mobile device or emulator.
2. Allow the app to access your device's location.
3. Tap on the map to add a note at the desired location.
4. Enter your note text and tap "Add."
5. View existing notes by tapping on the markers displayed on the map.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- This app was developed using Flutter for the frontend and Django for the backend.
- Special thanks to the developers of the dependencies used in this project.
  
---
**Note**: Make sure to update the URLs, API keys, and any other placeholders with your actual project information before publishing the README file.