package com.lol.hpw.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/cmm/searchUser.do")
	public ModelAndView searchUser(ModelAndView mv, @RequestParam String userName) {
		Map<String,Object> resultMap = cService.searchUser(userName);
		mv.setViewName("/cmm/CMM001");
		mv.addObject("result", resultMap);
		return mv;
	}
	
}
