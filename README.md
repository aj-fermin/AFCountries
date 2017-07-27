# AFCountries
Country database with country code, dial code, and flag emoji, which you can use for pickers and table views in iOS projects.

Data scraped from http://country.io . As this was made for the purpose of obtaining dial codes, countries with blank codes were removed from the list.


## Supported SDK Version
- Built with Swift on iOS 10.3


## Installation and Usage
To install, just drag `AFCountries.framework` into your project.

Access all countries with `AFCountry.allCountriesWithCodes()`

`AFCountry` has these properties:
- `countryName` (e.g. "Philippines")
- `countryCode` (e.g. "PH")
- `dialCode` (e.g. "63")
- `flagEmoji` (e.g. "🇵🇭")

Search for a country by country code: `AFCountry.countryWithCode("PH")`


## Demo
https://appetize.io/app/4evx0vd582jj3k4674973tq6ac?device=iphone7&scale=50&orientation=portrait&osVersion=10.3&deviceColor=black
