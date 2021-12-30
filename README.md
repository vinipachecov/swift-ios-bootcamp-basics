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
        - [Navigation Container](#navigation-container)
            - [Add navigation container](#navigation-container)
- [Dark mode](#dark-mode)
- [Protocols]
- [Networking](#networking)
    - [HTTP call without Headers](#http-call-without-headers)
    - [HTTP call with Headers](#http-call-with-headers)
    


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
distribution propert:
leading: start side (left if horizontal, top if vertical)
trailing: end side (right if horizontal, bottom if vertical)

StackViews will help us to avoid using constraint layouts and use every item as an individual UI element.

#### Stacks are awesome

Stacked elements get rearrenged if one of the items gets hidden/removed automatically from the layout. This would not happen in a constraint layout that easily.

## Navigation

Navigation is a complex part of mobile app development.

In swift with storyboard there are segues, which is an element that represents the transition between two screens.

### Segues
To create sucessfully screen transition, you have to link two ViewControllersm which creates a segue, give a string identifier for the newly created Segue, and then call it in the origin screen.


### Creating a segue
Segues are the transition names for storyboard UI. To Create a transition, basically, you have to hold CTRL while selecting the origin viewController and release to the target screen view controller.
This will create a **segue**. 

### Using the created segue

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



### Navigation Container
Navigation Container is what allows us to create a navigation flow inside our app besides using Modals.
### Add navigation Container
To add a navigation Container you will have to right-click in a ViewController and click in:
Editor -> Embbed in -> Navigation Controller

### Linking different screens throught button clicks
Select a UI button, hold CTRL and drag the mouse to the desired ViewController. It should create a new Segue.

### Changing the Segue type of a navigation controller
Select the Segue created and in Storyboard Segue menu, select the desired kind of segue:
* Show: Pushes a new card on top of the current one(default animation is slide to right)
* Present Modally: pushes a screen that responds like a Modal card on top of the current one but not using full space.
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

## Protocols

Protocols are the interface feature of other programming languages like Java. Protocols are a way to impose whoever uses them to implement a particular behavior.
Protocols are used swift specifically in form of Delegates, to delegate to the target class, that it should implement speficic behaviors.
In general, the "delegate" is simply a variable inside of class that should receive an instance of a class that implements a particular behavior:
```swift
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    // We don't know in this particular class, the actual class that this delegate variable will receive.
    // On the other hand, we are sure it will have the performCPR method and this is what matters
    var delegate: AdvancedLifeSupport?
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic performing CPR!")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor performing CPR!")
    }
    
    func doDoctorStuff() {
        print("Do doc stuff.")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Do surgeon stuff while doing CPR!")
    }
}


// let emergencyHandler = EmergencyCallHandler()
// let paramedic = Paramedic(handler: emergencyHandler)
// emergencyHandler.medicalEmergency()

let emergencyHandler = EmergencyCallHandler()
let surgeon = Surgeon(handler: emergencyHandler)
emergencyHandler.medicalEmergency()
```

## Networking

### HTTP call without Headers

To use remote APIs, swift requires you to:
* Create a URL
* Create a URLSession
* Give URLSession a task
* Start the task

```swift
 func request(with urlString: String) {
        // create URL
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"           
            let session = URLSession(configuration: .default)
            // create task
            let task = session.dataTask(with: urlRequest) {(data, response, error) in
            // Inside the closure handle the response
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print("Error : \(error)")
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                        
                }                
            }            
            // Actually do the api call
            task.resume()                        
        }
    }
```

### HTTP call with  Headers

* Create a URL
* Create a URLSession
* Set url headers
* Give URLSession a task
* Start the task

```swift
 func request(with urlString: String) {
        // create URL
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"           
            let session = URLSession(configuration: .default)
            // Setting Headers
            urlRequest.setValue(EnvironmentVariables.weatherAPIKey, forHTTPHeaderField: "x-rapidapi-key")
            urlRequest.setValue("community-open-weather-map.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
            // create task
            let task = session.dataTask(with: urlRequest) {(data, response, error) in
            // Inside the closure handle the response
                if error != nil {
                 // handle errors here
                }
                if let safeData = data {
                    // handle data here    
                }                
            }            
            // Actually do the api call
            task.resume()                        
        }
    }
```

## View Lifecycles

1. viewDidLoad()
2. viewWillAppear()
3. viewDidAppear()
4. viewWillDisappear()
5. viewDidDisappear()


