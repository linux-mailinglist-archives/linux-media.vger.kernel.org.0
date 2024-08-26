Return-Path: <linux-media+bounces-16781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965495EF71
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E55E1C20F40
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8840150981;
	Mon, 26 Aug 2024 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="heOhfeQR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0013E033
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670398; cv=none; b=JNctnm4BHIAHvjonSoqNU1wDaqBqhx3Wnq6Mpxkz2rA8wHY8kFU6Lgh+VHF7rDCwoQhHUaRflAG60BqQN78PNQ3gtuuioERfH+o9VK/bfpUPOxmu6D3NsXZxwtqmsOkGLyZNf2MVTu5/N2XH0stDt0ST/VlCIUQw2nmQNhsVjIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670398; c=relaxed/simple;
	bh=hXznDGQITta+08NuXER7F2848SoRDvtPwc4E1tng3qk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=HpryWJnoL+Dtbkq21QxQiq/z8mJ1yd8G9D/FrK1pX5JtUFRP7CCSjPlLSGzdxI6ZEEzgXLT0oXus3ThqoKaTwrk0aU5uT3k+SWZhHEKYJdkYJJETmaJD7kkVF7L3gVBdi6rQsIBVxECOJHnMV10OOh2qp8eL1RVMMtUBg4OXPEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=heOhfeQR; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240826105849epoutp01b6ca5efcb9bdd30c6ada08ffc0be9c48~vQinQMwLp2409524095epoutp013
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 10:58:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240826105849epoutp01b6ca5efcb9bdd30c6ada08ffc0be9c48~vQinQMwLp2409524095epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724669929;
	bh=hXznDGQITta+08NuXER7F2848SoRDvtPwc4E1tng3qk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=heOhfeQRa3F+jq+EkeORFCm+ZzM+I7DDWngAFGjjoSZu16BA74mjxz3/nlCGZ3Mel
	 Iht7jzTwJtxvy468P33SSLTAIZOzFfasA0GcVykFPcZqVyX6vljeNXsF4wZJCjIyPF
	 Degd2rKWaRpcPTBX8Mkd6TbXjaqVgeqXX+riyuN8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240826105849epcas5p4c81296b7ffc53e25220de46a38c902b7~vQimyf3CV1254012540epcas5p4E;
	Mon, 26 Aug 2024 10:58:49 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WsnjM27cwz4x9Pq; Mon, 26 Aug
	2024 10:58:47 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F1.E6.09640.7EF5CC66; Mon, 26 Aug 2024 19:58:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240826091344epcas5p221ef522aaa6f6e943f7351f8fa688a49~vPG3Y-cSP1090210902epcas5p2s;
	Mon, 26 Aug 2024 09:13:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240826091344epsmtrp22097ab86f7386a89292a152ae132f11f~vPG3YKFYi1679016790epsmtrp29;
	Mon, 26 Aug 2024 09:13:44 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-74-66cc5fe7708c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.A4.08964.8474CC66; Mon, 26 Aug 2024 18:13:44 +0900 (KST)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240826091342epsmtip2ec2b811249dadd1050111632ca995943~vPG008zF21793917939epsmtip2B;
	Mon, 26 Aug 2024 09:13:41 +0000 (GMT)
From: "Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Nicolas Dufresne'" <nicolas@ndufresne.ca>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
	<gost.dev@samsung.com>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Mon, 26 Aug 2024 14:43:41 +0530
