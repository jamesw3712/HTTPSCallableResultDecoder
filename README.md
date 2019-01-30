# HTTPSCallableResultDecoder
This is an extension to Firebase's HTTPSCallableResult which allows you to decode an API result from type HTTPSCallableResult to any data type in Swift using decodable

# Installation
Just simply download the source file and add it to your xcode project in any directory you would like

# Usage
            funtions.httpsCallable(funtionName).call(parameters) { (result, error) in
                        if let error = error as NSError?{
                            print(error.localizedDescription)
                            callback(posts)
                            return
                        }

                        //THIS IS ALL YOU NEED TO DECODE A RESULT FROM A FIREBASE API!
                        if let postsObjects: [UserPost.Post] = result?.getDecodedResult(decodeTo: [UserPost.Post].self){
                            //DO STUFF WITH YOUR NEW ARRAY OF POSTS!
                        }

                        posts.sort(by: self.sortByTime(this:that:))
                        callback(posts)

               }
