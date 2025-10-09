Return-Path: <linux-media+bounces-44046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C2BC77EA
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 08:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64CF19E6773
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 06:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89AB295DBD;
	Thu,  9 Oct 2025 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZas7T+o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D1296BC5
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990210; cv=none; b=paded6kbkD7uZfWKyK5V/zQ+O9wU5Fnzf8wfDfXgvC/bv5azpAWFlF76bz06Dy1DZz/8I7rtgFJKLMbdKIa1gEnJLt0ydak4piU3y6LJacaOy7YZX62M+UtJuUrhaZ8AWN5zdTNE9+vM5NjGzLJTJQo1VOXm/i81Qc4F+zoGmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990210; c=relaxed/simple;
	bh=pMzm5wNxxUFl/5sjiP8j0+TV/IGk2N8zL78Vrtg7pfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edIe8no0751VuwGqWylmjm8YKBrIlhS5EZxjRwhxF2Z1BH23F/xCbsRDnafuRd6enO560VxuAzjAp7qTRmiuvs2M4dxT0erKr5nbDLcK3OlB67bcFKOBUVnJPgrmUXoK0HXWucFjMeanuKlj3iG/ty81SwLhmQJ1hbxogYtJmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZas7T+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IWq004522
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 06:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssN14l2OvXNkdR+hETa9VZ9gJr2xgrcCMKyp8zmtTPc=; b=RZas7T+oSTf18cAl
	IpzwzVmMQjlxe0J3oRGzzbt70B64n2/RozNujqRGssg/u2SAE69njQqZ6iUgDoe0
	ii4YVDXVAxoXNR99SvWDfdKY13TLT4Dcx/LPen8AtsR6ua3Yf2jF4mAn0oeXKgOM
	o4tNWX5g3cJde3gwPZakn6ux8f3PpoU4ycx7MMZ64dIsNAeyYLik9YpshmuqvibK
	J/78QQNEha+tnOh2A0t73vZF26zcFUxDuZOf8ZCHqC1cgOrUXs4QOKPQPn0R1wKH
	y0DgSh0tVf6rHKg0WIdbevaltq8wUM5ChyoQLbkqWBycHFxtz262kcZT+GW1tDFX
	gVadeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksn2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 06:10:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33826e101ecso3935602a91.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 23:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990206; x=1760595006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssN14l2OvXNkdR+hETa9VZ9gJr2xgrcCMKyp8zmtTPc=;
        b=wzOPCaFZnzmq09GSn+PpFhm5e/00hgwCuUO1EKSa4xxzFwkzhAEx03S1ka7PySDyDa
         XXcr3Epd5FQFs8RAoW7F0efWB/8CfFlOuEmvLPAjs9fHYy1CJNL28e4ySTj1hC9TwRWp
         PncC4ojUv9fH7DAq31o34N8wOqepF/4fw3Q3mmnDZbL+EKbXK5d9mSYW62ivEeNW2F6u
         XZ8kB1W98AEVNjlN5WiOpwOHMxC7X4s7AJKnaIJu/H6XKGdefE4BhKnR/7plQeCpGbZ+
         uf9j4pGxhHNjhoG08QpTqyd61VYDL6lAN4Qm8qQLumdxMKYQmb3m9jViQkhQWBj3AWbj
         MA8A==
X-Gm-Message-State: AOJu0YwD3tP5Dy/anxGK90nUobg3+7QF1glJJMOXB2O8vtM5OKXzzOIy
	3YQmV7qXHrG7IsfMcEO+PPxYtylaL/CCco35NXw4KoIWdWGVzEbW3vUjKDJfBfzQ2M6fuCnwVqX
	Qf314oSM+BjGKvW9Piqg2dQ01bgrRMe0amYsOcjbTV4pSZetpOOeMn6GgbE1BuvF9zg==
X-Gm-Gg: ASbGncsAgDu/9i+8zvJe59upTxNm+nws8+AwSnJyHb3+fL/Nuos7sB7vNAwnczL8QDp
	KJ5i4NweuBoqHXkvgREr+lcTl6l6G4HcGDEBSs7P0OC4L4RDlFvV6GNfjBCHLtd2flSZipJe9oZ
	wy8lPYWx1r7skrixUGnDwUnWj1+/YuqmnF7ssA4LW+Sp4y86YoSrYMaDbzYfcspXSHa692XjVWw
	9jLCXFJSJ0FzW5bZAaXnynTOBbE7dgJUCZgi8YzVU0Bk42/s0x8dzk9ufzPGiebo4+8/qQwSONb
	iCudG5Kuz29Rrxoi6gujDec2IbR+2EKIszHCuY/olTHWYhnqeJRn4MKvCxiMimDzqT8jx3SwD3Y
	1YA==
