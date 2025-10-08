Return-Path: <linux-media+bounces-43901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3153BC35E5
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 07:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD7DB4E38C1
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 05:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD9120487E;
	Wed,  8 Oct 2025 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHpaPM5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2454652
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 05:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759900567; cv=none; b=qZ/nxJtPOkNYpBCjAaKX4gz4DT8oEb453CgdUbtnET6tEna+1i+2xdfE2JGIxgXT2kAfvsiSmyhHqdegHArZoPXD+V7gry3GbW7IaoO8R/c4Inhi5z6hCGZ1GDaXaVLBqf8Oe5S098++HbH6G3MYuAGCjNOiEeX/9P90G9kwgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759900567; c=relaxed/simple;
	bh=Xk94Vuc6seJLdFlhJl0nzWNmxlsrdyIWoO3t0wdkjEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3QmWwYA1ym4f2e6pAhq+trLPfoeeSNPzryQwLu/bPR7dpExedMPYZsf5v3cxBOQkX5yshINB3ht7mpQYPq07eWMuA8MpzWp22rtBLrR+zbA4a8XblvPcox1b9O8eNf39M1Jm0eXnsKexIVTg1fb5M7wVCvM3yavK944cKgCeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHpaPM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59804RqC024648
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 05:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zN3inemXqS9KNGoW5/uyVfSNbK9UhPopJTspFYvxv78=; b=LOHpaPM5Vf0Tp2cb
	fACNshV1ouHsFjzI5o50H3M2xZ8pCUMsYOcPoIKwpeUl0ImRUOGffZg4FkAYtUhV
	TVKpb/GJRRx4OrlExfio7NfBIfayAQyS4xd2v8MozB4xe2/5uOrJZHtcpK6/Blwk
	/QIMBRAfP7xX5QqOZXiExhQMfFw6UPBodmGPdpxKNE+2aeLavTNtAfqhM0LlBvXx
	61J40quY5u1S2wSUhui9/HdYnBvXJJZF1vVo9cq1nGCVlLhKWquHB0XXxbwB+GxP
	HNcAqelur5MjmEbG2G9QB6aS+Iqd6YGyNA5VWEOBfNVXCVl+GNhxZSY6KhvQ/H7Z
	JSHYew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk71ejc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 05:16:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so6802838a91.1
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 22:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759900562; x=1760505362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN3inemXqS9KNGoW5/uyVfSNbK9UhPopJTspFYvxv78=;
        b=TS7XpVGI4w9DPn9pZp2uomsRoGf2b8yDFCuZYxaiC7TKLpJLKyRmKgP40Oc0We5Jvz
         jKdso54FPory+PwsSxPvua0Gc/t/gN7TdNZIy3gs/WQL0lax5cLtoKjbKbocXID3pV2J
         rH3LF/vl5tyMjEPmhPvnHWQzpP+fRUV+BKASTGTcGRtJxt9HFEutYiTufV7Z9MgZlDxR
         wc6lmIny8rXM0v8VGnfsEAnqfQXlG29bTwoEsL15p4Q/JirgFR/sFa3+gGAQP7YmT1vn
         7tLGfK+Wjak8Oyo4t5dO7mS0n4+95oVxUO03AK55WwqC/rMzhgGFjkhQUS4bmafvRDUP
         wBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcbztjnzAbQ4hbA242T5mYTn6ZeaEj1n7wPI7rDQNZt38GPkxkYDpBpWDgXdNe1K02k3vUa0uRkkOWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9Q8tf85Mk/FD4aXQIm1GOzzhcEUuKkDyeYqOYurFu3TWytsH
	1G71ZZwbbpelVPFOibTyf1X7zzyKYdNcLk9rGw0a8WL/LwPh1X+QHnh/NJFDA8/N43B6BHS/9B9
	Cha+6faxzPGa0x/+5kD49PNLhipjzzcTxI75oZx4pihHEG3mjWUwiMi8UMMpFH1XRmw==
X-Gm-Gg: ASbGncv2u1MX+UT2p1KkDOXjqD9M4c8BWamSNP+ENgmuT5nmX2/nlkMaUSsdDs2Bs2w
	rvC/3FHI1o0aZCcjuCVQ2AoanE3pcE0BzoUsnqARdlQsViDGBc2Vp2n9jHjrOdRw5OOvXkMfREZ
	0O0u4odHRtjK6NDhLw34TTlmCiZbZl1efHf50A9yNJh5LQOy36MTxC4XZybOvy47/vTHPI3CjVY
	GX1oS8y1NT401y6xwUgVJ9+0gwKHq82k+LqpPRbfNKPEG5Q3MvIfkg23qXhP45rLliM5LE1NDoe
	+uv/3EQ9yRfbCs/mnsu+C0iNVcWUipNFZKE4gRc4+qRqHKIafa7n5DUCAkg4Q0xTpmgK8qA8F4t
	c6Q==
