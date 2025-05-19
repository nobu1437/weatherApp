import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var forecasts: [WeatherForecast] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchForecast() {
        isLoading = true
        errorMessage = nil
        
        NetworkService.shared.fetchForecast { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.forecasts = response.forecast.forecastday.compactMap { $0.toWeatherForecast() }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
