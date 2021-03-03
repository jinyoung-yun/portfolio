package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberLoginService;

@WebServlet("/memberLogin")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	request.setCharacterEncoding("utf8"); 
    	response.setCharacterEncoding("utf8");

    	String userId = request.getParameter("userId");
    	String userPw = request.getParameter("userPw");
    	
    	MemberLoginService memloginsvc = new MemberLoginService();
    	
    	int loginResult = memloginsvc.memberLogin(userId, userPw);
    	System.out.println("controllerResult: " +loginResult);
    	HttpSession session = request.getSession();
    	session.setAttribute("loginResult", loginResult);
    	if(loginResult == 1) {
        	session.setAttribute("userId", userId);
        	System.out.println("loginResult : "+loginResult +"\n"+"userIdSession : "+ userId);
    		System.out.println("로그인 성공");
    		response.sendRedirect("index.jsp");
    	}else if(loginResult == 0) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('비밀번호가 틀립니다.')");
    		script.println("history.back()");
    		script.println("</script>");
    		
    	}else if(loginResult == -1) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('아이디가 존재하지 않습니다.')");
    		script.println("history.back()");
    		script.println("</script>");
    	}else if(loginResult == -2) {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('DB접속 오류 혹은 올바른 경로가 아닙니다.')");
    		script.println("history.back()");
    		script.println("</script>");
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
