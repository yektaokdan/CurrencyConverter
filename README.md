# CurrencyConverter

CurrencyConverter is a swift iOS application designed for converting currency values based on real-time exchange rates. Ideal for travelers, finance enthusiasts, or anyone looking for quick currency conversions. This app fetches exchange rates from a web service and updates the values for various currencies like CAD, CHF, GBP, USD, and TRY directly on the user interface.

## Features

- **Real-time Currency Conversion:** Fetches and displays the latest exchange rates for CAD, CHF, GBP, USD, and TRY.
- **User-friendly Interface:** Easy-to-use interface with a simple 'Check' button to initiate the conversion process.
- **Error Handling:** Implements basic error handling to alert users in case of network or parsing issues.

## How It Works

The app uses `URLSession` to make a request to a currency exchange rate API. Upon receiving the data, it parses the JSON response and updates the UI with the latest exchange rates for selected currencies. 

### Important Note

When using this application, ensure to replace `"ENTER_URL"` in the ViewController.swift file with the actual URL of the currency exchange rate API you intend to use.

## JSON Response Format

The application expects the JSON response in the following format:

```json
{
    "success": true,
    "timestamp": 1656004563,
    "base": "EUR",
    "date": "2022-06-23",
    "rates": {
        "CAD": 1.366932,
        "CHF": 1.009697,
        "GBP": 0.859487,
        "USD": 1.051668,
        "TRY": 18.245762,
        // ....
    }
}
```
## Installation

- Clone this repository to your local machine.
- Open the project in Xcode by double-clicking the .xcodeproj file.
- Update the let url = URL(string: "ENTER_URL") line in ViewController.swift with the URL of your currency exchange rate API.
- Run the application on your chosen iOS device or simulator through Xcode.

## Usage
- Tap the 'Check' button on the main screen to fetch the latest exchange rates.
- View the updated exchange rates displayed for each currency on the screen.
This app provides a simple yet powerful tool for anyone needing quick access to currency exchange rates. Modify and expand it to suit your needs or integrate it with more comprehensive financial tracking tools.
