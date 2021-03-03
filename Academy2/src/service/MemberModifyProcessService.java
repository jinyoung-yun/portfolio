package service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import dto.MemberDTO;
public class MemberModifyProcessService {

	public int memberModify(MemberDTO MemberModify) {
		MemberDAO dao = MemberDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.memberModify(MemberModify);
		
		if(result > 0) {
			System.out.println("MemberModifyProcessService Result = "+result);
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
