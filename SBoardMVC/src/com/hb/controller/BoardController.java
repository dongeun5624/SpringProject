package com.hb.controller;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hb.service.BoardService;
import com.hb.vo.BoardVO;
import com.hb.vo.NaviVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardSvc;
	

	@RequestMapping("/BoardList")
	   public String BoardList(Model m,@RequestParam(value="nowPage",defaultValue="0") int nowPage
	         ){
	      int totalRecode=boardSvc.getTotalRecode();
	      if(nowPage==0){
	         nowPage=1;
	      }
	      String url = "/SBoardMVC/board/BoardList";
	      String pagingHtml = "?nowPage=";
	      NaviVO navi =new NaviVO(totalRecode, nowPage, 20,
	            10, url, pagingHtml);
	      List<BoardVO> list = boardSvc.getBoardList(navi);
	      m.addAttribute("list",list);
			m.addAttribute("navi",navi);
	      return "/board/BoardList";
	   }
	@RequestMapping("/newContent")
	public void setNewContent(Model model){
		BoardVO vo = new BoardVO();
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/insertContent")
	public void insertContent(@RequestParam("content") String text,
			HttpServletRequest request){
		
		MultipartHttpServletRequest mhlr = 
				(MultipartHttpServletRequest)request;
		Iterator<String> it = mhlr.getFileNames();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		Enumeration<String> en = mhlr.getParameterNames();
		if(en.hasMoreElements()){
			System.out.println(en.nextElement());
		}
		
	}
	
	@RequestMapping("/boardDetail")
	public ModelAndView getBoardDetail(
			@RequestParam("no") int no){
		ModelAndView model = new ModelAndView("/board/boardDetail");
		BoardVO board = new BoardVO();
		board.setNo(no);
		board = boardSvc.getBoardDetail(board);
		model.addObject("vo", board);
		return model;
	}
	@RequestMapping("/deleteBoard")
	public String deleteBoard(@RequestParam("no") int no){
		BoardVO board = new BoardVO();
		board.setNo(no);
		boardSvc.deleteBoard(board);
		return "redirect:/board/BoardList";
	}
	@RequestMapping(value="/insertBoard",method=RequestMethod.GET)
	public String insertBoard(Model model){
		BoardVO vo=new BoardVO();
		model.addAttribute(vo);
		return "/board/insertBoard";
	}
	@RequestMapping(value="/insertBoard",method=RequestMethod.POST)
	public String insertBoard2(Model model,@ModelAttribute("bvo")BoardVO bvo){
		if(bvo==null){
			return "/board/BoardList";   //리스트이동 
		}
		System.out.println(bvo.toString());
		int result=boardSvc.insertBoard(bvo);
		
		if(result>0){
			return this.BoardList(model, 1);
		}
		//실패
		return "/board/insertBoard";
	}
}









