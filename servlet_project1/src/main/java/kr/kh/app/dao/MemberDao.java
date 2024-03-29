package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVo;

public interface MemberDao {

	boolean insertMember(@Param("member") MemberVo memberVo);

	MemberVo selectMember(@Param("me_id") String id);

}
