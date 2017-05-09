package org.yakindu.base.generator.templates

import org.yakindu.base.generator.ClassGen
import org.yakindu.base.generator.CodeElement

/**
 * Example implementation of a class template.
 * Looks like Java, but is not guaranteed to be complete or correct.
 */
class ClassTemplate {
	
	def generate(ClassGen it) {'''
		«generateVisibility»class «className» «generateExtends»«generateImplements»{
			«generateContent»
		}
	'''
	}
	
	def generateContent(ClassGen it) {
		'''
		«FOR cm:classMembers»
		«cm.generate()»
		«ENDFOR»
		'''
	}
	
	def generateImplements(ClassGen it) {
		var ret = ""
		if(!interfaces.nullOrEmpty) {
			ret = "implements "
			var first = true
			for(i : interfaces) {
				if(first) {
					first = false
					ret += i.className
				} else {
					ret += ", " + i.className
				}
			}
			ret += " "
		}
	}
	
	def generateVisibility(ClassGen it) {
		if(!visibility.nullOrEmpty) {
			return visibility + " "
		}
		""
	}
	
	def generateExtends(ClassGen it) {
		if(superClass == null) {
			""
		} else {
			'''extends «superClass.className» '''
		}
	}
}