Return-Path: <linux-media+bounces-30938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D4A9ABDE
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0CCC1B6557C
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 11:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96DD225414;
	Thu, 24 Apr 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLoqEAbR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82F2139D2
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494367; cv=none; b=dY7d8jmHQa0Cy4JbU+pbQfAwNqi6/DfJQpjQVX6pVhEYPzm8U4H2pGoxfJizhR+JRjobSo73nYAV0xDofIczoLXIWjjyLIwjYnuo+glPM8F5vHuWbOMirZR/kKK16qUJSSI5GcWbqfppb7rKOuaOPF29PeIXfjpXg0+s2aQxzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494367; c=relaxed/simple;
	bh=CS6HOnMzlOIh4rt+JQgWXVJplUSPY8Dz4kIQKwWC5So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX+4ta+3z6bAgLbi+ADjJQFZIyHjPN57JnbjnRn0epFW+IqiJoE7SSa+H7CxWEBE63wCZqTYPa7hcKIfEadpiPsHIEby4WJ37S+DS4m3saRrFY7UCqT2ZazPpj59XOG+zM7cPQyumvAmkD5qxD4JMS+Vq+kZszF4qY9fWTq8gyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLoqEAbR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAvCkp007493
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 11:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=61EDQ7yhc0TXJTg7fz7zJ9Ea
	tL2RLDm8Ww7XI56evFo=; b=eLoqEAbRFhA4WyNcJHFqKS4SV2RPmgG24mRTHIfP
	t/oOfsnB46Zb5kDzroOaS6rIinch1eB2zs08pptQk6FIVP45xzBCuEg+walUm4EI
	QtIbGvvuiHeP56ON06e9/8OkS+05acvez4NSg9UlXnHD/w0a+1XImtGDRiZtb7c5
	y+qpLRvGutPTV+dD4z1JiBuaLddwBzitpfvLtmEwzK1LUlrIyEsdYU5+YXELP0P8
	jsYZbCBfpRXWiiMx/dK3rpGh8GDOlpb4coqRHnHKJBigt45IEJufznm2Tt1y3/zP
	Hk2zbptU7WRpZdmG3AupcmMOHmQHk6XnWnSFZ2Vrj/kgUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1nd6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 11:32:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so148510885a.1
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 04:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494363; x=1746099163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61EDQ7yhc0TXJTg7fz7zJ9EatL2RLDm8Ww7XI56evFo=;
        b=C87Qrai8X5f95+I+4kswTB/YlcgPX3OemWpUUglINuOcTxwUSbh4FngIXHUpBl0F5T
         dooGVLPeIBo6id4+ryYHW0nVX0k9MWEl0JoIZ0thSPovyvwqBcIUTREwby9ISJolUphE
         75HYEB8wNXMnN8AiFkEMDPoAPsdkCDcjw2T0r1j7e+Pl+mvvbKV6L0Kpf9vO14l4bV8W
         Cxg/dNi+GoDM8G16XJVzDvm/wh+UbtEYEcUl5jREfqgOXA/0obcljJBc+Eg0G+aAzDt7
         qQB0W8jSXt4Ly8ec4qaTMqn4BU6o3Dgo2d6mXx3Ym4/uEqgFWWS2E0nHRUQexBHwHR0V
         g1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXze+MJaCslYpnSK0ULwqjbg4xdi0i8dbTXyS7VHRFQyBUxczx8w/jgS5gt+WNmGaGGIe86W1IKidZ5vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5Z9Q1Fw8EDpqoFwm3t32hHJ9jLRBNouWnV1jjDeXYbx0ZOVt
	0U9OaixIBoPjgyxWN6cSRrzy2558zw5LUu9xRoxDVa6ggpnib/rljjOQGq44VTSWOs7wfFwIB3i
	ghL6xPZZT75+0u9A/K/Uj5bQILGgkxD6bOZO8QD8Sb7GmX9SnTP6AIFF0FUCDZw==
