Return-Path: <linux-media+bounces-43803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07507BC0557
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 08:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08D53C1F8E
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 06:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C61E2236F2;
	Tue,  7 Oct 2025 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amH6AdCY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434561DDA1E
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759818561; cv=none; b=IhB3g8Cm1gHRQC7cfjIemGaV6ywsXP3Tf4o8g2rvag1iVHZnqHls8N+Gv4Avh99D1MmW3dgREd/lNt5YSM0TlqMdDrau9id9KvRR5e6NlP2G2eMlI7fQVycav/dBrRYQC0hUyQcOh8h/CTmlhgpXljFWLaDiokgmaJUzCNYSwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759818561; c=relaxed/simple;
	bh=UzKLGad+vXk1zXjOWaOEl+vXcwqlI2M59gvOtq+AVYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCVEHDkGbYZGmUVnevyaYUjgPsLcV8mVmH1eitymrAz3HdE80ryHXPM4PTaZ2lrVg3M4YKBSOe3eCHL80gdZVwB4dr+8fDK1yJCMi75b8KYtzHPszjSnr6dxMR90WTJZsanOrfTWbGzmakKXl5aUQobe0Nm3ducMDz+6tSjD254=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amH6AdCY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974JDpt026646
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 06:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJ/mZMe9eQHwc6pMOqC3XAQFsV2a8LFAo3YiWpp0EbE=; b=amH6AdCYVNJDStLs
	8rJQRh4RiWhKmy/x9v+YSpBL8LVPr8cvHhOEpTI+CkfGVc9+y0Qd3+6ThG+/wvYH
	05Y8r/M+kGCi7TbDzFFU0nIoaEiifuTqcwcb5faHpDCZ5/a6Mtg4yYyINiZyVoex
	/OmdtSi4UO7Fay3bQu/7P7U+9wLb5k/y//5BilmxDZAEbqerbUq2RKYwPI6D302F
	bgOv8gc1i6XbnifgHtCSn7et/2DBel8wOJIXXmyzhR7rL4HN0s7CwArpc9faFZs0
	BC547KH8jwjLKQrxqea6zbb571OeXzPGA4/EEs6Z/0ATGglncWlnRDSGAGXBpdml
	o5rJ0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0hxnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 06:29:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so5125443a91.3
        for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 23:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759818557; x=1760423357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ/mZMe9eQHwc6pMOqC3XAQFsV2a8LFAo3YiWpp0EbE=;
        b=jXg7vijP/4st40bMGu7NvHlxT1j7ANuqq0i4ZQE61RoLWyNTl+OfFd0GLcgTpMqHUH
         52ebroxZuRFhIkgeXw3ImGJdhySpxu/vPRnr6bU17mD2FMBE082W1qmueH1abGjRsrGk
         1l+HBSHrf8xdz/GdFYuZxQ/SR8XnrMPa//XNsvGkPIKa3H5hwDFk9wW3aEKvRl13FaEW
         d0fKrPD2UfBRkFt9yhoGlxIdz74hMm5IhVMbEk5Dza0rPxiOxBx/QrD0ZzjthWrgUSNe
         x7J4UsSgKaOURKHME/9ahrUJmXmmjJ9cRcKQLyqEi4lI4rnMgF/J9xYrVU5mujDMoPkj
         PvOA==
X-Forwarded-Encrypted: i=1; AJvYcCVRTJ2U6c6xFmYKFlLlQZE8JYGiC3ShwA//NDUKDBDJys7kKnPc7d5OqCUpkLJsBn8cWh7K6v2zCpKqXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUwxgJ4AStFhcJU+pMhmxUoPJoRxG3ITymwSp0b/lckOCchLL
	NjF1fN8YJytIeGgs4krSc96zHDHUhuuJuCmHBH5Wy2eV49ADFhdnqllv1dK3XxgShNxc5rbsbKH
	4K8601CwF4U2DDGzOzQlr9fN2mIdw64mNZF6ZynIgA9Zq7GWXwOIWDrmdwSKd+6V5dQ==
