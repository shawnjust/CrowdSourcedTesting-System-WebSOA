/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 05-15-2014
 * 
 * XDoclet definition:
 * @struts.form name="checkQuestionnaireDetailForm"
 */
public class CheckQuestionnaireDetailForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** id property */
	private String id;

	/** subType property */
	private String subType;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	@Override
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the id.
	 * @return String
	 */
	public String getId() {
		return id;
	}

	/** 
	 * Set the id.
	 * @param id The id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/** 
	 * Returns the subType.
	 * @return String
	 */
	public String getSubType() {
		return subType;
	}

	/** 
	 * Set the subType.
	 * @param subType The subType to set
	 */
	public void setSubType(String subType) {
		this.subType = subType;
	}
}