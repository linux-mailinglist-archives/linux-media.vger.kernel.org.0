Return-Path: <linux-media+bounces-45619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E192AC0BD44
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 06:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D05F54E65FD
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3076F2D4B5F;
	Mon, 27 Oct 2025 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLrLLA04"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307FF198A11
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543284; cv=none; b=EvnIYuAMRv0q2P1sJZdipHlV489ROTSAGxbI0kAYd0O3qnDmpkBVBckzdkd1Ej/RGO/8Mkx7KxeEDA3mUqSJCDKq3VUuRSVtc1ZA0nIR83gN234lpG+BIibzVxc0C9KdiUfHbgh2Nnalh26lMeKi2hptAuaVoDLcB9MY7v/q2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543284; c=relaxed/simple;
	bh=TpwCVWhyQJkTI7nenZ633M2sn0NC+Uz9kQnNDboTU3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiJCSK4qiyu9ZFZVSERC4L435/Pxgk02kf98zB2XOuTESso8L8RbcKenfQJTayDdIzkxtNLtRVmsPZP7408rhMeKEVsXZT5xwO/3WySjSl7mYnlECH2oaddJSJHzOCrXZsbVJegIeHg8YSs57yigRYJGwBvS9Ylmw7h5hA6fUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLrLLA04; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNh87f1130618
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDIEKrvO3DowKo435wUZPP80lHdzqRLWRnZPmnjleSY=; b=oLrLLA04TCdy6UQS
	YGPo2ammUm3wbnY3C7RMbwFwkDisjamfWSRWyFPcPgeTkgs1bmpZN2jidzVy8fZf
	+uHofYu51uho88tXASjHN9Ff8NadUvM4qxlh7o3kyBrX5Csa2ZZM1ZgJA3NhI94l
	uBK7KGimcZVo8nzrJwmDE8hV3zoxbp3dZY0J8XxbeBKDSptSDvyHzCOHtFfk7bb+
	Bc5Q5F/bUmf+qUKqqvDG7Scc833NOowsdIHQAfzkq8aexyXzJDYTnlg0SukSQpGe
	T1hRZZ4iTtCDdvcArApufVy0h271NM+QVXbtG3/Zx6uBoY5QmKXb0WMQa/cXuyZm
	RNIArQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1uc58rq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:34:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a43210187cso393808b3a.3
        for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 22:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761543281; x=1762148081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDIEKrvO3DowKo435wUZPP80lHdzqRLWRnZPmnjleSY=;
        b=aLBDly9W+MhKBRt8DNGzQoWMR7pzHLpwegMFY8HCtnGfPShVCOgkFB8lVM4ufG35u+
         KUKps6mQgp6Yjme+mxT6ZmxWM4Uzp8AH7OSpo1Liskgnkw+HYggioosOC/dWg6PuQDVI
         F5gLXW+0e/6Zmk7ictAc0pjIyoHJjp74wpvJKzZKPs6+IBYK9vpJhvcZQpUI9hsfneiL
         dA9RmmblJgzHvQEshcqX4gmoYt7efSQMhuOAAWZWEpxmuoiJVzeLLxrVM6XOSaTGTQtb
         za34hLoDTTzMKUEWC4Pz5apkIQj1FSdrtcgvR4DJif+MNCXuccEs2Ht0cl4t9lSu9iOz
         AC5w==
X-Forwarded-Encrypted: i=1; AJvYcCVW/5M0qGJo24j/gP2ihX0JaoNsfZs+JqeA8vAE87axuwBenmIHU4HVtQQ0xNFEOUMnsyNunmz23w4CZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkUJLPkS8NvNiF3MHDmitrtYsmg3TahHzM+RfuvD2nZTgOa6wP
	Dl2ps0bLcDV+eonAj5LAviaL67jYh2Qy+YLjkF/nEqt4m/jjJqinqJCbD90kK9gPJsEOVBYHA3j
	CIdn7rtJRALhcRYTKZ0Ss9QPbk6rWpSyohUipUWrpW5rslESTVG6QinoYQKYpeRFVBg==
