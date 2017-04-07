import Foundation
import Leaf
import Node
import Vapor
import VaporForms

public class FormTextAreaGroup: BasicTag {
    public init(){}
    public let name = "form:textareagroup"
    
    public func run(arguments: [Argument]) throws -> Node? {
        
        /*
         #form:textgroup(key, value, fieldset, attr1, attr2 etc)
         
         Arguments:
         [0] = The name of the input (the key that gets posted) *
         [1] = The value of the input (the value that gets posted) (defaults to empty string) *
         [2] = The VaporForms Fieldset of the entire model * **
         
         * - All the arguments are actually required. We need to throw exceptions at people if they don't supply all of them
         ** - It would be awesome if you could only post the exact Field of the Fieldset so we don't need to find it in this code (its gonna get repetetive)
         
         The <label> will get its value from the Fieldset
         
         If the Fieldset has the "errors" property the form-group will get the has-error css class and all errors will be added as help-block's to the form-group
         
         given input:
         
         let fieldset = Fieldset([
         "name": StringField(
         label: "Name"
         )
         ], requiring: ["name"])
         
         #form:textgroup("name", "John Doe", fieldset)
         
         expected output if fieldset is valid:
         <div class="form-group">
         <label class="control-label" for="name">Name</label>
         <input class="form-control" type="text" id="name" name="name" value="John Doe" />
         </div>
         
         expected output if fieldset is invalid:
         <div class="form-group has-error">
         <label class="control-label" for="name">Name</label>
         <textarea class="form-control" id="name" name="name" value="John Doe"/>
            "input"
         </textarea>
         <span class="help-block">...validation message</span>
         </div>
         */
        
        
        guard arguments.count >= 3,
            let inputName: String = arguments[0].value?.string,
            let fieldsetNode = arguments[2].value?.nodeObject
            else {
                throw Abort.custom(status: .internalServerError, message: "FormTextGroup parse error, expecting: #form:textareagroup(\"name\", \"default\", fieldset)")
        }
        
        // Retrieve field set for name
        let fieldset = fieldsetNode[inputName]
        
        // Retrieve input value, value from fieldset else passed default value
        let inputValue = fieldset?["value"]?.string ?? arguments[1].value?.string ?? ""
        
        let label = fieldset?["label"]?.string ?? inputName
        
        // This is not a required property
        let errors = fieldset?["errors"]?.pathIndexableArray
        
        // Start constructing the template
        var template = [String]()
        
        template.append("<div class='form-group \(errors != nil ? "has-error" : "")'>")
        
        template.append("<label class='control-label' for='\(inputName)'>\(label)</label>")
        
        template.append("<textarea class='form-control' id='\(inputName)' name='\(inputName)'")
        
        // Add custom attributes
        if arguments.count > 3 {
            let max = arguments.count - 1
            for index in 3 ... max {
                if let argument = arguments[index].value?.string {
                    template.append(" " + argument)
                }
            }
        }
        
        template.append("</>")
        template.append(inputValue)
        template.append("</textarea>")
        
        // If Fieldset has errors then loop through them and add help-blocks
        if(errors != nil) {
            for e in errors! {
                
                guard let errorString = e.string else {
                    continue
                }
                
                template.append("<span class='help-block'>\(errorString)</span>")
            }
        }
        
        template.append("</div>")
        
        // Return template
        return .bytes(template.joined().bytes)
    }
}
