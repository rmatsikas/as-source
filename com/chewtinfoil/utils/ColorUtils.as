/*
* ColorUtils by Ryan Matsikas. Feb 10, 2006
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
	import mx.utils.ObjectUtil;
	

	public class ColorUtils {
		
		public static function average(a:Number, b:Number):Number {
			return ( (((a ^ b) & 0xFFFEFEFE) >> 1) + (a & b) );
		}

		public static function invert(p_color:Number):Number {
			return ((0xFF-(p_color >> 16) & 0xFF) << 16) | ((0xFF-(p_color >> 8) & 0xFF) << 8) | 0xFF-(p_color & 0xFF);
		}
		
		public static function mix(p_color:Number, p_alpha:Number=0.5, ...colors):Number {
			var mR:Number = (p_color >> 16)  & 0xFF;		    
			var mG:Number = (p_color >> 8)  & 0xFF;		
			var mB:Number = p_color & 0xFF;
			
			for each (var clr:Number in colors) {
				var r:Number = (clr >> 16)  & 0xFF;		    
				var g:Number = (clr >> 8)  & 0xFF;		
				var b:Number = clr & 0xFF;
				
				mR = Math.round( (mR * p_alpha) + (r * (1.0 - p_alpha)) );
				mG = Math.round( (mG * p_alpha) + (g * (1.0 - p_alpha)) );
				mB = Math.round( (mB * p_alpha) + (b * (1.0 - p_alpha)) );
			}
			
			return (mR << 16) | (mG << 8) | mB;			
		}
		
		public static function lighten(p_color:Number, p_alpha:Number=0.5):Number {
			return mix(p_color, p_alpha, 0xFFF);
		}
		
		public static function darken(p_color:Number, p_alpha:Number=0.5):Number {
			return mix(p_color, p_alpha, 0x000);
		}
		
		public static function contrast(p_color:Number, p_cut:Number=0.5):Number {
			var r:Number = (p_color >> 16)  & 0xFF;		    
			var g:Number = (p_color >> 8)  & 0xFF;		
			var b:Number = p_color & 0xFF;			
			
			r = (r > p_cut * 0xFF) ? 0 : r;
			g = (g > p_cut * 0xFF) ? 0 : g;
			b = (b > p_cut * 0xFF) ? 0 : b;
			
			return (r << 16) | (g << 8) | b;	
		}
		
		public static function blend(p_foreground:Number, p_background:Number=NaN, p_alpha:Number=0.5):Number {
			return mix(p_foreground, p_alpha, !isNaN(p_background) ? p_background : invert(p_foreground))
		}
		
		public static function createGradient(startColor:uint, endColor:uint, steps:int=10):Array {

			var startRed:uint=startColor>>16&0xFF;
			var startGreen:uint=startColor>>8&0xFF;
			var startBlue:uint=startColor&0xFF;

			var endRed:uint=endColor>>16&0xFF;
			var endGreen:uint=endColor>>8&0xFF;
			var endBlue:uint=endColor&0xFF;

			var colors:Array = [];
			for (var i:Number = 0; i<=steps; i++) {
				var ratio:Number = i / steps;
				var red:uint = (startRed) + ratio*(endRed - startRed) | 0;
				var green:uint= (startGreen) + ratio*(endGreen - startGreen) | 0;
				var blue:uint= (startBlue) + ratio*(endBlue - startBlue) | 0;
				var resultColor:uint = red<<16 | green<<8 | blue;
				colors[i] = resultColor;
			}

			return colors;
		}
		
		public static function HEX2RGB(p_hex:String):Object {
			var hex:String = fromHex(p_hex);
			
			var r:Number = parseInt( hex.substr(0,2), 16 ) / 255;
			var g:Number = parseInt( hex.substr(2,2), 16 ) / 255;
			var b:Number = parseInt( hex.substr(4,2), 16 ) / 255;
			
			return {r:r, g:g, b:b};
		}
		
		public static function HEX2HSB(p_hex:String):Object {
			var rgb:Object = HEX2RGB(p_hex);
			trace('hex2hsb',ObjectUtil.toString(rgb))
			return RGB2HSB(rgb.r, rgb.g, rgb.b);
		}
		
		private static function fromHex(p_value:String):String {
			if (p_value.indexOf("#") == 0) { p_value = p_value.substr(1); }
			if (p_value.indexOf('0x') == 0) { p_value = p_value.substr(2); }
			
			while (p_value.length < 6) { p_value = "0"+p_value; }
			
			if (p_value.length > 6) { p_value = p_value.substr(0,6); }
			
			return p_value;
		}
		
		public static function toHex(p_num:Number):String {
			p_num = Math.round(Math.max(Math.min(p_num||0, 255), 0));

			var charMask:String = "0123456789ABCDEF";
			var bitTwo:Number = p_num%16;
			var bitOne:Number = (p_num-(bitTwo))/16;

			var hex:String = (charMask.charAt(bitOne) + charMask.charAt(bitTwo)).toString();
			while (hex.length < 6) { hex = '0'+hex; }

			return '#'+hex;
		}
		
		public static function INT2RGB(p_int:Number):Object {
			
			var r:Number = p_int >> 16 & 0xFF;
			var g:Number = p_int >> 8 & 0xFF;
			var b:Number = p_int & 0xFF;

			return {r:r, g:g, b:b};
		}
		
		public static function RGB2INT(p_r:Number, p_g:Number, p_b:Number):Number {
			return Math.round((p_r*255)<< 16) | Math.round((p_g*255)<< 8) | Math.round(p_b*255);
		}
		
		public static function RGB2HSB(p_r:Number, p_g:Number, p_b:Number):Object {
			// max is the Value
			var v:Number =  Math.max(p_r, p_g, p_b);
			
			var delta:Number = v-Math.min(p_r, p_g, p_b);
			
			// Calculate Saturation
			var s:Number = (v==0) ? 0 : delta/v;
			// Calculate Hue
			delta = (s==0) ? 0.00001 : delta;
			var h:Number = (((p_r == v) ? (p_g - p_b) / delta : (p_g == v) ? 2 + (p_b - p_r) / delta : 4 + (p_r - p_g) / delta ) + 6) % 6;
			h /= 6;
			
			return {h:h,s:s,b:v};
        }
        
        public static function HSB2RGB(p_h:Number, p_s:Number, p_b:Number):Object { 
        	
            var r:Number = 0;
            var g:Number = 0;
            var b:Number = 0;
            
            if (p_s == 0) {
                r = p_b;
                g = r;
                b = r;
            } else {
                var h:Number = (p_h - Math.floor(p_h)) * 6.0;
                var f:Number =  h - Math.floor(h);
            
                var p:Number = p_b * (1.0 - p_s);
                var q:Number = p_b * (1.0 - p_s * f);
                var t:Number = p_b * (1.0 - (p_s * (1.0 - f)));
            
                switch(Math.floor(h)) {
                    case 0:
                        r = p_b;
                        g = t;
                        b = p;
                        break;
                    case 1:
                        r = q;
                        g = p_b;
                        b = p;
                        break;
                    case 2:
                        r = p;
                        g = p_b;
                        b = t;
                        break;
                    case 3:
                        r = p;
                        g = q;
                        b = p_b;
                        break;
                    case 4:
                        r = t;
                        g = p;
                        b = p_b;
                        break;
                    case 5:
                        r = p_b;
                        g = p;
                        b = q;
                        break;
                }
            }
            
            return {r:r, g:g, b:b};
        }
		
	}

}