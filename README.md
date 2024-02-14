This micro library provides conveniences for using the Swim HTML DSL library with Vapor.

== Usage
`Node` is now `AsyncResponseEncodable`, so you can just return it from a route handler:
```
    func home(req: Request) -> Node {
        
        html {
            head {
                meta(charset: "utf-8")
                meta(content: "width=device-width, initial-scale=1", name: "viewport")
                link(href: "css/style.css", rel: "stylesheet")
            }
            body {
                div(class: "center-screen") {
                    Hello!
                }
            }
        }
    }
```

In case you want to respond with HTML when returning a non-2xx status code, you can wrap your `Node` in `NodeResponse`:
```
func postContact(req: Request) -> NodeResponse {
  var contact = try req.content.decode(Contact.self)

  if exists(contact) {
    return NodeResponse(node: contactExistsNode(), status: .unprocessableEntity)
  }

  ....
}
```