Message-ID: <0ccb01daf798$409fb8f0$c1df2ad0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE+FHJLEG7bRbSgl/2Ewycw4h6AZQMC8PEqAYm+p/azMPFrUIAdsFPw
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOJsWRmVeSWpSXmKPExsWy7bCmhu7z+DNpBi232CzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZotNj6+xWlzeNYfNomfDVlaLGef3MVmsPXKX3WLZpj9MFp9O7WS2
	WLT1C7sDr8fiPS+ZPDat6mTzuHNtD5vH5iX1HptfdDN79G1ZxejxeZOcx6mvn9kDOKKybTJS
	E1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOATlZSKEvMKQUK
	BSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGc0dO5m
	LJhrXdG0qIupgXGTRRcjJ4eEgInEyen7WLsYuTiEBHYzSuyceo8ZJCEk8IlRon+rBkTiG6PE
	0/fzGGE6zr54yQyR2MsoMW/+EyYI5zmjxLIDG9hBqtgE9CXun+oBmysiMItRovPlYkYQh1mg
	l0ni7fZDQC0cHJwCvBIT/lmDNAgLuEksuLSAFcRmEVCV2H98IwuIzStgKdF/5gQbhC0ocXLm
	E7A4s4C2xLKFr5khTlKQ+Pl0GSvISBGgOdN2J0KUiEsc/dkDdqmEwA0OiQNtL9gg6l0k3u17
	CPWOsMSr41vYIWwpic/v9kLVJEs8XvQSan6OxPo9U1ggbHuJA1fmsIDsYhbQlFi/Sx8iLCsx
	9dQ6Joi9fBK9v58wQcR5JXbMg7HVJObc+cEKYctIHF69lHECo9IsJJ/NQvLZLCQvzELYtoCR
	ZRWjZGpBcW56arFpgWFeajk8wpPzczcxglO0lucOxrsPPugdYmTiYDzEKMHBrCTCK3f5ZJoQ
	b0piZVVqUX58UWlOavEhRlNgcE9klhJNzgdmibySeEMTSwMTMzMzE0tjM0Mlcd7XrXNThATS
	E0tSs1NTC1KLYPqYODilGpi0Hn2UFVy9I3EKS43zN1HFb/EbDB3lpu+Wqf2pMcX8oXeAvaVo
	Ril3Vdumnx3rGu/dXMJwoq368J4nOty1Lj5CC9atv9Xdcjr+ztG2B5tZfQ9ERy45fW7uFWcZ
	wSefr7SL8N94YMY1v2XSPXdnC9lLtwsPL1zXKSI/J9T4/ZTXG0OlZz1oeH0i4+qMF3ofL7HN
	VX4RtIm54t1JE+/Cnv8tJbEXE7cLfJV7VR6baveh4c2CF/33foQqmxz9NdnUIYThTspx1oQI
	toPxS4rdoyZPmLuwxfL8UouyWcEin3/x6nM/Cm++/z52En/JMutvOWI1c7QfdzBe6z54/E1l
	Ud2H7d+mV2u/cOGd9MHh1/UKJZbijERDLeai4kQAEDhZ4FoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWy7bCSvK6H+5k0gwdXVSzuL/7MYnFo81Z2
	i5sHdjJZXJx5l8Wi78VDZotNj6+xWlzeNYfNomfDVlaLGef3MVmsPXKX3WLZpj9MFp9O7WS2
	WLT1C7sDr8fiPS+ZPDat6mTzuHNtD5vH5iX1HptfdDN79G1ZxejxeZOcx6mvn9kDOKK4bFJS
	czLLUov07RK4Mnpn7mQsOKRTcaZvE2MD43mVLkZODgkBE4mzL14ydzFycQgJ7GaUWL9iCitE
	Qkbif9sxdghbWGLlv+dgtpDAU0aJ26elQWw2AX2J+6d6WEGaRQTmMEr8nXqUEcRhFpjKJPGz
	fQfU2HOMEj86VgJlODg4BXglJvyzBukWFnCTWHBpAdg2FgFVif3HN7KA2LwClhL9Z06wQdiC
	EidnPgGLMwtoSzy9+RTOXrbwNTPEdQoSP58uYwUZLwI0c9ruRIgScYmjP3uYJzAKz0IyaRaS
	SbOQTJqFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgONXS3MG4fdUHvUOM
	TByMhxglOJiVRHjlLp9ME+JNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1
	CCbLxMEp1cB04mDr7Xl+UZv0vMMObLWp6KxxOr3T3FTQXqBSsNL41sTVXJ9Ory559ui2SLLe
	3MDPHzfJW6YfPGS+o7LLL1X+9jGuxlnqodxRTlbL1/k+mxDpHfLrikPxNX5P26CzdTICT3t3
	1mvrbFqVwsw5acahw/y8IebWlQfWXfjc7txTlFUf4GMgn3S3/GfTLdeL+hNmhq6vu7nlu0vA
	x03a4ZHtPWorj3y34Z+kOztCUSYssuZr1AanqEjl+ZNVRF7O2L49mrl/5a+DLLPez13XtCVT
	RG650JJ+AYVfj7J5C/VKOi59DvWZH3uhu+6xaN4l0yu2u1+a/21g+s1zWJ3rg2fbLatrXFff
	3H6cs9WHd5ISS3FGoqEWc1FxIgC97wxAQgMAAA==
