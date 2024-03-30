package com.jspiders.springmvc.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.jspiders.springmvc.dto.UserDTO;
import com.jspiders.springmvc.service.UserService;

@Controller
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping( path="/sign_up", method=RequestMethod.GET)
	public String getSigUpPage() {
		return "sign_up";
	}
	@RequestMapping(path="/add_user" ,method=RequestMethod.POST)
	public String addUser(@RequestParam(name="email") String email,@RequestParam(name="password") String password, ModelMap modelMap)  {
		
		userService.addUser(email,password);
		modelMap.addAttribute("message","signed up");
		return "sign_in";	
	}
	
	@RequestMapping(path="/sign_in" ,method=RequestMethod.GET)
	public String getSigninPage() {
		return "sign_in";
	}
	
	
	@RequestMapping(path="/check_user" ,method=RequestMethod.POST)
	public String checkUser(@RequestParam(name="email") String email,@RequestParam(name="password") String password ,ModelMap modelMap,HttpSession httpSession) {
		UserDTO signedinUser = userService.checkUser(email, password);
			httpSession.setAttribute("user", signedinUser);
			httpSession.setMaxInactiveInterval(1200);
		if (signedinUser != null) {
			return "home";
		}else {
			modelMap.addAttribute("message","Invalid Email or password");
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/sign_out",method = RequestMethod.GET)
	public String signOut(ModelMap modelMap,HttpSession httpSession) {
		modelMap.addAttribute("message", "signed out");
		httpSession.invalidate();
		return "sign_in";
	}
	
	@RequestMapping(path="/delete_user",method=RequestMethod.GET)
	public String deleteUser(ModelMap modelMap,HttpSession httpSession) {
		
		  UserDTO signedInUser =(UserDTO) httpSession.getAttribute("user");
		  userService.deleteUser(signedInUser);
		  modelMap.addAttribute("message" ,"User Deleted");
		  return "sign_in";
	}

}
