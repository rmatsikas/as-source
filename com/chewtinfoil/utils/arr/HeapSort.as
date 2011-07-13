/**
* HeapSort by Ryan Matsikas. Feb 10, 2006
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
**/

package com.chewtinfoil.utils.arr {
	
	public class HeapSort {		
		
		public static function sort(p_arr:Array):void {
			
			var l:Number = p_arr.length;

			for (var i:Number=l-1; i>=0; i--) { 
				reheap (p_arr, l, i);
			}

			for (var i:Number=l-1; i>0; i--) {
			  var d:* = p_arr[i];
			  p_arr[i] = p_arr[0];
			  p_arr[0] = d;
			  reheap (p_arr, i, 0);
			}	
		}
		
		private static function reheap(p_arr:Array, p_length:uint, p_index:uint):void {
			
			var done:Boolean = false;
			var d:* = p_arr[p_index];
			var p:uint = p_index;
			var c:Number = 2*(p_index+1)-1;

			while (c < p_length && !done) {		
			  if ((c < p_length - 1) && (p_arr[c] < p_arr[c + 1])) { c++; }
			
			  if (d >= p_arr[c]) { done = true;}
			  else {
				p_arr[p] = p_arr[c];
				p = c;
				c = 2*(p+1)-1;
			  }
			}
			p_arr[p] = d;
		}
		
	}
}