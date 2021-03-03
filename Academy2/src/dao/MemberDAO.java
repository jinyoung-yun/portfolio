package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;
import static db.JdbcUtil.*;

public class MemberDAO {
	static MemberDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private MemberDAO() {
	};

	public static MemberDAO getInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int nextUserNum() {
		String sql = "select max(usernum) from members";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int result = rs.getInt(1) + 1;

				return result;
			} else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -1; // db 오류

	}

	public int memberJoin(MemberDTO member) {
		String sql = "INSERT INTO MEMBERS VALUES(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member.getUserNum());
			pstmt.setString(2, member.getUserId());
			pstmt.setString(3, member.getUserPw());
			pstmt.setString(4, member.getUserName());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, member.getUserGender());
			pstmt.setString(7, member.getUserAddr());
			pstmt.setString(8, member.getUserEmail());
			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int memberLogin(String userId, String userPw) {
		String sql = "select userPw from members where userId=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPw)) {
					return 1; // 로그인성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1;// 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -2;

	}


	public MemberDTO memberView(String userId) {
		String sql = "select * from members where userId=?";
		MemberDTO memberInfo = new MemberDTO();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberInfo.setUserNum(rs.getInt(1));
				memberInfo.setUserId(rs.getString(2));
				memberInfo.setUserPw(rs.getString(3));
				memberInfo.setUserName(rs.getString(4));
				memberInfo.setUserPhone(rs.getString(5));
				memberInfo.setUserGender(rs.getString(6));
				memberInfo.setUserAddr(rs.getString(7));
				memberInfo.setUserEmail(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return memberInfo;
	}

	public int memberDelete(String delId) {
		String sql = "Delete from memberTEST where userId=?";
		int deleteResult = 0;
		try {
			System.out.println("4.delete dao");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delId);
			deleteResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return deleteResult;
	} 

	
	
	public int memberModify(MemberDTO memberModify) {
		String sql = "update members set userPw=?, userPhone=?, userAddr=?, userEmail=? where userid=?";
		int modifyResult = 0;
		System.out.println("dao modify name: " + memberModify.getUserName());
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberModify.getUserPw());
			pstmt.setString(2, memberModify.getUserPhone());
			pstmt.setString(3, memberModify.getUserAddr());
			pstmt.setString(4, memberModify.getUserEmail());
			pstmt.setString(5, memberModify.getUserId());
			modifyResult = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return modifyResult;
	}

	public int idCheck(String userId) {
		String sql = "select * from members where userId=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next() || userId.equals("")) {
				return 0;
			}else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}
	
	

}
