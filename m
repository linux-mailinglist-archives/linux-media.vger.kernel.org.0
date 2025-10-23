Return-Path: <linux-media+bounces-45341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E8C0006A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE4C83A9E93
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 08:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D403043BF;
	Thu, 23 Oct 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jP85IU8L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8910303A17
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209573; cv=none; b=DE6wbh8VvggY4oG1WbqEiPstPyxQKoDoXW/ki84mUp+j9QAE2pzIJ1tPkjhB9gshbMp00Wv/CVc/c1/UmPA1TCq1+1dldEoGAv97W8RvUuSl9tLczzTE3201ILwA4/A6sZ0jBXIobIm2rS7VMx8l1FxTac3eaEF0jtZXUcTNFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209573; c=relaxed/simple;
	bh=VxTS1/Ik5/RdFtMLR/CtALXIiCv5xwuurZZlT/q/W5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phJuQV0rfpnARz0kad6IPYMTvGaDFMiWIAV8hRYfPupImCqs+ZgGqBiVPb+av1U0TtqMF/9mIUI4ijTcXntKbNafRqvzFudZ7SFuNEECHMX1nDrYALoVW1ZaqiyYPKFkos4SMO1rAzdLCY6aDg2NWKL4tFOTlPuGFG5NDk4gnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jP85IU8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7gLrV026339
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqvMC3BF/3BBwxbMIWbzSUgtt8paDr+OoYPzN4L337M=; b=jP85IU8LVBFSWU9J
	SSAx77n7e3jwhHKZihWYNaptsu86IuV4i5si+PoKz3V8dq8cizFpuB4/5/w6/d18
	hvehrHBM8uMTuCNqi/C5J082C/zQiiqYb6cPInjDN0XL72BUEngROwaDO01SP4ks
	cRtL2xMl4K7XOUEfwoctIZAA7i3eQJGGMi+2qfOh2EaTF8WsaDh29C68kIclE+VW
	0ZmS7N764U0Iz9hAyjfBN2vYdJddkSW2A1Ygvn1iCfOJbSk1zomLuQAtaP648OhE
	jkwyYXKCNzFFnIUjCPcUIJ5YqERhfTXR+yfl4oRpVFeFJ0SrhdTZf8uBT1j6SwWg
	Dy0gpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8hsn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:52:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7811a602576so1061859b3a.0
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 01:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209568; x=1761814368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqvMC3BF/3BBwxbMIWbzSUgtt8paDr+OoYPzN4L337M=;
        b=AOz2BSvJBC72RZ0TQInqQQmCpR7FnpbKXVxAc43WJhJjti2Au/qBJ4AziS+2ABdMlR
         vdCwohy6anZnl5eBpIravgdULJ3K0Muz4IoSCN+TXjuySj0DYsKm1WsT4orNbuO+4xHh
         MMpvIrpG+Vd9reTznqdUt4pj5GvxhBKo3kcRhhRriW9qTQc2t8BjWsGhzaIHRNHssp4w
         HfTmbQ1JqeNUW7ESkydeWJ/qUQRVc6KIJ8NBxUIB0z8OrUSGJ+F645fSDe8VqvGZ87Dh
         QOaV3NIE+Ml6jKC5SjvN6j5B79RGgxsgBdCcJawgBHUGGh5N112ezlXWPCjIqyTwsuaT
         ftAA==
X-Gm-Message-State: AOJu0Yzs+P/LbKmLIcSmjEsRQSrrHVc6NOq+g00wlx86oMJRhq0cwGMr
	6I7QXw82yshmqfDsJjAPORMaZZb/KHGQldpAl243Y73r3ZvuNHsAQE842uuRUBWj1MsUnCESnuQ
	JASk3YNYnZp2KkNE3hquaNzW6ZvAfVOiSQMJZc7dlKQ75oXGEV97G9qRgUfs9StG3ug==
X-Gm-Gg: ASbGncvcDjt/MNW4RDlTpVLkmTB66FPSoyF41K3PcKOUbbAwaFy9p6TOCTCG1kZXmdy
	DbowCkH2AsrJAnLt1h1SOktARAUt3JOWIMKoieJG8jCEx47h2RVVPSVdUmKAoJpsNlwuI+wRk68
	i/14aZ3rGA60sQD7AmbgZGzRDfgAIXNYW90d2lrJ9lLNBN93CV6vI6ae6Pzgf4S0gkzwFFf/NY7
	98jyi+VGJeD+bEAA41z49HqbjWgFM4JtxpRGEe7Wu2mslheGqXxyQoGbme9W/DmQoMJeBJba3mJ
	vNQa/mIwLQ3/TJfxUPSGJbhQw+w6Gm1BEY8Lu05oaS5iQ5RQMUgH2zDNsrKKO+FLYq+zliItFaA
	hk9pwmiFPwmkFp/7ZDfh7VPUrz3B9rLg=
X-Received: by 2002:a05:6a21:1584:b0:334:a93d:83ad with SMTP id adf61e73a8af0-334a93d83b5mr31681559637.8.1761209568241;
        Thu, 23 Oct 2025 01:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcvMgmRONEgQK+fXtBOKBnvMpRhi/MLpSqOoXfbSUxtgPWPXoH/wQkhnFE5kVLvSw62kEAfA==
