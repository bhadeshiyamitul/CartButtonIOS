# CartButtonIOS
iOS Cart Button

For More Detail visit [www.unusedbrain.com](https://unusedbrain.com/blog/2019/08/24/add-to-cart-button/)




Now a days all types of shopping are done by mobile apps. Here i have done simple component for add to cart just simple tap.  we can use this cart button any kind of product that related to quantity.  

Code for Add To cart Button

<pre>
let ubButtons = UBCartView.instanceFromNib() as! UBCartView

ubButtons.frame = CGRect(x: 100, y: 100, width: 120, height: 40)

ubButtons.loadInitalview()

ubButtons.cartQtyResponse = { (qty) in

      print(qty as Any)
}
self.view.addSubview(ubButtons)
</pre>

