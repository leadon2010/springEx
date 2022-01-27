<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>

<script>
	$(document).ready(function() {
		var operForm = $('#operForm');
		$('button').on('click', function() {
			var bno = $('input[name="bno"]').val();
			location.href = 'modify?bno='+bno;
		})
	});
</script>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Read</h1>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Read Page</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="">Bno</label>
                    <input type="text" class="form-control" name='bno' value='<c:out value="${board.bno }"/>'
                        readonly='readonly'>
                </div>
                <div class="form-group">
                    <label for="">Title</label>
                    <input type="text" class="form-control" name='title' value='<c:out value="${board.title }"/>'
                        readonly='readonly'>
                </div>
                <div class="form-group">
                    <label for="">Text area</label>
                    <textarea class='form-group' name="content"
                        readonly='readonly'><c:out value="${board.content}" /></textarea>
                </div>
                <div class="form-group">
                    <label for="">Writer</label>
                    <input type="text" class="form-group" name='writer' value='<c:out value="${board.writer }" />'
                        readonly='readonly'>
                </div>
                <button data-oper='modify' class='btn btn-default'>Modify</button>
                <button class="btn btn-info" data-oper='list' onclick='location.href="list"'>List</button>
                
                <form id='openForm' action='modify' method='get'>
                	<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }" />'>
                </form>
                
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>