X-Received: by 2002:a05:6a21:1584:b0:334:a93d:83ad with SMTP id adf61e73a8af0-334a93d83b5mr31681535637.8.1761209567697;
        Thu, 23 Oct 2025 01:52:47 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e2c95asm1436671a12.28.2025.10.23.01.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:52:47 -0700 (PDT)
Message-ID: <efd311b8-136d-0e08-4e1e-6cc02651d22c@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:22:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/6] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
 <20251019-iris-sc7280-v4-4-ee6dcee6e741@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-4-ee6dcee6e741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 93xPeepNxgs-n1IVZWwhyVUS5VaA9N8j
X-Proofpoint-GUID: 93xPeepNxgs-n1IVZWwhyVUS5VaA9N8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX58i0r7yhfqJb
 Vq4v+uymh2hYLH4CEuahElHfLnBAwLfuIjlus4dFlG1w6ayWRtqNCWE23luewSDWdqELbpc43HV
 21SDnnlkIZXWXqyiXvzyMUe8WlJ4DykUVsGPFdhimQJgc7W2F0KR9RYsJvnRDJYvxJAaf8s5oS0
 Qa3dXgbyGtGNZ8nremvf1E5vLvkifOJVWkZKq7fhAOTGSdTM0/uZQYciYtAgIlZytSn9N1TqLTK
 kNOMrJ2A87K0k1mTqEqcjsa/UdyF/3WYUCvpvSpAcfZzCzR+4ywI8mPYdO/5RzgQEh9Ja0ECNa/
 yTSJW+uxiLN/vhgpB/l3b+Iaf5N5Wc6zpISGIWd0hxpyOfEsNssm/9eL9+KmXinQFmcPGR0xTF7
 BJmpkiI8HlauqwdM7vkW8ZSu2iTzJA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9ece1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TLZo1Ju0aynVPnjjdSkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Pls fix the typo in commit title s/duplicateion/duplication

