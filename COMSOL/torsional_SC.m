function out = model
%
% torsional_SC.m
%
% Model exported on Sep 7 2026, 20:55 by COMSOL 6.4.0.293.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath(['C:\Users\ASUS\Desktop\AAA_Response_JSV\JSV_' native2unicode(hex2dec({'5f' '00'}), 'unicode')  native2unicode(hex2dec({'6e' '90'}), 'unicode') '\COMSOL']);

model.label('torsional_SC.mph');

model.param.set('a0', 'a1+a2', [native2unicode(hex2dec({'66' '76'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode')  native2unicode(hex2dec({'5e' '38'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('a1', '50[mm]', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode') '1' native2unicode(hex2dec({'95' '7f'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.param.set('a2', 'a1', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode') '2' native2unicode(hex2dec({'95' '7f'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.param.set('b0', '50[mm]', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode')  native2unicode(hex2dec({'90' '53'}), 'unicode')  native2unicode(hex2dec({'51' '85'}), 'unicode')  native2unicode(hex2dec({'5f' '84'}), 'unicode') ]);
model.param.set('d0', '5[mm]', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode')  native2unicode(hex2dec({'90' '53'}), 'unicode') '1' native2unicode(hex2dec({'58' 'c1'}), 'unicode')  native2unicode(hex2dec({'53' '9a'}), 'unicode') ]);
model.param.set('d2', 'd0', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode')  native2unicode(hex2dec({'90' '53'}), 'unicode') '2' native2unicode(hex2dec({'58' 'c1'}), 'unicode')  native2unicode(hex2dec({'53' '9a'}), 'unicode') ]);
model.param.set('c1', 'b0+2*d0', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode')  native2unicode(hex2dec({'90' '53'}), 'unicode') '1' native2unicode(hex2dec({'59' '16'}), 'unicode')  native2unicode(hex2dec({'5f' '84'}), 'unicode') ]);
model.param.set('c2', 'b0+2*d2', [native2unicode(hex2dec({'7b' 'a1'}), 'unicode')  native2unicode(hex2dec({'90' '53'}), 'unicode') '2' native2unicode(hex2dec({'59' '16'}), 'unicode')  native2unicode(hex2dec({'5f' '84'}), 'unicode') ]);
model.param.set('a8', 'wavelength', ['PML' native2unicode(hex2dec({'5b' 'bd'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.param.set('hp', '4[mm]', ['PZT' native2unicode(hex2dec({'53' '9a'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.param.set('ap', '4[mm]', ['PZT' native2unicode(hex2dec({'8f' 'b9'}), 'unicode')  native2unicode(hex2dec({'95' '7f'}), 'unicode') ]);
model.param.set('theta', '10[deg]');
model.param.set('CPT', '3130*epsilon0_const * (ap * hp) / (theta * (c1+hp)/2)', ['PZT' native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode') '-Torsion']);
model.param.set('CC1', 'k*CPT', [native2unicode(hex2dec({'8d' '1f'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode') ]);
model.param.set('k', '1');
model.param.set('kx', 'pi/a0*k', ['floquet' native2unicode(hex2dec({'54' '68'}), 'unicode')  native2unicode(hex2dec({'67' '1f'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('am', '20[mm]', [native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'57' '57'}), 'unicode')  native2unicode(hex2dec({'8f' 'b9'}), 'unicode')  native2unicode(hex2dec({'95' '7f'}), 'unicode') ]);
model.param.set('ah', 'am/2', [native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'57' '57'}), 'unicode')  native2unicode(hex2dec({'5f' '84'}), 'unicode')  native2unicode(hex2dec({'54' '11'}), 'unicode')  native2unicode(hex2dec({'53' '9a'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.param.group.create('par2');
model.param('par2').set('wavelength', '1500[mm]');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').geomRep('cadps');
model.component('comp1').geom('geom1').designBooleans(false);
model.component('comp1').geom('geom1').create('cyl1', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl1').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('cyl1').set('h', 'a1');
model.component('comp1').geom('geom1').feature('cyl1').set('layername', {[native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 1'] [native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 2']});
model.component('comp1').geom('geom1').feature('cyl1').set('layer', {'d0/2' 'd0/2'});
model.component('comp1').geom('geom1').create('cyl2', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl2').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('cyl2').set('h', 'a1');
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'cyl1'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'cyl2'});
model.component('comp1').geom('geom1').create('cyl3', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl3').set('r', 'c2/2');
model.component('comp1').geom('geom1').feature('cyl3').set('h', 'a2');
model.component('comp1').geom('geom1').feature('cyl3').set('pos', {'0' '0' '-a2'});
model.component('comp1').geom('geom1').feature('cyl3').set('layername', {[native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 1'] [native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 2']});
model.component('comp1').geom('geom1').feature('cyl3').set('layer', {'d0/2' 'd0/2'});
model.component('comp1').geom('geom1').create('cyl4', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl4').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('cyl4').set('h', 'a2');
model.component('comp1').geom('geom1').feature('cyl4').set('pos', {'0' '0' '-a2'});
model.component('comp1').geom('geom1').create('dif2', 'Difference');
model.component('comp1').geom('geom1').feature('dif2').selection('input').set({'cyl3'});
model.component('comp1').geom('geom1').feature('dif2').selection('input2').set({'cyl4'});
model.component('comp1').geom('geom1').create('wp1', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp1').set('unite', true);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ca1', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca1').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca1').set('angle1', '-theta/2');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca1').set('angle2', 'theta/2');
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls1').set('coord2', {'c1/2+hp' '(c1/2+hp)*tan(theta/2)'});
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls1').selection('vertex1').set('ca1(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls2').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls2').set('coord2', {'c1/2+hp' '-(c1/2+hp)*tan(theta/2)'});
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls2').selection('vertex1').set('ca1(1)', 1);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls3', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls3').selection('vertex1').set('ls1(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls3').selection('vertex2').set('ls2(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ca2', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca2').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca2').set('angle1', '-theta/2+180');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ca2').set('angle2', 'theta/2+180');
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls4', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls4').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls4').set('coord2', {'-(c1/2+hp)' '(c1/2+hp)*tan(theta/2)'});
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls4').selection('vertex1').set('ca2(1)', 1);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls5', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls5').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls5').set('coord2', {'-(c1/2+hp)' '-(c1/2+hp)*tan(theta/2)'});
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls5').selection('vertex1').set('ca2(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.create('ls6', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls6').selection('vertex1').set('ls4(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.feature('ls6').selection('vertex2').set('ls5(1)', 2);
model.component('comp1').geom('geom1').feature('wp1').geom.create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('wp1').geom.feature('csol1').selection('input').set({'ca1' 'ca2' 'ls1' 'ls2' 'ls3' 'ls4' 'ls5' 'ls6'});
model.component('comp1').geom('geom1').create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature('ext1').setIndex('distance', 'ap', 0);
model.component('comp1').geom('geom1').feature('ext1').selection('input').set({'wp1'});
model.component('comp1').geom('geom1').create('wp2', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp2').set('unite', true);
model.component('comp1').geom('geom1').feature('wp2').geom.create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('c1').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('wp2').geom.create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('c2').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('wp2').geom.create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('dif1').selection('input').set({'c2'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('dif1').selection('input2').set({'c1'});
model.component('comp1').geom('geom1').create('ext2', 'Extrude');
model.component('comp1').geom('geom1').feature('ext2').setIndex('distance', 'ap', 0);
model.component('comp1').geom('geom1').feature('ext2').selection('input').set({'wp2'});
model.component('comp1').geom('geom1').create('blk1', 'Block');
model.component('comp1').geom('geom1').feature('blk1').set('size', {'ah' 'am' 'am'});
model.component('comp1').geom('geom1').feature('blk1').set('base', 'center');
model.component('comp1').geom('geom1').feature('blk1').set('pos', {'c1/2+hp+ah/2' '0' 'ap/2'});
model.component('comp1').geom('geom1').feature('blk1').set('layername', {[native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 1'] [native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 2']});
model.component('comp1').geom('geom1').feature('blk1').set('layer', {'(am-ap)/2' 'ap'});
model.component('comp1').geom('geom1').create('blk2', 'Block');
model.component('comp1').geom('geom1').feature('blk2').set('size', {'ah' 'am' 'am'});
model.component('comp1').geom('geom1').feature('blk2').set('base', 'center');
model.component('comp1').geom('geom1').feature('blk2').set('pos', {'-(c1/2+hp+ah/2)' '0' 'ap/2'});
model.component('comp1').geom('geom1').feature('blk2').set('layername', {[native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 1'] [native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 2']});
model.component('comp1').geom('geom1').feature('blk2').set('layer', {'(am-ap)/2' 'ap'});
model.component('comp1').geom('geom1').create('arr1', 'Array');
model.component('comp1').geom('geom1').feature('arr1').set('fullsize', [1 1 10]);
model.component('comp1').geom('geom1').feature('arr1').set('displ', {'0' '0' 'a0'});
model.component('comp1').geom('geom1').feature('arr1').selection('input').set({'blk1' 'blk2' 'ext1' 'ext2' 'dif2(1)' 'dif1(1)'});
model.component('comp1').geom('geom1').create('cyl7', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl7').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('cyl7').set('h', 'a8/2');
model.component('comp1').geom('geom1').feature('cyl7').set('pos', {'0' '0' 'a0*9.5'});
model.component('comp1').geom('geom1').feature('cyl7').set('layername', {[native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 1'] [native2unicode(hex2dec({'5c' '42'}), 'unicode') ' 2']});
model.component('comp1').geom('geom1').feature('cyl7').set('layer', {'d0/2' 'd0/2'});
model.component('comp1').geom('geom1').create('cyl8', 'Cylinder');
model.component('comp1').geom('geom1').feature('cyl8').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('cyl8').set('h', 'a8/2');
model.component('comp1').geom('geom1').feature('cyl8').set('pos', {'0' '0' 'a0*9.5'});
model.component('comp1').geom('geom1').create('dif4', 'Difference');
model.component('comp1').geom('geom1').feature('dif4').selection('input').set({'cyl7'});
model.component('comp1').geom('geom1').feature('dif4').selection('input2').set({'cyl8'});
model.component('comp1').geom('geom1').create('arr2', 'Array');
model.component('comp1').geom('geom1').feature('arr2').set('fullsize', [1 1 3]);
model.component('comp1').geom('geom1').feature('arr2').set('displ', {'0' '0' 'a8/2'});
model.component('comp1').geom('geom1').feature('arr2').selection('input').set({'dif4'});
model.component('comp1').geom('geom1').create('mov1', 'Move');
model.component('comp1').geom('geom1').feature('mov1').set('keep', true);
model.component('comp1').geom('geom1').feature('mov1').set('specify', 'pos');
model.component('comp1').geom('geom1').feature('mov1').selection('input').set({'arr2'});
model.component('comp1').geom('geom1').feature('mov1').selection('oldposvertex').set('arr2(1,1,3)', 8);
model.component('comp1').geom('geom1').feature('mov1').selection('newposvertices').set('arr1(1,1,1,5)', 7);
model.component('comp1').geom('geom1').create('wp3', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp3').set('quickoffsettype', 'vertex');
model.component('comp1').geom('geom1').feature('wp3').set('unite', true);
model.component('comp1').geom('geom1').feature('wp3').selection('offsetvertex').set('mov1(1)', 7);
model.component('comp1').geom('geom1').feature('wp3').geom.create('ca1', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca1').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca1').set('angle1', '-theta/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca1').set('angle2', 'theta/2');
model.component('comp1').geom('geom1').feature('wp3').geom.create('ca3', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca3').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca3').set('angle1', '-theta/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca3').set('angle2', 'theta/2');
model.component('comp1').geom('geom1').feature('wp3').geom.create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls1').selection('vertex1').set('ca3(1)', 2);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls1').selection('vertex2').set('ca1(1)', 2);
model.component('comp1').geom('geom1').feature('wp3').geom.create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls2').selection('vertex1').set('ca3(1)', 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls2').selection('vertex2').set('ca1(1)', 1);
model.component('comp1').geom('geom1').feature('wp3').geom.create('ca2', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca2').set('r', 'c1/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca2').set('angle1', '-theta/2+180');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca2').set('angle2', 'theta/2+180');
model.component('comp1').geom('geom1').feature('wp3').geom.create('ca4', 'CircularArc');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca4').set('r', 'b0/2');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca4').set('angle1', '-theta/2+180');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ca4').set('angle2', 'theta/2+180');
model.component('comp1').geom('geom1').feature('wp3').geom.create('ls4', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls4').selection('vertex1').set('ca4(1)', 1);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls4').selection('vertex2').set('ca2(1)', 1);
model.component('comp1').geom('geom1').feature('wp3').geom.create('ls5', 'LineSegment');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls5').selection('vertex1').set('ca4(1)', 2);
model.component('comp1').geom('geom1').feature('wp3').geom.feature('ls5').selection('vertex2').set('ca2(1)', 2);
model.component('comp1').geom('geom1').feature('wp3').geom.create('csol1', 'ConvertToSolid');
model.component('comp1').geom('geom1').feature('wp3').geom.feature('csol1').selection('input').set({'ca1' 'ca2' 'ca3' 'ca4' 'ls1' 'ls2' 'ls4' 'ls5'});
model.component('comp1').geom('geom1').create('ext3', 'Extrude');
model.component('comp1').geom('geom1').feature('ext3').set('specify', 'vertices');
model.component('comp1').geom('geom1').feature('ext3').selection('input').set({'wp3'});
model.component('comp1').geom('geom1').feature('ext3').selection('vertex').set('arr2(1,1,3)', 8);
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel5', 'Explicit');
model.component('comp1').selection('sel5').set([41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 419 420 421 422 423 424 425 426 427 428 429 430 431 432 433 434 435 436 437 438 439 440 441 442 443 444 445 446 447 448 449 450 451 452 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470 471 472 473 474 475 476 477 478 479 480 481 482 483 484 485 486 487 488 489 490 491 492 493 494 495 496 497 498 499 500 501 502 503 504 505 506 507 508 509 510 511 512 513 514 515 516 517 518 519 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534 535 536 537 538 539 540 541 542 543 544 545 546 547 548 549 550 551 552 553 554 555 556 557 558 559 560 561 562 563 564 565 566 567 568 569 570 571 572 573 574 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 590 591 592 593 594 595 596 597 598 599 600 601 602 603 604 605 606 607 608 609 610 611 612 613 614 615 616]);
model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').set([49 50 51 52 55 56 57 58 61 62 63 64 67 68 69 70 73 74 75 76 79 80 81 82 85 86 87 88 91 92 93 94 97 98 99 100 103 104 105 106 117 118 120 121 123 124 126 127 129 130 132 133 135 136 138 139 141 142 144 145 153 154 156 157 159 160 162 163 165 166 168 169 171 172 174 175 177 178 180 181 193 194 195 196 199 200 201 202 205 206 207 208 211 212 213 214 217 218 219 220 223 224 225 226 229 230 231 232 235 236 237 238 241 242 243 244 247 248 249 250 261 262 264 265 267 268 270 271 273 274 276 277 279 280 282 283 285 286 288 289 297 298 300 301 303 304 306 307 309 310 312 313 315 316 318 319 321 322 324 325 333 334 336 337 339 340 342 343 345 346 348 349 351 352 354 355 357 358 360 361 369 370 372 373 375 376 378 379 381 382 384 385 387 388 390 391 393 394 396 397 405 406 408 409 411 412 414 415 417 418 420 421 423 424 426 427 429 430 432 433 441 442 444 445 447 448 450 451 453 454 456 457 459 460 462 463 465 466 468 469 477 478 480 481 483 484 486 487 489 490 492 493 495 496 498 499 501 502 504 505 513 514 516 517 519 520 522 523 525 526 528 529 531 532 534 535 537 538 540 541 549 550 552 553 555 556 558 559 561 562 564 565 567 568 570 571 573 574 576 577 585 586 588 589 591 592 594 595 597 598 600 601 603 604 606 607 609 610 612 613]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([47 48 53 54 59 60 65 66 71 72 77 78 83 84 89 90 95 96 101 102 116 119 122 125 128 131 134 137 140 143 152 155 158 161 164 167 170 173 176 179 191 192 197 198 203 204 209 210 215 216 221 222 227 228 233 234 239 240 245 246 260 263 266 269 272 275 278 281 284 287 296 299 302 305 308 311 314 317 320 323 332 335 338 341 344 347 350 353 356 359 368 371 374 377 380 383 386 389 392 395 404 407 410 413 416 419 422 425 428 431 440 443 446 449 452 455 458 461 464 467 476 479 482 485 488 491 494 497 500 503 512 515 518 521 524 527 530 533 536 539 548 551 554 557 560 563 566 569 572 575 584 587 590 593 596 599 602 605 608 611]);
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').set([31 32 33 34 35 36 37 38 39 40 617 618 619 620 621 622 623 624 625 626]);
model.component('comp1').selection.create('sel4', 'Explicit');
model.component('comp1').selection('sel4').set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 627 628 629 630 631 632 633 634 635 636 637 638 639 640 641 642 643 644 645 646 647 648 649 650 651 652 653 654 655 656]);
model.component('comp1').selection('sel5').label('pipe 0');
model.component('comp1').selection('sel1').label('pipe 1');
model.component('comp1').selection('sel2').label('pipe 2');
model.component('comp1').selection('sel3').label('PZT');
model.component('comp1').selection('sel4').label([native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'57' '57'}), 'unicode') ]);

model.component('comp1').variable.create('var2');
model.component('comp1').variable('var2').set('E1', '70[GPa]');
model.component('comp1').variable('var2').set('rho1', '2700[kg/m^3]');
model.component('comp1').variable('var2').set('nu1', '0.36');
model.component('comp1').variable('var2').set('G1', 'E1 / 2 / (1 + nu1)');
model.component('comp1').variable('var2').selection.named('sel5');
model.component('comp1').variable.create('var3');
model.component('comp1').variable('var3').set('E1', '40.8[GPa]');
model.component('comp1').variable('var3').set('rho1', '11600[kg/m^3]');
model.component('comp1').variable('var3').set('nu1', '0.369');
model.component('comp1').variable('var3').selection.named('sel4');
model.component('comp1').variable.create('var4');
model.component('comp1').variable('var4').set('uu', 'intop1(abs(u)^2)');
model.component('comp1').variable('var4').set('vv', 'intop1(abs(v)^2)');
model.component('comp1').variable('var4').set('ww', 'intop1(abs(w)^2)');
model.component('comp1').variable('var4').set('ratio', 'uu/(uu+vv+ww)');

model.component('comp1').view('view1').hideEntities.create('hide1');
model.component('comp1').view('view1').hideEntities('hide1').set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 109 110 111 112 147 148 183 184 253 254 255 256 291 292 327 328 363 364 399 400 435 436 471 472 507 508 543 544 579 580 615 616 617 618 619 620 621 622 623 624 625 626 627 628 629 630 631 632 633 634 635 636 637 638 639 640 641 642 643 644 645 646 647 648 649 650 651 652 653 654 655 656]);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').selection.named('sel3');
model.component('comp1').material('mat1').propertyGroup.create('StrainCharge', 'StrainCharge', 'Strain-charge form');
model.component('comp1').material('mat1').propertyGroup.create('StressCharge', 'StressCharge', 'Stress-charge form');

model.component('comp1').cpl.create('intop1', 'Integration');
model.component('comp1').cpl.create('intop2', 'Integration');
model.component('comp1').cpl.create('intop3', 'Integration');
model.component('comp1').cpl.create('aveop1', 'Average');
model.component('comp1').cpl.create('aveop2', 'Average');
model.component('comp1').cpl.create('aveop3', 'Average');
model.component('comp1').cpl.create('aveop4', 'Average');
model.component('comp1').cpl.create('aveop5', 'Average');
model.component('comp1').cpl.create('aveop6', 'Average');
model.component('comp1').cpl.create('aveop7', 'Average');
model.component('comp1').cpl.create('aveop8', 'Average');
model.component('comp1').cpl.create('aveop9', 'Average');
model.component('comp1').cpl.create('aveop10', 'Average');
model.component('comp1').cpl.create('aveop11', 'Average');
model.component('comp1').cpl.create('aveop12', 'Average');
model.component('comp1').cpl.create('aveop13', 'Average');
model.component('comp1').cpl.create('aveop14', 'Average');
model.component('comp1').cpl.create('aveop15', 'Average');
model.component('comp1').cpl.create('aveop16', 'Average');
model.component('comp1').cpl.create('aveop17', 'Average');
model.component('comp1').cpl.create('aveop18', 'Average');
model.component('comp1').cpl.create('aveop19', 'Average');
model.component('comp1').cpl.create('aveop20', 'Average');
model.component('comp1').cpl('intop1').selection.named('sel5');
model.component('comp1').cpl('intop2').selection.geom('geom1', 2);
model.component('comp1').cpl('intop2').selection.set([229 230 408 517 629 630 808 917 1170 1279 1424 1533 1678 1787 1932 2041]);
model.component('comp1').cpl('intop3').selection.geom('geom1', 2);
model.component('comp1').cpl('intop3').selection.set([394 395 507 616 794 795 907 1016 1269 1378 1523 1632 1777 1886 2031 2140]);
model.component('comp1').cpl('aveop1').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop1').selection.set([162]);
model.component('comp1').cpl('aveop2').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop2').selection.set([2186]);
model.component('comp1').cpl('aveop3').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop3').selection.set([166]);
model.component('comp1').cpl('aveop4').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop4').selection.set([2192]);
model.component('comp1').cpl('aveop5').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop5').selection.set([170]);
model.component('comp1').cpl('aveop6').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop6').selection.set([2198]);
model.component('comp1').cpl('aveop7').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop7').selection.set([174]);
model.component('comp1').cpl('aveop8').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop8').selection.set([2204]);
model.component('comp1').cpl('aveop9').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop9').selection.set([178]);
model.component('comp1').cpl('aveop10').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop10').selection.set([2210]);
model.component('comp1').cpl('aveop11').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop11').selection.set([182]);
model.component('comp1').cpl('aveop12').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop12').selection.set([2216]);
model.component('comp1').cpl('aveop13').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop13').selection.set([186]);
model.component('comp1').cpl('aveop14').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop14').selection.set([2222]);
model.component('comp1').cpl('aveop15').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop15').selection.set([190]);
model.component('comp1').cpl('aveop16').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop16').selection.set([2228]);
model.component('comp1').cpl('aveop17').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop17').selection.set([194]);
model.component('comp1').cpl('aveop18').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop18').selection.set([2234]);
model.component('comp1').cpl('aveop19').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop19').selection.set([198]);
model.component('comp1').cpl('aveop20').selection.geom('geom1', 2);
model.component('comp1').cpl('aveop20').selection.set([2240]);

model.component('comp1').coordSystem.create('sys2', 'VectorBase');
model.component('comp1').coordSystem.create('pml1', 'PML');
model.component('comp1').coordSystem('sys2').set('orthonormal', true);
model.component('comp1').coordSystem('pml1').selection.set([41 42 111 112 113 148 149 184 185 186 255 256 257 292 293 328 329 364 365 400 401 436 437 472 473 508 509 544 545 580 581 616]);

model.component('comp1').common.create('mpf1', 'ParticipationFactors');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('pzm1', 'PiezoelectricMaterialModel', 3);
model.component('comp1').physics('solid').feature('pzm1').selection.named('sel3');
model.component('comp1').physics('solid').create('disp1', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp1').selection.set([2180 2473]);
model.component('comp1').physics('solid').create('disp2', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp2').selection.set([388 755]);
model.component('comp1').physics('solid').create('disp3', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp3').selection.set([1375 1485]);
model.component('comp1').physics('solid').create('disp4', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp4').selection.set([1668 1778]);
model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
model.component('comp1').physics('es').selection.named('sel3');
model.component('comp1').physics('es').create('ccn1', 'ChargeConservationFluid', 3);
model.component('comp1').physics('es').feature('ccn1').selection.all;
model.component('comp1').physics('es').feature('ccn1').featureInfo.create('information');
model.component('comp1').physics('es').create('ccnp1', 'ChargeConservationPiezo', 3);
model.component('comp1').physics('es').feature('ccnp1').selection.all;
model.component('comp1').physics('es').create('gnd1', 'Ground', 2);
model.component('comp1').physics('es').feature('gnd1').selection.set([162 166 170 174 178 182 186 190 194 198 202 204 206 208 210 212 214 216 218 220 2186 2192 2198 2204 2210 2216 2222 2228 2234 2240 2252 2256 2260 2264 2268 2272 2276 2280 2284 2288]);
model.component('comp1').physics('es').create('ge1', 'GlobalEquations', -1);
model.component('comp1').physics('es').feature('ge1').set('DependentVariableQuantity', 'none');
model.component('comp1').physics('es').feature('ge1').set('CustomDependentVariableUnit', 'C');
model.component('comp1').physics('es').create('sfcd1', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd1').selection.set([162]);
model.component('comp1').physics('es').create('sfcd2', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd2').selection.set([2186]);
model.component('comp1').physics('es').create('sfcd3', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd3').selection.set([166]);
model.component('comp1').physics('es').create('sfcd4', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd4').selection.set([2192]);
model.component('comp1').physics('es').create('sfcd5', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd5').selection.set([170]);
model.component('comp1').physics('es').create('sfcd6', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd6').selection.set([2198]);
model.component('comp1').physics('es').create('sfcd7', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd7').selection.set([174]);
model.component('comp1').physics('es').create('sfcd8', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd8').selection.set([2204]);
model.component('comp1').physics('es').create('sfcd9', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd9').selection.set([178]);
model.component('comp1').physics('es').create('sfcd10', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd10').selection.set([2210]);
model.component('comp1').physics('es').create('sfcd11', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd11').selection.set([182]);
model.component('comp1').physics('es').create('sfcd12', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd12').selection.set([2216]);
model.component('comp1').physics('es').create('sfcd13', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd13').selection.set([186]);
model.component('comp1').physics('es').create('sfcd14', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd14').selection.set([2222]);
model.component('comp1').physics('es').create('sfcd15', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd15').selection.set([190]);
model.component('comp1').physics('es').create('sfcd16', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd16').selection.set([2228]);
model.component('comp1').physics('es').create('sfcd17', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd17').selection.set([194]);
model.component('comp1').physics('es').create('sfcd18', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd18').selection.set([2234]);
model.component('comp1').physics('es').create('sfcd19', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd19').selection.set([198]);
model.component('comp1').physics('es').create('sfcd20', 'SurfaceChargeDensity', 2);
model.component('comp1').physics('es').feature('sfcd20').selection.set([2240]);
model.component('comp1').physics('es').create('constr1', 'PointwiseConstraint', 2);
model.component('comp1').physics('es').feature('constr1').selection.set([162 166 170 174 178 182 186 190 194 198 2186 2192 2198 2204 2210 2216 2222 2228 2234 2240]);
model.component('comp1').physics('es').create('constr2', 'PointwiseConstraint', 2);
model.component('comp1').physics('es').feature('constr2').selection.set([162 166 170 174 178 182 186 190 194 198 2186 2192 2198 2204 2210 2216 2222 2228 2234 2240]);
model.component('comp1').physics('es').create('constr3', 'PointwiseConstraint', 2);
model.component('comp1').physics('es').feature('constr3').selection.set([162 166 170 174 178 182 186 190 194 198 2186 2192 2198 2204 2210 2216 2222 2228 2234 2240]);

model.component('comp1').multiphysics.create('pze1', 'PiezoelectricEffect', 3);

model.component('comp1').mesh('mesh1').create('swe1', 'Sweep');
model.component('comp1').mesh('mesh1').create('swe2', 'Sweep');
model.component('comp1').mesh('mesh1').create('swe3', 'Sweep');
model.component('comp1').mesh('mesh1').feature('swe1').selection.named('sel5');
model.component('comp1').mesh('mesh1').feature('swe2').selection.named('sel3');
model.component('comp1').mesh('mesh1').feature('swe2').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh1').feature('swe2').feature('dis1').selection.named('sel3');
model.component('comp1').mesh('mesh1').feature('swe3').selection.named('sel4');
model.component('comp1').mesh('mesh1').feature('swe3').create('dis1', 'Distribution');

model.component('comp1').variable('var2').label(['pipe 2_' native2unicode(hex2dec({'94' 'dd'}), 'unicode') ]);
model.component('comp1').variable('var3').label(['Pb ' native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'57' '57'}), 'unicode') ]);

model.component('comp1').view('view1').set('renderwireframe', true);
model.component('comp1').view('view1').set('showgrid', false);
model.component('comp1').view('view1').hideEntities('hide1').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'72' '69'}), 'unicode')  native2unicode(hex2dec({'74' '06'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'96' '90'}), 'unicode')  native2unicode(hex2dec({'85' 'cf'}), 'unicode') ' 1']);
model.component('comp1').view('view2').axis.set('xmin', -0.09302368760108948);
model.component('comp1').view('view2').axis.set('xmax', 0.15078090131282806);
model.component('comp1').view('view2').axis.set('ymin', -0.06740644574165344);
model.component('comp1').view('view2').axis.set('ymax', 0.11658918857574463);
model.component('comp1').view('view3').axis.set('xmin', -0.06778069585561752);
model.component('comp1').view('view3').axis.set('xmax', 0.09285040944814682);
model.component('comp1').view('view3').axis.set('ymin', -0.05524613708257675);
model.component('comp1').view('view3').axis.set('ymax', 0.0659797266125679);
model.component('comp1').view('view4').axis.set('xmin', -0.017422806471586227);
model.component('comp1').view('view4').axis.set('xmax', 0.0793772041797638);
model.component('comp1').view('view4').axis.set('ymin', -0.03452229127287865);
model.component('comp1').view('view4').axis.set('ymax', 0.04900674521923065);

model.component('comp1').material('mat1').label('Lead Zirconate Titanate (PZT-5H)');
model.component('comp1').material('mat1').set('family', 'lead');
model.component('comp1').material('mat1').propertyGroup('def').label('Basic');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '440[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'1.3[W/(m*K)]' '0' '0' '0' '1.3[W/(m*K)]' '0' '0' '0' '1.3[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1704.4' '0' '0' '0' '1704.4' '0' '0' '0' '1433.6'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', '7500[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').label('Strain-charge form');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('sE', {'1.65e-011[1/Pa]' '-4.78e-012[1/Pa]' '-8.45e-012[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '-4.78e-012[1/Pa]' '1.65e-011[1/Pa]' '-8.45e-012[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '0[1/Pa]' '-8.45e-012[1/Pa]' '-8.45e-012[1/Pa]' '2.07e-011[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '4.35e-011[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '4.35e-011[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '4.26e-011[1/Pa]'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('dET', {'0[C/N]' '0[C/N]' '-2.74e-010[C/N]' '0[C/N]' '0[C/N]' '-2.74e-010[C/N]' '0[C/N]' '0[C/N]' '5.93e-010[C/N]' '0[C/N]'  ...
'7.41e-010[C/N]' '0[C/N]' '7.41e-010[C/N]' '0[C/N]' '0[C/N]' '0[C/N]' '0[C/N]' '0[C/N]'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('epsilonrT', {'3130' '0' '0' '0' '3130' '0' '0' '0' '3400'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').label('Stress-charge form');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('cE', {'1.27205e+011[Pa]' '8.02122e+010[Pa]' '8.46702e+010[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '8.02122e+010[Pa]' '1.27205e+011[Pa]' '8.46702e+010[Pa]' '0[Pa]'  ...
'0[Pa]' '0[Pa]' '8.46702e+010[Pa]' '8.46702e+010[Pa]' '1.17436e+011[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]'  ...
'0[Pa]' '2.29885e+010[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '2.29885e+010[Pa]' '0[Pa]'  ...
'0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '2.34742e+010[Pa]'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eES', {'0[C/m^2]' '0[C/m^2]' '-6.62281[C/m^2]' '0[C/m^2]' '0[C/m^2]' '-6.62281[C/m^2]' '0[C/m^2]' '0[C/m^2]' '23.2403[C/m^2]' '0[C/m^2]'  ...
'17.0345[C/m^2]' '0[C/m^2]' '17.0345[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('epsilonrS', {'1704.4' '0' '0' '0' '1704.4' '0' '0' '0' '1433.6'});

model.component('comp1').cpl('aveop1').active(false);
model.component('comp1').cpl('aveop2').active(false);
model.component('comp1').cpl('aveop3').active(false);
model.component('comp1').cpl('aveop4').active(false);
model.component('comp1').cpl('aveop5').active(false);
model.component('comp1').cpl('aveop6').active(false);
model.component('comp1').cpl('aveop7').active(false);
model.component('comp1').cpl('aveop8').active(false);
model.component('comp1').cpl('aveop9').active(false);
model.component('comp1').cpl('aveop10').active(false);
model.component('comp1').cpl('aveop11').active(false);
model.component('comp1').cpl('aveop12').active(false);
model.component('comp1').cpl('aveop13').active(false);
model.component('comp1').cpl('aveop14').active(false);
model.component('comp1').cpl('aveop15').active(false);
model.component('comp1').cpl('aveop16').active(false);
model.component('comp1').cpl('aveop17').active(false);
model.component('comp1').cpl('aveop18').active(false);
model.component('comp1').cpl('aveop19').active(false);
model.component('comp1').cpl('aveop20').active(false);

model.component('comp1').coordSystem('sys2').set('base', {'-sin(atan2(y,x))' 'cos(atan2(y,x))' '0'; '0' '0' '1'; 'cos(atan2(y,x))' 'sin(atan2(y,x))' '0'});

model.component('comp1').physics('solid').prop('AdvancedSettings').set('GroupPhysOdesRc', false);
model.component('comp1').physics('solid').prop('AdvancedSettings').set('GroupPhysOdesAtt', false);
model.component('comp1').physics('solid').prop('AdvancedSettings').set('GroupPhysOdesRd', false);
model.component('comp1').physics('solid').feature('lemm1').set('E_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('E', 'E1');
model.component('comp1').physics('solid').feature('lemm1').set('nu_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('nu', 'nu1');
model.component('comp1').physics('solid').feature('lemm1').set('rho_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('rho', 'rho1');
model.component('comp1').physics('solid').feature('dcnt1').set('pn', '((min(1e-3*(5^niterCMP),1))*solid.dcnt1.E_char)/solid.hmin_dst');
model.component('comp1').physics('solid').feature('pzm1').set('coordinateSystem', 'sys2');
model.component('comp1').physics('solid').feature('disp1').set('Direction', {'free'; 'prescribed'; 'free'});
model.component('comp1').physics('solid').feature('disp1').set('U0', {'0'; '1e-6'; '0'});
model.component('comp1').physics('solid').feature('disp2').set('Direction', {'free'; 'prescribed'; 'free'});
model.component('comp1').physics('solid').feature('disp2').set('U0', {'0'; '-1e-6'; '0'});
model.component('comp1').physics('solid').feature('disp3').set('Direction', {'prescribed'; 'free'; 'free'});
model.component('comp1').physics('solid').feature('disp3').set('U0', {'1e-6'; '0'; '0'});
model.component('comp1').physics('solid').feature('disp4').set('Direction', {'prescribed'; 'free'; 'free'});
model.component('comp1').physics('solid').feature('disp4').set('U0', {'-1e-6'; '0'; '0'});
model.component('comp1').physics('es').feature('ccn1').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'83' '77'}), 'unicode')  native2unicode(hex2dec({'5b' '88'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode') ' 1']);
model.component('comp1').physics('es').feature('ccn1').featureInfo('information').label([native2unicode(hex2dec({'8f' 'c1'}), 'unicode')  native2unicode(hex2dec({'79' 'fb'}), 'unicode')  native2unicode(hex2dec({'72' '79'}), 'unicode')  native2unicode(hex2dec({'5f' '81'}), 'unicode') ]);
model.component('comp1').physics('es').feature('ge1').set('name', {'q1';  ...
'q2';  ...
'q3';  ...
'q4';  ...
'q5';  ...
'q6';  ...
'q7';  ...
'q8';  ...
'q9';  ...
'q10';  ...
'q11';  ...
'q12';  ...
'q13';  ...
'q14';  ...
'q15';  ...
'q16';  ...
'q17';  ...
'q18';  ...
'q19';  ...
'q20'});
model.component('comp1').physics('es').feature('ge1').set('equation', {'aveop1(V)+q1/CC1';  ...
'aveop2(V)+q2/CC1';  ...
'aveop3(V)+q3/CC1';  ...
'aveop4(V)+q4/CC1';  ...
'aveop5(V)+q5/CC1';  ...
'aveop6(V)+q6/CC1';  ...
'aveop7(V)+q7/CC1';  ...
'aveop8(V)+q8/CC1';  ...
'aveop9(V)+q9/CC1';  ...
'aveop10(V)+q10/CC1';  ...
'aveop11(V)+q11/CC1';  ...
'aveop12(V)+q12/CC1';  ...
'aveop13(V)+q13/CC1';  ...
'aveop14(V)+q14/CC1';  ...
'aveop15(V)+q15/CC1';  ...
'aveop16(V)+q16/CC1';  ...
'aveop17(V)+q17/CC1';  ...
'aveop18(V)+q18/CC1';  ...
'aveop19(V)+q19/CC1';  ...
'aveop20(V)+q20/CC1'});
model.component('comp1').physics('es').feature('ge1').set('initialValueU', [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]);
model.component('comp1').physics('es').feature('ge1').set('initialValueUt', [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]);
model.component('comp1').physics('es').feature('ge1').set('description', {'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
'';  ...
''});
model.component('comp1').physics('es').feature('ge1').set('SourceTermQuantity', 'none');
model.component('comp1').physics('es').feature('ge1').set('CustomSourceTermUnit', 'V');
model.component('comp1').physics('es').feature('ge1').active(false);
model.component('comp1').physics('es').feature('sfcd1').set('rhoqs', 'q1/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd1').active(false);
model.component('comp1').physics('es').feature('sfcd2').set('rhoqs', 'q2/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd2').active(false);
model.component('comp1').physics('es').feature('sfcd3').set('rhoqs', 'q3/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd3').active(false);
model.component('comp1').physics('es').feature('sfcd4').set('rhoqs', 'q4/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd4').active(false);
model.component('comp1').physics('es').feature('sfcd5').set('rhoqs', 'q5/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd5').active(false);
model.component('comp1').physics('es').feature('sfcd6').set('rhoqs', 'q6/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd6').active(false);
model.component('comp1').physics('es').feature('sfcd7').set('rhoqs', 'q7/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd7').active(false);
model.component('comp1').physics('es').feature('sfcd8').set('rhoqs', 'q8/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd8').active(false);
model.component('comp1').physics('es').feature('sfcd9').set('rhoqs', 'q9/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd9').active(false);
model.component('comp1').physics('es').feature('sfcd10').set('rhoqs', 'q10/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd10').active(false);
model.component('comp1').physics('es').feature('sfcd11').set('rhoqs', 'q11/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd11').active(false);
model.component('comp1').physics('es').feature('sfcd12').set('rhoqs', 'q12/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd12').active(false);
model.component('comp1').physics('es').feature('sfcd13').set('rhoqs', 'q13/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd13').active(false);
model.component('comp1').physics('es').feature('sfcd14').set('rhoqs', 'q14/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd14').active(false);
model.component('comp1').physics('es').feature('sfcd15').set('rhoqs', 'q15/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd15').active(false);
model.component('comp1').physics('es').feature('sfcd16').set('rhoqs', 'q16/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd16').active(false);
model.component('comp1').physics('es').feature('sfcd17').set('rhoqs', 'q17/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd17').active(false);
model.component('comp1').physics('es').feature('sfcd18').set('rhoqs', 'q18/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd18').active(false);
model.component('comp1').physics('es').feature('sfcd19').set('rhoqs', 'q19/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd19').active(false);
model.component('comp1').physics('es').feature('sfcd20').set('rhoqs', 'q20/(hp * ap)');
model.component('comp1').physics('es').feature('sfcd20').active(false);
model.component('comp1').physics('es').feature('constr1').set('constraintExpression', 'Vx');
model.component('comp1').physics('es').feature('constr1').active(false);
model.component('comp1').physics('es').feature('constr2').set('constraintExpression', 'Vy');
model.component('comp1').physics('es').feature('constr2').active(false);
model.component('comp1').physics('es').feature('constr3').set('constraintExpression', 'Vz');
model.component('comp1').physics('es').feature('constr3').active(false);

model.component('comp1').multiphysics('pze1').set('InitializePiezoCoupling', 1);
model.component('comp1').multiphysics('pze1').label([native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'65' '48'}), 'unicode')  native2unicode(hex2dec({'5e' '94'}), 'unicode') ' 1']);

model.component('comp1').mesh('mesh1').feature('size').set('custom', 'on');
model.component('comp1').mesh('mesh1').feature('size').set('hmax', '13e-3');
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 0.036);
model.component('comp1').mesh('mesh1').feature('swe1').set('element', 'hexlegacy63');
model.component('comp1').mesh('mesh1').feature('swe1').set('smoothcontrol', true);
model.component('comp1').mesh('mesh1').feature('swe2').set('element', 'hexlegacy63');
model.component('comp1').mesh('mesh1').feature('swe2').set('smoothcontrol', true);
model.component('comp1').mesh('mesh1').feature('swe2').feature('dis1').set('numelem', 3);
model.component('comp1').mesh('mesh1').feature('swe3').set('element', 'hexlegacy63');
model.component('comp1').mesh('mesh1').feature('swe3').set('smoothcontrol', true);
model.component('comp1').mesh('mesh1').feature('swe3').selection('targetface').set([11 14 17]);
model.component('comp1').mesh('mesh1').run;

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');

model.sol.create('sol1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg1', 'PlotGroup3D');
model.result.create('pg2', 'PlotGroup3D');
model.result.create('pg3', 'PlotGroup3D');
model.result.create('pg6', 'PlotGroup1D');
model.result.create('pg5', 'PlotGroup3D');
model.result('pg1').create('vol1', 'Volume');
model.result('pg1').feature('vol1').set('expr', 'solid.mises_peak');
model.result('pg1').feature('vol1').create('def', 'Deform');
model.result('pg2').create('mslc1', 'Multislice');
model.result('pg2').create('strmsl1', 'StreamlineMultislice');
model.result('pg2').feature('mslc1').set('expr', 'V');
model.result('pg2').feature('strmsl1').set('expr', {'es.Ex' 'es.Ey' 'es.Ez'});
model.result('pg2').feature('strmsl1').create('col1', 'Color');
model.result('pg2').feature('strmsl1').create('filt1', 'Filter');
model.result('pg2').feature('strmsl1').feature('col1').set('expr', 'V');
model.result('pg2').feature('strmsl1').feature('filt1').set('expr', '!isScalingSystemDomain');
model.result('pg3').create('mslc1', 'Multislice');
model.result('pg3').create('strmsl1', 'StreamlineMultislice');
model.result('pg3').feature('mslc1').set('expr', 'es.normE');
model.result('pg3').feature('strmsl1').set('expr', {'es.Ex' 'es.Ey' 'es.Ez'});
model.result('pg3').feature('strmsl1').create('col1', 'Color');
model.result('pg3').feature('strmsl1').create('filt1', 'Filter');
model.result('pg3').feature('strmsl1').feature('col1').set('expr', 'es.normE');
model.result('pg3').feature('strmsl1').feature('filt1').set('expr', '!isScalingSystemDomain');
model.result('pg6').create('glob1', 'Global');
model.result('pg6').feature('glob1').set('expr', {'intop3(abs(solid.curlUZ)^2)/intop2(abs(solid.curlUZ)^2)'});
model.result('pg5').create('vol1', 'Volume');
model.result('pg5').feature('vol1').set('expr', 'solid.curlUZ');
model.result('pg5').feature('vol1').create('def', 'Deform');

model.study('std1').feature('freq').set('plist', 'range(5,10,10000)');
model.study('std1').feature('freq').set('preusesol', 'auto');

model.sol('sol1').feature('st1').label([native2unicode(hex2dec({'7f' '16'}), 'unicode')  native2unicode(hex2dec({'8b' 'd1'}), 'unicode')  native2unicode(hex2dec({'65' 'b9'}), 'unicode')  native2unicode(hex2dec({'7a' '0b'}), 'unicode') ': ' native2unicode(hex2dec({'98' '91'}), 'unicode')  native2unicode(hex2dec({'57' 'df'}), 'unicode') ]);
model.sol('sol1').feature('v1').label([native2unicode(hex2dec({'56' 'e0'}), 'unicode')  native2unicode(hex2dec({'53' 'd8'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
model.sol('sol1').feature('v1').set('cname', {'freq'});
model.sol('sol1').feature('v1').set('clist', {'range(5,10,10000)[Hz]'});
model.sol('sol1').feature('s1').label([native2unicode(hex2dec({'7a' '33'}), 'unicode')  native2unicode(hex2dec({'60' '01'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('dDef').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 2']);
model.sol('sol1').feature('s1').feature('aDef').label([native2unicode(hex2dec({'9a' 'd8'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').feature('p1').label([native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'53' '16'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(5,10,10000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('fc1').label([native2unicode(hex2dec({'51' '68'}), 'unicode')  native2unicode(hex2dec({'80' '26'}), 'unicode')  native2unicode(hex2dec({'54' '08'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'5e' 'fa'}), 'unicode')  native2unicode(hex2dec({'8b' 'ae'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' (pze1) (' native2unicode(hex2dec({'5d' 'f2'}), 'unicode')  native2unicode(hex2dec({'54' '08'}), 'unicode')  native2unicode(hex2dec({'5e' '76'}), 'unicode') ')']);
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-9);
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'5e' 'fa'}), 'unicode')  native2unicode(hex2dec({'8b' 'ae'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'8f' 'ed'}), 'unicode')  native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' (pze1)']);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', true);
model.sol('sol1').feature('s1').feature('i1').feature('ilDef').label([native2unicode(hex2dec({'4e' '0d'}), 'unicode')  native2unicode(hex2dec({'5b' '8c'}), 'unicode')  native2unicode(hex2dec({'51' '68'}), 'unicode') ' LU ' native2unicode(hex2dec({'52' '06'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').label([native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').label([native2unicode(hex2dec({'98' '84'}), 'unicode')  native2unicode(hex2dec({'5e' '73'}), 'unicode')  native2unicode(hex2dec({'6e' 'd1'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('soDef').label('SOR 2');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').label('SOR 1.1');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').label([native2unicode(hex2dec({'54' '0e'}), 'unicode')  native2unicode(hex2dec({'5e' '73'}), 'unicode')  native2unicode(hex2dec({'6e' 'd1'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('soDef').label('SOR 2');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').label('SOR 1.1');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.8);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').label([native2unicode(hex2dec({'7c' '97'}), 'unicode')  native2unicode(hex2dec({'53' '16'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('dDef').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 2']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('pivotperturb', 1.0E-9);

model.study('std1').runNoGen;

model.result('pg1').label([native2unicode(hex2dec({'5e' '94'}), 'unicode')  native2unicode(hex2dec({'52' '9b'}), 'unicode') ' (solid)']);
model.result('pg1').set('looplevel', [1]);
model.result('pg1').set('showhiddenobjects', true);
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('smooth', 'internal');
model.result('pg1').feature('vol1').set('const', {'solid.refpntx' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' x ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpnty' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' y ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpntz' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]});
model.result('pg1').feature('vol1').set('colortable', 'Prism');
model.result('pg1').feature('vol1').set('resolution', 'custom');
model.result('pg1').feature('vol1').set('refine', 2);
model.result('pg1').feature('vol1').set('threshold', 'manual');
model.result('pg1').feature('vol1').set('thresholdvalue', 0.2);
model.result('pg1').feature('vol1').set('resolution', 'custom');
model.result('pg1').feature('vol1').set('refine', 2);
model.result('pg1').feature('vol1').feature('def').set('scale', 119248.10048580813);
model.result('pg1').feature('vol1').feature('def').set('scaleactive', false);
model.result('pg2').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'52' 'bf'}), 'unicode') ' (es)']);
model.result('pg2').set('looplevel', [1]);
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').set('showlegendsmaxmin', true);
model.result('pg2').set('smooth', 'internal');
model.result('pg2').feature('mslc1').set('const', {'solid.refpntx' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' x ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpnty' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' y ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpntz' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]});
model.result('pg2').feature('mslc1').set('multiplanexmethod', 'coord');
model.result('pg2').feature('mslc1').set('xcoord', 'es.CPx');
model.result('pg2').feature('mslc1').set('multiplaneymethod', 'coord');
model.result('pg2').feature('mslc1').set('ycoord', 'es.CPy');
model.result('pg2').feature('mslc1').set('multiplanezmethod', 'coord');
model.result('pg2').feature('mslc1').set('zcoord', 'es.CPz');
model.result('pg2').feature('mslc1').set('colortable', 'Dipole');
model.result('pg2').feature('mslc1').set('resolution', 'normal');
model.result('pg2').feature('strmsl1').label([native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'52' '07'}), 'unicode')  native2unicode(hex2dec({'97' '62'}), 'unicode') ' 1']);
model.result('pg2').feature('strmsl1').set('multiplanexmethod', 'coord');
model.result('pg2').feature('strmsl1').set('xcoord', 'es.CPx');
model.result('pg2').feature('strmsl1').set('multiplaneymethod', 'coord');
model.result('pg2').feature('strmsl1').set('ycoord', 'es.CPy');
model.result('pg2').feature('strmsl1').set('multiplanezmethod', 'coord');
model.result('pg2').feature('strmsl1').set('zcoord', 'es.CPz');
model.result('pg2').feature('strmsl1').set('titletype', 'none');
model.result('pg2').feature('strmsl1').set('posmethod', 'uniform');
model.result('pg2').feature('strmsl1').set('udensity', 7.8);
model.result('pg2').feature('strmsl1').set('maxlen', 0.4);
model.result('pg2').feature('strmsl1').set('inheritplot', 'mslc1');
model.result('pg2').feature('strmsl1').set('inheritcolor', false);
model.result('pg2').feature('strmsl1').set('resolution', 'normal');
model.result('pg2').feature('strmsl1').feature('col1').set('colortable', 'DipoleDark');
model.result('pg2').feature('strmsl1').feature('col1').set('colorlegend', false);
model.result('pg3').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ' (es)']);
model.result('pg3').set('looplevel', [1]);
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('showlegendsmaxmin', true);
model.result('pg3').set('smooth', 'internal');
model.result('pg3').feature('mslc1').set('const', {'solid.refpntx' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' x ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpnty' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' y ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpntz' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]});
model.result('pg3').feature('mslc1').set('multiplanexmethod', 'coord');
model.result('pg3').feature('mslc1').set('xcoord', 'es.CPx');
model.result('pg3').feature('mslc1').set('multiplaneymethod', 'coord');
model.result('pg3').feature('mslc1').set('ycoord', 'es.CPy');
model.result('pg3').feature('mslc1').set('multiplanezmethod', 'coord');
model.result('pg3').feature('mslc1').set('zcoord', 'es.CPz');
model.result('pg3').feature('mslc1').set('colortable', 'Prism');
model.result('pg3').feature('mslc1').set('colortabletrans', 'nonlinear');
model.result('pg3').feature('mslc1').set('colorcalibration', -0.8);
model.result('pg3').feature('mslc1').set('resolution', 'normal');
model.result('pg3').feature('strmsl1').label([native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'52' '07'}), 'unicode')  native2unicode(hex2dec({'97' '62'}), 'unicode') ' 1']);
model.result('pg3').feature('strmsl1').set('multiplanexmethod', 'coord');
model.result('pg3').feature('strmsl1').set('xcoord', 'es.CPx');
model.result('pg3').feature('strmsl1').set('multiplaneymethod', 'coord');
model.result('pg3').feature('strmsl1').set('ycoord', 'es.CPy');
model.result('pg3').feature('strmsl1').set('multiplanezmethod', 'coord');
model.result('pg3').feature('strmsl1').set('zcoord', 'es.CPz');
model.result('pg3').feature('strmsl1').set('titletype', 'none');
model.result('pg3').feature('strmsl1').set('posmethod', 'uniform');
model.result('pg3').feature('strmsl1').set('udensity', 7.8);
model.result('pg3').feature('strmsl1').set('maxlen', 0.4);
model.result('pg3').feature('strmsl1').set('inheritplot', 'mslc1');
model.result('pg3').feature('strmsl1').set('inheritcolor', false);
model.result('pg3').feature('strmsl1').set('resolution', 'normal');
model.result('pg3').feature('strmsl1').feature('col1').set('colortable', 'PrismDark');
model.result('pg3').feature('strmsl1').feature('col1').set('colorlegend', false);
model.result('pg3').feature('strmsl1').feature('col1').set('colortabletrans', 'nonlinear');
model.result('pg3').feature('strmsl1').feature('col1').set('colorcalibration', -0.8);
model.result('pg6').set('xlabel', 'freq (kHz)');
model.result('pg6').set('ylog', true);
model.result('pg6').set('smooth', 'internal');
model.result('pg6').set('xlabelactive', false);
model.result('pg6').feature('glob1').set('const', {'solid.refpntx' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' x ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpnty' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' y ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpntz' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]});
model.result('pg6').feature('glob1').set('xdataparamunit', 'kHz');
model.result('pg6').feature('glob1').set('linewidth', 2);
model.result('pg6').feature('glob1').set('linewidthslider', 2);
model.result('pg6').feature('glob1').set('linemarker', 'point');
model.result('pg6').feature('glob1').set('markerpos', 'datapoints');
model.result('pg5').label([native2unicode(hex2dec({'5e' '94'}), 'unicode')  native2unicode(hex2dec({'52' '9b'}), 'unicode') ' (solid) 1']);
model.result('pg5').set('looplevel', [101]);
model.result('pg5').set('showhiddenobjects', true);
model.result('pg5').set('edges', false);
model.result('pg5').set('smooth', 'internal');
model.result('pg5').feature('vol1').set('const', {'solid.refpntx' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' x ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpnty' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' y ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]; 'solid.refpntz' '0' [native2unicode(hex2dec({'52' '9b'}), 'unicode')  native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'8b' 'a1'}), 'unicode')  native2unicode(hex2dec({'7b' '97'}), 'unicode')  native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'80' '03'}), 'unicode')  native2unicode(hex2dec({'70' 'b9'}), 'unicode') ' z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]});
model.result('pg5').feature('vol1').set('rangecoloractive', true);
model.result('pg5').feature('vol1').set('rangecolormin', -1.45E-4);
model.result('pg5').feature('vol1').set('rangecolormax', 1.45E-4);
model.result('pg5').feature('vol1').set('resolution', 'custom');
model.result('pg5').feature('vol1').set('refine', 2);
model.result('pg5').feature('vol1').set('threshold', 'manual');
model.result('pg5').feature('vol1').set('thresholdvalue', 0.2);
model.result('pg5').feature('vol1').set('resolution', 'custom');
model.result('pg5').feature('vol1').set('refine', 2);
model.result('pg5').feature('vol1').feature('def').active(false);
model.result('pg5').feature('vol1').feature('def').set('scale', 71666.4381308839);
model.result('pg5').feature('vol1').feature('def').set('scaleactive', false);

out = model;
