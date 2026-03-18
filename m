Return-Path: <linux-media+bounces-56193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEKqGxZ+ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:27:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA5B2B9DC0
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE4F03016EC2
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7CA363C59;
	Wed, 18 Mar 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaBV2CJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFjHP1MB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C982322B88
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829603; cv=none; b=PUmNb106DGh2rSlE4WnIFM8B2BbmDgVeInEk3zo7/H8crEm2y/exS7gBwso9zCkNJqGEqgjoUPpMZQyY67UGw1V4VM6DkTHE37otwWFKwKRxGhVHoCJZFtrYvPiGJFg/5A9MZbmmE1bEWcb9gZhSC8Cf1Q8780Pqm48B5QKjMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829603; c=relaxed/simple;
	bh=IGqPKFgnjoHLbmDGTkrJLGNdjB2opn2yvJ4fplouKqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6ms3pjG07q4zqV7orQleQQMO1Qs3loQLuWSsTHoymZmDbtu7b3Mf7mTMuqOx9EPCDNNnjDXs7hrv7njfAeLEfni4pan902fbhgKL5lKj17/E7891sf+tSJYx18CJJIXUFUs/02mc8u8pOeKiLYmufXr93snwpbtoeJwWZqNdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaBV2CJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFjHP1MB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8lsEj084668
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQ2Eh95kaRetVzUZNIsUKGFz+NkPhvc/M13EeUcfDgc=; b=FaBV2CJvvGHpyVbA
	BQ+PLhmgWliHXAj1ktRrvfAH6VIwFS4+LqqETQAczQaD/rMrDtTkGduCV6DSaqEN
	2weAouFtbV4CBoI2xJ+HVj1CKm179va0S6FiQP4TqG+Xsz7k48LOEN/Oe0dxNvow
	ieFeg4Ww0kgfyRxrb0rD82hkF5Uqm6NweQBEtkIMmNawM2M9sTRI7XJVeYos0D0j
	P219aahbV8XjfxgJOpHK0xmkZlEDiY6fkt9W6Kcke1AEE/1NzWaRAOolF9xE8rNI
	DksVKoafkJNR5vMExRFp6oT01ZEQvHCMSGcoim2HwAi4SHeSqEeWIbnTQZZnWWQa
	5aH1zA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqest7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:26:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso24987336b3a.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 03:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829600; x=1774434400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQ2Eh95kaRetVzUZNIsUKGFz+NkPhvc/M13EeUcfDgc=;
        b=GFjHP1MBcjSgDvmYaEfExLGlaVWqXzGgqzimAKqMT96hHAXW8me1aaQ3cZYBuZkoAS
         Szesvy2oig9doTXSBnwnNUSmJhux4yRX8d4OgDLFt7GMkcHBcqF0RNOGev6lBDUarF+m
         qvH5tCNQgGKcih/dQO5fj1iWRCCbujs79qvAE3ZoihJVjIYtGMuAKU0z8LoWDkM49GzO
         LmEA/3tsjv5Vws6+iSJ6gysNNr8P5DuSvEPX5KJRHEIp6R4/vKkvcHfVYSUQkZfMMPIS
         Zvkj6+QK7149Ul+7JJMfzPFnXzsH0pDeMA4w3HG/1Zv/6oVRhjo2GNQpRrHUDR/7V4k3
         cXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829600; x=1774434400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQ2Eh95kaRetVzUZNIsUKGFz+NkPhvc/M13EeUcfDgc=;
        b=LT8R4V9mnYhW5eADCuVqB0roRTcmMgj2+r6T+eYcMtkuPmsvdSrgyMOkWmL2gErpzJ
         sz38xMG3QfRSBCpXdeYGC1ATAaT9loUg4Yp53NlLjgIKNuI0ZpTJ6IFONMYrTSK9jRwT
         YGXY+M54WehzEwHNqmZWOl55JqpHRxTijyMQwHO1TnIDomv+XYwXE3IxwGh6LRrsy+J2
         mdyRKjwjOJud3e4IVDpGDBi8rxue8+nnUem4jpuOk5YgwtGXayUC0zegVRArnZDWJVMt
         iXrfMuL5vFCf2+KuEQ7k1N6b1oP9YtxD+/X7HTo07ismpolwwgwYmJ7PoKfI+aQXB9ES
         RvsA==
