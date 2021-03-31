package com.lol.hpw.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lol.hpw.service.CmmService;

@Controller 
public class CmmController {
	
	@Autowired
	CmmService cService;

	@RequestMapping("/")
	public String goHome() { 
		return "home";
	}
	
	@RequestMapping("/cmm/goSearchUser.do") 
	public ModelAndView goSearchUser(ModelAndView mv, @RequestParam String userName) {
		mv.setViewName("/cmm/CMM001");
		mv.addObject("userName", userName);
		return mv;
	} 
	
	@RequestMapping("/cmm/searchUser.do")
	@ResponseBody
	public Map<String,Object> searchUser(ModelAndView mv, @RequestParam String userName) {
		Map<String,Object> resultMap = cService.searchUser(userName);
		return resultMap;
	}
	
}
