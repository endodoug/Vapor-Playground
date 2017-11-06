import Vapor

extension Droplet {
  func setupRoutes() throws {
    get("hello") { req in
      var json = JSON()
      try json.set("hello", "world")
      return json
    }
    
    get("plaintext") { req in
      return "Hello, world!"
    }
    
    // response to requests to /info domain
    // with a description of the request
    get("info") { req in
      return req.description
    }
    
    get("description") { req in return req.description }
    
    get("myJson") { req in
      var json = JSON()
      try json.set("title", "This is my title😀")
      try json.set("description", "A great description here!")
      try json.set("URL", ["URL 1" : "http://google.com"])
      try json.set("URL", ["URL 2" : "zewkey.com"])
      return json
    }
    
    try resource("posts", PostController.self)
  }
}
