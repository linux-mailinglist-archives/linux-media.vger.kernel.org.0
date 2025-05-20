Return-Path: <linux-media+bounces-32953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8BABE415
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59734C30CD
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 19:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19562280CFC;
	Tue, 20 May 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTYOeZvH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F9280CFB
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770752; cv=none; b=T0u4eiA4BRjzmFEg4u5COzlhYoin/9Cri+3qmKtRwzYgLeWZJALdcBdwOQqV8Dum/wkJsDoJ8ndwo50Vvhnj1XTMVJGLlb/1oWS/r9LgqjI3efSz5coXhfsaPIsYxbMvMEsCLdtgRs8+a4V3fRLcawb4VgeIAL68fQQlPQa9+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770752; c=relaxed/simple;
	bh=fhwrc1tbFQioZ+O75VVgYeJFQo/oxLMljz6u/pC7sPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBif8dPXMbm2SLT/JZjU4KbHAD7lAKAlfaHHPoXPyKQNlSjPmJRdG3e+O3WDGrRPKCJsUunijWJOKyx1qVEiGGtEzUZAxtrmiYPqVhVtJiMxwtOBdMvKdtymsQwQ2kXukrjItPEdo5WeXN520Ig+m5QUBa+s2sthCP1klDwD0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTYOeZvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGj1Hh031039
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFL2XC8qzId5Dd6D3sundaqd
	2zkC9xDf5x4zzleSYqI=; b=KTYOeZvHmpbm0b1biMqZxWJQBdNnXPFYO9mTYhsT
	YPWuEUZ78DJEGA//OB9ZmFNK4J008bld10zwULWTbl5EwKlw9y3RyLVMPixW/vCo
	WxZaBXkqaa42wX11EirEuqi1VUen5YAMEl7+P5zwo7SxUqo0scO2tC/foTx5AMWm
	G0+4iT2ibWXTylRobSarSg9/5ivuAv7ywshzMgrDTsrppE/rGpOv4Hzu3aw7UlCi
	aSGrkcA5LHta2RWzukcQajKrbb9JchY4ETBoD9GDOOSbnVLIg693gmlLhMHSXYVt
	ZnU+vIE28wKqHw4XDzG+85Xw3j0cNT8CbzF+UVbiUZ/GIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf00ghb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:52:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so981180685a.0
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770748; x=1748375548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFL2XC8qzId5Dd6D3sundaqd2zkC9xDf5x4zzleSYqI=;
        b=pMVCe+C36yYTfWxeTbCHAiL6FSQpoTup1b0KH/nYjWysXkpezHIm8HtutjOuak24Np
         mKbOJAiFLVPQOuPaZ1ShonhsdxKPI+qz6ynMuvvvymv54EuCMefdI97ib11A5/cUOabC
         OdeRKBE6RVVF1sMz3FSx/i3C2NZEXLoWRHzvPqqzD/atAY/cdozbU/2tAhMtFsLb9hf5
         HTT14yJQXqSIu0LrZoYHVC+lBRrLZio1ZT+WfNY6z37hvgv782dEHwoTsk/A1AxXmcq+
         3PbXupEFM8TERttwblJcp2lcE6D2aDYlTa5xVlwtv3jC6gEH2Gfqw9Cqvvl5+0mzcWj/
         0m0w==
X-Forwarded-Encrypted: i=1; AJvYcCWNrUb9PylOo+sq19AbXRJrrZZEX6tYyd9lMgUxRCirPL6y8qOsX3AKDaXAFvs4wy/QFhUywvJxbt0HxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyePYx6DQ3TpL/GGByjqW26GvvBWM4PMgm/rC9gzV9NIwZ1EGf
	Jpqvj/TWIABq6jEUH28uGxxpOWx1+9ECPnz0r8K0FpcFOE7UEzjciFMkT44Kyw0NaJg2amN6FsR
	frZQq4T7HSBFQhnNbibDJvjWgCTIz07PKRwsoIHZJHBWe4qmRI39atjSI6bfpyDJytw==
