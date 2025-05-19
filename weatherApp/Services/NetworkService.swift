import Foundation

class NetworkService{
    static let shared = NetworkService()
    private var task: URLSessionTask?
    private init(){}
    func fetchForecast(_ completion: @escaping (Result<ForecastResponse,Error>) -> Void) {
        assert(Thread.isMainThread)
        task?.cancel()
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=11ab2359c40641cf952131654251905&q=moscow&days=5") else {
            assertionFailure("[NetworkService Error]: WrongURL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HttpConstants.get.rawValue
        let task = URLSession.shared.objectTask(for: request) { [weak self] (result: Result<ForecastResponse, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let forecast):
                completion(.success(forecast))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        self.task = task
        task.resume()
    }
}

