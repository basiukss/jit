({
    click:function(component, event, helper) {
    	console.log('click');
        var action = component.get("c.test");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {                
                var result = response.getReturnValue();
                console.log("Clean records success");  
                console.log(result); 
                component.set("v.status", JSON.parse(result));
            }
        });
        $A.enqueueAction(action);
    }
    ,
    clickClean : function(component, event, helper) {       
        var action = component.get("c.Clean");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {                
                var result = response.getReturnValue();
                console.log("Clean records success");  
                console.log(result); 
                component.set("v.status", result);
                //component.set("v.status", JSON.parse(result));
            }
        });
        $A.enqueueAction(action);
    }  
    ,
    clickGenerateData : function(component, event, helper) {       
        var action = component.get("c.GenerateData");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {                
                var result = response.getReturnValue();
                console.log("Generate records success");  
                console.log(result); 
                component.set("v.status", result);
            }
        });
        $A.enqueueAction(action);
    }       
})