Return-Path: <linux-media+bounces-9003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E438289F072
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70D261F22550
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813A159596;
	Wed, 10 Apr 2024 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m428ZyYG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984832837B
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747668; cv=none; b=jRtihFSTFqKq5/NMrMzAQZAqtz8sZCnr4/J7V8IUT7WkdzGjFF7I1owS/cOLbYoVuYWzRad+4bW1IvDgE8Yx6LldAKw4c+yybl4Efn7xJVHXtSBEPw9qsbLnreHs4Zbx+8HFNUTqvbznBkN3kmwSi/yBdaQKZIezKNqGfcglsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747668; c=relaxed/simple;
	bh=IizWyO11E5emeHeF54h+6dhyRodICKphftr0PCL/0y0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mY4e8EbR607uTYyrMZkwecBAzi7zRsmUl14oJIdQWX9iAzx+lhBbWL4ZddmJTpn8siNSVEFi7FIRBCILiTHqprNjVRCkfrA1wG5rt11EJtY7zihoxQVVku+mEfRhFwr5x5S3jth9JEtsOt6jIEODk+FmwHGmA0/sHlQSC4sDiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=m428ZyYG; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b499588f72b11ee935d6952f98a51a9-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TVTowwXxuEBtAoClEaB++0T9r+YupGboxtqzR44HAgo=;
	b=m428ZyYGCNvq8WBfbYww2E03GUzoJIvn5b2vGv55dFMshjxgYKJjP+4mQ86O7THtkcLgu/SHjYE/dPgkSVntHMyCb4EXflcPAWw00O4HaHT9KvWaT2nM2a+sxz/rFw4BeHISU5Eby/MeniJuG8i6lYg+lXnrngmrgD5vCCqS7aE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:67b445c1-c7b3-4695-b57a-b65afddfee1e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:996c6a91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7b499588f72b11ee935d6952f98a51a9-20240410
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1251277473; Wed, 10 Apr 2024 19:14:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 04:14:20 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Apr 2024 19:14:20 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9
Date: Wed, 10 Apr 2024 19:14:16 +0800
Message-ID: <20240410111416.2204-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410111416.2204-1-irui.wang@mediatek.com>
References: <20240410111416.2204-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

[h264 encoder]
update h264 encode rate control

Release Version: 1.1.9

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index 06aa3fb83b4e8d9b6921f7429b66c37744aad4a9..a9e832a1db1908a1b91da72cf64746d56283c4c9 100644
GIT binary patch
delta 3784
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
HH?RE<R8KTB

