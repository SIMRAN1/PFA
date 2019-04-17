import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class SongDataSource : GenericDataSource<App>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = .clear
        if (self.data.value.count)>0 {
            cell.app = self.data.value[indexPath.row]
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.contentView.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
        }  else
        {
            tableView.isHidden = true
        }
        
        return cell
    }

    }

