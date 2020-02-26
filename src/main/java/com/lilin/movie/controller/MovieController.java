package com.lilin.movie.controller;

import java.util.List;








import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lilin.movie.domain.Movie;
import com.lilin.movie.service.MovieService;
import com.lilin.movie.vo.MovieVO;

@Controller
public class MovieController {
//第一额
	@Resource
	private MovieService mService;
	
	@RequestMapping("list")
	public String list(MovieVO vo,Model m){
		if(vo.getPageNum()==null||"".equals(vo.getPageNum())){
			vo.setPageNum(1);
		}
		PageHelper.startPage(vo.getPageNum(), 3);
		List<Movie> list=mService.list(vo);
		PageInfo<Movie> page=new PageInfo<Movie>(list);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "list";
	}
	@ResponseBody
    @RequestMapping("delete")
	public Object delete(String ids){
		boolean flag=mService.delete(ids);
		return flag;
	}
}