X-Gm-Gg: ASbGncsfKo4uY0/3ppmRnyV6Je6f4pr+l2EdvCbI57Tjrxi+jddbYsmZkv/1Dp4aoBw
	L1COP9eiqvt36ZZWcSX2SVXNYv+BYt+m7qKPQGK7tvF/vPwp5ib57pAdm2QGK3QqdBVM3983vR4
	zPf7eCKUweuVyZ8VNYsFhCTDnmBnlk8f1a1Zf0H3MT+bUDqyhWq17tQL7i6dg5y5SA3W8c9CRZp
	ACCHNjA26ormmK01A4NKLaXpGsz10kLVJnQUzH239E4agEj97qagEmNiGQ0q3t8up2GxKF4VXqv
	1q78U2XBbyrIbYpyVxzRELq/QmyTli1Op4md5yNfVZafEy2V1Arkl9cu3sL8rv1DWtFCdrpsEfn
	3+1wFH/yXqjP7MfnhPGxIlcc2GgrfQ9A=
X-Received: by 2002:a05:6a00:88f:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a28678f6e3mr11579282b3a.11.1761543281275;
        Sun, 26 Oct 2025 22:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsIO7GRXzKhtowLGxLS5LBUo3hlx5I4P7Z0DOgENX3Uogg441FvmN1zhp7iRNv2vxDxvPtpw==
X-Received: by 2002:a05:6a00:88f:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a28678f6e3mr11579250b3a.11.1761543280776;
        Sun, 26 Oct 2025 22:34:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm6877609b3a.63.2025.10.26.22.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 22:34:40 -0700 (PDT)
Message-ID: <29e4ddb7-0ed3-74e6-78d0-396eeb201fc3@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:04:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: qcom: iris: Constify iris_v4l2_file_ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tQDQQROmR0IzXoE9dGmtCfLFzTzBjLCp
X-Proofpoint-ORIG-GUID: tQDQQROmR0IzXoE9dGmtCfLFzTzBjLCp
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=68ff0472 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=3tk5DILjExYhGTJMbPgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA0OCBTYWx0ZWRfX/xiJiLCii3I9
 NAy+lDHsuHd3tIMNUmbIX4WxvEXRp3IzAGD3rVl9Oe5T/7Dfidoec826uqTjeEXUQ+sxrDIWKTp
 +8RHjiHi8NECLWA4muD/3bVSOi6gj/butbr1CgcbLwJ4cpxTJQULQGqhzjURoL55dQCoM2VMB0r
 UMKlOdpNXJwF0bYbazWwriRbl+Al+gIu5kdPDZ9CudLOyA1eyaRW0leoGVhDES3+COCMhmccMBM
 9yuME+qsy3RqNlzCtiTl8EZj3ZQ7Op8pAZklCG+GpGOLarX+9flBm+eA7lG9O05L/V2okof2dia
 pNlsrupAQaVtF7o8YlD9jVq/dNiyRDou92LnQQ9fJC0KySHW3x7iGKsbXLCifdzP3gnppxCrbhI
 TNqPxMK+0lxdCioAcFrKM+7UXynOtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270048



On 10/26/2025 11:41 PM, Laurent Pinchart wrote:
> The iris_v4l2_file_ops structure is never modified. Make it const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d38d0f6961cd..c9b881923ef1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -630,7 +630,7 @@ static int iris_enc_cmd(struct file *filp, void *fh,
>  	return ret;
>  }
>  
> -static struct v4l2_file_operations iris_v4l2_file_ops = {
> +static const struct v4l2_file_operations iris_v4l2_file_ops = {
>  	.owner                          = THIS_MODULE,
>  	.open                           = iris_open,
>  	.release                        = iris_close,
> 
> base-commit: ea299a2164262ff787c9d33f46049acccd120672

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

