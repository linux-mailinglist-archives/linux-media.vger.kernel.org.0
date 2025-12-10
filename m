Return-Path: <linux-media+bounces-48564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D408BCB33FB
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 728A5302DBDE
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C4E30AAC1;
	Wed, 10 Dec 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt5DK5Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfkDwpNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C33191C8
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379039; cv=none; b=Ul3+H/NdHIBgkozYCl2mr7cszjQ0CsRT+4QgohlmZ6ZCVtxzvcUjT0xOUxz/E6r+JuGQbH97w4Vg48y7xMxosMd8NyJaL2Z6V+Ku1YHuW1KvN5TpADNx2ZsJybxrj83Sw5Z0j2QHE3P48d1wRyJeUr/GJt4H+yPZRzhyd+GbQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379039; c=relaxed/simple;
	bh=BZ23x6fg6/A1juQGtK69JXPZ+EVEG9RA9Cm8GETlv4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8XaNMpm1YFhaHAklE8R85W7jWl4RdkKvshiCd7mt1BXi+0Xl+4VmnHDhG8uUSEzc/RN+sQGZhGQIinZYTVBSwYWde3pXWM1vCiT7mGU/T1Eza2EKryIuH1M231nM+Oow31ijyiasBEqkUidQGTxCw0exdId8A5H0ZE4KLoWK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt5DK5Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfkDwpNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAU0XJ1603105
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tK3Xv3vQWW4oF9YbgGiQA1xH
	p79m8WjepgZN2LC+2sU=; b=Jt5DK5Z+4IT8tC97GoccuJk+FhM0HulOduVFmxpv
	DRXc7DqsZ+UgGx/cz1ywkevfBzUmiuiCq7hR03zOHWQRKksqzEgxEfjGZz5FQrMU
	dSTG5poToj7N/ZakSeKx1c0DMObjf9XaEBVzZm6RSX2q+CoiCDojZnB00rSwXRqF
	2/jGE/rW18m6LhZ0boxX+afJ/QTgAR9ZnfRRxhHAWJNKFhBYcTjjtrtYapSR3cxY
	OToDpzI3MSHi/Z/u8DM4CMjMkQaQ1OY1oo3c5TqIma3qoRNLWANuFMHiEPEyfmII
	VbLYjX7DBVa/fRnTm4XiJ+w92TJyqEVRKlha0xfJKRPqhQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay75q8puc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:03:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5de93ca44d9so3270408137.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765379029; x=1765983829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tK3Xv3vQWW4oF9YbgGiQA1xHp79m8WjepgZN2LC+2sU=;
        b=LfkDwpNnIeR29QZRi/GQKNHAfQ6eKnEWZrLfphcoXaLU6EGj94qD+LmHPcJIxOkdS5
         VRxUvCSxEFHq6iEALfWOowDhvb6GHAeEoQ8risOXCyn5L7xRKPjPRP8n/rkg03J+GDyC
         AfWVdhQOSlIfc4SILMbQWlr/L3Qnb+R55imAQKKO2aLHjQ/J+xquxGFALS3LO+yJn7hB
         gbtyObr4jRW0WEjpCZNp5BKqxtepWfuKCDGT8uE54xbnoTFyj7jHqpqNOlmoZ0A5R6wM
         7FzMN0/kx6C/Gp0oCOzqEP6d0z7gxFJOwWcRO8NimgJWgMODKu7EOGG9DNx1NzIHC0zB
         OUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765379029; x=1765983829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK3Xv3vQWW4oF9YbgGiQA1xHp79m8WjepgZN2LC+2sU=;
        b=EZirCrNOqeySkTwhSwdxUh6fhWYGXMtpPyk4MgMx0eHUnKdl0CyCgLMJn2Za+n9PZt
         zR8h+46oy1CEVysOeMH7XY7cJKiU5fCdtfLCwku6ECtTFAAvZWuKhmR3U8A3R+dPIvn9
         LqExGRxvhKot6jFyRZsfFMl5ILub1BXAFPpXQp+J4XJSP4dp57gYxxdTvZ3hvIkSbuBh
         xPSlvA7/7/EiLIOyZ7milvPb6e+DjRE+ZtcwamX41BaQ3XncvAL5B7d/ZhugPRDalZSq
         jIERkrD4LRJnsYnEO+vt9XwAPywWottnQTKAXJOpOdqweSwG0jeBnPc+j8TArsBbl6ZM
         2YGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPdKy1bKmBBNOVFMMctearWTve2MR50JUy90A4mSykYDrXeeuYIOSj+o6YbEZM9AduJZTdeqY/PbadQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlIXB44TOqk2R2VWlPoSxPBRbvXh07VQKTziJo4fRh14Uf4c15
	Ddg2Lb6tUbrXgRN/CMhY4ttWTQL/RPQchessDv6zEwbgHTaOiE4Mx7KWIR6tbOZBdG3fNGBqUit
	uV69YNQslaxdl88IUxVf/lGv8nv59b/UWRw+dy4M9gMF7qglFhvbeRU6BfBxKahlYcd1BBWAVSw
	==
