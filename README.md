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
2. Tap on the map to add a note at the desired location.
3. Enter your note text and tap "Add."
4. View existing notes by tapping on the markers displayed on the map.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Samples

1. Django server started sucessfully: ![api](https://github.com/Lucifer1811/BeenThere/assets/98603982/085f7e30-c95a-494e-a559-3a3d18eda8c5)<br/><br/>

</br/>
2. App Lauched and google maps api sucessfully imported: ![opening screen](https://github.com/Lucifer1811/BeenThere/assets/98603982/fbfe1efe-0c50-4fd4-ba7a-51a481acf10e)<br/>


3. Note taking interface: ![notes taking interface](https://github.com/Lucifer1811/BeenThere/assets/98603982/b6a5c4bb-1e41-4af3-bbec-580416f0df10)<br/>


4. Note marker on the map: ![note marker](https://github.com/Lucifer1811/BeenThere/assets/98603982/805073f6-56c4-418b-8f5c-9592852b0410)<br/>


5. Note View: ![Note view](https://github.com/Lucifer1811/BeenThere/assets/98603982/be2efd53-97c1-43f0-9c59-f7aea55e186c)<br/>


6. Marker Updating on Database: ![updated in data base](https://github.com/Lucifer1811/BeenThere/assets/98603982/de021268-17a3-4a52-9728-5d626515d1df)<br/>


## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- This app was developed using Flutter for the frontend and Django for the backend.
- Special thanks to the developers of the dependencies used in this project.
  
---
**Note**: Make sure to update the URLs, API keys, and any other placeholders with your actual project information before publishing the README file.
