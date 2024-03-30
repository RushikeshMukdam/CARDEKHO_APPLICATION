
package com.jspiders.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.springmvc.dto.CarDTO;
import com.jspiders.springmvc.dto.UserDTO;
import com.jspiders.springmvc.service.CarService;
import com.jspiders.springmvc.service.UserService;

@Controller
public class CarController {

	@Autowired
	private CarService carService;
	@Autowired
	private UserService userService;

	@RequestMapping(path = "/add_page", method = RequestMethod.GET)
	public String getAddPage(HttpSession httpSession) {
		
		UserDTO signedInUser =(UserDTO) httpSession.getAttribute("user");
		if (signedInUser != null) {
			return "add_car";
		}else {
			return "sign_in";
		}
		
	}

	@RequestMapping(path = "/add_car", method = RequestMethod.POST)
	public String addCar(@RequestParam(name = "name") String name, @RequestParam(name = "brand") String brand,
			@RequestParam(name = "price") double price,HttpSession httpSession, ModelMap modelMap) {		
		   UserDTO signedInuser =(UserDTO) httpSession.getAttribute("user");
		if (signedInuser != null) {
			 CarDTO addedcar =  carService.addCar(name, brand, price);
			userService.updateUser(signedInuser, addedcar);
			modelMap.addAttribute("message", "Car details added");
			return "add_car";	
		}else {
			return "sign_in";
		}
	}
	
	
	
	@RequestMapping(path="/viewAllCars" ,method=RequestMethod.GET)
	public String findAllCars(ModelMap modelMap,HttpSession httpSession) {
		
		 UserDTO signedInUser =(UserDTO) httpSession.getAttribute("user");
		 if (signedInUser != null) {
			 List<CarDTO> cars = carService.findAllCars();
				if (cars!=null) {
					modelMap.addAttribute("cars",cars);
				}else {
					modelMap.addAttribute("message","car not found");
				}
				return "viewcars";
		}else {
			return "sign_in";
		}
	}
	
	@RequestMapping(path = "/home",method = RequestMethod.GET)
	public String getHomePage(HttpSession httpSession) {
	Object signedInUser	= httpSession.getAttribute("user");
	if (signedInUser != null) {
		return "home";
	}else {
		return "sign_in";
	}
	}
	
	@RequestMapping(path="/my_cars" ,method=RequestMethod.GET)
	public String findAllCarsByUser(ModelMap modelMap,HttpSession httpSession) {
			UserDTO signedInUser = (UserDTO) httpSession.getAttribute("user");
			if (signedInUser != null) {
				 List<CarDTO> cars = carService.findAllCarsByUser(signedInUser);
				 
				if (cars != null )   {
					modelMap.addAttribute("cars",cars);
				}else {
					modelMap.addAttribute("message","Car Not found");
				}
				return "my_cars";
			}else {
				return "sign_in";
			}	
	}
	
	@RequestMapping(path="/delete_car" , method = RequestMethod.POST)
	public String deleteCar(@RequestParam(name="id") int id, ModelMap modelMap,HttpSession httpSession) {
		     UserDTO signedInUser = (UserDTO) httpSession.getAttribute("user");
		        carService.deleteCar(signedInUser, id);
		           List<CarDTO> cars = carService.findAllCarsByUser(signedInUser);
		           if (cars != null) {
					modelMap.addAttribute("cars",cars);
					modelMap.addAttribute("message","Car Details Deleted");
				}else {
					modelMap.addAttribute("message","cars not available");
				}
		
		return "my_cars";
	}
	
	@RequestMapping(path = "/updateCar" ,method=RequestMethod.POST)
	public String updateCar(@RequestParam(name="id")int id,@RequestParam(name="name") String name,@RequestParam(name="brand") String brand,@RequestParam(name="price") double price,ModelMap modelMap, HttpSession httpSession) {
		              UserDTO signedInUser =(UserDTO) httpSession.getAttribute("user");
		              carService.updateCar(id, name, brand, price);
		                List<CarDTO> cars = carService.findAllCarsByUser(signedInUser);
		                modelMap.addAttribute("cars",cars);
		                modelMap.addAttribute("message","Car Details Updated");
		                return "my_cars";
	}
	
	@RequestMapping(path="/edit_car" ,method=RequestMethod.POST)
	public String getEditCar(@RequestParam(name="id") int id, ModelMap modelMap) {
		   CarDTO car = carService.findCarById(id);
		   modelMap.addAttribute("car",car);
		   return "edit_car";
	}
	
	@RequestMapping(path="/search",method=RequestMethod.POST)
	public String findAllCarByPrice(@RequestParam(name="low")  double low,@RequestParam(name="high") double high, ModelMap modelMap) {
		  List<CarDTO> cars = carService.findAllCarByPrice(low,high);
		  if (cars != null ) {
			modelMap.addAttribute("cars",cars);
		}else {
			modelMap.addAttribute("message","Cars Not Avalible");
		}
		  return "viewcars";
	}

}
