package com.in28minutes.grid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JSGridController {

	
	 @RequestMapping(value = "/jsgrid", method=RequestMethod.GET)
	 public String showGrid() {
		 return "jsgrid01";
	 }
	 
	 

}
