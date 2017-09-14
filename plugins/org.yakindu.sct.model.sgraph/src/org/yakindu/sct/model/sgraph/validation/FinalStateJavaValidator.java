/**
 * Copyright (c) 2012-2017 committers of YAKINDU and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     committers of YAKINDU - initial API and implementation
 */
package org.yakindu.sct.model.sgraph.validation;

import org.eclipse.xtext.validation.Check;
import org.eclipse.xtext.validation.CheckType;
import org.yakindu.sct.model.sgraph.FinalState;

public class FinalStateJavaValidator extends AbstractSGraphJavaValidator{

	public static final String ISSUE_FINAL_STATE_OUTGOING_TRANSITION = "A final state should have no outgoing transition.";

	@Check(CheckType.FAST)
	public void finalStateWithOutgoingTransition(FinalState finalState) {
		if ((finalState.getOutgoingTransitions().size() > 0)) {
			warning(ISSUE_FINAL_STATE_OUTGOING_TRANSITION, finalState, null, -1);
		}
	}
}