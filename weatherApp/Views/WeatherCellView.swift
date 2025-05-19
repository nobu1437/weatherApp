import SwiftUI

struct WeatherCellView: View {
    let forecast: WeatherForecast
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: forecast.icon) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().frame(width: 50, height: 50)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(forecast.formattedDate)
                    .font(.headline)
                Text(forecast.forecastDescription)
                    .font(.subheadline)
                Text("Average temperature: \(forecast.avgTemp, specifier: "%.1f")°C")
                Text("Wind speed: \(forecast.maxWind, specifier: "%.1f") kph")
                Text("Humidity: \(forecast.avgHumidity, specifier: "%.0f")%")
            }
        }
        .padding(.vertical, 8)
    }
}