X-Gm-Gg: ASbGncsgEAmy4mIeybyJD/FYbea89oQMvKv9ARHJV+7jrCDFUIqKYRdGNvhejFwEekw
	8H3T3PxXF2OSCvU8EAs0Iy6vZ1wtJ3eUQWMaxHBestVX6QCPVG+EHzUBZ4D3Y+j7u9xxTLyTkyg
	sGaKbPCHEotQt5MKpu1ak7lQF352HsbuWbhtNrUxuGvCdTw2Ij5A7tB+688t2MXCrlKrlz+MhaY
	3iGxi1isl/Y35JT/aeZnbS03JlGxG1BS6T7cvpaKE6Fvi2y6w4iwuHlll/6rZDshwPmWkmsf6Sb
	ofoQ2Ky8D50WIt+8pcaIb2VZufT+dwYccqpKkNb+iv6GHyDgDLNoXmrcDiYrWez2OOF8jXJK0rU
	=
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064508385a.48.1747770748630;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEldE9RxymngN0SkiNE/w7R4kBGpcHXriCXVbNFCA/wbxlYIebBJIZ4sUG/sX2j3pgpIKH5w==
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064501685a.48.1747770748082;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1637dsm2462421e87.35.2025.05.20.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:52:27 -0700 (PDT)
Date: Tue, 20 May 2025 22:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <ggx6kzto3qy2blhr5yiqhy37wmgs7c2hvvp4wyfuf4iclk3bkj@7masdrxeaddf>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
X-Proofpoint-GUID: -vH59oB-ylrGd8PQkzF34veG208kiBlc
X-Proofpoint-ORIG-GUID: -vH59oB-ylrGd8PQkzF34veG208kiBlc
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682cdd7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=ngZlcTqnKCSXXy_N_KUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX1WLBrH85m2uL
 u4II2Ih/YUFQvJuR2yvRZQzYGPlrjfPnDv7X+uCWFrD4fWtg4L51pNvEamkV09IN5ea7b6/TpBs
 hFljJ12v6Wod817t1BvI30hnEXsNGB1iLeskl9cBnW+GmOwfT8sSXyUPzgUIPehgl3YJgHwAiii
 8PgK8qUx7Y13umroifBrReMrvc4/dTkYxJqxS3vBFHKVze9uMU5Di6eR5uG0Mk3k1D0xN0cA1La
 uFTqIHGlFfvZ/jMY/dcoxzLSy39EkkbVSq2EKInpKZFDyXDN4pXWatU9+joLuRDhdxsp6H5Z22X
 dVTZmFVrptLn/0qHyXQeCAD+Sd9w4DwzXv/kix8vuBMr1JjeH/CuIsvDOZ96e1DopLvXuNXPDcP
 WOEKnNW/mAZRb0Xaiz15/fnkwTxxrWOzGZjI5Hnmk4BN2aQKvaCRw9LwRog7aTFTuy+e9TGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=753 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200160

On Tue, May 20, 2025 at 10:30:30PM +0300, Vladimir Zapolskiy wrote:
> Hello Vincent.
> 
> On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> > 
> > Add the camera subsystem and CCI used to interface with cameras on the
> > Snapdragon 615.
> > 
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
> >   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++
> 
> Please split SoC specific changes from the board specific ones into
> separate patches.
> 
> >   2 files changed, 156 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > @@ -11,6 +11,10 @@
> >   #include "msm8939.dtsi"
> >   #include "pm8916.dtsi"
> > +&camss {
> > +	vdda-supply = <&pm8916_l2>;
> > +};
> > +
> 
> What is the benefit of enabling CAMSS on a board without any sensors
> connected to the SoC? Likely the board specific change has to be removed.

This is not a board, it's a PMIC-related include file which just wires
the supplies.

-- 
With best wishes
Dmitry

