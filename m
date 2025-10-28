Return-Path: <linux-media+bounces-45727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8115CC12E4E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0981F4683D8
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 05:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9062989BF;
	Tue, 28 Oct 2025 05:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHLqtm4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F1EAE7
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627683; cv=none; b=nEC3BUv6pIAydv8ZmFca+poOGXiJ/n9DYlr3c4J1ocY6Nu3dyOoyVWAyFHOsimiXo1R+8injb6pP4XFl988c3outRXnjKwugRZuk13q5u5YTgvTgieX2s03VXB76GGYlfMN2MhZQjgGyZGBWBniTSDx8MKho8B41DEdS6kHmZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627683; c=relaxed/simple;
	bh=Lq0NUp8tzDM21ME58IEDJ0ubQDaHxYD7QlhSXZX4T5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/QjSnB1BbHPm4XXzqiAB4ZQGTxDjLfAnEq+ylSCES2yOjw/UihUfbwjbbLeaYz9iRvT1wBYmBG/ukkepX9BDKy0tvJWHILiJLJ6UIFjj7iC7+R5SKUEA2ttcgDxFcCXM5imIVYzJ1Q/UD902bXkjlyl0z9izliYOutgP1OTFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHLqtm4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45Hn2573510
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vad+qn8RkXM2BN3TnKTIwMAAG+YIgA1CHl86YPkog10=; b=ZHLqtm4CHqai9IvB
	qmTba2B1efr68ZmBDME+eF2GlpicIFe36gX0uz/NGyTVHbT/Pcyx1AaAYo0OUrZ8
	BkIc0NgThPUASDXXn/S/vkgpXnYMzRs8S/mTc1ssBhl/l8DIo71qZlXruXypYmQM
	8j49aXc/ahJzCZH/ijj8rzlEHHH4NLItqNbDI/qdetasQ5kAs+yITY5PbWVfKMuN
	pMzihqAhhuEzc4L3E/dz5B+n4KOkMxKUB6vvRZRSG+UPDd9iv4rkwd99lE/Lud39
	ld5h48F7z9m5JYy9SotAs2QU/kqSFGEh+l3qqTdVIraKQsqv/z6iSsiXTr5qkI/d
	X60phA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge83pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 05:01:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so4603284a91.1
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 22:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761627681; x=1762232481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vad+qn8RkXM2BN3TnKTIwMAAG+YIgA1CHl86YPkog10=;
        b=SmJlOJWx5Z4hxt5hFC7f0m3r5CGkdCc9FgTbJqVkw6LkSxO84tn1UQs5ka4qFLGxiY
         khXuG8MxzYWeiQm+nfx0fdXJXlJ+TKk1ZwNrxY0MttTfCPYBXge4OAIgmJG3FVGKOzlQ
         /5QiE3Nak/ELOc+D7Oo8ki+GWOn85cxCH4rAPWHdERwGpN13Fa6MZUsDhk/33Z1cf0pm
         cywKO2Ux/lkHZMCSnW886JmkUDs2gSrStftFLqeypmREir49Z744jGbRdmf7gx09iYrt
         g+kjWRXCvDuiLjGwZ3I8D4W0OBacP2Tzg/eKYIZX7qXes/tCn7o4UMRvuYnWA0nJ1+Ui
         b5JA==
X-Gm-Message-State: AOJu0YzJdmbcOFw9qubRACsN+HMV4FbNccimN1EDtSKHj/CJipVd2kKu
	VFqoc06MPZDVs5PRdzJzH9+dhicXuLZsmgCPdc0cMPvqakKmWXPPYmNU2sOQiG/p4H3YGjaInVe
	uyLPZe6xN9XztQhU1sLr9DuDAfjDXaq40cQ84HBMKyomCgBdBEEgY4LYKQg2X+USsag==
X-Gm-Gg: ASbGnctFZg4jmGYo5mPhjeqFnlEnVPvnDorh1ZwXthRas6WTQLaCwJB0oLxIcIfOts3
	adYXeosUYtb7c0WFQIBdhjcp1whjKRuQwr6PlXn4Nb0NY9o2ty/XpTpKDQl8LTFpbvpgyOz3HaM
	6u3imDyOW8nIDqneReBlb1SYmsDowDHyHqEoutOnMM10ZeKvOn+CMBcnVOhs3PuzOOo4lJWagCM
	ocH57q155lhY7iAT5ipOEl7NKg3PT1FOtguC4xvPQe0iroptWk7U98IvTy7KbCe2RlDnGZwRk1F
	JCGJIwngzCwcYGLeilZ/ZDn0IdtDiE96hhnNdUziK43ltzr+yypKw12WkTBqXEYK9YyyzAlDPzv
	EWcKGKJ1cH1LltLl+U8z7OH63YTNc0/o=
X-Received: by 2002:a05:6a20:6a22:b0:340:fce2:a15c with SMTP id adf61e73a8af0-344d1ba883dmr2074222637.9.1761627680745;
        Mon, 27 Oct 2025 22:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDeIRD4wAR0wRMOvJHEteHWQmjnRT05hGOov0KIeVR9og2SzmIgUQrAfBFQA0Yal7IiQhpw==
X-Received: by 2002:a05:6a20:6a22:b0:340:fce2:a15c with SMTP id adf61e73a8af0-344d1ba883dmr2074192637.9.1761627680233;
        Mon, 27 Oct 2025 22:01:20 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d7cdf28sm9039013a12.31.2025.10.27.22.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:01:19 -0700 (PDT)
Message-ID: <68974e34-78e0-d82a-f552-044e9bae3170@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:31:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/6] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
 <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-3-5eeab5670e4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: snh-YKPS0CfmdawbS85JXl_0gE_5nsOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0MSBTYWx0ZWRfXx16jKxAMUMIS
 D2vBDc03xKLnhKb9yTdlyfU22MUNIFG/tBeyVcjMcNCTJyR7Sce9nwXlD/GYD9mPLAvPB1KiQuj
 IAeSOnkp0mAqwzMgiUDF7bflftjxGvI9QvNU6QbOjO+d4pBvP1acu02VDuIqYWf0u8jlCERebKn
 VTVHW9c2gMBIw4+bFVzg7XPUGNKl5UlHogbWKeSOee8NfJB+jVDAnxc0kpuLRMDHg+k6darCvhj
 VLkoyHbmj6YNna/u8cZC+UHQ46Z8zkWhwKYLYzjRDGIKQBM5SvVfMZJcw5G+qCKW1Oss/3Fpxt0
 Nu4voq75rpGg3VUEyysqCgpuDF24dCXkZsLFRAKd0I+xxwH4xwIobfvdYZKJqekMLkcMA3b25oZ
 uUhY9Kvky0zn3kZKHLVlKoU4xYXA7w==
X-Proofpoint-GUID: snh-YKPS0CfmdawbS85JXl_0gE_5nsOj
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=69004e21 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SvJZJoMY8oi3fNviAK8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280041



On 10/27/2025 5:57 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
>  		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>  		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
>  		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
>  		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
> +
> +		if (cap_id == PIPE) {
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].min =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].max =
> +				core->iris_platform_data->num_vpp_pipe;
> +		} else {
> +			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> +			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		}
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_2,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_2,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -20,10 +20,8 @@
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>  		.set = iris_set_pipe,
>  	},
> 