X-Gm-Message-State: AOJu0YxlKSdQeXzR48e2SPcY82sdB0EQzCZUZpRoxj74DmpVh5Y6lxpI
	xpFytsIK9u9QYG16ZQVnuQJL1FNawZfd5LpoYVBaEZ0aRCdAlG0nPFw2L0C1oqtyggaJeVRTfAn
	TXvFhGtikmKWezRFc0j6k5KTRrK7Y/BrTX3XqxuTXLEtT4IXcTT3k5MYSajOLYdK2MA==
X-Gm-Gg: ATEYQzxcM/jsln8rjjO/IYvVCzEUVrs7JEDhAB1yt9tnS31SL/TwckzAaVfryGMUd/z
	TM3ZL6jBJ8O8/KTPha8EgYMt97zo0qe74j8WJZricL1wwvk9Pw+/PCe5nZZG0JdhGWh0f2oFc97
	E5GVPWoGbGvtjZK0ZjTpMvQw5uxoxY64mGjeCEzqJzRakMhMmIZ7s49iF+qx8a5VdEnmrHAK3Yr
	bx+fKtAORYrWTU6t0EDrFToe39wGzBLstxgttR8FM0xFfmixZTN8VKJ7bLpb7wux3lqnbkXNlyq
	7oGov7alhdWdwh+/TsHKHuvY2xpNxLIsV9+alUMdtpZbflhtwWgpTAwo3vw3a6hP6wHAacRb+yY
	siJt9/C3BUGKnWrulyiC5cVo1i015c0E+i0NRcKmhqtBAXOhkebB6Yg==
X-Received: by 2002:a05:6a00:b95:b0:81f:eb35:69ef with SMTP id d2e1a72fcca58-82a6aedf22amr2701948b3a.40.1773829599598;
        Wed, 18 Mar 2026 03:26:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:b95:b0:81f:eb35:69ef with SMTP id d2e1a72fcca58-82a6aedf22amr2701894b3a.40.1773829598602;
        Wed, 18 Mar 2026 03:26:38 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bef9a32sm2506715b3a.58.2026.03.18.03.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:26:38 -0700 (PDT)
Message-ID: <c510b9a4-2ed5-4b55-b294-44f4c7983379@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:56:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] media: qcom: iris: split platform data from
 firmware data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-8-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-8-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OCBTYWx0ZWRfXx/8w6eEh3zIZ
 yuSJOu6nypBOLggLfpdkRAlSraIcCiR0EeMCyq5HdvyMwKHXdV0pqhQiBH99pTLWk3z9rxNSU+D
 YQ9y6WfHzAJ1LPNVlA7aWHH2KYA4HqL+zWciLCSTaogyyI6fAba0OuzhHt2CG0K1Or1oVq/6GIB
 6GDhGiVUycDG/IueSiZyBw8BUEvrMbOVQtvehq3HFdDfHR8qe7M9E9qmMKYLLEX9Qj76kwlSAkY
 i1HAHZzwT45kcL7J7TCAYOqRcFUiwDO9KX4qN3HkU66Od4Gmk+p+hVz7JNq2C7vr3WFXFnpltFP
 /lLQoDl9b7aUKDOjY4US78RSYNmz+iv7/X2UyTZKK4N8AeDkk1G82N28vei69LlsADRjoPhbBeZ
 Cazz9tu0hIOYHnzs8Qffnh8D9fvshypcf3C27JayYNg3FVLdseVESDSb6Knukwpd01+hOdSDOiZ
 s/6RJgtWufQwex5HFQw==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba7de0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zOkOwExhqZzp30hkaXYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: wbf72aYyYM0_NV1_ZPd3owW2HY3ACyfw
