Return-Path: <linux-media+bounces-44547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328BBDD4E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC17D19242DF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F0E2D238A;
	Wed, 15 Oct 2025 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8nmNDdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761826E6F2
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515525; cv=none; b=hzxOHrhB/hh/ewJt6z1nII46HY4fgGHdIiWtp4dWaynNxsjG0utMaEH21H+yXILXwkZJGSUwWhMTyKMTFk/MF3xW5TsaT14jS1vty/kxnmwruOEJVW8dz+0Rc2PdAG61Er3ENf2mpBAc/U4YkBs9oZJuPqFqpxmATwkhGUtrUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515525; c=relaxed/simple;
	bh=jb5eUCp9yhOc0e25r/IYBA5EJMkAmd76xiXvXoc/QbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuunFI/R6fbR0BNYjQijubkL5oBG1VvN55agGzloNJ6OA/aKDYuswAbcttW/py7xP+Q+ck+3TUJOyeYzKrp+LZ6SyPte5DwaFJYu4VPYWViZLV1fh7sphwks/x4dYg8y62YQ76tPa2jgczm7NUZmDCxiU/U7Zu+9Y4MDAKJbXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8nmNDdJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFti014793
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puE9uyHsdgGpcWDL8ZAvftsmoS6a2wcnSO713QdrpnM=; b=V8nmNDdJ5v6JovWw
	OPjTCi4E5CP51EdGMPNgZ404Y/QnKBzfPesP+0qx12jNT3VmBYeDL2ZxlOW2Urg5
	D1j8aO1ssJFIoengDxrhP1+YHDTLl6Err8rs0BmML2ztwREjgfij5DTF71NE6c4+
	ZsL14FH0o0Ltewf+g1pAjggxJyfB9XqICLfbbyWQz4EgV4lguGXTYMpXqSSWpV6P
	Oets5Yk+OAjVK7TC4hXOk1C5jQivKZeGcsvKYub/enVhOzhLN46xwRpfDHPhQfxr
	jYBOX/VOfetkOrZZlgiqEUm9skIJK6MlGt8d60hwIjeN3+BljWmzSRdCfh7kjfMO
	BsoEYg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj3m9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:05:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3306543e5abso930478a91.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 01:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515521; x=1761120321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puE9uyHsdgGpcWDL8ZAvftsmoS6a2wcnSO713QdrpnM=;
        b=QCsXcfsXFYgoF0rjxAEPWfAjiDhgDzj2E9nk6kunrS5QERCss8FwHEgS/UcqHJrFwE
         /BTSD78+g4hVFXehLq67New6JyCOLeg3r4ZweP/IzLzn4LfdphP0Z4WogZXvGQ2Om/nQ
         l9vKfvLQJv5PO34IyDCCIhTto+Gb3kH40Wu1htG0eRk3hvTV6HmnaU6u0X0qFDINpWcX
         lpIhIQSjIsI3A/qTh4DTxBj9hObT7mSggfPqqbASxJY0pgh6eEqGsKztVetAKfxDzLn9
         7u4Pii507BfXyuhD+XRiHTVQxB27bSwpVj5Bk8KhNmZhEGNeW1innLKpRzSccDMChaOy
         0xHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr5f4wUTAf6NGuLWpBSu2xLcpsRYGmWlM52Aziz6/QuylMXH40ERGUTXzw9+Glce+R2gRd+F3k7Iks+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGMxWdOSSre7q1yAAsBb4a/L+LMn/7DLmMcbEZP/JW+Y7ZyBGy
	qfliYGPbQJf5Hvr0D9O7Rzza24r89ZvhkzKSSXVX8Vq/aJc6mqSvLmYPothmFrfOmzaJ9JC+hGp
	ly3CN/nA2WBBU78FoTuIaHGdL9/3X3k3NQM2YwEk6KjTJlCYGNzGS2dQe5NqcC69N9w==
X-Gm-Gg: ASbGncv/V4+6WrYQj/caeRPn1kYcCuO6NgYmg2ptSoT/yLQnK6GFUgWLbt1TPq/ooAx
	cd9O+8BghpOB1r+9woXZnDNENB+gVlAjWqICnGJ2R5YEWtVZuMAK30TXvspdAizz9SAQmgfAabs
	WmHdfYBUs6QqBjC6LaYJ1h2n+N4EQbRfe6TET+bjNowHf//HrBiqiV/KeF4LtHYWzgv0ydk7RL+
	aZ+d4R6XTSiPKG7HdeImnqUUiU7KAAUhCY8LAM66C9LJVrW1QFPd8QfwFRqSMlOwwAB3oV0z8qW
	CNFjauXLzAS38HUBmxM89Q+C2hcyOBsKXxxEH+5DmKnjsm7Y7p5CCBXAp0vnkiY0eqqOy4wf
X-Received: by 2002:a17:90b:384f:b0:330:c522:6138 with SMTP id 98e67ed59e1d1-339eda603a7mr42073142a91.8.1760515521489;
        Wed, 15 Oct 2025 01:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsUhr0x5bG5wc9zkEY1X2zXtv4THXFhdtP8ZdIeEC4XZTagaRI2yDrH/qESOvqeJ4sCfq8Dg==
X-Received: by 2002:a17:90b:384f:b0:330:c522:6138 with SMTP id 98e67ed59e1d1-339eda603a7mr42073112a91.8.1760515520964;
        Wed, 15 Oct 2025 01:05:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm1474942a91.9.2025.10.15.01.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:05:20 -0700 (PDT)
Message-ID: <9a946ac2-7452-9ca3-e75a-0d9abdc21f56@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 13:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/25] media: qcom: iris: Drop unneeded
 v4l2_m2m_get_vq() NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-16-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251015075353.22625-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX30zOGMXJT0up
 h7MsmkFKXAyWzLWEY6Gxyd8H63PHvlOs1qKR6Mx23/cmzsh9gh5lwq7W8GDmkl7TfrOn4UqfI78
 k3jESg7qmZJI5sLUMbBZAuopjaMU8fqFLPGfsNf9aGv69RULJ4bTmOhvlYxUZRHy/3SYB80xGH1
 4aEUhtXES+LcXGS5uZ5bVoO7SKOOPBPrDXNYAgJdKuRPHy601uele+0/zqIRgBXqAyqM8MhJnyI
 E5Wj/2xeDo4hNzygPp3xGf2K0zocGTZ8qVI2iy3mCnWa+AanfKdmomEYHySCFQ3S1pKh+ZFIEzi
 ls/vrrT5RFsRuIVLy0g3tqYjEQ8AwJfCOOx7wUPIxqKHRFD0tdQxgA81VqG160MkNB+33jcRiGa
 MvSVgd+jkLufpUGXT+rVpDfVeo9qSA==
X-Proofpoint-ORIG-GUID: zrsNM75xCkjeX7dIp4B7vj4iuiid28Rb
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef55c2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uC0m2VHO6b9A_3DEsbIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zrsNM75xCkjeX7dIp4B7vj4iuiid28Rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018



On 10/15/2025 1:23 PM, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Changes since v1:
> 
> - Address iris_venc_s_fmt()
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
>  drivers/media/platform/qcom/iris/iris_venc.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426..3926ed513f08 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -190,8 +190,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  	u32 codec_align;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0..8a65c9cc6010 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -269,8 +269,6 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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

