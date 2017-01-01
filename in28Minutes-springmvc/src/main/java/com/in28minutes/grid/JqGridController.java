package com.in28minutes.grid;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class JqGridController {

	
	 @RequestMapping(value = "/jqgrid", method=RequestMethod.GET)
	 public String showGrid(HttpServletRequest request, HttpServletResponse response) {
		 return "jqGrid01";
	 }
	 
//
//	 @RequestMapping(value = "/login", method=RequestMethod.POST)
//	 public String handleLoginRequest(@RequestParam String name, @RequestParam String password, ModelMap model) {
//		 if (service.validateUser(name, password)){
//			 model.put("name",name);
//			 model.put("password",password);
//			 return "welcome";
//		 }else{
//			 model.put("errorMessage", "Invalid Credentials");
//			 return "login";
//		 }
//	 }
}
