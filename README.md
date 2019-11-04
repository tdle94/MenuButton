## MenuButton

Cute animated UI button micro interaction

The original design is given to [Aashish Kumar](https://dribbble.com/shots/5494154-Menu-Button-Micro-Interaction-Adobe-XD-Auto-Animate)

![ezgif com-resize](https://user-images.githubusercontent.com/13130384/68116963-6f7d0e80-ff3f-11e9-80bf-0288ba65fdb1.gif)


## How to use

You can just copy `MenuButon.swift` file to your project and start experimenting. No pod :blush:

and just simply use it like any other UIView
```swift
let menuButton = MenuButton(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100))
menuButton.ontap = { tapped in
  // Do something
}

view.addSubview(menuButton)
```

or in StoryBoard. Just set custom class to MenuButton

<img width="497" alt="Webp net-resizeimage" src="https://user-images.githubusercontent.com/13130384/68117770-99cfcb80-ff41-11e9-8346-79b7ce459b22.png">

