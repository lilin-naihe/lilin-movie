package com.lilin.movie.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lilin.movie.dao.MovieMapper;
import com.lilin.movie.domain.Movie;
import com.lilin.movie.service.MovieService;
import com.lilin.movie.vo.MovieVO;
@Service
public class MovieServiceImpl implements MovieService{

	@Resource
	private MovieMapper mapper;
	@Override
	public List<Movie> list(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.list(vo);
	}
	@Override
	public boolean delete(String ids) {
		int i=mapper.delete(ids);
		return i>0;
	}

	

}
