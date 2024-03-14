import UIKit

class List: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students: [String] = []
    
    lazy var studentsTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getStudents()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(studentsTableView)
        setConstraints()
    }
    
    private func setConstraints() {
        studentsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
    func getStudents() {
        if let savedStudents = UserDefaults.standard.array(forKey: "Students") as? [String] {
            students = savedStudents
            studentsTableView.reloadData()
        }
    }
}
