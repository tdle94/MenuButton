# MenuButton

Cute animated UI button interaction

![menu_button_interaction](https://user-images.githubusercontent.com/13130384/68116581-896a2180-ff3e-11e9-806e-f061cac450bf.gif)

# How to use

Can just copy the code to your project and start experimenting. No pod :blush:

```swift
let menuButton = MenuButton(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100))
menuButton.ontap = { tapped in
  // Do something
}
```

or in StoryBoard. Just set custom class to MenuButton

The original design is given to [Aashish Kumar](https://dribbble.com/shots/5494154-Menu-Button-Micro-Interaction-Adobe-XD-Auto-Animate)