X-Received: by 2002:a17:90b:3ec4:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-33b5116b782mr2662519a91.16.1759900562231;
        Tue, 07 Oct 2025 22:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJfXchZYLk7AwCGFqllzQgE2NliGSPz5KcimSGlsyuUs5e0R13CuQuC6i02t0y4fizJxZ2tA==
X-Received: by 2002:a17:90b:3ec4:b0:32e:51dd:46dd with SMTP id 98e67ed59e1d1-33b5116b782mr2662477a91.16.1759900561622;
        Tue, 07 Oct 2025 22:16:01 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5114acb7sm1714505a91.24.2025.10.07.22.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 22:16:01 -0700 (PDT)
Message-ID: <1530abc3-158b-a3e5-54a6-d96b24178406@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:45:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: venus: prevent potential integer overflow in
 decide_core()
Content-Language: en-US
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX+LwonxR8PEJV
 SNIgzaQD4ccVCIKYkw1IbsodaZzBE1LiOZImdoTl2xO68PA8AERc1W5gQjFJLjIJzmOoEZlKN/7
 zPaTIskcXLeA/Q7ooZNDKpRWdRWFW+qevaoulAEAT3PIn2boA9o9ZxG8zvYqGnWdUiti+lraxek
 GYVojy9QyIiXY9QfCqfLSddQkd6O1QI3vvavydpyIcoOhM/gFTeoZ1hRIeVaNYNO4lltL9geyYi
 G4Z6EPSwXn9uez7Z4OkOVZEnYIJ+ttx2bBkhTbqdEikrnuaUwjZgn9pZHGUsaGZPdYk/6jrX72w
 AGMb+uc436I3jaD7ccTIltriUfvhi6pPlG5g3Y8sJi8fEzE7pyKMcdu9zU7m19phI08joHUCBYt
 ClWf1aj1LcndPPluupfniFPHttqUww==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e5f394 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=ACEZY41XAAAA:8
 a=HH5vDtPzAAAA:8 a=EUspDBNiAAAA:8 a=E45_vJ1-3OPGenHQyXEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: 1xbbGdnDSIJIaZwbXLHVpAYwnhekdKds
X-Proofpoint-ORIG-GUID: 1xbbGdnDSIJIaZwbXLHVpAYwnhekdKds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017



On 10/7/2025 4:00 PM, Pavel Zhigulin wrote:
> The function 'decide_core()' contains the following code:
> 
> 	cur_inst_load = load_per_instance(inst);
> 	cur_inst_load *= inst->clk_data.vpp_freq;
> 	...
> 	cur_inst_lp_load = load_per_instance(inst);
> 	cur_inst_lp_load *= inst->clk_data.low_power_freq;
> 
> This can lead to an integer overflow because the variables
> 'cur_inst_load' and 'cur_inst_lp_load' are of type u32.
> 
> The overflow can occur in the following scenario:
> 
>   1. The current FPS is 240 (VENUS_MAX_FPS constant).
>      The processed image frame has a resolution of 4096x4096 pixels.
>   2. According to 'codec_freq_data':
>        - 'inst->clk_data.low_power_freq' can be up to 320
>        - 'inst->clk_data.vpp_freq' can be up to 675
>      (see drivers/media/platform/qcom/venus/hfi_platform_v4.c
>       and drivers/media/platform/qcom/venus/hfi_platform_v6.c)
>   3. 'load_per_instance()' returns 15728640 under these conditions.
>   4. As a result:
>        cur_inst_load *= inst->clk_data.vpp_freq → 10616832000
>        cur_inst_lp_load *= inst->clk_data.low_power_freq → 5033164800
> 
> The proposed fix changes the type of these variables from u32 to u64
> to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 3cfe5815ce0e ("media: venus: Enable low power setting for encoder")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
> v2: Revert min_coreid and min_lp_coreid to u32 as
>     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> suggested
> 	during review
> v1: https://lore.kernel.org/all/20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com/
>  drivers/media/platform/qcom/venus/pm_helpers.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..eec49590e806 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
>  }
> 
>  static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
> +min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u64 *min_load, bool low_power)
>  {
> -	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
> +	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>  	u32 cores_max = core_num_max(inst);
>  	struct venus_core *core = inst->core;
>  	struct venus_inst *inst_pos;
> @@ -639,8 +639,9 @@ static int decide_core(struct venus_inst *inst)
>  {
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>  	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
> -	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u32 min_coreid, min_lp_coreid;
> +	u64 min_load, cur_inst_load;
> +	u64 min_lp_load, cur_inst_lp_load;
>  	struct hfi_videocores_usage_type cu;
>  	unsigned long max_freq = ULONG_MAX;
>  	struct device *dev = core->dev;
> --
> 2.43.0
> 
LGTM now.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

