Return-Path: <linux-media+bounces-44051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B166BC7BE2
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 09:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 704071899AD6
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 07:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3A728CF66;
	Thu,  9 Oct 2025 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEpY8FwN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6369DF4FA
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995750; cv=none; b=AVqOeQ8q6/AvGPI7MpboynxXfHblP5f1DvRMAvEmUTt4e67GVqM6OEyoJlPEhCDj4sXToJCgErJ3+WOESzCqtEA3WukdoPYnnlPfqwfUF6bTkx0Qv8Ux03/XJuupG1UkbFbFeclIBqS/77Sh3q5NQOaZdMd7b4zaOwXzgtVdqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995750; c=relaxed/simple;
	bh=AzylpSSRl2CcWFMwrusxn0okqICGeGTSDI+hXJ9p06I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOKzJSQ5DYlCcTSlXEc00zqpGX736cGHigXGJpZbccNstphDZ+RRAJN92cXrGfBc0W7mYydIt96nW4PrWlA8uYqHRHzephijAM6+99NPzv+mXBXJ27Gd0h5skVt88KCTMubJRB8Z+ZzgMFtGDTy9YnLUZexpC0FNEmTofi7FaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEpY8FwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ERoL028608
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 07:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0SNXJFOsVYzhJ3jhxVt4s2J7cKV1EdF3v23DlHkr18=; b=nEpY8FwNsDtDNysz
	zqqPgoiWp+jAyMEyPXnGe6hKhP/jT+kTbh7LbryJbxFZaI+JdTndSLCPU3YfvjvR
	Cf40mQf53Pn+qGtNA8SW4hLlLfN6eWkasR9yQlZKZwArygsVptrNGyjktPLHNf3D
	8d17+YV2wFe5HZkozUpreH2RcQe9amvhstXiFSesWEUb0RiQb9RuvtwCpwn+ZvVo
	ub6FsFcwyyhEybSokAstHUe/SfhDh1tdVG0zDATIdOir7KphmyjH0vj5jfdJIRIt
	Gec212uSUP7xl8/D400rnIXEfi3OMgq+JBC6xO5ub9J9P9oWIci1V9nAbfmKXLen
	QES6WQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksw82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:42:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b63038a6350so2202619a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 00:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995747; x=1760600547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0SNXJFOsVYzhJ3jhxVt4s2J7cKV1EdF3v23DlHkr18=;
        b=lnP6ngh6GZ58w8trTeLJtQq5Rp9y6Y+Awik+u+hPBd9q2NIx8+1U5OqYR9CsVKmyxO
         Gtt7Qt/ts/T4hzviqQGLS1eE447Z1VepetGGIb+3Y2g2YCml0I6rGjeHB4Gi0UHF4YZO
         e3CgyFEeg3aKNl7h4r+FNc61M/49Llja6WpS9bsL8PGxVLkh3FvDr7ZXH3K3QzNT00DG
         yqRaH0PtDpDHdxTH+aqazuUc1kGw3fM/HD8ThEZ13LQ/NLFKIsAK/r0YhWTDaxn+j92s
         Z/jLXbwAa+V1ORQFXtcleVkwbGXFARJv9E250LnRRCFmD506qyf2Bg4IdSyb4QPUHX5j
         R2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHkFLN8d0xspO+Y2KfvloPmZmWrsZ/3Owi0uzIqwAZlHZTj4MhksVwcZEaZS0vUotsr4roS/YzGI0v1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnS7PLAbwFC1W4QCOowTxLM+0ocB/EyX03r750hj7FBCC5/wuD
	XlOIIILR1MbNcsClZTuPe/iGr5tTxEm9aqJmiNTgr+dvDs6FQ9jvfREi6SyoCqyw3M+lRkbzmjT
	GlAdQX+YDcbYwkVyon/zjwyuFGi+q62LSkgj/YGIbe/iCdEO5+Fr19XK/r6RqNrDpYw==
X-Gm-Gg: ASbGncsNe/z3VRhTKn0CDRWrhTveF85E1kLMpuweFA0bPm+/rRdKLUNjQYJLWfDp5JH
	0jMO67+NV2s1x/YjhrTr2kvGM2XbCRgB8WSUD6wVv1ZTRJOVbPMhbSLkCFiKSim15DTnkeyzufJ
	KEMenMYObWjaPEvkn9HpD6SO7/4pb6nvc+SNfb5u0Y9d+ow0wP9E+sAOr7PvUfpjFBoQwzKcLfO
	Tm2Ycj4ETuXVtH9W2Un/fogj4aWjVco5WinDJ7KH+nsZCBCsG5WfJLFX/IGO/iOqMvWKxXWITMk
	t5OZ/5u63e5iADSkibSq0/nY33pgfl6y8Na/MDp52ayAHNI0X0epsaZzrH5wCJF6Qg5rAJMpACA
	izw==
X-Received: by 2002:a17:90b:4a86:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33b51660564mr8437420a91.2.1759995747349;
        Thu, 09 Oct 2025 00:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqjOQsyOL2Qw47P+sV2iqJMDYIT9HSU7jqLVRJxnFw9ShvYRafKJuyrx4mwmq5exGrAA3wJA==
X-Received: by 2002:a17:90b:4a86:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-33b51660564mr8437385a91.2.1759995746818;
        Thu, 09 Oct 2025 00:42:26 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5296d52esm2958054a91.2.2025.10.09.00.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:42:26 -0700 (PDT)
Message-ID: <c97dba5e-3b1f-4751-398b-c72393d03f9f@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 13:12:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq()
 NULL check
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXygrGFvHRwaid
 YAjvfVBIE1rVB2OUM+4jmxqWW4ioBI/wOOIFtGyKoKHF8exy6LyjrDAdYFIo3x2rPrPpJTnjDKl
 /JymdJtvelZqtc4dKGY8tTqy1YJf+X/aWKwo4U1MUKaaBmWDk8fU9rGr+a9JgAcM+2gPhrrBuN9
 51BgJ7I4CuGNrIUjB0iYKbOY6sgUqIKNvovLGJYtcuhcfG8tmyUC4svbHV3YWE4+JfDQIsG4Ump
 ylS7S4PwAsCnXcacgYhIMpZqkIJ6gJX+GeYILpQp1Kt8Y2rKeIMT58Bxwblv8gUlnH82yAJ4Yt5
 zPBsn8tp6/Z3yipneiZ2lglWW1QLNeD4h+6p4fvMz4dzOKmr6aKmt0bF7sCRgsnY0srjNG9Yvqu
 4RjymeU2R2vCZqGsIJ2Zh2ZWN6kGmQ==
X-Proofpoint-GUID: WrjTf3F6uoqeE8SJJJGkfP05LF_fFiF7
X-Proofpoint-ORIG-GUID: WrjTf3F6uoqeE8SJJJGkfP05LF_fFiF7
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e76764 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=d3DCbir4PBIb6Zx2eVkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 11:20 PM, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 2 --
>  drivers/media/platform/qcom/venus/venc.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29b0d6a5303d..8c77db0f6e76 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -329,8 +329,6 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	struct vb2_queue *q;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c0a0ccdded80..0fe4cc37118b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -241,8 +241,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	struct vb2_queue *q;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

