/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.sun.jmx.snmp.tasks.Task;

import cn.com.crowdsourcedtesting.DAO.GiftDAO;
import cn.com.crowdsourcedtesting.DAO.TaskCommentDAO;
import cn.com.crowdsourcedtesting.DAO.TestTaskDAO;
import cn.com.crowdsourcedtesting.bean.TestTask;
import cn.com.crowdsourcedtesting.bean.Gift;
import cn.com.crowdsourcedtesting.bean.TaskComment;

import cn.com.crowdsourcedtesting.DAO.PublisherDAO;
import cn.com.crowdsourcedtesting.DAO.TestTaskDAO;
import cn.com.crowdsourcedtesting.bean.Administrator;
import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.TestTask;
import cn.com.crowdsourcedtesting.model.TestTaskHandler;
import cn.com.crowdsourcedtesting.modelhelper.MethodNumber;
import cn.com.crowdsourcedtesting.struts.form.CheckRegisterDetailForm;
import cn.com.crowdsourcedtesting.struts.form.CheckRegisterListForm;
import cn.com.crowdsourcedtesting.struts.form.GiftForm;
import cn.com.crowdsourcedtesting.struts.form.ManageTestTaskForm;
import cn.com.crowdsourcedtesting.struts.form.TaskForm;
import cn.com.other.page.Page;
import cn.com.crowdsourcedtesting.struts.form.PageIdForm;
import cn.com.crowdtest.factory.DAOFactory;
import cn.com.other.page.Page;

/**
 * MyEclipse Struts Creation date: 05-01-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/manageTestTask" name="manageTestTaskForm"
 *                input="ManageTestTaskView.jsp" scope="request" validate="true"
 */
public class TestTaskRouter extends DispatchAction {
	/*
	 * Generated Methods
	 */

	TestTaskHandler myHandler = new TestTaskHandler();

	/**
	 * Method addNewComment Web任务审核
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addNewComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	
		TaskForm taskForm = (TaskForm) form;// TODO Auto-generated method stub
		int taskId = taskForm.getTaskId();
		String comment = taskForm.getComment();
		System.out.println("add comment: " + comment);
		myHandler.addNewComment(taskId, comment, request);
		
		return mapping.findForward("allcomment");
	}
	
	
	

	public ActionForward checkWebList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.ListHandle(pageIDForm, request, MethodNumber.MethodOne); // 调用第一个接�

		return mapping.findForward("list");

	}

	/**
	 * Method checkComment
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward checkComment(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaskForm giftForm = (TaskForm) form;
		int task_id = giftForm.getTaskId();
		System.out.println("check comment list...");

		int pagenow = 1;
		List<TaskComment> comments = new ArrayList();
		TestTaskDAO tdao = new TestTaskDAO();
		TestTask task = tdao.findById(task_id);
		TaskCommentDAO dao = new TaskCommentDAO();

		Page page = new Page();
		page.setCurrentPage(pagenow);
		page.setPerRows(20);
		page.setTotalRows(task.getTaskComments().size());

		comments = dao.findByPage(page, task_id);
		if (comments != null && comments.size() > 0) {
			request.setAttribute("comments", comments);
			request.setAttribute("page", page);
			request.setAttribute("isLegal", "legal");
		} else
			request.setAttribute("isLegal", "illegal");

		return mapping.findForward("allcomment");
	
	}

	
	/**
	 * 桌面任务审核列表处理
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkAndroidList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.ListHandle(pageIDForm, request, MethodNumber.MethodTwo); // 调用第二个接�

		return mapping.findForward("list");
	}

	/**
	 * 桌面任务审核列表处理
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkDesktopList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.ListHandle(pageIDForm, request, MethodNumber.MethodThree); // 调用第三个接�

		return mapping.findForward("list");
	}

	/**
	 * Web任务审核细节
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkWebDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.detailHandle(pageIDForm, request, MethodNumber.MethodOne); // 调用第二个接�

		return mapping.findForward("detail");
	}

	/**
	 * 安卓任务审核细节
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkAndroidDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.detailHandle(pageIDForm, request, MethodNumber.MethodTwo); // 调用第二个接�

		return mapping.findForward("detail");
	}

	/**
	 * 桌面任务审核细节
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkDesktopDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		PageIdForm pageIDForm = (PageIdForm) form;

		// 交给事务处理
		myHandler.detailHandle(pageIDForm, request, MethodNumber.MethodThree); // 调用第三个接�

		return mapping.findForward("detail");
	}

	/**
	 * 响应审核操作
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkConfirm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		CheckRegisterDetailForm detailForm = (CheckRegisterDetailForm) form;

		HttpSession session = request.getSession();

		Administrator admin = (Administrator) session // 得到审核者的信息
				.getAttribute("Administrator");

		String taskType = (String) session.getAttribute("taskType");

		if (admin == null) { // 审核者未登录

			return mapping.findForward("adminLogin");

		} else if (form == null) { // 如果传过来的表单为空

			// 如果表单为空，则直接跳转到列�
			Page currentPage = (Page) session.getAttribute("currentPage");
			CheckRegisterListForm p = new CheckRegisterListForm();
			p.setPage(currentPage.getCurrentPage() + "");

			if (taskType != null && taskType.equals("Web")) { // 如果是web，返回web任务列表
				return this.checkWebList(mapping, p, request, response);
			} else if (taskType != null && taskType.equals("Android")) {
				return this.checkAndroidList(mapping, p, request, response); // 如果是安卓，返回安卓列表
			} else {
				return this.checkDesktopList(mapping, p, request, response); // 如果是桌面，返回桌面列表
			}

		} else {

			String subType = detailForm.getSubType(); // 通过或者不通过类型

			int id = Integer.parseInt(detailForm.getId()); // 得到要处理的问卷
			TestTaskDAO qd = DAOFactory.getTestTaskDAO();
			TestTask q = qd.findById(id);
			q.setAdministrator(admin);

			if ("yes".equals(subType)) { // 审核通过

				q.setIsPassed(true);

			} else // 审核不通过
			{

				q.setIsPassed(false);

			}
			qd.save(q); // 修改数据�

			Page currentPage = (Page) session.getAttribute("currentPage");
			PageIdForm p = new PageIdForm();

			if (currentPage != null) {
				p.setPage(currentPage.getCurrentPage() + "");
			} else {
				p.setPage("1");
			}

			if (taskType != null && taskType.equals("Web")) { // 如果是web，返回web任务列表
				return this.checkWebList(mapping, p, request, response);
			} else if (taskType != null && taskType.equals("Android")) {
				return this.checkAndroidList(mapping, p, request, response); // 如果是安卓，返回安卓列表
			} else {
				return this.checkDesktopList(mapping, p, request, response); // 如果是桌面，返回桌面列表
			}
		}

	}

}