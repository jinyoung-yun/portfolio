package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberLoginService {

	
	public int memberLogin(String userId, String userPw) {
		MemberDAO dao = MemberDAO.getInstance();
		
		Connection con = getConnection();
		
		dao.setConnection(con);
		
		int loginId = dao.memberLogin(userId,userPw);
		System.out.println("svcResult = " + loginId);
		close(con);
		
		return loginId;
	
}

}