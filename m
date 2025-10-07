Return-Path: <linux-media+bounces-43834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 344BFBC13BD
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 13:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98E104F22F9
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 11:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632622D9796;
	Tue,  7 Oct 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wo2smy7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE62D94A0
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837095; cv=none; b=C4QtpcXK77XJKcoQu3iI2K3/DBPaDCuj8QHl/JbTWO8ZnQWSYTd7YhbgcYEFLgXn/vbtUIF2tLlVe+4PCUBxPIg6j8DcDgvxpi5R+NA/FWuXLC9RurCrsMMoDwYfQTVV08VtrDh71lDCtzj0TiK6ZUQ1E2UuGhndeDuezGBEtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837095; c=relaxed/simple;
	bh=AR4v9eUGDhYNQtY1HeNc04PQ//e5S/yDedZGfJKBHh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNiSp8I0VeHQUokBGExwGp2Av1wTkHFKV3NVaa6ryQeVK8GZLN5MxmUc3j8T1ar6PlBjDrJ3hX3vV5jxhCdFQHAeHRW58Ek8s71la4F7rOJ9eB+g7yDturEEzd5HqUHXLk0syub9a/QoImlbgzdMsBedcWshaINalEJ1qPM+/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wo2smy7v; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so11735144a12.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759837091; x=1760441891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ml4LEpVTJVXyrvhWASdbj9I+fhI5yZyg6wx5UdWe8k8=;
        b=wo2smy7vYZrTD9Q0Cx5Z5mqKasYKeeG7J1IOXsE2sMUfSwXiUG0nWjZZlnx+bObFma
         zlaXZFdGKz1nvMMHzK3mksdabpzXNYx8V9Yy/hMtFpODdkE2/9n6wkOQDpxjOHeshYTB
         +iWFPXXsfUOgqErrgY8yftdbIQHi6RGjifvNhly7N8pLmY4WWz4YsxRBSr6/46HFXUdP
         9/BbPlqqxRxw4tTV8Zn+L21B8SBhxvQJGSz26cmr+2wsYo96DCRajLOUnvyQMYmhzjJR
         yD10lzALjZYAb1Ww/bcRenMCzWhmZTFj2gW2fJXTOVuGkh1wY8JbVddYljVxhzoDFwqt
         XBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837091; x=1760441891;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ml4LEpVTJVXyrvhWASdbj9I+fhI5yZyg6wx5UdWe8k8=;
        b=DAGSGBdPY0mJiIpT3S+jUbIP27NeLHChAC6Z8DTv7sJmwUG4CjI+VGdoCQjOM7C4Jc
         jIiTybmnyeWM+Igml9GSggbp1Ca2ADeO/b/F4TmJO3pzQKNKGg4g9N7Y+BFXql9/J5Qs
         +1jFvS1MFrpXqdqIPw/thkDteS/jOnigP7FZ2Y4BdDJeTnHa7/0oxMULiD8/HPOZ1FXT
         Vpud9/X85pAA2otLFQjx+jL6caDY1ZMy4oTUOML/zhSpY+gKUXA5MlOIBaMahIJXwpW4
         vMCCBHPCgOHa97B6DJXeNbgUzP+jeoXmV1wFwZByY/KetKb9vYK1ZRlzUOWuLGwNFH7G
         FXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUAoOpsYHw2cJS16GJo4SoCzzXxs19nTnU8BcmvAHOcTKD8rRly6WKM11KEpiDiW2sk128/JJSa5mREg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2eJKAY3842bmPPLEfsQSWzbTUKYbj3npBIJvqEP0BuBfDFCok
	okFw1HGtPyanOpNx62W7UPM0a7t1PuP4+qjsYAD5tKsusWZOTtLSCt4DEZs8nGWLe48=
X-Gm-Gg: ASbGncsOMZTZ6bZRGkWM2t/+Nj32D4QnU+XTw3CuT4EGdKhpdCUlJoGvofiAh8By8+G
	qsyxX+F8GUa05yILauBEkoh3J2jPVBtkF+mqnll8lIti7oOlABDRsckd+sj02mjj3zqEZq5M3yh
	N5+ebYaEBeS561tg65Cuv6kX0r9pZRstLZz1qJv00ufcM4Qu80fKqs95LAPfPFMFj8XWiVOH7NI
	f5ijgkNzoylx+bUqoM9GQpOJwis2vDGSaHif6SK62Y/qPjr2DOkuO0QuA/8b0sX2fPi7EDB4mmS
	f8tceyNeIholxU0P5dPvyzHnbY1Nb7AUdM3pC/QIPWoFFwpaRR4IGXgXX2c/g1KAol6naqrZ702
	VJb3oT9SMyPE30+zFcjn+wfX4aqH4hl3qtYpS8bQP5nErZHXCDEcsCh5f9vVzC6DDR7lbyTqa3+
	nfwc9qF63JD9nUeC4u
X-Google-Smtp-Source: AGHT+IGRGfFEPmDIsh6CnYypDkCoLqPl3lzoN0Kez0PhVDQ7AyOqIyogj/xm1iA3ddUkIdKbeJyTsg==
X-Received: by 2002:a05:6402:27d4:b0:636:21b3:25a4 with SMTP id 4fb4d7f45d1cf-639348ddf20mr18989792a12.10.1759837091307;
        Tue, 07 Oct 2025 04:38:11 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3abcd7sm12224132a12.2.2025.10.07.04.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:38:10 -0700 (PDT)
Message-ID: <41899b79-7b12-4f94-a55a-7d365336a147@linaro.org>
Date: Tue, 7 Oct 2025 12:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: prevent potential integer overflow in
 decide_core()
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <gpZbbJubwhdMWqv7EprxhkTnwMAvvFs-qxjUEDxb-sji4H2XnPw8M02B6QLs7mrG_EXAgAjmhLVaMZfaVRoAKQ==@protonmail.internalid>
 <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/10/2025 11:30, Pavel Zhigulin wrote:
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
>    1. The current FPS is 240 (VENUS_MAX_FPS constant).
>       The processed image frame has a resolution of 4096x4096 pixels.
>    2. According to 'codec_freq_data':
>         - 'inst->clk_data.low_power_freq' can be up to 320
>         - 'inst->clk_data.vpp_freq' can be up to 675
>       (see drivers/media/platform/qcom/venus/hfi_platform_v4.c
>        and drivers/media/platform/qcom/venus/hfi_platform_v6.c)
>    3. 'load_per_instance()' returns 15728640 under these conditions.
>    4. As a result:
>         cur_inst_load *= inst->clk_data.vpp_freq → 10616832000
>         cur_inst_lp_load *= inst->clk_data.low_power_freq → 5033164800
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
>      Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> suggested
> 	during review
> v1: https://lore.kernel.org/all/20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com/
>   drivers/media/platform/qcom/venus/pm_helpers.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..eec49590e806 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
>   }
> 
>   static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
> +min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u64 *min_load, bool low_power)
>   {
> -	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
> +	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>   	u32 cores_max = core_num_max(inst);
>   	struct venus_core *core = inst->core;
>   	struct venus_inst *inst_pos;
> @@ -639,8 +639,9 @@ static int decide_core(struct venus_inst *inst)
>   {
>   	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>   	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
> -	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u32 min_coreid, min_lp_coreid;
> +	u64 min_load, cur_inst_load;
> +	u64 min_lp_load, cur_inst_lp_load;
>   	struct hfi_videocores_usage_type cu;
>   	unsigned long max_freq = ULONG_MAX;
>   	struct device *dev = core->dev;
> --
> 2.43.0
> 

Contingent on passing tests.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