X-Gm-Gg: AY/fxX62apzf2KbHuQiDMQSpxocnhoVREuAxyDlwbGzTyglHsDBjWDiM8OvTDytzwaG
	2J/gxSNMkKzTk3k6zqddXXCNdlsdZ/C5mycYGq5r169asRuYfmfWUfDePYJP54xhu8jVj0lWYhU
	AL0eoEU2aDwvrzIqgwSLxAQUExXgAu39tGbkRJ1rrwLCXH5++9JlHAAkcSEYf7KbQq8xq/7oBId
	REj03fBWzrlM8FrnQrZuRU2yIsDXP0+UodcmYNhmYsVBkqkvdmW/98Yf2bPLBJkbggac9z8qOQS
	VnMdtAmVyplFXg5phwE4NRjbGSwygw5CTP4hJBmbSbCKTUH2pzUcba4D+7qERAnQwrsaithrAvt
	d2jWZu3ycuOHltS3rh03pF84ul7pEiS/ZH4PKQGkSUtMCl0bnGSYCC0/MZN5iOoOemOTjfQ4dH5
	XzqffN8V2XpIzBJiHaGErvJfo=
X-Received: by 2002:a05:6102:5487:b0:5df:b31d:d5d9 with SMTP id ada2fe7eead31-5e571f401a5mr700727137.23.1765379024801;
        Wed, 10 Dec 2025 07:03:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKMRhVeDjknLfBGTCmFBNMNNPgsmjkcNmaO+zZu81kkTsiq+AMmGeEjGRwLKr4o1r6y18zaw==
X-Received: by 2002:a05:6102:5487:b0:5df:b31d:d5d9 with SMTP id ada2fe7eead31-5e571f401a5mr700122137.23.1765379019773;
        Wed, 10 Dec 2025 07:03:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2acsm6554174e87.61.2025.12.10.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:03:38 -0800 (PST)
Date: Wed, 10 Dec 2025 17:03:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
Message-ID: <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
X-Proofpoint-GUID: y9ekAoMXMTBR56ja5i5TXVCZIWnyWsyW
X-Proofpoint-ORIG-GUID: y9ekAoMXMTBR56ja5i5TXVCZIWnyWsyW
X-Authority-Analysis: v=2.4 cv=NtrcssdJ c=1 sm=1 tr=0 ts=69398bd6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FRQO-4gtz3DVsKXuV7oA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyMSBTYWx0ZWRfXwC2WBa1jw8D5
 CmKV86LGT+DFIm8Cm1NHBAR7h0/UWhGTokQtlbbE6kux8+WM0tLNXoIl7A4ny/RFdHNZRM9hXlk
 nCCQmP1mnazb10kJkG2fJPPvjIrgwQ8tUWXiGXYOdveWzqsRcicyJ4UvSadm4dFgG0WPIdf7VId
 HF0MrED3L8czCld8C4Z5QA9PI9d2NfDYQVnsb1mpGafC5vcivYUlWY10DkNL99ewPPf4MOBaZJF
 fBHGs1/evYPbhOhWFl3qufuyx7yDSOOz6exIqyQGvYCks8XX23t2YftKuA/AdR71qkElTljbCj3
 hbevMrqpjYL0Gjzr0FcLCL0fayKc8hLbkg+85D7NayGObMM7SW/SJhIS2KpX/q99ye/IFa3njaP
 84dw4Z3BgN9E+jWzO3PSE7ESD0xl3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100121

On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

You have missed my CdB / SoB tags here.

> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 42 ---------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 ---------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 61 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 85 deletions(-)
> 
-- 
With best wishes
Dmitry