delta 3686
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
WXbO}GO@*?cX;5~3;oa%0xBVCMGZ}OM

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index e91505e1194347a47ea9e48afce0ca9a790b37ad..d753236ec0791d8ba1ba16d01d0dacc64e6189b0 100644
GIT binary patch
delta 2904
zcmZ`*4Ny~87Jeth=WCm1^41U$A}>L*uv4v}QU|M+AasCAS5&O~W37%Xvb)&|qa)OI
zYXB9h?pC~LtlApfyiFGTL0>dTZ4CnA4_#2$kva~7L}W&^M3B<T%AS`*cV}mJGP(EM
zbI(0L-#O>r=PG7g#Z1i>14I*xA(qjz0C_YwAl4Xk5ljNEh6P-8n$|CcFp@@^Axl(M
zybY<F>m!mC7Hvvlkvh@lJ6z&2(M3v%(aNKp7PTgO4JirVmR1y6v_>lrLw?Z?ILxip
z$|bpEr-`ngn)V4(s?rnt-o?;NhWF-f38C^cw!0W(k$sS+j#8&5_nT-v<2yU$vrV3I
zBSo3$8?NuSZ*Uf5Yvr}&6qVnjkQeqV<lJ}&Q;PqB-)ZF>{v+l2W%*@X9<Nz)2FR*$
z+2WmQKGJu%c-k+<d5!8mLpF@>XekcmH9)lTwd2L1McKZ?Caz*K`lglpw(}av{}tmz
zVciLKalaJ+c8Le}SIcAr`$+1+CT1VYP%mbb4G{IAy%MkbP#+5J`TS1+t3}=6C9<hm
zHuf)0&OuWa-Y3L4N}LNFKv7E0Om<Ypz%FvC@-@gJ{gpqPHuyO!1|_-uNp(6$Nacv2
z4@hT`SB@lthrEB}HAoZfN6IJQG{?C?HZ`s4f9o$K7pmf5KN+ri8PbTZT0gDA`TzB&
zkyX`+U>3iq{t&PL!jHWRMpAfe5fqZfV{?HbPmd)+JbB}II?`pw3;5Lyg1T=a2IUXN
zG|Dyz9RfUC>qz8@sZb~;oLB&mNjBB2Vuo0nTIb9eB)4i3!6|A_P6Tk0=u>xD%L!IG
zNFypaTA~qeGG~zSor4=7qv8VCP3E}bKt*z0Ga;7jbLpXi)Vg>aJ6&rLlKH3gIIcQ9
z1rCu-r^`_{b0!_o@ulwRkU=)NQ=x-=?fxJl!NSkkm|qK&Dx+6ea<otQw$g&(U@pqY
z(%KkEAe(EGQ1)DH!IWspBVBiix<^>|1!trfzjwFDTW3?_Yz@zY?GVa^9^o2h7k!Uy
zW;vsYw(uc;<25vOLpV9^*KQ*h&X%I<Z`I{X+UsUxX$;nt0JM;e=jLH@YR-MQW#tH>
z=NF%Up4AxhXg{5WbV86ef6Z#n1?gPmdxEqY`Hew(>?>AtDM+tGeoK(fMESNLE%&gR
zjv$?dGMy5=5K-vF!?%JP@wm|)q~{~;4bnzb)SpK`w0<X0RHBVi!k){RtZ@ft69>M^
zl<6+v>b!#+d+ZQvEWFoI>__-o%$LX?61byer6<}iWZ}879k|IP_XtgnMuAfHIGzjH
zJO<gYi!^(55%ZHR5~f2A9|B~eCzDW;^pPK&Fe0mugIgrNewMc4dFiQA*pX7&NuSwX
z=a(9|NVe36aTSsZbeHl3963jv^(&y`)P?&1W-`z)9V<-L$RllRT!0<$e&g?vzS%ev
zN2X~RG?JA~Ye7LgP5PL|A5n*ezh-zTgFbUlSaEbjD5`1|5_R_$QA+t9X}8tE4HM?#
zK|E)_m^4N4grykEQ42p=K`CkK2}&T~3Nm&v0s{zZPDU#$n?-Cu)urD;BGt~ex!PTA
z_@k6<uFLEMs?D|BF2_SDs&<xAUUOY%Wz;`hQDY49%H$HS!`04Cq^`RP6r}d@EGQ%W
zmwB)d<_ZZlS$Mlpw@5PDXBbA~%bZ*Xsky?VRNIw#c>gG_>VXnpxw;6DwYeo7S&c1o
zv0R_FtbyI)>Ti63jn~PpRu(r8wEj}>$|ipmexslm2@HxkB2bJ$ODUtmBnx{ST!*M`
zYXI!u)!)RPx}FNKk)*ZH!m+SD2DTDg`}Y{{{*FZ<FoSq+{2CXg&K}H$7<F@*Tx#a7
zq`79lZptTAr%zDH8HlBnYNi48_X?a!+Vcs;>Ajc;^uqaU4@=8T2D@frM@QZ^=*?1>
zcUf=yD;5as$&R*!Qp$11?LZoKlkD5G(9Me5F_X7?9Yc8ITKExzBEz4g4D$EeQ}yO9
z_C-Xm>ejdH3pjt)b^~)lDVOJUVIK16s9cfhep&K8zDFsAoN{Lyj#uuqBI`gevdpB)
zI~&I??{cYR@6N(8+do#^-SFmrnAHc&ruDHo0~F&GPNMS&uhJ)Y@vXsR+wNeRDP@7D
zJK##L7hTDtmz%|mzBTw}i^uOJNuCV$zZZg2=D=EH64wI**vZWY>u_B7@Kd(-M|RGr
ziS}PycCqW>2eR3Itp5v7wS+a|sgnBmr3~yrXRkr6l5!q+!+bMYGo>66B)NB-oQgF1
z79;NJN3*4LKk}#hkw4v!Qs?<I7ASomtI-AT6b9)TK|1RmtBDWNvG@OdX%&*Fq1PFI
z?@FDOJ+#`tz)zB4(lWGsN<zKgPm1y3MKXD7V8tbf3BxNS>~}v-g-+7>SRXOt92-|C
z#cknDbVntnj4M1H2r-+eM{d9^abP4_20GFB!&N!R$=E+*aEyLBQ#LwDT=sNK26lHQ
zz<J!Ws%S_DqxDxbe93u%WipJ8B*zj5077H4{&XTd;qo}PUGN4TMv0wgeU*Xfc<3Dl
zwub{d5z#2{7C1CI$m>>TI&y-i-6ISvk%P^e#=;-K=EfKC=fH&HR~RN^*s4&1@%hS~
zqJ&-<7~Qcyf&38k(|s@$?#LkC`f(U6f;{(?FnAYhz#1D4TbW4#9iwhnIN%%Pu_kEY
zO$_Q|Ej$27ahoGyo*Z(m&M3&|GYx)hDjhv_k=;tVN2si$lqJqr13LQM3DcqJ1=&D?
zdwd4KvT~blp9MOfIo56MwgA4+)|4XnBbvWZ1nFU(At5JADygmbbgs!V(SEc>Ct0T#
z!*R&AUN43PIH^kD24uVYO8_sPH22MIkPKkAMwY^2S$DW~eJO;7Ns&AjxKRt=j!DPY
z6W0v_LVTzc)}yeZ4C2uG8)cBnjZR{7Bx7jUZ!piguMBu}>P#8jhZgIRPv8f%b7%+D
z<Gbu$wF};sA^Yf`p%tf(K80qGyHj?<gAlzvg6$QW9Tt9A*onRRB>9?Qkha91bbvOf
QdT9l`C#6BGfFkq10CXhrpa1{>

