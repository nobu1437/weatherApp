import Foundation

extension ForecastDay {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    func toWeatherForecast() -> WeatherForecast? {
        guard let iconURL = URL(string: "https:\(day.condition.icon)") else { return nil }
        let parsedDate = ForecastDay.dateFormatter.date(from: date) ?? Date()
        return WeatherForecast(
            date: parsedDate,
            forecastDescription: day.condition.text,
            icon: iconURL,
            avgTemp: day.avgtemp_c,
            maxWind: day.maxwind_kph,
            avgHumidity: day.avghumidity,
        )
    }
}
