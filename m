Return-Path: <linux-media+bounces-34764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD08AD8F6F
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98DD0188EAE8
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D4019ABAC;
	Fri, 13 Jun 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdGpqlWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E32E11CD
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824441; cv=none; b=ELgSbLApLmPAEs1f7DwrLryzSoj1Graa+wWeJNgMVIL7qjJNy4D0mqVKCbSlCp8tJ5rTBNr2uv7TkXI5F+rrFJuXV3+afHckfFwHjPx+oSIQYyjot7eTH23HT/Otcv5K1q98D12aaajeZ6yuyRZzr7ZGKnZKB2LEOlt0BIPyGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824441; c=relaxed/simple;
	bh=kv1f/hNYa1plr+nIIidlV+b2spVNxEsefZHdz8jWfaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGjoFrBNW4S0OVkjGPIPUhIdqaWp07v+1g+/TXPZ81w2Y8HEJghtGRasp4QQrivAK0HeIGqEwQzruZMmyRY4tdIW/+jXGbhs/gIjAOl1Diz4uzqUcJxVjrj/JaftTDSBe0YqWh7YZ3HwseoPdkfFLmqwGxNbcWLq1o9cASPVv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdGpqlWh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1386702f8f.0
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749824438; x=1750429238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4mYyZ+2tTkkCoL3k1TKqHg7lSWacSP72TFpyhWIgbk=;
        b=cdGpqlWhs4QxY2Y5nRfZyKIdS++zLpr9DaOp8VmmzNrHDbkYI18BPEU2L3hd/waaFx
         1wJcppnAAJddTIfPilNpHUyQm3x2xteyv7btSqWn/WlxeuK6x9GeDmYYz6TjO+Z/1yPY
         H+qWxIQPfGE46YUtvHV+x5wRI0zkwvtE+vPNFyzCjXb0E5MXlc9eKflSMREE+hJyA4LZ
         dv3MGcdco1qA5YsgW/mvF6HRwAq7hDz/KXRlR+MBIvs+xQtwHXDF12cx21D9xU/xs01O
         F+kaN/B7SawErRKCe4HscnutxhRLMnsr8Mz7N9Jv5yXhBglwbWgrPF9gz67ciJuQnVaK
         NhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824438; x=1750429238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4mYyZ+2tTkkCoL3k1TKqHg7lSWacSP72TFpyhWIgbk=;
        b=T3fsCwgBKaNdtOUURmNogEnASw4Itlve39FO+9d7T6xshy5AcGH/AYjDe405iE6vEi
         qEL14qRtbZGimG2BHnjjh87+BynmXUdGjCaeN8ATdQWXeF9udHnK7V8cik+bT5t2kwPg
         sZERtBeaDsq2iXGfq6N7/oxNFpbWIsDqwL4EkAJGaqhl5+2ArQhWqXshXxDFZFukkhV1
         AkNqXhJX0O38VTCoa2Rq4dWtCJwXgpz4llVjmJ/GZR3Zp/vLmFGpiBQmv7ag+o0ipXO4
         rXP76yNyzltSrD91GpYWDIl1xavdYIIxRU6yKi0eKldWtplPu1rT4qYKE1yF6YCbypjp
         f//Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP7oYK26BKzK/1YsiOQCOfvO+ydVom7JIy7lNRyWOkvyH+ZQVmu84/Q03B+KuFlLGkHo3XIw1BxSGolQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDp/y8uJEX1MMZShLWe3b6CB6xDRPgbnmyWs0Witu+M8gTgO8
	NkT3871ftAPs3XypoRdtofcHHBPA/m2n3IgykD4jshYqNNVfQINBIB79kLKyrvk/SBo=
X-Gm-Gg: ASbGnct/suXZifqQF54lW4PIGz0x33Ec2KaGUzYwqXKnE8C8m+wM9G3nGpGzsyBAVWr
	DF9zzEGGl4Wa1MacNhfm3RJg3pbcf1DiA/yYtFBKacb9RaTVN+y92lhEzQUrycG0hf/5M13BdCu
	zzBUTjKGDH+R3gQhBtweATsQFoLUyhf81h+cw3nBwA+WdcCQRPA5NrvvYHN6Sb+l4uMtwYcg9jz
	6ML0PhgORvIxoMss8CCW7JD0ziaO1rNANeOQMLnhZwhKa+hCOVWgpA9lLwXLNMgaWxWQT6J0Q9E
	qZPIP6A3vcuFKo+pHlDylVkpUjf/nR+6HrDfDhbqs/d3V3MGB6VWN/2eBXpp4p1zVLOKhl6Y1f/
	fw4rqYMtbhRR1IFcoxJ+YCyXyFB0=
X-Google-Smtp-Source: AGHT+IHKpd3gkAfLo6eOiMysNrK5s5pbt4yXFjsI7TgTM+VJCoP0aU+9dffIVA6j7xP98PniNPjEAw==
X-Received: by 2002:a05:6000:26c2:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a568717afemr2779241f8f.48.1749824438442;
        Fri, 13 Jun 2025 07:20:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm2510693f8f.26.2025.06.13.07.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:38 -0700 (PDT)
Message-ID: <68d6ee51-3cd6-4e2c-8a72-6885bc33cb1a@linaro.org>
Date: Fri, 13 Jun 2025 15:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:04, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the venus core.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 736ef53d988d..f1f211ca1ce2 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +static const struct freq_tbl qcm2290_freq_table[] = {
> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.freq_tbl = qcm2290_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_6XX_LITE,
> +	.vpu_version = VPU_VERSION_AR50_LITE,
> +	.max_load = 352800,
> +	.num_vpp_pipes = 1,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +	.dec_nodename = "video-decoder",

No encoder - you declared one in the schema.

I think this should be:

         .dec_nodename = "video-decoder",
         .enc_nodename = "video-encoder",

> +};
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>   	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, venus_dt_match);
---bod


