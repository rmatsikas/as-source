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