import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.forecasts) { forecast in
                        WeatherCellView(forecast: forecast)
                    }
                    .refreshable {
                        viewModel.fetchForecast()
                    }
                }
            }
            .navigationTitle("Weather")
        }
        .onAppear {
            viewModel.fetchForecast()
        }
    }
}
