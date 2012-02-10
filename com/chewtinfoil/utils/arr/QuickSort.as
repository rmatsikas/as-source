﻿/*** QuickSort by Ryan Matsikas. Feb 10, 2006*** Copyright (c) 2006 Ryan Matsikas* * Permission is hereby granted, free of charge, to any person* obtaining a copy of this software and associated documentation* files (the "Software"), to deal in the Software without* restriction, including without limitation the rights to use,* copy, modify, merge, publish, distribute, sublicense, and/or sell* copies of the Software, and to permit persons to whom the* Software is furnished to do so, subject to the following* conditions:* * The above copyright notice and this permission notice shall be* included in all copies or substantial portions of the Software.* * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR* OTHER DEALINGS IN THE SOFTWARE.**/package com.chewtinfoil.utils.arr {		import com.chewtinfoil.utils.ArrayUtils;	public class QuickSort {				public static function sort(p_arr:Array, ...args):void {			var low:uint = (args[0] == undefined) ? 0 : args[0];			var high:uint = (args[1] == undefined) ? p_arr.length : args[1];			if(high > low) {				var h:Number = high;				var l:Number = low;				var p:Number = p_arr[Math.round((low+high)/2)];  // RM: just a guess				while(h > l) {					while(p_arr[l] < p) { l++; }			        while(p_arr[h] > p) { h--; }					if(l > h) { break; }					ArrayUtils.swap(p_arr, l, h);			        l++;					h--;				}			    sort(p_arr, low, h);			    sort(p_arr, l,  high);			}		}			}	}