Return-Path: <linux-media+bounces-61500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENrTBePIBGqnOgIAu9opvQ
	(envelope-from <linux-media+bounces-61500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:54:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A55395D6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF24730A9F11
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F9F3AEF3D;
	Wed, 13 May 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2nBbS4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVXLlkPh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F643ACF18
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698258; cv=none; b=KweS2DJLBQg2FbZvY4+C/ezEAnie3717I6nLedcONrLHTk7eU8nSCtr1Yju5H0H8MMSK5k00y3TjUa9vhL4kQHkvt8DtQLcZfccEYuxRq9Cp6jlVe893piIp/6AqSJIlxptzaBaJiwQi9G3rShnMWnYZ4u+WBvbsSWSApR9FkzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698258; c=relaxed/simple;
	bh=+7JjR+gaRrvVzMIwgi8KK6quzi+E3lphsWL2mtonhLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OX5Fy23hpaNvRI50pF/Y/By1kfhE1xHuG1wFe4SmCdKxJbdR12C6T+bcTgL5gvNaLhzxQILZfSi3TBlpQ7YDJS1ZyhNhpkau/oyh6vAB18TRf02JAPRVPGvcWlNx9V6WHCggF0rltXcWVxxUo75uZXiZ69m0Rpb6pxtsaoKSwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2nBbS4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVXLlkPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdqi61242893
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2tsXnWsrCQyfORbxKTrTPWPeuAX/yqlRxp27Mkoz38=; b=M2nBbS4Kmqmkji8t
	vzc82bCaLX5TsBT3Mvn6j5eoGPtdxlzDdU39ixEQxzCkQ1v44EhsjAQ5T5aDRtiR
	txib7+e4OM2dMdGWdrYMbioHP1bJynvalAvukDc0QTzO5zgqPiP9ev8bOmsz2IGg
	98KBOVTZMThIbiuwD3FjV4w9ZzRZn9VnXklxZ74RES0weKRYOjGJnr7xYJ/rZH+w
	/+S2UlB+34mkhFJhHsgr2uTodykDIeXnbE/I65w1QEDqyuZJPchnI3OnjKo27uY9
	LDw0Vn+0lB/CUO5ckZNb5EzUDJ8x6CxTGCEGiqhSv4cILIpIm8VkG8t/oV5SP4ts
	uAEz6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trt9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso4914496b3a.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698255; x=1779303055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2tsXnWsrCQyfORbxKTrTPWPeuAX/yqlRxp27Mkoz38=;
        b=MVXLlkPhw6gSR8Y2GMfpqS+hwtuU7agpwYMRLcKGdre7HyTm4z60baPkeIKSf727mo
         DVxtYSRLVtKpNQQmcgVfVc+ZVjTtMarv1la+bBufG1Asui6kanA8UVsfm0uvuljOnbMb
         kR78IOMXYkqVGu2CpAAvlxWyQnGzr8LHiwnb+YaqYMbYBx1ag2kLdQhQdV7EdcovBQvK
         TJ/MWAVv+YhV+n4/DkMxkL9azRXHMaHgGvOiHHhPcZTBwJGOzl1VR3YvkfIgnUTlSfYS
         YqGIYGC+kw6LhO4/c6TY8dTYo+S6Q9Rrxloi8fOLOPOZE/nyTHw1cjyOqAbYOVQtSxbs
         a1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698255; x=1779303055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2tsXnWsrCQyfORbxKTrTPWPeuAX/yqlRxp27Mkoz38=;
        b=gsKxGu7bOYm5NLhe5pu51o8fMvbLmuH3zWbEGEWTYDe59FgL95GxNSRlR/yzls77eR
         ONIY6YLQFR1f6+ChvdlzWUFQI1UIctvUC/g78iG2+uEzAkRr0mO4GlTvZg5Uh8EsYIzm
         phwxdGvIQRrRSbG826ZWDhAIWBgc1q7I/ro3+IKBOTkS28pKYTBLeVK59Dm5ZSnjPwj5
         r3Ffqa4UD29GEUCxIwQIFirWa9OYo5bLQQ0khakfyXWSg7kxPQz13GpBmpjfKYGBXbZd
         s2gr4OvCysxHxc40nSzOWb7rYRFdAynJOFk7hON/vY8h0uclIyAU8xqMNMqvkLzwCPau
         LnRg==
X-Gm-Message-State: AOJu0Yyp+l9Oo4OpSuI6va1Grv9TD30HU2YxQUv/cms9/8f3daSSxTC+
	iBa++t7MPyy90AawdMRq25waOznExY2HzD8EqMt3hGMUPAGXr7TmMT3ebbouL/tdk28AifNHfaH
	PgJ9x1biVx6F02alC0OshhGSnb//l5oOUvEhfui0aW41qg0yK6e8py31YSydCNmYfnm6hbI98Pw
	==
X-Gm-Gg: Acq92OG3OMzMiIfDKGZ/FpqC3GhRLd/NjdqIsoH4IHZ3wtqdhuiGqsmkMQhPl3G6Nz6
	VNp/AwVhy5V0y7EcX1JEeBX58Ne5S227kpWWVxQ4cibN14ezGy7baZek2BA0sgvT2bxcELMpx3u
	Dxr8nQLe/zuXmKny+BgZvZZlBDb6QGPl1QDNlsadmRHqZCATpDYpXRDVyQqWsE7tx2C8aMbuzyj
	Bb8d+rkYA+YO2vl7no24GgzkV0nNb4UUuguwuMhTL9AmZKHGRbbMKt8GMsOU2XMmG+jKCHECGu8
	u69hmyBBF7Ne7oViik9kEVJjVt8V+0KwLyfsvsnEOWZUHwu8h7zVmIVQqlhi3RFUmPYhHBFkMLT
	ZUXfnnCfln9A4BJrsqI2u3k/4dTwgvg/h4yPJ+BDjnvIZP0I3O3Dqn5ZY
X-Received: by 2002:a05:6a00:148a:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f0428a8bcmr5089577b3a.31.1778698255214;
        Wed, 13 May 2026 11:50:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:148a:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f0428a8bcmr5089552b3a.31.1778698254705;
        Wed, 13 May 2026 11:50:54 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7788esm252103b3a.42.2026.05.13.11.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:50:54 -0700 (PDT)
Message-ID: <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:20:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04c810 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=3-3apU6M8_iyrm20M3AA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX8tMfWbv+zASZ
 C6/vcjKrISxGYXVv9pJl//74y7uYwn/kYlz8oOHDVYFEXOnVU/mIxwTfSxF8K/8FI7Tq2Uo3UaE
 DD/IFqt0xUukYRwWHcSAXkZJqGoa1RdZngGzSqwy3znxiPIu+fKQfFeNmco/sgoM4jKyA5lXVQf
 6T/UCz0HGoRv4B555Gx47M6ZMDTfEklL5vrIRF/DJismQcxejfo7h+TtR2tYoojwWie+rclJvNI
 ScibCJmo8O2gevSN0wcUR9f2477koxAZCrivR8vlU1R1diqfVpWcq8xylQ7vjskVGXFVGHeZtH5
 avnhS77/DvFspsf+J1Kv7a7k8Ztma8UEXWNdjdcbKgIbteDGTojfdXGVwdKVXggONd5tJ83w7v4
 DsqJt2Ikc+y3qNW5gsExny5l+rTxULQ/vjKN8f7yV5kzxShk2WY/y8hOUxs2UkaOV27VY8gRhjE
 aCvoPkA0Ha5elSIjK7g==
X-Proofpoint-ORIG-GUID: BFJ3bBbGf0iLIzHanaA2Gwbw9yNbA1lX
X-Proofpoint-GUID: BFJ3bBbGf0iLIzHanaA2Gwbw9yNbA1lX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186
X-Rspamd-Queue-Id: 856A55395D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61500-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/11/2026 2:50 PM, Neil Armstrong wrote:
> Add the necessary plumbing into the HFi Gen2 to signal the decoder
> the right 10bit pixel format and stride when in compressed mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>   3 files changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..89de8c366836 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>   
>   	if (inst->domain == DECODER) {
>   		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> -			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
> +		switch (pixelformat) {
> +		case V4L2_PIX_FMT_NV12:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12;
> +			break;
> +		case V4L2_PIX_FMT_QC08C:
> +			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
> +			break;
> +		case V4L2_PIX_FMT_P010:
> +			hfi_colorformat = HFI_COLOR_FMT_P010;
> +			break;
> +		case V4L2_PIX_FMT_QC10C:
> +			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
> +			break;
> +		};

semicolon ?

>   	} else {
>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>   		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>   	stride_uv = stride_y;
>   	scanline_uv = scanline_y / 2;
>   
> -	if (pixelformat != V4L2_PIX_FMT_NV12)
> +	if (pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixelformat != V4L2_PIX_FMT_P010)
>   		return 0;
>   
>   	payload[0] = stride_y << 16 | scanline_y;
> @@ -532,6 +545,61 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>   						  sizeof(u64));
>   }
>   
> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
> +{
> +	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
> +	u32 stride_y, scanline_y, stride_uv, scanline_uv;
> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
> +	u32 pixelformat, width, height;
> +	u32 payload[4];
> +
> +	if (inst->domain != DECODER ||
> +	    inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)

whats the restriction with AV1 here ?

> +		return 0;
> +
> +	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> +	width = inst->fmt_dst->fmt.pix_mp.width;
> +	height = inst->fmt_dst->fmt.pix_mp.height;
> +
> +	switch (pixelformat) {
> +	case V4L2_PIX_FMT_QC08C:
> +		stride_y = ALIGN(width, 128);
> +		scanline_y = ALIGN(height, 32);
> +		stride_uv = ALIGN(width, 128);
> +		scanline_uv = ALIGN((height + 1) >> 1, 32);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
> +		break;
> +	case V4L2_PIX_FMT_QC10C:
> +		stride_y = ALIGN(width * 4 / 3, 256);
> +		scanline_y = ALIGN(height, 16);
> +		stride_uv = ALIGN(width * 4 / 3, 256);
> +		scanline_uv = ALIGN((height + 1) >> 1, 16);
> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	payload[0] = stride_y << 16 | scanline_y;
> +	payload[1] = stride_uv << 16 | scanline_uv;
> +	payload[2] = meta_stride_y << 16 | meta_scanline_y;
> +	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_UBWC_STRIDE_SCANLINE,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ARRAY,
> +						  &payload[0],
> +						  sizeof(u32) * 4);
> +}
> +
>   static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>   {
>   	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -620,6 +688,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>   		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
> +		{HFI_PROP_UBWC_STRIDE_SCANLINE,       iris_hfi_gen2_set_ubwc_stride_scanline },

alignment

>   		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>   		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
>   		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index cecf771c55dd..68f849232906 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -118,6 +118,7 @@ enum hfi_flip {
>   #define HFI_PROP_OPB_ENABLE			0x03000184
>   #define HFI_PROP_AV1_TILE_ROWS_COLUMNS		0x03000187
>   #define HFI_PROP_AV1_DRAP_CONFIG		0x03000189
> +#define HFI_PROP_UBWC_STRIDE_SCANLINE		0x03000190
>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>   #define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
>   #define HFI_PROP_END				0x03FFFFFF
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index bdedd6bfa87a..c75dcb8e671e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -35,7 +35,9 @@ int iris_get_mbpf(struct iris_inst *inst)
>   bool iris_split_mode_enabled(struct iris_inst *inst)
>   {
>   	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
> -		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C ||
> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010 ||
> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
>   }
>   
>   bool iris_fmt_is_8bit(__u32 pixelformat)
> 


