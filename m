Return-Path: <linux-media+bounces-61451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCuwFVSQBGoVLgIAu9opvQ
	(envelope-from <linux-media+bounces-61451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:53:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9C535814
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E10531BB8E0
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49E12848BA;
	Wed, 13 May 2026 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erl5IoFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SarqFN+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC9218EB1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680049; cv=none; b=mG6bFNCQYlY3MbZY6kI8m8H/AZCWEyfWoGpMvnb2Lq7G0d83Sr03CbdTF6RvOOp0t+6dRfhDwJpNhiwX0yc2dAyxyVuQbZ7XXvtxojivMW9KgeV2y2DL/GkE5FOWJgQuHs1GDVc9F6oOoM4fwRX98jlFoLnVgJDm+CjkmifaIjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680049; c=relaxed/simple;
	bh=PFMRWD1DzQUsbBzuHK/L3Y9G3Gpl6I9x5VQNYXCV6uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwEMaNyWQMByuQeKceXgZ6lbgX1jWW9ynU3QLfe43wHX2kPzSSbgbYTeYiI/4AehV3/SpLPEmxd8Z2wWJDvkyismiiEi3SrydfO0hhQb3w9aywEROeLvNfjyKHUqOuIK4+z8c5ttoNTQOgUmwK5JtT1MCuxwclRnqRYgGAyhO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erl5IoFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SarqFN+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DASJtA2321285
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gF9m9TlU439Pia82PPMay5Pd
	uiP3AVmilaTFV8rnjwc=; b=erl5IoFj7hZmKlle1t2SU1AbF7+yoZbDYxwXbYoc
	WcN7vE88IQs9T5qa0B7guptaUFApBLVZsT+3baHrTtq8jT52vl96uSK/rLCPq0WJ
	lzHUhbyg7lLerNL82KxLoIrVwy1D48aOFoQwRNiqg/kBzTdE8H7tALci44lMt43U
	cv1KUhlTw5oRGwJKGGDXFKbZ+VZg045glNAqNLORKRV2hZclcMDGJsLHSrBXgTWj
	JzNwhukw9hpl1MqT4aEw1WlK2+Kwt7UEuscfcrUffESGFLg9q5vGQZzsCxkI4Klp
	NFVTfMXdMFLeyBiZZFVnDO/s7yUJvJ+r4P+7xHRtKQmSsQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua70b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:47:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6333021c63fso4435277137.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680046; x=1779284846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=SarqFN+4OoR7LeRBiCKLBhcOvzsgLG8sKcBDTkdPP/QGk0940XGb0vJXD28qjiAmt6
         IP7E2JzrVuxO9eZhSER1RSbdQtTZ1MdoI46bKxRsdtkZMsvJKlcjT66SvuyrfUHdWN8+
         LUPnRiLrgIVZNJ+Ga2FFe3pXoLQOS8Bi/BvfKcoFgNf/LduNQHIf014Fp874i3yoQRVq
         K38yDFDszWcvrCSaDznm/46/dWhUbw39+ZnIpZI7GU0Pd+tIluweYpn5NUgBRAJTZ8SE
         95sK0p6z3sgAGb/hVDi/0PNh5Qtx9lJ/XdBGQYGsmgt1sIvOU8K9e/S18toF6Zm0x11o
         g0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680046; x=1779284846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF9m9TlU439Pia82PPMay5PduiP3AVmilaTFV8rnjwc=;
        b=Auf7SNOKqm8FVTd514nUlaCur6txl0Wk0xE2poDoogGcm8BlK+jXaP3T0ToUgGIHut
         9IAEurzwS4czPQKOuayUnOIAj8/zt717By8sylHzuB9LVJfPJZyD9NQPQX/1uQKYqUfL
         B+n+OsZJ6xbJtkn3oc3PcyRBcQtDOYQCipwg9N1zkBxx4AwT3PUvnEUOjoqtdv1s3VIR
         kndMy6A3aq42s5ORaOGkKj+pEi6T4F87+Mhz3NKWAIhRpyZ/Gi33yCpwa/G9nCnKG2pM
         nEUVOOYa/kxe/jYapXWsuf59z5Ly2g3ZOJQvYbsbbKtHTtWs7cqNrRLl7wpmzNltZJOU
         moPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QEGOMDQseNFo1rWkerU41xdQ9uhoUs4b6+PIqkGepwNSDonQYKvDX2H9DQ2Txo4G0W7qy10AQmHrbIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmmghTLrum1KiKNbAzqHBz6kidntx7O2tOqTX4HlcT72HZugJ
	swIq0oAkZ8AmrVYNOK2CYbG+rrTBFWCak8wJRTEPinDi70Xkx5IyE2mXHgKC3SZGR8C4MyvvZCU
	/MvVNDunCnP0L4iUg4Vr2dwOV92KELpIcL6rXBA1BHtU39ikHTtuLWYTuzJrBUeIQcA==
X-Gm-Gg: Acq92OH4hQBfU9LNkdOHSoZIg9RXFlKeQ6Ilw/JlHI+wiuqfTicCtjrz+sK6RlL1OeB
	gT94Qsi9YN/E5zMdlkUAw1B1MvB4Z51EECsrM1tiuAhZWvUMBlAsvuYlzDE0cIxfmu4515EBy5i
	adz5AxMROd9MOqBmUN+9l3RE8SbKft9vbx/S41efNSIngQL8n31xGndV/sz4y2+bkFCkw77Na/a
	cOdTu261V34D3lEsBauEZ0G1K9Cyl90kvAOYFY8YfQnlfmvHF1YUiMGPNx8hQwqzA/nvnDY+Q9O
	eFbeBZijgVbEeAosGi526CyYehkuMtYoZaiQjFU1z4znwMB6X3NyEDXdPpHRryloYTrd+KIwmaZ
	WrPcu/OQs+HToJ84ITLSGHgynjCCp9Rc92we2dyhqQGU4TAnQ3crZ8AjdEJd/7o+VxMtcfwPpht
	XaqkNtAmp7hyjakjeUT+paE5/0xxGyQsYOPsA=
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286294137.2.1778680045487;
        Wed, 13 May 2026 06:47:25 -0700 (PDT)
X-Received: by 2002:a05:6102:1512:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-637a6c28831mr1286271137.2.1778680044935;
        Wed, 13 May 2026 06:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b225sm4025242e87.83.2026.05.13.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:47:23 -0700 (PDT)
Date: Wed, 13 May 2026 16:47:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0480ee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=T-6Eqvt1JYRBjGg4ocMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: wn-uaa57dfl-8GVArxXX2fhM7rYPsbh3
X-Proofpoint-ORIG-GUID: wn-uaa57dfl-8GVArxXX2fhM7rYPsbh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX2vJj7LigothZ
 KnBj+K+04DYLsIbwG3EmwMKhsxb9CYPQBPJpKwsHvDE4I/SQcD2p+dgQMV1X8Kh7cJfc7PnvVK5
 EqnHfhlo9s/3MdUGfvdB2H0wyYUv/aZB0xQjZ93zmv1yhNTo9OuUcSqSlIb0fhroRpyT2MQ1BSH
 IprUFjekKOIUWvs2ybJBeSlQK86r+h+aF5zw7dBzmYH9CEBLI29Ucqzz0ekCjhPb/1J7yOvuY7i
 Eq9rtvIDHueM3AjRVYeH32Bl6w9Njl4dg3iAeMvB/oyNHh3qPqQRxtze9ztKbd9SdHszp3UTyho
 bEEXd2DSaY5cTumcZVUA6HA25xUjvIWdrEDVFXarYUHYDx5XJF4N+69yLrzeX4fQaN6pew2bku0
 Z7c8OWlidXWimiwQ9Gy4a+Y5XBNdX3KMOr66FjGsn1OylrPbBphaMQq36kweTAusso9xWsBGJb2
 2eTYsJjXTGi4BX7+hjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130142
X-Rspamd-Queue-Id: CFB9C535814
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61451-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> 
> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >> The current clock and power domain enum names are too generic. Rename
> >> them with a vcodec prefix to make the names more meaningful and to easily
> >> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>
> >> No functional changes intended.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
> >>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
> >>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
> >>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
> >>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
> >>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
> >>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
> >>  8 files changed, 67 insertions(+), 63 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 55ff6137d9a9..30e9d4d288c6 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
> >>  extern const struct iris_platform_data sm8750_data;
> >>  
> >>  enum platform_clk_type {
> >> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> >> +	IRIS_AXI_VCODEC_CLK,
> >>  	IRIS_CTRL_CLK,
> >>  	IRIS_AHB_CLK,
> >> -	IRIS_HW_CLK,
> >> -	IRIS_HW_AHB_CLK,
> >> -	IRIS_AXI1_CLK,
> >> +	IRIS_VCODEC_CLK,
> >> +	IRIS_VCODEC_AHB_CLK,
> >> +	IRIS_AXI_CTRL_CLK,
> > Why AXI_CTRL is better than AXI1?
> 
> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
> especially when platforms differ in the number of AXI clocks they expose.

=> commit message

> 
> >
> >>  	IRIS_CTRL_FREERUN_CLK,
> >> -	IRIS_HW_FREERUN_CLK,
> >> +	IRIS_VCODEC_FREERUN_CLK,
> > Can we at least group them too?
> >
> >>  	IRIS_BSE_HW_CLK,
> > Is BSE a core or a codec clock?

Unanswered

> >
> >>  	IRIS_VPP0_HW_CLK,
> >>  	IRIS_VPP1_HW_CLK,
> >> @@ -206,7 +206,7 @@ struct icc_vote_data {
> >>  
> >>  enum platform_pm_domain_type {
> >>  	IRIS_CTRL_POWER_DOMAIN,
> >> -	IRIS_HW_POWER_DOMAIN,
> >> +	IRIS_VCODEC_POWER_DOMAIN,
> >>  	IRIS_VPP0_HW_POWER_DOMAIN,
> >>  	IRIS_VPP1_HW_POWER_DOMAIN,
> >>  	IRIS_APV_HW_POWER_DOMAIN,

-- 
With best wishes
Dmitry

