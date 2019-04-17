import Foundation

struct SongViewModel {
    
    weak var dataSource : GenericDataSource<App>?
    var apps: [App]?
    var appStoreClient = AppStoreClient()

    init(dataSource : GenericDataSource<App>?) {
        self.dataSource = dataSource
    }
    
    func fetchSongs(term: String) {
        appStoreClient.fetchApps(withTerm: term, inEntity: "musicVideo") { (apps) in
            
            DispatchQueue.main.async {
                if let app = apps {
                self.dataSource?.data.value = app
                }
            }
        }
    }
    
    
}
