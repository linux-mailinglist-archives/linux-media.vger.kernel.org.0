Return-Path: <linux-media+bounces-44343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E981BD79B2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485023B6E4B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 06:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644EA26E704;
	Tue, 14 Oct 2025 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqDQmER0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD92D372A
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424320; cv=none; b=NNQ2X+9aLayuqAGr9KVA1MR3rOvRbYvC1PPAOL49PVPWh4Z3egUDi5uE9YHiRyHls+aBH+FmxuX/YKAx9ubVnLUAuS5RId8GxAfgmirlFHiFQe7iRr8gAIbTJQrVTNV7236LbbmP6BXFHyVyo6ZE3GcNYKL+kQ9VQe6TBu3TCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424320; c=relaxed/simple;
	bh=J9jGOA7RxXG/uDKGkODr0T46+dPJuuy6/5vlmJdrTTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InSvhudLpnYdOOgkLF81t3h6r+KMb2vwg3MZbnBWFqPGjTAJ+0rI6s+mu6NZd3gQl9/v4sdhr4iQFl4KSHddJ8BJIffxPYzZs5G7dczSans/x8cegq6LY1KURFqGJ13GvvSzm8Y2ncv9mgptRjDimmHmkcLC92Tzn9zkojuyJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqDQmER0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6TJGj021065
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 06:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35L3kgBLgmTkcE9OZQQ81NyuPk6b0VIT/Ot8MyZGSBg=; b=FqDQmER04wRRQzlI
	5z+82KgMZuLRXUPZPE6+Q1LSa6XVoLkc543U1Pd5LHyOtWPnvRn95Nh/51JKZIPs
	Pp7xl4uqo29ZItFDPZ78XIHcQwrf94aZEsn1DeLTQLg1DYpRMAOp1dqYdya32rx2
	mJmKb0QnR9U/2bMdE5Is7CFYleA0XCQHLYocZ34yiUE9mbzphNw57Ok+5EUojSnR
	KodEiqmTh0lKK0hwPCHiYlQshuWDCr+xL5a31hx/+r75Vj0syYiL5X6K+Mk0+krX
	zfVcm/9ZVytOgpzobTFo4MCBtKUqnXnxGHfHcHqgPSNFgYmXzGjUzg8x89CqPxdI
	7dtPNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0byd8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 06:45:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso9012054a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 23:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424310; x=1761029110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35L3kgBLgmTkcE9OZQQ81NyuPk6b0VIT/Ot8MyZGSBg=;
        b=fktLEsla23NrjYJZLtV5QH5L6ZIT2gmC0MTSG6tUAYIu8L5TQ50i1Ei7yyHO3f/oTD
         mTjBEOZb6hgu/d4fKdcBc2P/6u73xrt7Lmdu7K4iuwHDrwYPxYX6GQXrPoAix3Bye3vb
         +tfe+gOkfhSLN0d/2KoRuT73W8Z0fVvM8jAtcQC+qMCCUS+KZY15BNFRjxQ5tCaecoKQ
         p6cC2q//6DIb3iuRbPF/Y6Wf/ORu3Ce3YNsiyeQ65fTSEOj/Lq+mL7m00DxDHpv0T1UI
         4qfsbv04HhbvesguJg1RFRrXUdU4dQByKVANj0fgAoCLbdeD3awik2tKVsnp7KCLxNye
         bgsw==
X-Gm-Message-State: AOJu0YzRG7BJOMSTHl701ZyuxlQlfA2tD+vvdHUCoe7Wb2571hFhRDon
	xgjWVt8VEGIXuKHvZsmiYvv67kr1Q0m5vVIQr7AoviMOcCqRBwzi9czmFMBkV5fpwUTQcg3PCMU
	ppnPSBH7My0N5+8pvBFhgqOPYEO3SHI2xb3eg+e+cCyifuDSJvEFqG2/J6MARBFDBr+jFHP82eg
	==
