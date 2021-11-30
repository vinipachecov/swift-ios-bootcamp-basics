# IOS and Swift boot camp

Code used in [this course](https://www.udemy.com/course/ios-13-app-development-bootcamp) to learn swift and use Xcode.

## Basics of Swift and IOS development

- [UI positioning schemes](#ui-positioning-schemes)
    - [Alignment](#ui-positioning-schemes)
    - [Constraints](#ui-positioning-schemes)
    - [StackView](#stack-view)
- [Navigation](#navigation)
    - [Segues](#segues)
        - [Creating a segue](#creating-a-segue)
        - [Using the created segue](#using-the-created-segue)
- [Dark mode]
    


## UI positioning schemes


### Positioning

#### View
Component that can nest a lot of components without a vertical or horizontal alignment enforced.

Views can have a Safe Area embedded so the elements inside will have to respect some screen constraints. 
### Alignment

Alignment is used when the developer requires to set an item aligned horizontally or vertically without setting fixed values like 30px and so on.
Good to be used to place UI elements that keep relativaly the same position in landscape and portrait mode.

### Constraints
Constraints are used to set fixed spacing values for an item, like 30px top from an ImageView of the same tree level.

### StackView

StackViews are used to pack UI elements that have related behavior in the UI and should change considering their siblings in the tree level. It can pack elements to be rendered vertically or horizontally.

## Navigation

Navigation is a complex part of mobile app development.

In swift with storyboard there are segues, which is an element that represents the transition between two screens.

### Segues
To create sucessfully screen transition, you have to link two ViewControllersm which creates a segue, give a string identifier for the newly created Segue, and then call it in the origin screen.


#### Creating a segue
Segues are the transition names for storyboard UI. To Create a transition, basically, you have to hold CTRL while selecting the origin viewController and release to the target screen view controller.
This will create a **segue**. 

#### Using the created segue

Below you will find an example of how to invoke from an origin screen, a segue transition. it starts with this signature in a specific event:
```swift
self.performSegue(withIdentifier: "SegueIdentifier", sender: whoIsSending)
```

Here we can see another function: **prepare**. It is a method provided to allow the program to pre-setup the upcoming ViewController and its variable initializations if there are values in the next screen that relies on the previous app state.
In this case, it is using to current app state to fill the variables: result, tip and split in the ResultsViewController.

```swift
 @IBAction func navigateToNewSegue(_ sender: UIButton) {     
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "goToResults" {
               
               let destinationVC = segue.destination as! ResultsViewController
               destinationVC.result = String(format: "%f.0", finalResult)
               destinationVC.tip = Int(Int(billTip) * 100)
               destinationVC.split = Int(splitNumberLabel.text!) ?? 0
           }
       }

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
}       
```



## Dark mode

Dark mode is a way to change the color scheme of your app when night comes. 
Steps to make it:

### Texts and vector images

- Create a new Color set
- Select Appearances: "Any, Light, Dark"
- Select the main color of your app
- Use that color in your text elements and vector icons
- Leave dark as white (suggestion)

Angela also changed the background of the app with vector images:

- Drag your vector image to Assets folder
- Select Appearances: "Any, Light, Dark"
- Select preserve vector data
- Select Single Scale in Scales
- Drag and drop the images according to the light, any appearance and dark mode (night time) 