X-Gm-Gg: ASbGncv9nOIEIVcfxbToR2mY+KjfkcR6E9jz4JzaDnMtTGtoxx8wZ6GtXN6nQCh7F2n
	l5TFROYWW4EK/uFlnnDa/RZ9OqjCazRfyyEgndbYOWkpZKCQMiQSc0LosTiJnF3NDBAiM2j9dmD
	4L2ScAhcbIbbo3MYTAdUF2Atj2AaWD18K4K7MqDfezO4qVTwI30bDDIDy1AIZiinQxLhtIn1UnX
	ZZty/TTukUw2X2GKnsBso30IUI0CmGEPlK8Tw4gqFfXE6A43M7QHjnkjtKf+ctlJ5l2EzVjWhKD
	UAc2evh7f9SW1XQOih09X/S00PioBAB4JH0iX2IbSD/jvL5Fjb3p2T5LHdG9uU0jSoWvfi7mxt+
	07A==
X-Received: by 2002:a17:90b:3ec6:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-339c2759dfamr19030229a91.9.1759818556790;
        Mon, 06 Oct 2025 23:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEYeZYBRgOmwNar8K7RG4m6Nmim2fQTWAJstBfmo588K6ZiICRgELHRhWh7xlFRNNjzYpceg==
X-Received: by 2002:a17:90b:3ec6:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-339c2759dfamr19030191a91.9.1759818556330;
        Mon, 06 Oct 2025 23:29:16 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d25bsm18903319a91.5.2025.10.06.23.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:29:15 -0700 (PDT)
Message-ID: <0b448507-5e5f-20a4-a9a0-191447362809@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 11:59:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: prevent potential integer overflow in
 decide_core()
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MUHgkxAIUJdBaKby_Vj2u0K6ZS6zSLaG
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e4b33f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=HH5vDtPzAAAA:8 a=ACEZY41XAAAA:8
 a=m0Ah2RrY1ua3onEXlJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-ORIG-GUID: MUHgkxAIUJdBaKby_Vj2u0K6ZS6zSLaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX/FojRvPFsXao
 EgtPoplyCfSuYAE46d7ZWvqe5kfCMY9vAVlSQFiuQbuRLcQhXb7BENPJz2dmT/i4Yf311Q4OVdB
 iCyOGKjsWoZk46wOIP6y52VwrCvYBd0hVgvhN1fiSyKrPMvG8ZYpfDrKU/ZZUrrOis/5mePTkEI
 E8mM8VdSImIFi5DpozxturQE8oLI0MFtXsNVgUT6lVS+jkmt84i2utY6KWIehuZUX/g0oVUlWVy
 poq7cz1itluM9gMIsBubdWbYzAFqqxtQUP/pzXEHwQkjRj2aLoi2rzAZYOGMBZV6AkAJWAQ4p9M
 yJ8AwCJrHc1SWBn8PgJSEytifeiz0z+mhON1wVrDKZ22OcYY/ueHMVhM2qkwNmOSpgwBMAZJej/
 K2LomT0rPxFr+q52d8B7novzGpuwgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123



On 10/6/2025 9:10 PM, Pavel Zhigulin wrote:
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
>  drivers/media/platform/qcom/venus/pm_helpers.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..caaab097a04d 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
>  }
> 
>  static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
> +min_loaded_core(struct venus_inst *inst, u64 *min_coreid, u64 *min_load, bool low_power)
>  {
> -	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
> +	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>  	u32 cores_max = core_num_max(inst);
>  	struct venus_core *core = inst->core;
>  	struct venus_inst *inst_pos;
> @@ -639,8 +639,8 @@ static int decide_core(struct venus_inst *inst)
>  {
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>  	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
> -	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u64 min_coreid, min_load, cur_inst_load;
> +	u64 min_lp_coreid, min_lp_load, cur_inst_lp_load;

why update type for min_coreid and min_lp_coreid, the number of cores will
never approach the u32 limit.

Thanks,
Dikshita
>  	struct hfi_videocores_usage_type cu;
>  	unsigned long max_freq = ULONG_MAX;
>  	struct device *dev = core->dev;
> --
> 2.43.0
> 
> 

