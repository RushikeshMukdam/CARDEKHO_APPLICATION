package com.jspiders.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jspiders.springmvc.dao.UserDAO;
import com.jspiders.springmvc.dto.CarDTO;
import com.jspiders.springmvc.dto.UserDTO;

@Component
public class UserService {
	
	@Autowired
	private UserDAO userDAO;

	public void addUser(String email, String password) {
		UserDTO userDTO = new UserDTO();
		userDTO.setEmail(email);
		userDTO.setPassword(password);
		
		userDAO.addUser(userDTO);
		
	}
	
	public UserDTO checkUser(String email,String password) {
		
			  List<UserDTO> users = userDAO.findAllUser();
			  UserDTO signedInUser = null;
			  for(UserDTO user : users) {
				  if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
					signedInUser = user;
				}
			  }
		
		return signedInUser;
		
	}

	public void updateUser(UserDTO signedInUser,CarDTO addedCars) {
		userDAO.updateUser(signedInUser.getId(),addedCars.getId());
	}
	
	public void deleteUser(UserDTO signedInUser) {
		userDAO.deleteUser(signedInUser.getId());
	}
}