with that.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On 10/19/2025 1:26 PM, Dmitry Baryshkov wrote:
> Now as we have removed PIPE value from inst_fw_caps_dec there should be
> no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> QCS8300-specific tables and use generic one instead.
> 
> The differences between QCS8300 and SM8550 data comes from a
> non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
> capabilities to firmware for encoder video device") (which added .set
> callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
> capabilities for encoder video device") (which added QCS8300 data, but
> not the callbacks).
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 533 +--------------------
>  2 files changed, 8 insertions(+), 534 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 03ce5c259c8491ae6882128795d18569baea6241..6970bee488e4617478f807a30afd231275875f5a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -995,7 +995,6 @@ const struct iris_platform_data sm8750_data = {
>  /*
>   * Shares most of SM8550 data except:
>   * - inst_caps to platform_inst_cap_qcs8300
> - * - inst_fw_caps to inst_fw_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
> @@ -1021,10 +1020,10 @@ const struct iris_platform_data qcs8300_data = {
>  	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
>  	.pas_id = IRIS_PAS_ID,
>  	.inst_caps = &platform_inst_cap_qcs8300,
> -	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
> -	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
> -	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
> -	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 310c48958018ae724d01c87e7977096cd86e1bfd..a97a9f932b75a88535df66160dfc934220919ed5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -3,536 +3,9 @@
>   * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> -#define BITRATE_MAX				245000000
>  
> -static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
> -	{
> -		.cap_id = PROFILE_H264,
> -		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> -		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
> -		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> -		.hfi_id = HFI_PROP_PROFILE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = PROFILE_HEVC,
> -		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> -		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> -		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> -		.hfi_id = HFI_PROP_PROFILE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = PROFILE_VP9,
> -		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> -		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> -		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> -		.hfi_id = HFI_PROP_PROFILE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = LEVEL_H264,
> -		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> -		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> -		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> -		.hfi_id = HFI_PROP_LEVEL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = LEVEL_HEVC,
> -		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> -		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> -		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> -		.hfi_id = HFI_PROP_LEVEL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = LEVEL_VP9,
> -		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> -		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
> -				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
> -		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> -		.hfi_id = HFI_PROP_LEVEL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = TIER,
> -		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> -		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> -		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> -		.hfi_id = HFI_PROP_TIER,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -		.set = iris_set_u32_enum,
> -	},
> -	{
> -		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> -		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> -		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> -		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> -		.flags = CAP_FLAG_INPUT_PORT,
> -		.set = iris_set_u32,
> -	},
> -	{
> -		.cap_id = STAGE,
> -		.min = STAGE_1,
> -		.max = STAGE_2,
> -		.step_or_mask = 1,
> -		.value = STAGE_2,
> -		.hfi_id = HFI_PROP_STAGE,
> -		.set = iris_set_stage,
> -	},
> -	{
> -		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		/* .max, .min and .value are set via platform data */
> -		.step_or_mask = 1,
> -		.hfi_id = HFI_PROP_PIPE,
> -		.set = iris_set_pipe,
> -	},
> -	{
> -		.cap_id = POC,
> -		.min = 0,
> -		.max = 2,
> -		.step_or_mask = 1,
> -		.value = 1,
> -		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> -	},
> -	{
> -		.cap_id = CODED_FRAMES,
> -		.min = CODED_FRAMES_PROGRESSIVE,
> -		.max = CODED_FRAMES_PROGRESSIVE,
> -		.step_or_mask = 0,
> -		.value = CODED_FRAMES_PROGRESSIVE,
> -		.hfi_id = HFI_PROP_CODED_FRAMES,
> -	},
> -	{
> -		.cap_id = BIT_DEPTH,
> -		.min = BIT_DEPTH_8,
> -		.max = BIT_DEPTH_8,
> -		.step_or_mask = 1,
> -		.value = BIT_DEPTH_8,
> -		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> -	},
> -	{
> -		.cap_id = RAP_FRAME,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 1,
> -		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> -		.flags = CAP_FLAG_INPUT_PORT,
> -		.set = iris_set_u32,
> -	},
> -};
> -
> -static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
> -	{
> -		.cap_id = PROFILE_H264,
> -		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> -		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> -		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> -		.hfi_id = HFI_PROP_PROFILE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = PROFILE_HEVC,
> -		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> -		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> -		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> -		.hfi_id = HFI_PROP_PROFILE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = LEVEL_H264,
> -		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> -		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> -				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
> -		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
> -		.hfi_id = HFI_PROP_LEVEL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = LEVEL_HEVC,
> -		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> -		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> -				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> -		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> -		.hfi_id = HFI_PROP_LEVEL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = STAGE,
> -		.min = STAGE_1,
> -		.max = STAGE_2,
> -		.step_or_mask = 1,
> -		.value = STAGE_2,
> -		.hfi_id = HFI_PROP_STAGE,
> -	},
> -	{
> -		.cap_id = HEADER_MODE,
> -		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> -		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> -				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> -		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> -		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = PREPEND_SPSPPS_TO_IDR,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 0,
> -	},
> -	{
> -		.cap_id = BITRATE,
> -		.min = 1,
> -		.max = BITRATE_MAX,
> -		.step_or_mask = 1,
> -		.value = BITRATE_DEFAULT,
> -		.hfi_id = HFI_PROP_TOTAL_BITRATE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = BITRATE_PEAK,
> -		.min = 1,
> -		.max = BITRATE_MAX,
> -		.step_or_mask = 1,
> -		.value = BITRATE_DEFAULT,
> -		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = BITRATE_MODE,
> -		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> -		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> -				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> -		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> -		.hfi_id = HFI_PROP_RATE_CONTROL,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = FRAME_SKIP_MODE,
> -		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> -		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> -				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
> -				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> -		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = FRAME_RC_ENABLE,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 1,
> -	},
> -	{
> -		.cap_id = GOP_SIZE,
> -		.min = 0,
> -		.max = INT_MAX,
> -		.step_or_mask = 1,
> -		.value = 2 * DEFAULT_FPS - 1,
> -		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = ENTROPY_MODE,
> -		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> -		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> -		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> -				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> -		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> -		.hfi_id = HFI_PROP_CABAC_SESSION,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> -	},
> -	{
> -		.cap_id = MIN_FRAME_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> -	},
> -	{
> -		.cap_id = MIN_FRAME_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -		.hfi_id = HFI_PROP_MIN_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> -	},
> -	{
> -		.cap_id = MAX_FRAME_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> -	},
> -	{
> -		.cap_id = MAX_FRAME_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -		.hfi_id = HFI_PROP_MAX_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT,
> -	},
> -	{
> -		.cap_id = I_FRAME_MIN_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = I_FRAME_MIN_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = P_FRAME_MIN_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = P_FRAME_MIN_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = B_FRAME_MIN_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = B_FRAME_MIN_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MIN_QP_8BIT,
> -	},
> -	{
> -		.cap_id = I_FRAME_MAX_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = I_FRAME_MAX_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = P_FRAME_MAX_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = P_FRAME_MAX_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = B_FRAME_MAX_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = B_FRAME_MAX_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = MAX_QP,
> -	},
> -	{
> -		.cap_id = I_FRAME_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = I_FRAME_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = P_FRAME_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = P_FRAME_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = B_FRAME_QP_H264,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -	{
> -		.cap_id = B_FRAME_QP_HEVC,
> -		.min = MIN_QP_8BIT,
> -		.max = MAX_QP,
> -		.step_or_mask = 1,
> -		.value = DEFAULT_QP,
> -		.hfi_id = HFI_PROP_QP_PACKED,
> -		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> -			CAP_FLAG_DYNAMIC_ALLOWED,
> -	},
> -};
> +#ifndef __IRIS_PLATFORM_QCS8300_H__
> +#define __IRIS_PLATFORM_QCS8300_H__
>  
>  static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>  	.min_frame_width = 96,
> @@ -547,3 +20,5 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>  	.max_frame_rate = MAXIMUM_FPS,
>  	.max_operating_rate = MAXIMUM_FPS,
>  };
> +
> +#endif
> 