X-Gm-Gg: ASbGncvXCxRXQnkTHNOq+DX8TfKM+MYh4Xzuvl4eCXohn8IUhCjct2NdbM3lMtXnUxT
	/ESVGiqVcFNeo9Jjur4jb3sjQylXqWM8XQRMDPmoOXohqZDVkaG+7cLK9YWBM+XBEwW59wd31DH
	iDfQvkG7U7jSMrIv+rHQshNkdwlqKAsX7hVnxZKxho3JbkkLsWyFVFHW//rahlFSbI/GOmlZ6J5
	S6dFdUgGQE98n6W+v7QQQCIEQSKht5mB97RhMv0NS6+ilMfcUhNZ6dpc6vinW7mFbmvnYL2Q1aB
	b5l+vk5KA3Y5CAG+jKjAWEQJUa37J5r8qgAOPUIJr1b5XPsKzsmnypD3qGwtkILZZsipyWwv
X-Received: by 2002:a17:90b:3a92:b0:32b:dbf1:31b7 with SMTP id 98e67ed59e1d1-33b5114d4d5mr30890131a91.2.1760424310520;
        Mon, 13 Oct 2025 23:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvPCHkGaaKprkCCPU+pf+oJXyvbWCEPlFJfzmcC8Py5PD4JFWz4/0XSGO3LAjsjOsgGY96rQ==
X-Received: by 2002:a17:90b:3a92:b0:32b:dbf1:31b7 with SMTP id 98e67ed59e1d1-33b5114d4d5mr30890101a91.2.1760424310077;
        Mon, 13 Oct 2025 23:45:10 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a392cdsm15060370a91.7.2025.10.13.23.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 23:45:09 -0700 (PDT)
Message-ID: <fcb402a8-f0d1-d268-5bcb-0806433e5356@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:15:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix fps calculation
To: Ricardo Ribalda <ribalda@chromium.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UV--GwoCXZcv8OOs887Mtl_ZdUb6NM13
X-Proofpoint-ORIG-GUID: UV--GwoCXZcv8OOs887Mtl_ZdUb6NM13
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68edf17e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=0qo9UwXc1eKLUzRIyuAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX1XQfeOlA4WLa
 +jisaFsTn/nLGZhJap+ujfmhJeUOdtPMBex73C18r4NZ+qZcnUeJ+Z0G2AQHzhKjXa4vR1cd2Es
 XMr/HXUqVxNosOcUlEuSvEjb4RWeKeg/TOgyD5TNR4gDNuPxl+k90dK+o0ToTHwvCXR2icxlRM/
 K5eGMuivROT1Oh6XIw0iuN6QOLZiq+BL1EnX26/XzPokQJVzXh4wM4TAIyoNnf+zZ/OoC9FdlFt
 lt7Qq0vHAHsEkvEFIBzqHeM+YZn/LNuwei4762KrzLbEgmvVbWHkPtN+35jgA+U+nWtbAUUIeQH
 lY2OuSmyo957nq4HwKzMlkNhiGEt6zmFnHXWnzzc9rKOipRnTFEyUjwpO0zqR7/3JEJX0pSyg66
 XY3ofubo4z/XuVEOmDlvsVcxzM+aLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/13/2025 7:43 PM, Ricardo Ribalda wrote:
> iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> a normal division.
> 
> Now that we are at it, mark the fps smaller than 1 as invalid, the code
> does not seem to handle them properly.
> 
> The following cocci warning is fixed with this patch:
> ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> 
> Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..1234c61d9e44c632b065a5c44d3290f6e1491892 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -371,11 +371,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>  	do_div(us_per_frame, timeperframe->denominator);
>  
> -	if (!us_per_frame)
> +	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	fps = USEC_PER_SEC / (u32)us_per_frame;
>  	if (fps > max_rate) {
>  		ret = -ENOMEM;
>  		goto reset_rate;
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-iris-9addbd27ef76
> 
> Best regards,

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