delta 2933
zcmZ`*4Ny~87QQFM=WCm1@@j}tqDhbpZi{26ZO4B?p#zMxVnyqATa}TeY}XxO%ZOEX
zef(5Xr7e1`p;Na4%iEVlYS9-ArB=fdMJ*k$uq$;Oegu`7VoM}atFG>OA-X#|yTfqb
zch5QZoO8c(?!EC8vz}tMVW$m}sbHJKMsomp46l(JY?df?A<lv#&Uzf1Ux5WQm9{~F
ztlR$*q*S&<C20gx@_{0KLRH{UiO0bdX$fmm$G8Q(Av=qf%y>7aD6%Naq&A|wXg3_<
zH=5LnU6R|uv`kNZk1f+B(Atkyz*QRjD0k-qlAq2TXB`_+J+<D!WDRK4MUzOBicG4G
zAVtK&f_;?Pl9AD9sC6(I^?@&@4sY>USwg0Le9^Pl{x+^Nsejr<NMW`{-LzMu&L4<i
zw+=_J`~#D^4F3z?%6IZ_@p-e<E05<pS3EEq_UM5I4yoeP9+=~2>AoqRnT^8YNR|TK
zeIyfcQMO6#*isznU;>8%yQX>!I8Q}6Az74;9M}VXd8-Qm>g8>fhgB+#i^hI(nssq3
zc|6^zp}|i+Qe=A$UPHs*|LJ`I;n<;-s_6w)+@IaN#1O$85aXp1_X`pbqUFo!Th*~p
zPxn<n2L<$O^)F`XKIP=FC107?Y>^_W$3^Rebpf4HlK}nn<(lUpS1zsDI|)Aq_uH!J
zxpn{Be<iJ{i-#uKUH3HP?mKLq>2d#m_qlZ0;RGm`|9E&iV0+xDe*-e;+Rv6lC9VBz
zAy{bdX9<u=XB|mHoO`6uEVPRHYm;$Lp}lOl&9#c%B0QWs==~$pp;9(}z7%_mu4!1u
z204bj>CVy76AcM)R=(FT8Q?5cAG^v`ea<Nh86+iV2^~LniS?r3M~T<a9(gG=P=hBP
z>@?Lg7gFgKj}<($(qqQ4$+Hm|F*RCoT-G=ZPS7=td(roBV;W%M&v<9UCc4I(0zvwz
z_noM<g8BJ^{3al}^g(fD{WbBsY9TF@zMDSN6bozVYfXu0d$6f+TC$RnrN2Z!Ainu2
zZzpUhyL<GhFH+)tt&cX_E$$Tu#0ywl%ssV@<LwScFh~5=Y+%Sm@#uq)cOR|!q6|}i
zsyScr-aH=!xwE+hV1#C#SPZ$e;>7lyJI0Z{kooJUID<Wp3E=|73&ObkBxg7g#!i&`
z!uVN~`@`6T_-q*OK-?b2d1&7m#xXw5&>hAFXw#$M7qB63f5jOthZUKq=nv!95f6oN
z209wfV}5Y`C=!xTMYOQ*92V<=#QWs-uQF5?Wp+y9O}8YuK`;+V#UX|-#D0nLF_CYl
zOMEdQBf-p@cB7I_8W2xQevxPgq(?@A&!*BhQpsnDdOb-{I31G$ND$r@G?FIn2$8dZ
zUh&1lJ*sb+XYxF1JzX+4UdFhY<GY$eR+=`tzQxFU6c?B-@l7OhnL1lug`nKu@;yK~
zZEu~8EjHR}My&HM#Ut>t|F?*n{c~{~_OF5=y5#gmh@(}ft+7LQ(1~EaV0!{@vFqZi
z_2XhuU5A)pxxSoe)%)(EwnO6ebolfqxUTd};<UKC9ASle!8}z%v<y)!knuQr`Aih<
z;P#m$jIyLn#uGT&_8UmBba9=YE>9=^5pAdE95;z{dRF_@xG34)#S!fVPZy^mfA>V2
z@J`e^V-#68$|jR<J%w?!^4vUd)3fKyP(_E&(Z~&gxmIjmt^~bi3u5q9ZazpW&YRJy
z;rwE}e@4z*!6HxjdO4uzwe~a=)wVChe(i0~f(F^~O<+Q?h;HiOP`Rz+m)7oV`WNxn
z8p0}M5Vl4ntj$EU(MBc0K8X*?!H!nI1MK)_j@*AC1z<m&(=`vrwOz4LONFkVaKl@>
zmq$Q4^<VrIPAokGSPofrX_Z<z&b^5X%R|mdKs=l_NvCFE4$<n_RtzvG@^(cR5R20W
zu@abu`=Jh-tDJWB&c!o*zt?6hSI&8_t1r~EKw)2Yj1Wn*52U_{IyBJazIm8uL0|0D
z+97ESuUx@AZquZPs<eq7>6>mX@8upx`s(g|$32GMk4G<JQHXYRMK2a2kBN55!+lRH
zx$6hC%ARAcyo+Pql@1hb8$?k#-90oP$CE>=m8QKq569%tSa9|27yl!ybs}u;H7;j_
zutVZeOdk2w2E-wJYp~kBD_CcuE$r`~NX0pXspK)M%jLLhSpXIC2iFsoOge|xN8rak
zvJr)J{|y`XY4eRYag6@qL$2oz_xx=K6S}(m^2s0GQOyr={a<|Q6|Rv_yK<7BNXJv?
z9<=FoO3^1CvA|reoM^{I#cqw8x6|6d3gkT)n6H%kW~kgZL*>4ivN%++(8{;~XRw5C
zl{tvx!noi%XLvS@Q@{WBwN*(~V~f}p3^Jx1t>m!{p$YzE(bM{|)zj80Dy0nrc$G{o
zotW`!Wn=JFh5Ni)DR7%M-LgidpWx!RD*G194yL=BXydmwPHeH125()2dvg1Dk_sHM
z?&q)75JNBjGZshn{kbZmR-S+Vo(lY4JHRQ_xke{J8f3T@G4Lg?R&i{)T}qTzN&rZW
z&&5oJyL<)Db%{e0PopBPa6QSwY+Up_3%h2hxXH*yp}J5qSRk)opCRRhS9|}#!b&yx
zTyr@19r(NlICvS@DEyU%#n8J(rhxs?%p0SHK^0_p*(V`C0`v54kAy2K$aJkU!g8qa
z)*0aq>;V@$14>!#gb$;4{|vxasNZEY!Hc-5btbq0knK&M1&h_-bUC9T-<)R)aZ@b~
zG|%eSG6Q0DGtri~=TG=xy~f#a`Z1Mep|>v%VATNudLCv)T>S#z1MNyKf<IvFzZF56
zv42d=$yDl8iZ5qYrh^GlWz@Q67sC-Kb$we5OYx&Cfs0V;9WDX9c5=O!-i0IpziU<*
ztWc3C*XA;aG%DM;CGtkW+=Ug##}ntRBJz8%3^t>&#tHEleVG$dcr?yYf??oLzzWv^
zCzvs*<4*V<MqD-T!Os}y;BIKaXW6^199~kPxc&p^z|W2kp$%fZ$rW%T!s?IW2E{f>
jFbBmwcu?;qU9gQZ!m~#uFoj*evLDtfHIVm1(WZX^1&jLn

-- 
2.25.1


