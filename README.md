# IOS and Swift boot camp

Code used in [this course](https://www.udemy.com/course/ios-13-app-development-bootcamp) to learn swift and use Xcode.

## Basics of Swift and IOS development

- [UI positioning schemes](#ui-positioning-schemes)
    - [Alignment](#ui-positioning-schemes)
    - [Constraints](#ui-positioning-schemes)
    - [StackView](#stack-view)


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
