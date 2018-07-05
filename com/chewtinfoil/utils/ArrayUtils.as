/*
* ArrayUtils by Ryan Matsikas. Feb 10, 2006
*
*
* Copyright (c) 2006 Ryan Matsikas
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/


package com.chewtinfoil.utils {
	
	public class ArrayUtils {
		
		public static function average(p_arr:Array):Object {

			var m:Number = 0;
			var v:Number = 0;
			var d:Number = 0;
			var s:Number = 0;

			var t:Number = p_arr.length;
			var l:Number = t;
			
			while (l--) { s += p_arr[l]; }
			
			m = s / t;
			s = 0;
			l = t;
			
			while (l--) { s += Math.pow(p_arr[l] - m, 2); }
			
			v = s / t;
			d = Math.sqrt(v);
			
			return {mean:m, variance:v, deviation:d};
		}
		
		public static function shuffle(p_arr:Array):Array {
			var arr:Array = p_arr.slice(0); // should we shuffle the source, or dupe it and return a shuffled copy
			var i:uint = arr.length;
			
			while (i) {
				var j:uint = Math.random() * i;
				var d:Object = arr[--i];
				arr[i] = arr[j];
				arr[j] = d;
			}			
    		return arr;
		}
		
		// Compares 2 arrays and returns the distinct values or indicies;
		public static function diff(p_vector:Array, p_comparator:Array, p_useIndex:Boolean = false):Array { 
			var d:Array = new Array();
			
			var a_arr:Array = (p_vector.length > p_comparator.length) ? p_vector.slice(0) : p_comparator.slice(0);
			var b_arr:Array = (p_vector.length > p_comparator.length) ? p_comparator.slice(0) : p_vector.slice(0);
			
			var l:uint = a_arr.length;
			for (var i:uint=0; i<l; i++) {
				if (a_arr[i] !== b_arr[i]) { d.push((p_useIndex) ? i : a_arr[i]); } 
			}		
			
			return d;
		}
		
		public static function sum(p_arr:Array):Number {
			var s:Number = 0;
			var i:uint = p_arr.length;
			while (i) { s += p_arr[--i]; }
			return s;
		 }
		
		public static function rotate(p_arr:Array, p:Number):Array {
			var l:Number = p_arr.length;
	
			if (Math.abs(p) >= l) { p %= l; }
			if (p<0) { p += l; }
			while (p) {
				var i:Number = l;
				while (i>p) {
					var z:Object = p_arr[--i];
					p_arr[i] = p_arr[i-p];
					p_arr[i-p] = z;
				}
				l = p = (Math.ceil(l/p)-1)*p-l+p;
			}
			return p_arr;
		}
		
		public static function chunk(p_arr:Array, p_size:uint = 2):Array {
			// use splice routine, pull chunks instead of item by item..?
			var c:Number = -1;
			var l:Number = p_arr.length;
			var n:Array = new Array();
			
			for (var i:Number=0; i<l; i++) {
				var z:Number = i%p_size;
				if (z) { n[c][z] = p_arr[i]; }
				else { n[++c] = new Array(p_arr[i]); }				
			}
			return n;
		 }
		
		public static function swap(p_arr:Array, p_a:Number, p_b:Number):void {
			var t:Object = p_arr[p_a];
			p_arr[p_a] = p_arr[p_b];
			p_arr[p_b] = t;
		}
		
	}	
}
