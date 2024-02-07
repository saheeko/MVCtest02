<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.bit.model.*" %>
<%
	//파라메터수집(vo0)
	request.setCharacterEncoding("utf-8");	
	//1.파라메터수집(vo) 개별로 넘어온 데이터를 받는 곳
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
	//파라메터 수집을 하기위해 VO로 작성 된것을 객체 생성하여 묶는곳 / 이곳이 파라미터 수집한곳
	//MemberVO vo=new MemberVO(id, pass, name, age, email, phone);
	//이방법은 set으로 파라메터 수집을 하는 방법(기본방법)
		 MemberVO vo=new MemberVO(); 
		 vo.setId(id); 
		 vo.setPass(pass); 
		 vo.setName(name);
		 vo.setAge(age); 
		 vo.setEmail(email); 
		 vo.setPhone(phone);
		 
		 MemberDAO dao=new MemberDAO();
		 int cnt=dao.memberInsert(vo);
		 if(cnt>0) {
			 //가입성공
			 response.sendRedirect("memberList.jsp"); //가입성공하면  RESPONSE응답을  하고 보낸다다시 (sendRedirect)
		 }else {
			 //가입실패 - 예외 객체를 생성 후 WAS=TOMCAT에 던짐
			 throw new ServletException("not insert");
		 }
%>