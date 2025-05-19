import Foundation

struct WeatherForecast:Identifiable {
    let id = UUID()
    let date: Date
    let forecastDescription: String
    let icon: URL
    let avgTemp: Double
    let maxWind: Double
    let avgHumidity: Double
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter.string(from: date)
    }
}

