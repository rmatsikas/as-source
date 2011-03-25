package com.chewtinfoil.utils {
	
	public class RegexUtils {
		
		public static const MULTILINE_COMMENT:RegExp = /\/\*[\s\S]*?\*\//gm;
		public static const SINGLELINE_COMMENT:RegExp = /\/\/.*$/gm;
		public static const DOUBLE_QUOTED_STRING:RegExp = /"(?:\.|(\\\")|[^\""\n])*"/g;
		public static const SINGLE_QUOTED_STRING:RegExp = /'(?:\.|(\\\')|[^\''\n])*'/g;
		public static const URL:RegExp = /\w+:\/\/[\w-.\/?%&=]*/g;
		public static const CDATA_TAGS:RegExp = /(\&lt;|<)\!\[[\w\s]*?\[(.|\s)*?\]\](\&gt;|>)/gm;
		public static const HTML_COMMENT:RegExp = /(\&lt;|<)!--\s*.*?\s*--(\&gt;|>)/gm;
		public static const TAG:RegExp = /<(?:\/)?([A-Za-z0-9_:-]+)(?:\/)?>/g;
		
	}

}