X-Proofpoint-GUID: wbf72aYyYM0_NV1_ZPd3owW2HY3ACyfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56193-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: ACA5B2B9DC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   6 +-
>   .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 136 -------------
>   .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 223 ---------------------
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
>   .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 ++++++++++++
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 214 ++++++++++++++++++++
>   8 files changed, 407 insertions(+), 361 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2fde45f81727..48e415cbc439 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
>                iris_ctrls.o \
>                iris_firmware.o \
>                iris_hfi_common.o \
> +             iris_hfi_gen1.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen1_response.o \
> +             iris_hfi_gen2.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_gen1.o \
> -             iris_platform_gen2.o \
> +             iris_platform_vpu2.o \
> +             iris_platform_vpu3x.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> similarity index 67%
> rename from drivers/media/platform/qcom/iris/iris_platform_gen1.c
> rename to drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index b2d18459a811..60f51a1ba941 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -3,38 +3,16 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> -#include "iris_core.h"
>   #include "iris_ctrls.h"
>   #include "iris_platform_common.h"
> -#include "iris_resources.h"
>   #include "iris_hfi_gen1.h"
>   #include "iris_hfi_gen1_defines.h"
>   #include "iris_vpu_buffer.h"
> -#include "iris_vpu_common.h"
> -#include "iris_instance.h"
> -
> -#include "iris_platform_sc7280.h"
>   
>   #define BITRATE_MIN		32000
>   #define BITRATE_MAX		160000000
> -#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>   #define BITRATE_STEP		100
>   
> -static struct iris_fmt platform_fmts_sm8250_dec[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -};
> -
>   static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>   	{
>   		.cap_id = PIPE,
> @@ -248,56 +226,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   	},
>   };
>   
> -static struct platform_inst_caps platform_inst_cap_sm8250 = {
> -	.min_frame_width = 128,
> -	.max_frame_width = 8192,
> -	.min_frame_height = 128,
> -	.max_frame_height = 8192,
> -	.max_mbpf = 138240,
> -	.mb_cycles_vsp = 25,
> -	.mb_cycles_vpp = 200,
> -	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
> -};
> -
> -static const struct icc_info sm8250_icc_table[] = {
> -	{ "cpu-cfg",    1000, 1000     },
> -	{ "video-mem",  1000, 15000000 },
> -};
> -
> -static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
> -
> -static const struct bw_info sm8250_bw_table_dec[] = {
> -	{ ((4096 * 2160) / 256) * 60, 2403000 },
> -	{ ((4096 * 2160) / 256) * 30, 1224000 },
> -	{ ((1920 * 1080) / 256) * 60,  812000 },
> -	{ ((1920 * 1080) / 256) * 30,  416000 },
> -};
> -
> -static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> -
> -static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> -
> -static const struct platform_clk_data sm8250_clk_table[] = {
> -	{IRIS_AXI_CLK,  "iface"        },
> -	{IRIS_CTRL_CLK, "core"         },
> -	{IRIS_HW_CLK,   "vcodec0_core" },
> -};
> -
> -static const char * const sm8250_opp_clk_table[] = {
> -	"vcodec0_core",
> -	NULL,
> -};
> -
> -static const struct tz_cp_config tz_cp_config_sm8250[] = {
> -	{
> -		.cp_start = 0,
> -		.cp_size = 0x25800000,
> -		.cp_nonpixel_start = 0x01000000,
> -		.cp_nonpixel_size = 0x24800000,
> -	},
> -};
> -
>   static const u32 sm8250_vdec_input_config_param_default[] = {
>   	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
>   	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
> @@ -356,67 +284,3 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> -
> -const struct iris_platform_data sm8250_data = {
> -	.firmware_data = &iris_hfi_gen1_data,
> -	.get_vpu_buffer_size = iris_vpu_buf_size,
> -	.vpu_ops = &iris_vpu2_ops,
> -	.icc_tbl = sm8250_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> -	.clk_rst_tbl = sm8250_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
> -	.bw_tbl_dec = sm8250_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> -	.pmdomain_tbl = sm8250_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> -	.opp_pd_tbl = sm8250_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> -	.clk_tbl = sm8250_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> -	.opp_clk_tbl = sm8250_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu-1.0/venus.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> -	.inst_caps = &platform_inst_cap_sm8250,
> -	.tz_cp_config_data = tz_cp_config_sm8250,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,

This can be moved out and is not bound to any specific platform.

> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> -};
> -
> -const struct iris_platform_data sc7280_data = {
> -	.firmware_data = &iris_hfi_gen1_data,
> -	.get_vpu_buffer_size = iris_vpu_buf_size,
> -	.vpu_ops = &iris_vpu2_ops,
> -	.icc_tbl = sm8250_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> -	.bw_tbl_dec = sc7280_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> -	.pmdomain_tbl = sm8250_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> -	.opp_pd_tbl = sc7280_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> -	.clk_tbl = sc7280_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> -	.opp_clk_tbl = sc7280_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu20_p1.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> -	.inst_caps = &platform_inst_cap_sm8250,
> -	.tz_cp_config_data = tz_cp_config_sm8250,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 1,
> -	.no_aon = true,
> -	.max_session_count = 16,
> -	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
> -	/* max spec for SC7280 is 4096x2176@60fps */
> -	.max_core_mbps = 4096 * 2176 / 256 * 60,
> -};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> similarity index 76%
> rename from drivers/media/platform/qcom/iris/iris_platform_gen2.c
> rename to drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 1a54a9a96285..071009a9ce4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -4,40 +4,14 @@
>    * Copyright (c) 2025 Linaro Ltd
>    */
>   
> -#include "iris_core.h"
>   #include "iris_ctrls.h"
>   #include "iris_hfi_gen2.h"
>   #include "iris_hfi_gen2_defines.h"
>   #include "iris_platform_common.h"
>   #include "iris_vpu_buffer.h"
> -#include "iris_vpu_common.h"
>   
> -#include "iris_platform_qcs8300.h"
> -#include "iris_platform_sm8650.h"
> -#include "iris_platform_sm8750.h"
> -
> -#define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
>   
> -static struct iris_fmt platform_fmts_sm8550_dec[] = {
> -	[IRIS_FMT_H264] = {
> -		.pixfmt = V4L2_PIX_FMT_H264,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_HEVC] = {
> -		.pixfmt = V4L2_PIX_FMT_HEVC,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_VP9] = {
> -		.pixfmt = V4L2_PIX_FMT_VP9,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -	[IRIS_FMT_AV1] = {
> -		.pixfmt = V4L2_PIX_FMT_AV1,
> -		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -	},
> -};
> -
>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
> @@ -742,58 +716,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   	},
>   };
>   
> -static struct platform_inst_caps platform_inst_cap_sm8550 = {
> -	.min_frame_width = 96,
> -	.max_frame_width = 8192,
> -	.min_frame_height = 96,
> -	.max_frame_height = 8192,
> -	.max_mbpf = (8192 * 4352) / 256,
> -	.mb_cycles_vpp = 200,
> -	.mb_cycles_fw = 489583,
> -	.mb_cycles_fw_vpp = 66234,
> -	.num_comv = 0,
> -	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
> -};
> -
> -static const struct icc_info sm8550_icc_table[] = {
> -	{ "cpu-cfg",    1000, 1000     },
> -	{ "video-mem",  1000, 15000000 },
> -};
> -
> -static const char * const sm8550_clk_reset_table[] = { "bus" };
> -
> -static const struct bw_info sm8550_bw_table_dec[] = {
> -	{ ((4096 * 2160) / 256) * 60, 1608000 },
> -	{ ((4096 * 2160) / 256) * 30,  826000 },
> -	{ ((1920 * 1080) / 256) * 60,  567000 },
> -	{ ((1920 * 1080) / 256) * 30,  294000 },
> -};
> -
> -static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
> -
> -static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
> -
> -static const struct platform_clk_data sm8550_clk_table[] = {
> -	{IRIS_AXI_CLK,  "iface"        },
> -	{IRIS_CTRL_CLK, "core"         },
> -	{IRIS_HW_CLK,   "vcodec0_core" },
> -};
> -
> -static const char * const sm8550_opp_clk_table[] = {
> -	"vcodec0_core",
> -	NULL,
> -};
> -
> -static const struct tz_cp_config tz_cp_config_sm8550[] = {
> -	{
> -		.cp_start = 0,
> -		.cp_size = 0x25800000,
> -		.cp_nonpixel_start = 0x01000000,
> -		.cp_nonpixel_size = 0x24800000,
> -	},
> -};
> -
>   static const u32 sm8550_vdec_input_config_params_default[] = {
>   	HFI_PROP_BITSTREAM_RESOLUTION,
>   	HFI_PROP_CROP_OFFSETS,
> @@ -969,148 +891,3 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> -
> -const struct iris_platform_data sm8550_data = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu_buf_size,
> -	.vpu_ops = &iris_vpu3_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8550_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8550_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_sm8550,
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K * 2,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> -};
> -
> -/*
> - * Shares most of SM8550 data except:
> - * - vpu_ops to iris_vpu33_ops
> - * - clk_rst_tbl to sm8650_clk_reset_table
> - * - controller_rst_tbl to sm8650_controller_reset_table
> - * - fwname to "qcom/vpu/vpu33_p4.mbn"
> - */
> -const struct iris_platform_data sm8650_data = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu33_buf_size,
> -	.vpu_ops = &iris_vpu33_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8650_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> -	.controller_rst_tbl = sm8650_controller_reset_table,
> -	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8550_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu33_p4.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_sm8550,
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K * 2,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> -};
> -
> -const struct iris_platform_data sm8750_data = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu33_buf_size,
> -	.vpu_ops = &iris_vpu35_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8750_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8750_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu35_p4.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_sm8550,
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 4,
> -	.max_session_count = 16,
> -	.max_core_mbpf = NUM_MBS_8K * 2,
> -	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> -};
> -
> -/*
> - * Shares most of SM8550 data except:
> - * - inst_caps to platform_inst_cap_qcs8300
> - */
> -const struct iris_platform_data qcs8300_data = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu_buf_size,
> -	.vpu_ops = &iris_vpu3_ops,
> -	.icc_tbl = sm8550_icc_table,
> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> -	.clk_rst_tbl = sm8550_clk_reset_table,
> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> -	.bw_tbl_dec = sm8550_bw_table_dec,
> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> -	.pmdomain_tbl = sm8550_pmdomain_table,
> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> -	.opp_pd_tbl = sm8550_opp_pd_table,
> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> -	.clk_tbl = sm8550_clk_table,
> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> -	.opp_clk_tbl = sm8550_opp_clk_table,
> -	/* Upper bound of DMA address range */
> -	.dma_mask = 0xe0000000 - 1,
> -	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> -	.inst_iris_fmts = platform_fmts_sm8550_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> -	.inst_caps = &platform_inst_cap_qcs8300,
> -	.tz_cp_config_data = tz_cp_config_sm8550,
> -	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> -	.core_arch = VIDEO_ARCH_LX,
> -	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> -	.num_vpp_pipe = 2,
> -	.max_session_count = 16,
> -	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> -	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> -};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 401069bd7396..39a7ee8ce904 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -40,6 +40,9 @@ enum pipe_type {
>   	PIPE_4 = 4,
>   };
>   
> +extern const struct iris_firmware_data iris_hfi_gen1_data;
> +extern const struct iris_firmware_data iris_hfi_gen2_data;
> +
>   extern const struct iris_platform_data qcs8300_data;
>   extern const struct iris_platform_data sc7280_data;
>   extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
> new file mode 100644
> index 000000000000..50306043eb8e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __IRIS_PLATFORM_SM8250_H__
> +#define __IRIS_PLATFORM_SM8250_H__
> +
> +static const struct bw_info sm8250_bw_table_dec[] = {
> +	{ ((4096 * 2160) / 256) * 60, 2403000 },
> +	{ ((4096 * 2160) / 256) * 30, 1224000 },
> +	{ ((1920 * 1080) / 256) * 60,  812000 },
> +	{ ((1920 * 1080) / 256) * 30,  416000 },
> +};
> +
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> +
> +static const struct platform_clk_data sm8250_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +static const char * const sm8250_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> new file mode 100644
> index 000000000000..a9d9709c2e35
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_SM8550_H__
> +#define __IRIS_PLATFORM_SM8550_H__
> +
> +static const char * const sm8550_clk_reset_table[] = { "bus" };
> +
> +static const struct platform_clk_data sm8550_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_sm8550 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 96,
> +	.max_frame_height = 8192,
> +	.max_mbpf = (8192 * 4352) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 489583,
> +	.mb_cycles_fw_vpp = 66234,
> +	.num_comv = 0,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> new file mode 100644
> index 000000000000..b3f5fddd43c2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_platform_common.h"
> +#include "iris_resources.h"
> +#include "iris_hfi_gen1.h"
> +#include "iris_hfi_gen1_defines.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +#include "iris_instance.h"
> +
> +#include "iris_platform_sc7280.h"
> +#include "iris_platform_sm8250.h"
> +
> +static struct iris_fmt iris_fmts_vpu2_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_vpu2 = {
> +	.min_frame_width = 128,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 128,
> +	.max_frame_height = 8192,
> +	.max_mbpf = 138240,
> +	.mb_cycles_vsp = 25,
> +	.mb_cycles_vpp = 200,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +static const struct icc_info iris_icc_info_vpu2[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
> +
> +static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
> +
> +static const struct tz_cp_config tz_cp_config_vpu2[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +};
> +
> +const struct iris_platform_data sc7280_data = {
> +	.firmware_data = &iris_hfi_gen1_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.icc_tbl = iris_icc_info_vpu2,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu2,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	.opp_clk_tbl = sc7280_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu2_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
> +	.inst_caps = &platform_inst_cap_vpu2,
> +	.tz_cp_config_data = tz_cp_config_vpu2,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 1,
> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
> +	/* max spec for SC7280 is 4096x2176@60fps */
> +	.max_core_mbps = 4096 * 2176 / 256 * 60,
> +};
> +
> +const struct iris_platform_data sm8250_data = {
> +	.firmware_data = &iris_hfi_gen1_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.icc_tbl = iris_icc_info_vpu2,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> +	.clk_rst_tbl = iris_clk_reset_table_vpu2,
> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu2,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu-1.0/venus.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu2_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
> +	.inst_caps = &platform_inst_cap_vpu2,
> +	.tz_cp_config_data = tz_cp_config_vpu2,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> new file mode 100644
> index 000000000000..11ca098ab125
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_hfi_gen2.h"
> +#include "iris_hfi_gen2_defines.h"
> +#include "iris_platform_common.h"
> +#include "iris_vpu_buffer.h"
> +#include "iris_vpu_common.h"
> +
> +#include "iris_platform_qcs8300.h"
> +#include "iris_platform_sm8550.h"
> +#include "iris_platform_sm8650.h"
> +#include "iris_platform_sm8750.h"
> +
> +#define VIDEO_ARCH_LX 1
> +
> +static struct iris_fmt iris_fmts_vpu3x_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_AV1] = {
> +		.pixfmt = V4L2_PIX_FMT_AV1,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static const struct icc_info iris_icc_info_vpu3x[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const struct bw_info iris_bw_table_dec_vpu3x[] = {
> +	{ ((4096 * 2160) / 256) * 60, 1608000 },
> +	{ ((4096 * 2160) / 256) * 30,  826000 },
> +	{ ((1920 * 1080) / 256) * 60,  567000 },
> +	{ ((1920 * 1080) / 256) * 30,  294000 },
> +};
> +
> +static const char * const iris_pmdomain_table_vpu3x[] = { "venus", "vcodec0" };
> +
> +static const char * const iris_opp_pd_table_vpu3x[] = { "mxc", "mmcx" };
> +
> +static const char * const iris_opp_clk_table_vpu3x[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
> +static const struct tz_cp_config tz_cp_config_vpu3[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +};
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - inst_caps to platform_inst_cap_qcs8300
> + */
> +const struct iris_platform_data qcs8300_data = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.icc_tbl = iris_icc_info_vpu3x,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps = &platform_inst_cap_qcs8300,
> +	.tz_cp_config_data = tz_cp_config_vpu3,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> +	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> +};
> +
> +const struct iris_platform_data sm8550_data = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.icc_tbl = iris_icc_info_vpu3x,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.tz_cp_config_data = tz_cp_config_vpu3,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - vpu_ops to iris_vpu33_ops
> + * - clk_rst_tbl to sm8650_clk_reset_table
> + * - controller_rst_tbl to sm8650_controller_reset_table
> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
> + */
> +const struct iris_platform_data sm8650_data = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.vpu_ops = &iris_vpu33_ops,
> +	.icc_tbl = iris_icc_info_vpu3x,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl = sm8650_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> +	.controller_rst_tbl = sm8650_controller_reset_table,
> +	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu33_p4.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.tz_cp_config_data = tz_cp_config_vpu3,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> +
> +const struct iris_platform_data sm8750_data = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.vpu_ops = &iris_vpu35_ops,
> +	.icc_tbl = iris_icc_info_vpu3x,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl = sm8750_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
> +	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.clk_tbl = sm8750_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
> +	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu35_p4.mbn",
> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.tz_cp_config_data = tz_cp_config_vpu3,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> 


