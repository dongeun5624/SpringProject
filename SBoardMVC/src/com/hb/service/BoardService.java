package com.hb.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hb.model.BoardMapper;
import com.hb.vo.BoardVO;
import com.hb.vo.NaviVO;

@Service
public class BoardService {
	@Autowired
	SqlSessionTemplate template;
	
	public List<BoardVO> getBoardList(NaviVO nvo){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getBoardList(nvo);
	}
	
	public int getTotalRecode(){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getTotalRecode();
	}
	
	public BoardVO getBoardDetail(BoardVO board){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.getBoardDetail(board);
	}
	@Transactional
	public void deleteBoard(BoardVO board){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		mapper.deleteBoard(board);
	}
	public int insertBoard(BoardVO board){
		BoardMapper mapper = 
				template.getMapper(BoardMapper.class);
		return mapper.insertBoard(board);
	}
}









