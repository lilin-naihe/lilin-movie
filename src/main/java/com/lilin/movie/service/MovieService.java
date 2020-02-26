package com.lilin.movie.service;

import java.util.List;

import com.lilin.movie.domain.Movie;
import com.lilin.movie.vo.MovieVO;

public interface MovieService {

	List<Movie> list(MovieVO vo);

	boolean delete(String ids);
}
