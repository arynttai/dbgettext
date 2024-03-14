import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .bezel
        field.placeholder = ""
        field.font = .systemFont(ofSize: 30)
        return field
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(addText), for: .touchUpInside)
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton()
        button.setTitle("List", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(listButton)
        setConstraints()
    }
    
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
            make.width.equalTo(250)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.width.equalTo(100)
        }
        listButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button.snp.bottom).offset(20)
        }
    }
    
    @objc func addText() {
        guard let text = textField.text, !text.isEmpty else { return }
        saveStudent(text: text)
        textField.text = ""
    }
    
    func saveStudent(text: String) {
        var students = UserDefaults.standard.array(forKey: "Students") as? [String] ?? []
        students.append(text)
        UserDefaults.standard.setValue(students, forKey: "Students")
    }
    
    @objc func nextPage() {
        let listVC = List()
        navigationController?.pushViewController(listVC, animated: true)
    }
}
