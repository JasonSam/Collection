

import UIKit

class CNPPopupDemoViewController: UIViewController,CNPPopupControllerDelegate {

    @IBOutlet weak var content: UITextField!
    var popupController = CNPPopupController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func showPopupWithStyle(popupStyle: CNPPopupStyle) {
        
        let label1 = labelFormat("这是一个Popup", labelFont: 24)
        let label2 = labelFormat("你可以添加文字或图片", labelFont: 18)
        
        let btn = CNPPopupButton(frame: CGRectMake(0, 0, 200, 60))
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor(red: 0.46, green: 0.8, blue: 1.0, alpha: 1.0)
        btn.layer.cornerRadius = 4
        btn.selectionHandler = {(btn) in
            let title = btn.titleLabel?.text
            print(title)
        }
        
        let customView = UIView(frame: CGRectMake(0, 0, 250, 55))
        customView.backgroundColor = UIColor.lightGrayColor()
        let textFeild = UITextField(frame: CGRectMake(10, 10, 230, 35))
        textFeild.borderStyle = UITextBorderStyle.RoundedRect
        textFeild.placeholder = "自定义VIEW"
        customView.addSubview(textFeild)
        
        self.popupController = CNPPopupController(contents: [label1,label2,customView,btn])
        self.popupController.theme = CNPPopupTheme.defaultTheme()
        self.popupController.theme.popupStyle = popupStyle
        
        self.popupController.delegate = self
        self.popupController.presentPopupControllerAnimated(true)
        
    }
    
    func labelFormat(labelTitle: String,labelFont: CGFloat,labelColor:UIColor = UIColor.whiteColor()) -> UILabel {
        let labelDemo = UILabel()
        labelDemo.text = labelTitle
        labelDemo.font = UIFont.boldSystemFontOfSize(labelFont)
        labelDemo.textAlignment = NSTextAlignment.Center
        labelDemo.lineBreakMode = NSLineBreakMode.ByWordWrapping
        labelDemo.backgroundColor = labelColor
        return labelDemo
        
    }
    
    
    
    @IBAction func actionFormsheet(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.ActionSheet)
    }
    
    
    @IBAction func actionCentered(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.Centered)
    }
    
    
    
    @IBAction func actionFullscreen(sender: AnyObject) {
        showPopupWithStyle(CNPPopupStyle.Fullscreen)
    }
    
    //CNPopupDelegate
    func popupControllerDidDismiss(controller: CNPPopupController!) {
        print("关闭")
    }
    
    func popupControllerDidPresent(controller: CNPPopupController!) {
        print("打开")
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}