X-CMS-MailID: 20240826091344epcas5p221ef522aaa6f6e943f7351f8fa688a49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e
References: <CGME20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e@epcas5p1.samsung.com>
	<20240806115714.29828-1-aakarsh.jain@samsung.com>
	<3765b1674e276afdc302def55327396a0a29cc63.camel@ndufresne.ca> 



> -----Original Message-----
> From: Aakarsh Jain <aakarsh.jain=40samsung.com>
> Sent: 07 August 2024 17:23
> To: 'Nicolas Dufresne' <nicolas=40ndufresne.ca>; 'linux-arm-
> kernel=40lists.infradead.org' <linux-arm-kernel=40lists.infradead.org>; '=
linux-
> media=40vger.kernel.org' <linux-media=40vger.kernel.org>; 'linux-
> kernel=40vger.kernel.org' <linux-kernel=40vger.kernel.org>
> Cc: 'm.szyprowski=40samsung.com' <m.szyprowski=40samsung.com>;
> 'andrzej.hajda=40intel.com' <andrzej.hajda=40intel.com>;
> 'mchehab=40kernel.org' <mchehab=40kernel.org>; 'hverkuil-cisco=40xs4all.n=
l'
> <hverkuil-cisco=40xs4all.nl>; 'krzysztof.kozlowski+dt=40linaro.org'
> <krzysztof.kozlowski+dt=40linaro.org>; 'linux-samsung-soc=40vger.kernel.o=
rg'
> <linux-samsung-soc=40vger.kernel.org>; 'gost.dev=40samsung.com'
> <gost.dev=40samsung.com>; 'aswani.reddy=40samsung.com'
> <aswani.reddy=40samsung.com>; 'pankaj.dubey=40samsung.com'
> <pankaj.dubey=40samsung.com>
> Subject: RE: =5BPATCH=5D media: s5p-mfc: Corrected NV12M/NV21M plane-size=
s
>=20
> Hi Nocolas,
>=20
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas=40ndufresne.ca>
> > Sent: 06 August 2024 20:08
> > To: Aakarsh Jain <aakarsh.jain=40samsung.com>; linux-arm-
> > kernel=40lists.infradead.org; linux-media=40vger.kernel.org; linux-
> > kernel=40vger.kernel.org
> > Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com;
> > mchehab=40kernel.org; hverkuil-cisco=40xs4all.nl;
> > krzysztof.kozlowski+dt=40linaro.org; linux-samsung-soc=40vger.kernel.or=
g;
> > gost.dev=40samsung.com; aswani.reddy=40samsung.com;
> > pankaj.dubey=40samsung.com
> > Subject: Re: =5BPATCH=5D media: s5p-mfc: Corrected NV12M/NV21M plane-
> sizes
> >
> > Hi Jain,
> >
> > I haven't dig much, but I have a quick question below.
> >
> > Le mardi 06 ao=C3=BBt=202024=20=C3=A0=2017:27=20+0530,=20Aakarsh=20Jain=
=20a=20=C3=A9crit=20:=0D=0A>=20>=20>=20There=20is=20a=20possibility=20of=20=
getting=20page=20fault=20if=20the=20overall=20buffer=0D=0A>=20>=20>=20size=
=20is=20not=20aligned=20to=20256bytes.=20Since=20MFC=20does=20read=20operat=
ion=20only=0D=0A>=20>=20>=20and=20it=20won't=20corrupt=20the=20data=20value=
s=20even=20if=20it=20reads=20the=20extra=20bytes.=0D=0A>=20>=20>=20Correcte=
d=20luma=20and=20chroma=20plane=20sizes=20for=20V4L2_PIX_FMT_NV12M=20and=0D=
=0A>=20>=20>=20V4L2_PIX_FMT_NV21M=20pixel=20format.=0D=0A>=20>=0D=0A>=20>=
=20Have=20you=20re-run=20v4l2=20compliance=20?=20(better=20be=20safe=20then=
=20sorry).=0D=0A>=20>=0D=0A>=20I=20ran=20v4l2-compliance=20and=20didn't=20f=
ound=20any=20issue=20wrt=20to=20the=20changes=20added=20in=0D=0A>=20this=20=
patch.=0D=0A>=20Please=20find=20the=20v4l2-compliance=20report=20attached.=
=0D=0A>=20=0D=0A>=20>=20>=0D=0A>=20>=20>=20Signed-off-by:=20Aakarsh=20Jain=
=20<aakarsh.jain=40samsung.com>=0D=0A>=20>=20>=20---=0D=0A>=20>=20>=20=20..=
./media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=20=20=20=20=7C=2010=20+++=
+++-=0D=0A>=20---=0D=0A>=20>=20>=20=201=20file=20changed,=206=20insertions(=
+),=204=20deletions(-)=0D=0A>=20>=20>=0D=0A>=20>=20>=20diff=20--git=20a/dri=
vers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20>=20b/dri=
vers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20>=20index=
=2073f7af674c01..03c957221fc4=20100644=0D=0A>=20>=20>=20---=20a/drivers/med=
ia/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20>=20+++=20b/drive=
rs/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c=0D=0A>=20>=20>=20=40=40=
=20-498,8=20+498,8=20=40=40=20static=20void=20s5p_mfc_dec_calc_dpb_size_v6(=
struct=0D=0A>=20>=20s5p_mfc_ctx=20*ctx)=0D=0A>=20>=20>=20=20=09case=20V4L2_=
PIX_FMT_NV21M:=0D=0A>=20>=20>=20=20=09=09ctx->stride=5B0=5D=20=3D=20ALIGN(c=
tx->img_width,=0D=0A>=20>=20S5P_FIMV_NV12MT_HALIGN_V6);=0D=0A>=20>=20>=20=
=20=09=09ctx->stride=5B1=5D=20=3D=20ALIGN(ctx->img_width,=0D=0A>=20>=20S5P_=
FIMV_NV12MT_HALIGN_V6);=0D=0A>=20>=20>=20-=09=09ctx->luma_size=20=3D=20calc=
_plane(ctx->stride=5B0=5D,=20ctx->img_height);=0D=0A>=20>=20>=20-=09=09ctx-=
>chroma_size=20=3D=20calc_plane(ctx->stride=5B1=5D,=20(ctx-=0D=0A>=20>=20>i=
mg_height=20/=202));=0D=0A>=20>=20>=20+=09=09ctx->luma_size=20=3D=20calc_pl=
ane(ctx->img_width,=20ctx-=0D=0A>=20>=20>img_height);=0D=0A>=20>=20>=20+=09=
=09ctx->chroma_size=20=3D=20calc_plane(ctx->img_width,=20(ctx-=0D=0A>=20>=
=20>img_height=20>>=0D=0A>=20>=20>=20+1));=0D=0A>=20>=0D=0A>=20>=20These=20=
size=20needs=20to=20match=20the=20sizes=20reported=20through=20TRY_FMT=20(a=
nd=0D=0A>=20>=20S_FMT)=20sizeimage=20for=20each=20planes.=20Is=20this=20cod=
e=20being=20call=20withing=0D=0A>=20>=20try_fmt=20?=20Will=20these=20value=
=20match=20or=20will=20this=20change=20cause=20the=20value=20to=20miss-=0D=
=0A>=20match=20?=0D=0A>=20>=0D=0A>=20This=20code=20is=20getting=20called=20=
within=20try_fmt.=20In=20MFC=20driver=20we=20are=20not=20returning=0D=0A>=
=20any=20sizes=20in=20TRY_FMT.=20We=20are=20only=20validating=20codec=20and=
=20the=20pixel=20format.=20We=0D=0A>=20are=20setting=20luma,=20chroma=20and=
=20stride=20size=20in=20S_FMT=20to=20inform=20user=20space=20for=0D=0A>=20f=
urther=20buffer=20allocation.=20So,=20this=20change=20is=20not=20going=20to=
=20cause=20any=20mismatch.=0D=0A>=20=0D=0A>=20>=20The=20reason=20is=20that=
=20correct=20value=20is=20needed=20for=20allocating=20this=20memory=0D=0A>=
=20>=20from=20the=20outside=20(like=20using=20a=20DMAbuf=20Heap).=20Perhaps=
=20its=20all=20right,=20let=20me=0D=0A>=20know.=0D=0A>=20>=0D=0A>=20>=20Nic=
olas=0D=0A>=20>=0D=0A>=20>=20>=20=20=09=09break;=0D=0A>=20>=20>=20=20=09cas=
e=20V4L2_PIX_FMT_YUV420M:=0D=0A>=20>=20>=20=20=09case=20V4L2_PIX_FMT_YVU420=
M:=0D=0A>=20>=20>=20=40=40=20-539,9=20+539,11=20=40=40=20static=20void=0D=
=0A>=20s5p_mfc_dec_calc_dpb_size_v6(struct=0D=0A>=20>=20>=20s5p_mfc_ctx=20*=
ctx)=20=20static=20void=20s5p_mfc_enc_calc_src_size_v6(struct=0D=0A>=20>=20=
>=20s5p_mfc_ctx=20*ctx)=20=20=7B=0D=0A>=20>=20>=20=20=09unsigned=20int=20mb=
_width,=20mb_height;=0D=0A>=20>=20>=20+=09unsigned=20int=20default_size;=0D=
=0A>=20>=20>=0D=0A>=20>=20>=20=20=09mb_width=20=3D=20MB_WIDTH(ctx->img_widt=
h);=0D=0A>=20>=20>=20=20=09mb_height=20=3D=20MB_HEIGHT(ctx->img_height);=0D=
=0A>=20>=20>=20+=09default_size=20=3D=20(mb_width=20*=20mb_height)=20*=2025=
6;=0D=0A>=20>=20>=0D=0A>=20>=20>=20=20=09if=20(IS_MFCV12(ctx->dev))=20=7B=
=0D=0A>=20>=20>=20=20=09=09switch=20(ctx->src_fmt->fourcc)=20=7B=0D=0A>=20>=
=20>=20=40=40=20-549,8=20+551,8=20=40=40=20static=20void=20s5p_mfc_enc_calc=
_src_size_v6(struct=0D=0A>=20>=20s5p_mfc_ctx=20*ctx)=0D=0A>=20>=20>=20=20=
=09=09case=20V4L2_PIX_FMT_NV21M:=0D=0A>=20>=20>=20=20=09=09=09ctx->stride=
=5B0=5D=20=3D=20ALIGN(ctx->img_width,=0D=0A>=20>=20S5P_FIMV_NV12M_HALIGN_V6=
);=0D=0A>=20>=20>=20=20=09=09=09ctx->stride=5B1=5D=20=3D=20ALIGN(ctx->img_w=
idth,=0D=0A>=20>=20S5P_FIMV_NV12M_HALIGN_V6);=0D=0A>=20>=20>=20-=09=09=09ct=
x->luma_size=20=3D=20ctx->stride=5B0=5D=20*=20ALIGN(ctx-=0D=0A>=20>=20>img_=
height,=2016);=0D=0A>=20>=20>=20-=09=09=09ctx->chroma_size=20=3D=20=20ctx->=
stride=5B0=5D=20*=20ALIGN(ctx-=0D=0A>=20>=20>img_height=20/=202,=2016);=0D=
=0A>=20>=20>=20+=09=09=09ctx->luma_size=20=3D=20ALIGN(default_size,=20256);=
=0D=0A>=20>=20>=20+=09=09=09ctx->chroma_size=20=3D=20ALIGN(default_size=20/=
=202,=20256);=0D=0A>=20>=20>=20=20=09=09=09break;=0D=0A>=20>=20>=20=20=09=
=09case=20V4L2_PIX_FMT_YUV420M:=0D=0A>=20>=20>=20=20=09=09case=20V4L2_PIX_F=
MT_YVU420M:=0D=0A=0D=0AGentle=20reminder=20to=20review=20this=20patch.=0D=
=0A=0D=0A