X-Gm-Gg: ASbGncsZ3A7VBvVvdPv0PF77TcMGO8o+gacZJp7L+walYEpy1RSxgA2ESPqReHO2imC
	dTYeuGxCxUDADA9gq82xHX5/aPLX5ZBgUSMxhGhaqkLW0Yx1CT61B/vVXDu3YSGC0ZuSYTuTtG+
	6AIL5x7OhzqGabmyuggb/jvloMxj8o8g8nrmhuJjGLNSEKmRoGWbjHR0dDsdFCdrwkenaFEcIU6
	5X0RPy4PaaVmVEhk4jX/j+UCeK2D1WlO2zRAGA4WZJHrHruBZ4j4cEYOLGuWFU8ZiqPpvwgjLr4
	aBAbirRtklrFz2xw0wV19Ko/Ckck+HQ+FlbFLcjKz3sfhoErboZ/h/JM11OH6uJukmgyTd9Mugk
	=
X-Received: by 2002:a05:620a:4509:b0:7c3:c9e5:e4ba with SMTP id af79cd13be357-7c95865b5a3mr295947185a.29.1745494363400;
        Thu, 24 Apr 2025 04:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSF8NXZpNShhA73w7mSe/hny4nEbCfzojEr0ygmGOYju4QA197e90OnCcpK+9TXxCGUsACfA==
X-Received: by 2002:a05:620a:4509:b0:7c3:c9e5:e4ba with SMTP id af79cd13be357-7c95865b5a3mr295944185a.29.1745494363064;
        Thu, 24 Apr 2025 04:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a849bsm2347771fa.82.2025.04.24.04.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:32:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
X-Proofpoint-GUID: i2mykwLz4n17SQUZpOPtN_FSRY66Frh6
X-Proofpoint-ORIG-GUID: i2mykwLz4n17SQUZpOPtN_FSRY66Frh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NyBTYWx0ZWRfX/6M4Rcj6Fl64 yYxWYMuo9CYWnVlZvMse4/+3kj3kW+BLwtURduXjCTShhfKTEK1Bt1w1SrThifeENJ4DE05XyYE +1zUkJoGsw2wkDdUlMfjceo9AKHDGj2kswMPQdnbgEbrAZMApljBxgg+D/y/RoNo+ymMCubm7kP
 upPHlwzfp41sZYWyHFTdlG37R/KYxdA+/LxMvbKAA9WYBmFmMad2plYYEuofkngAXG9CvxD1EZQ ZesnwfbNKcOmJgOpN4LGjxVFTl6qGhLlM0KdgxwuFwnAxPlcP18yib6UoB8tGXxu3qvPjh1uwgn /zdIwkon+CRxReOoG1S8qu/e7XWp44nuHCqcEUUmwjh+VFrHRMbcjmQ0VQOFr78JN5VfnEKrIK4
 irkXdrdp4e7z740sMSiGVs5P6XLED12g1+NNU5697aSaWMbddYDHCLyiJi8jur97UldL0jb4
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a215c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=bRtgI_ysDkPbppu9wooA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=767 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240077

On Thu, Apr 24, 2025 at 12:29:39PM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 11:45, Dmitry Baryshkov wrote:
> > > Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> > > the power-domains used by these PHYs.
> > This won't be consistent with other cases where we have a shared power
> > pin. For example, for PMICs we provide supply names which match pin
> > names rather than one-supply-per-LDO.
> 
> Yes but taking a random example from a PMIC vdd-l2-l13-l14-supply is
> specific to a given PMIC, so you need to name it specifically wrt its PMIC
> pin-name whereas csiphyX-1p2 is there for every CSIPHY we have.

This is fine from my POV.

> For example on qcom2290 there's a shared power-pin for VDD_A_CAMSS_PLL_1P8
> but then individual power-pins for VDD_A_CSI_0_1P2 and VDD_A_CSI_1_1P2.

So far so good.

> 
> If we follow the general proposal of
> 
> vdd-csiphyX-1p2-supply
> vdd-csiphyX-0p9-supply
> 
> in the yaml, then whether SoCs like qcm2290 share 1p8 or SoCs like sm8650,
> sm8450, x1e have individual 1p8 pins is up to the dtsi to decide.

So, what should be the behaviour if the DT defines different supplies
for csiphy0 and csiphy1? Would you express that constraint in DT?

-- 
With best wishes
Dmitry

