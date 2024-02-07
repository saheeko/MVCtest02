<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.bit.model.*" %>
<%
request.setCharacterEncoding("utf-8");
//파라메터 수집(vo)
int num=Integer.parseInt(request.getParameter("num"));
int age=Integer.parseInt(request.getParameter("age"));
String email=request.getParameter("email");
String phone=request.getParameter("phone");

MemberVO  vo=new MemberVO();
vo.setNum(num);
vo.setAge(age);
vo.setEmail(email);
vo.setPhone(phone);

MemberDAO dao=new MemberDAO();
int cnt=dao.memberUpdate(vo);
 if(cnt>0) {
	 //수정성공
	 response.sendRedirect("memberList.jsp"); //가입성공하면  RESPONSE응답을  하고 보낸다다시 (sendRedirect)
 }else {
	 //가입실패 - 예외 객체를 생성 후 WAS=TOMCAT에 던짐
	 throw new ServletException("not update");
 }
%>