X-Received: by 2002:a17:903:1acf:b0:269:b2e5:900d with SMTP id d9443c01a7336-29027e5ee48mr83144445ad.5.1759990205389;
        Wed, 08 Oct 2025 23:10:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGppskwtIqu+FnOlWc9evRH9KNXKIzDGrpIbfgupPXylG4vfcWk8GVgIe3N0c1riE0STqBJcA==
X-Received: by 2002:a17:903:1acf:b0:269:b2e5:900d with SMTP id d9443c01a7336-29027e5ee48mr83143855ad.5.1759990204749;
        Wed, 08 Oct 2025 23:10:04 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e179cesm16568185ad.34.2025.10.08.23.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 23:10:04 -0700 (PDT)
Message-ID: <f622da01-3eb3-1aae-f788-d4dc6c22617f@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:40:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] media: iris: remove duplicateion between generic gen2
 data and qcs8300
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-5-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/MCXV+HE3Yz6
 sNa0VRnPf1HqhtgdWFpUm/Wl+mWw0P8aSZKe/hPbiW/5JwqPO3kvyQjf31Ot/ISxjaO4LfKKmOz
 nqToBOVaDEzurNoC2u2THqKsykUqeKFTT0KJyPOZPfwSDIzsZbGOsi1qd7/AVS05NxPWqOvKygL
 OE6U/ebnPw+4fWO3u5miUO3OYKp92Gjct/pMYK6r17LxGrBx5UoWIrPE7NulIKE+NWEWti/7KVh
 QDqlHSyHUJJWMjHhvRev36LNBD4VPLTkdY4jHChnptLxrQ9rxVj58r6jfxeqXb3X/WNLLXqhM9d
 He2GqW9HKxYCp91J4XImdzNbH3EMi9vxb81NANawlvCXr2J/7CnS96HiBrCB6ny0G8zOc7dSNBp
 F51+YJWssmgiR+43QTz6Rbz3da+Gdw==
X-Proofpoint-GUID: UQyJuYvIWvmjtFNTgi6mp181YPCdL4Gr
X-Proofpoint-ORIG-GUID: UQyJuYvIWvmjtFNTgi6mp181YPCdL4Gr
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e751be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Dxa4BB5hUmT5MAWwTIQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> Now as we have removed PIPE value from inst_fw_caps_dec there should be
> no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
> QCS8300-specific tables and use generic one instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  28 +-
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 550 ---------------------
>  2 files changed, 18 insertions(+), 560 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 7ad03a800356ae9fb73bdbd6d09928d0b500cb3c..5ddc579a73bbc75e3bfca5881d6eee4aa40f09c9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -12,7 +12,6 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> -#include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
>  
> @@ -993,11 +992,20 @@ const struct iris_platform_data sm8750_data = {
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
>  
> -/*
> - * Shares most of SM8550 data except:
> - * - inst_caps to platform_inst_cap_qcs8300
> - * - inst_fw_caps to inst_fw_cap_qcs8300
> - */
> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
Agree with removing the fw_caps and using the generic ones.

But inst_caps should still be in separate header file for qcs8300, to keep
design consistent across SOCs.

Thanks,
Dikshita

>  const struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> @@ -1022,10 +1030,10 @@ const struct iris_platform_data qcs8300_data = {
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
> deleted file mode 100644
> index 612526a938eed0554fc0da99e12c26d22e04bb6e..0000000000000000000000000000000000000000
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ /dev/null
> @@ -1,550 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> - */
> -
> -#define BITRATE_MAX				245000000
> -
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
> -		/* .max is set via platform data */
> -		.step_or_mask = 1,
> -		/* .value is set via platform data */
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
> -
> -static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> -	.min_frame_width = 96,
> -	.max_frame_width = 4096,
> -	.min_frame_height = 96,
> -	.max_frame_height = 4096,
> -	.max_mbpf = (4096 * 2176) / 256,
> -	.mb_cycles_vpp = 200,
> -	.mb_cycles_fw = 326389,
> -	.mb_cycles_fw_vpp = 44156,
> -	.num_comv = 0,
> -	.max_frame_rate = MAXIMUM_FPS,
> -	.max_operating_rate = MAXIMUM_FPS,
> -};
> 

