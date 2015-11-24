package com.hb.model;

import java.util.ArrayList;
import java.util.List;

import com.hb.vo.MemberVO;
import com.hb.vo.ZipVO;

public interface MemberMapper {
	public int loginMember(MemberVO vo);
	public int isExistId(String id);
	public List<ZipVO> getlistZip(String dong);
}
