package com.lilin.movie.dao;

import java.util.List;

import com.lilin.movie.domain.Movie;
import com.lilin.movie.vo.MovieVO;

public interface MovieMapper {

	List<Movie> list(MovieVO vo);

	int delete(String ids);
}
