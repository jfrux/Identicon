<cfcomponent displayname="identicon">
	<cfset $spriteZ = 0 />
	
	<cffunction name="init" access="public" output="no">
	
	</cffunction>
	
	<cffunction name="getsprite" output="no">
		<cfargument name="shape" type="string" required="yes" />
		<cfargument name="R" type="string" required="yes" />
		<cfargument name="G" type="string" required="yes" />
		<cfargument name="B" type="string" required="yes" />
		<cfargument name="rotation" type="string" required="yes" />
		
		<cfset var $shape = arguments.shape />
		<cfset var $R = arguments.R />
		<cfset var $G = arguments.G />
		<cfset var $B = arguments.B />
		<cfset var $rotation = arguments.rotation />
		<cfset var $sprite = ImageNew("",$spriteZ,$spriteZ,"argb") />
		<cfscript>
		ImageSetAntialiasing($sprite,"on");
		
		/*$fg=imagecolorallocate($sprite,$R,$G,$B);
		$bg=imagecolorallocate($sprite,255,255,255);
		imagefilledrectangle($sprite,0,0,$spriteZ,$spriteZ);*/
		ImageSetDrawingColor($sprite,$R & "," & $G & "," & $B);
		
		switch($shape) {
			case 1: // triangle
				$shape=[
					0.5,1,
					1,0,
					1,1
				];
				break;
			case 2: // parallelogram
				$shape=[
					0.5,0,
					1,0,
					0.5,1,
					0,1
				];
				break;
			case 3: // mouse ears
				$shape=[
					0.5,0,
					1,0,
					1,1,
					0.5,1,
					1,0.5
				];
				break;
			case 4: // ribbon
				$shape=[
					0,0.5,
					0.5,0,
					1,0.5,
					0.5,1,
					0.5,0.5
				];
				break;
			case 5: // sails
				$shape=[
					0,0.5,
					1,0,
					1,1,
					0,1,
					1,0.5
				];
				break;
			case 6: // fins
				$shape=[
					1,0,
					1,1,
					0.5,1,
					1,0.5,
					0.5,0.5
				];
				break;
			case 7: // beak
				$shape=[
					0,0,
					1,0,
					1,0.5,
					0,0,
					0.5,1,
					0,1
				];
				break;
			case 8: // chevron
				$shape=[
					0,0,
					0.5,0,
					1,0.5,
					0.5,1,
					0,1,
					0.5,0.5
				];
				break;
			case 9: // fish
				$shape=[
					0.5,0,
					0.5,0.5,
					1,0.5,
					1,1,
					0.5,1,
					0.5,0.5,
					0,0.5
				];
				break;
			case 10: // kite
				$shape=[
					0,0,
					1,0,
					0.5,0.5,
					1,0.5,
					0.5,1,
					0.5,0.5,
					0,1
				];
				break;
			case 11: // trough
				$shape=[
					0,0.5,
					0.5,1,
					1,0.5,
					0.5,0,
					1,0,
					1,1,
					0,1
				];
				break;
			case 12: // rays
				$shape=[
					0.5,0,
					1,0,
					1,1,
					0.5,1,
					1,0.75,
					0.5,0.5,
					1,0.25
				];
				break;
			case 13: // double rhombus
				$shape=[
					0,0.5,
					0.5,0,
					0.5,0.5,
					1,0,
					1,0.5,
					0.5,1,
					0.5,0.5,
					0,1
				];
				break;
			case 14: // crown
				$shape=[
					0,0,
					1,0,
					1,1,
					0,1,
					1,0.5,
					0.5,0.25,
					0.5,0.75,
					0,0.5,
					0.5,0.25
				];
				break;
			case 15: // radioactive
				$shape=[
					0,0.5,
					0.5,0.5,
					0.5,0,
					1,0,
					0.5,0.5,
					1,0.5,
					0.5,1,
					0.5,0.5,
					0,1
				];
				break;
			default: // tiles
				$shape=[
					0,0,
					1,0,
					0.5,0.5,
					0.5,0,
					0,0.5,
					1,0.5,
					0.5,1,
					0.5,0.5,
					0,1
				];
				break;
		}
		Xcoords = ArrayNew(1);
		Ycoords = ArrayNew(1);
		xpos = 0;
		ypos = 0;
		
		for ($i=1; $i <= arrayLen($shape); $i++) {
			if ($i mod 2 eq 1) {
				xpos = xpos+1;
				ArrayAppend(Xcoords,$shape[$i]*$spriteZ);
			} else {
				ypos = ypos+1;
				ArrayAppend(Ycoords,$shape[$i]*$spriteZ);
			}
		}
		
			
		ImageDrawLines($sprite,Xcoords,Ycoords,"yes","yes");
		/* apply ratios 
		for ($i=0;$i<count($shape);$i++)
			$shape[$i]=$shape[$i]*$spriteZ;
			imagefilledpolygon($sprite,$shape,count($shape)/2,$fg);
			/* rotate the sprite 
			for ($i=0;$i<$rotation;$i++)
				$sprite=imagerotate($sprite,90,$bg);
				*/
		</cfscript>
		<cfreturn $sprite />
	</cffunction>
	
	<cffunction name="getcenter" output="no">
		<cfargument name="shape" type="string" required="yes" />
		<cfargument name="fR" type="string" required="yes" />
		<cfargument name="fG" type="string" required="yes" />
		<cfargument name="fB" type="string" required="yes" />
		<cfargument name="bR" type="string" required="yes" />
		<cfargument name="bG" type="string" required="yes" />
		<cfargument name="bB" type="string" required="yes" />
		<cfargument name="usebg" type="string" required="yes" />
		
		<cfset var $shape = arguments.shape />
		<cfset var $fR = arguments.fR />
		<cfset var $fG = arguments.fG />
		<cfset var $fB = arguments.fB />
		<cfset var $bR = arguments.bR />
		<cfset var $bG = arguments.bG />
		<cfset var $bB = arguments.bB />
		<cfset var $usebg = arguments.usebg />
		<cfset var $sprite = ImageNew("",$spriteZ,$spriteZ,"argb") />
		<cfscript>
			ImageSetAntialiasing($sprite,"on");
			
			/*$fg=imagecolorallocate($sprite,$R,$G,$B);
			$bg=imagecolorallocate($sprite,255,255,255);
			imagefilledrectangle($sprite,0,0,$spriteZ,$spriteZ);*/
			ImageSetDrawingColor($sprite,$fR & "," & $fG & "," & $fB);
			
			/*$fg=imagecolorallocate($sprite,$fR,$fG,$fB);*/
			/* make sure there's enough contrast before we use background color of side sprite
			if ($usebg>0 && (abs($fR-$bR)>127 || abs($fG-$bG)>127 || abs($fB-$bB)>127))
				$bg=imagecolorallocate($sprite,$bR,$bG,$bB);
			else
				$bg=imagecolorallocate($sprite,255,255,255);
			imagefilledrectangle($sprite,0,0,$spriteZ,$spriteZ,$bg); */
			
			switch($shape) {
				case 1: // empty
					$shape=[];
					break;
				case 2: // fill
					$shape=[
						0,0,
						1,0,
						1,1,
						0,1
					];
					break;
				case 3: // diamond
					$shape=[
						0.5,0,
						1,0.5,
						0.5,1,
						0,0.5
					];
					break;
				case 4: // reverse diamond
					$shape=[
						0,0,
						1,0,
						1,1,
						0,1,
						0,0.5,
						0.5,1,
						1,0.5,
						0.5,0,
						0,0.5
					];
					break;
				case 5: // cross
					$shape=[
						0.25,0,
						0.75,0,
						0.5,0.5,
						1,0.25,
						1,0.75,
						0.5,0.5,
						0.75,1,
						0.25,1,
						0.5,0.5,
						0,0.75,
						0,0.25,
						0.5,0.5
					];
					break;
				case 6: // morning star
					$shape=[
						0,0,
						0.5,0.25,
						1,0,
						0.75,0.5,
						1,1,
						0.5,0.75,
						0,1,
						0.25,0.5
					];
					break;
				case 7: // small square
					$shape=[
						0.33,0.33,
						0.67,0.33,
						0.67,0.67,
						0.33,0.67
					];
					break;
				case 8: // checkerboard
					$shape=[
						0,0,
						0.33,0,
						0.33,0.33,
						0.66,0.33,
						0.67,0,
						1,0,
						1,0.33,
						0.67,0.33,
						0.67,0.67,
						1,0.67,
						1,1,
						0.67,1,
						0.67,0.67,
						0.33,0.67,
						0.33,1,
						0,1,
						0,0.67,
						0.33,0.67,
						0.33,0.33,
						0,0.33
					];
					break;
			}
			/* apply ratios */
			Xcoords = ArrayNew(1);
			Ycoords = ArrayNew(1);
			xpos = 0;
			ypos = 0;
			
			for ($i=1; $i <= arrayLen($shape); $i++) {
				if ($i mod 2 eq 1) {
					xpos = xpos+1;
					ArrayAppend(Xcoords,$shape[$i]*$spriteZ);
				} else {
					ypos = ypos+1;
					ArrayAppend(Ycoords,$shape[$i]*$spriteZ);
				}
			}
			
				
			ImageDrawLines($sprite,Xcoords,Ycoords,"yes","yes");
		</cfscript>
		
		<cfreturn $sprite />
	</cffunction>
	
	<cffunction name="generate" access="remote" output="yes">
		<cfargument name="hash" type="string" required="yes" />
		<cfargument name="size" type="string" required="yes" />
		
		<cfset var theHash = LCASE(HASH(arguments.hash,"MD5")) />
		<cfset var filePath = expandPath("/static/images/identicons/#theHash#.png") />
		<cfset var theSize = arguments.size />
		
		<cfif fileExists(filePath)>
			<cfcontent type="image/png" file="#filePath#" />
			<cfabort>
		<cfelse>
			
			
		
		<cfscript>
		/* parse hash string */

		$csh=hexdec(substr(theHash,1,1)); // corner sprite shape
		$ssh=hexdec(substr(theHash,2,1)); // side sprite shape
		$xsh=bitAnd(hexdec(substr(theHash,3,1)),7); // center sprite shape
		$cro=bitAnd(hexdec(substr(theHash,4,1)),3); // corner sprite rotation
		$sro=bitAnd(hexdec(substr(theHash,5,1)),3); // side sprite rotation
		$xbg=hexdec(substr(theHash,6,1))%2; // center sprite background
		
		/* corner sprite foreground color */
		$cfr=hexdec(substr(theHash,6,2));
		$cfg=hexdec(substr(theHash,8,2));
		$cfb=hexdec(substr(theHash,10,2));
		
		/* side sprite foreground color */
		$sfr=hexdec(substr(theHash,12,2));
		$sfg=hexdec(substr(theHash,14,2));
		$sfb=hexdec(substr(theHash,16,2));
		
		/* final angle of rotation */
		$angle=hexdec(substr(theHash,18,2));
		
		/* size of each sprite */
		$spriteZ=128;
		
		/* start with blank 3x3 identicon */
		$identicon=ImageNew("",$spriteZ*3,$spriteZ*3,"argb");
		ImageSetAntialiasing($identicon,"on");
		
		/* assign white as background 
		ImageSetDrawingColor($resized, "FFFFFF");
		ImageDrawRect($resized, 0,0, theSize, theSize, "yes");*/
		
		/* generate corner sprites */
		$corner=getsprite($csh,$cfr,$cfg,$cfb,$cro);
		
		cpSection1 = ImageCopy($corner, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection1, 0,0);
		
		ImageRotate($corner,90);
		cpSection2 = ImageCopy($corner, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection2, 0,$spriteZ*2);
		
		ImageRotate($corner,90);
		cpSection3 = ImageCopy($corner, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection3, $spriteZ*2,$spriteZ*2);
		
		ImageRotate($corner,90);
		cpSection4 = ImageCopy($corner, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection4, $spriteZ*2,0);
		
		/* generate side sprites */
		$side=getsprite($ssh,$sfr,$sfg,$sfb,$sro);
		
		cpSection = ImageCopy($side, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection, $spriteZ,0);
		
		ImageRotate($side,90);
		cpSection = ImageCopy($side, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection, 0,$spriteZ);
		
		ImageRotate($side,90);
		cpSection = ImageCopy($side, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection, $spriteZ,$spriteZ*2);
		
		ImageRotate($side,90);
		cpSection = ImageCopy($side, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection, $spriteZ*2,$spriteZ);
		
		/* generate center sprite */
		$center=getcenter($xsh,$cfr,$cfg,$cfb,$sfr,$sfg,$sfb,$xbg);
		
		cpSection = ImageCopy($center, 0, 0, $spriteZ, $spriteZ);
		ImagePaste($identicon, cpSection, $spriteZ,$spriteZ);
		
		// $identicon=imagerotate($identicon,$angle,$bg);
		
		/* make white transparent */
		//imagecolortransparent($identicon,$bg);
		
		/* create blank image according to specified dimensions */
		$resized=ImageNew("",theSize,theSize,"argb");
		ImageSetAntialiasing($resized,"on");
		
		/*ImageSetDrawingColor($resized, "FFFFFF");
		ImageDrawRect($resized, 0,0, theSize, theSize, "yes");*/
		
		/* resize identicon according to specification */
		$identiconInfo = ImageInfo($identicon);
		cpSection = ImageCopy($identicon,($identiconInfo.width-$spriteZ*3)/2,($identiconInfo.width-$spriteZ*3)/2,$spriteZ*3,$spriteZ*3);
		ImageResize(cpSection, theSize,theSize);
		ImagePaste($resized,cpSection,0,0);
		//imagecopyresampled($resized,$identicon,0,0,(imagesx($identicon)-$spriteZ*3)/2,(imagesx($identicon)-$spriteZ*3)/2,theSize,theSize,$spriteZ*3,$spriteZ*3);
		
		/* make white transparent */
		//imagecolortransparent($resized,$bg);
		
		/* and finally, send to standard output */
		//header("Content-Type: image/png");
		//imagepng($resized);

		//ImageWrite($resized,expandPath("/static/images/identicon/testing.png"));
		</cfscript>
		<cfimage action="write" source="#$resized#" destination="#expandPath('/static/images/identicons/' & theHash & '.png')#"  />
		<cfcontent type="image/png" file="#filePath#" />
		<cfabort>
		</cfif>
	</cffunction>
	
	<cffunction name="hexdec" access="public" output="no">
		<cfargument name="str" type="string" required="yes" />
		
		<cfreturn InputBaseN(str, 16) />
	</cffunction>
	
	<cffunction name="substr" access="public" output="no">
		<cfargument name="str" type="string" required="yes" />
		<cfargument name="start" type="string" required="yes" />
		<cfargument name="count" type="string" required="yes" />
		
		<cfreturn mid(arguments.str,arguments.start+1,arguments.count) />
	</cffunction>
</cfcomponent>