Return-Path: <linux-media+bounces-37961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE5B08961
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 11:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9E55866B4
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1714289803;
	Thu, 17 Jul 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNTnva7+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407C288CBE
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752744857; cv=none; b=FCrXYl1O/PhG1N3blUpxRbjp5TwGtAgQJt43KQdncZX7yzgmAVrl0XuFoCTw7ItEELjSp/3SDiPhwNZDPpfpJ9W6BCnfKD59xENQNHO3GBTb8q/kt5z/QqntkLW7COXSAGWS7JDJ8t6mvQRoyfonwyUxntEp84fj1Nbq35pDkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752744857; c=relaxed/simple;
	bh=Ennb6Ziwqm6bJQ30TcLz7toa3HFvyzpDeeS1W3sdkTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQmi9QGY4YFxZP77cu3kr/y0PTsEoHFzLLEoHj91iUj25Brt4Mhr8Pea6UJzSGEJ9coa6SQJOOLBA5tzPxL2CQGHkMdj6weBJJPTtDTxrjucrWKrDipCYtClLBDEU3OybzNUmAT+OQOFDsDX1ODFwSCMvHh5aS5dvkIkqM3gQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNTnva7+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso1338835e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752744854; x=1753349654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Oipk/8uKSbLekB9aZXETn7St9hKr6hAgH4lVQ/8ls=;
        b=CNTnva7+tVwnJOZFqEkk7oA/0Uv+Bwqgk48M0bodjyMatSEQfk2vLYUHYSbUknh8m1
         5lq8bhO+NDirTTc9qU1bRjNuP8kfysPXN06bpkwk9Fwc+XH7PlT6FDENFamWFV6gGaTp
         YRg9KudBMnTOL0vMxiuREOovywVvOSddG+PaZ9c2OeCFdOJvAcr+nSuWlQHGWJLII5K+
         8ilrHIGGZryGzGWdYy7zuB2zxSDWydP3gqtVULR9NUDoI7CKX9rJquc80aerQCUbCm8G
         gJMHER5VIDdOufzX+lgn/cCUHxKZ+oNQb5rlC50pNE33UDunlCjsQO2LamVLjnD3eDOL
         9xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744854; x=1753349654;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/Oipk/8uKSbLekB9aZXETn7St9hKr6hAgH4lVQ/8ls=;
        b=hf3ar0alDWQRWsDBhu0KT5Mw6uHiJ+LPMDiuhyPXTtYJOZoYYaVExOdB8TaQJyvgQV
         OfgOD+H4bCGPzExccmDA/4vQznfG/W8c8JcbqW1jb6bztRayYre8zkihpH+cqNuqGCXZ
         oDIVkAbDrwFkCgJqe+43m352geiLfh+YZ6N9n/EQw1xENwKM9PkVJT/1JgQ4wdiKkfhP
         GkiBDLY41/qvSAPPogcpv108ihcOXFidUNUyX7IkN4F9U/oyvxbuc8fM5rbFW6BELflQ
         n8D0k3V2QPFl1kJd7jOKihjkxVoXtQuPSFTrJLQ0g+63eDA840egBsqsFNo6jDUU6n3g
         o1YA==
X-Gm-Message-State: AOJu0YwMm+9CWZ+cJxzCB9vIDcUOiqVh8iSeIj4R5xwpjadzeXcfSpVj
	apaUQufriAJ4a7+ubp1HlpgdbreTa3t9a8Y65ynCoh9aUqUP46jSNGnwCBXSa9U1h9I=
X-Gm-Gg: ASbGncuLusBa+vSX3dnHAAxO3lkg5cur5yGirqF4GOAp7cRh6Mu9ciT37zDbXWG0iXl
	eGO7tDqDg3zG1g4HnqRC2IKpJUOZG9gukmZPcNhCVFYZ74FL5pIcOUPpR4bhdvXdHSmtWiLfdlj
	qeQb4CdfCyElD8zIuvBDPa9UwxrYHib+WhAyEFf4PyX93HK3wVLpn+mIIQ8NSN8Mp7LPRpL4h+u
	f36LO+v2e/IaadUfHYQ6z7Cp15qRp84S/AUXSEImUVK0v8RXac71TEaK6HRJKz7Crscy5OGbwk3
	IBxzlrFVA3ysrHxteqJDz7vo53NSyjMJnpa4DIvZUxxQP6CeR/Hj7ay5r2QHqoW/XQ2X4qDvJGZ
	pG8208knyEGJWULJsS3xhbdUxUe/OsE6RDupxOvMmeg==
X-Google-Smtp-Source: AGHT+IGBNtPAF/42mVIyEKgo2198k/q9jrEA3iXwTq8C16itJxw86l55h9xQXzu6wCjrHnVlNiIXMw==
X-Received: by 2002:a05:600c:548b:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4562e047a0amr25633015e9.3.1752744853694;
        Thu, 17 Jul 2025 02:34:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f36b2sm45419765e9.6.2025.07.17.02.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:34:13 -0700 (PDT)
Message-ID: <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
Date: Thu, 17 Jul 2025 11:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 09:37, Dikshita Agarwal wrote:
>>>> +	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
>>>> +	/* Upper bound of DMA address range */
>>>> +	.dma_mask = 0xe0000000 - 1,
>>>> +	.fwname = "qcom/vpu/vpu35_4v.mbn",
>>> Could you clarify where this firmware has been merged? Also, it appears
>>> that the naming convention hasn't been followed.
>>
>>
>> I mentioned in the DTS patchset but not here, so I will add it in the
>> cover letter - firmware is not released. About the name I cannot
>> comment, that's the name I got from qcom. Happy to use whatever name you
>> prefer.
>>
> 
> 
> You can name it vpu35_p4.mbn to maintain consistency with the current
> naming convention.


Sure.

> 
> 
>>
>>
>>>> +static int iris_vpu35_power_on_hw(struct iris_core *core)
>>>> +{
>>>> +	int ret;
>>>> +	u32 val;
>>>> +
>>>> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Switch GDSC to SW control */
>>>> +	writel(0x0, core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>>> GDSCs have been transitioned from HW_CTRL to HW_CTRL_TRIGGER, placing them
>>> under software control by default, what is the need of doing this?
>>>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_CORE_POWER_STATUS,
>>>> +				 val, val & BIT(1), 200, 2000);
>>
>>
>> The need comes from differences between this and previous generation,
> 
> 
> which previous generation you’re referring to?


The one I mentioned in the commit msg - SM8650.

> HW_CTRL_TRIGGER is supported on SM8550 and all later SOCs, and if you look
> at videocc changes, same applies to SM8750 as well.
> 
> 
> 
>> mostly based on downstream sources. I think the hardware just did not
>> boot up without it.
> 
> 
> That shouldn’t be the case. The downstream design is different, which is
> why the driver requires the above code to move the GDSC to software control
> before enabling the clock. With HW_CTRL_TRIGGER, this step isn’t needed, so
> the above code is unnecessary.
> 
> 
>>
>> You need to fix your email client to add line breaks around your
>> replies, because it is very difficult to spot them. It's close to
>> impossible...
>>
>>
>>>> +	if (ret)
>>>> +		goto err_disable_power;
>>>> +
>>>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>>>> +	if (ret)
>>>> +		goto err_gdsc;
>>>> +
>>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
>>>> +	if (ret)
>>>> +		goto err_disable_axi_clk;
>>>> +
>>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>>>> +	if (ret)
>>>> +		goto err_disable_hw_free_clk;
>>>> +
>>>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>>>> +	if (ret)
>>>> +		goto err_disable_hw_clk;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_disable_hw_clk:
>>>> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>>>> +err_disable_hw_free_clk:
>>>> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>>>> +err_disable_axi_clk:
>>>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>>> +err_gdsc:
>>>> +	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>>>> +err_disable_power:
>>>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>> +{
>>>> +	u32 val = 0, value, i;
>>>> +	int ret;
>>>> +
>>>> +	if (iris_vpu3x_hw_power_collapsed(core))
>>>> +		goto disable_power;
>>>> +
>>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>>> +	if (value)
>>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>>> +
>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>> +					 val, val & 0x400000, 2000, 20000);
>>>> +		if (ret)
>>>> +			goto disable_power;
>>>> +	}
>>>> +
>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>> +				 val, val & BIT(0), 200, 2000);
>>> what are you polling here for?
>>
>>
>> This is not different than existing code. I don't understand why you are
>> commenting on something which is already there.
> 
> Which code are you referring to?

To the existing vpu33 which had Reviewed-by: Vikash Garodia
<quic_vgarodia@quicinc.com>

You understand that everything here is the same, everything is a copy
while adding just few more things?

My patch is not doing in this respect anything different that what you
reviewed.


> 
> You are not setting AON_WRAPPER_MVP_NOC_LPI_CONTROL and polling for its status.

True, neither old reviewed code has done. I am not changing or fixing
any existing logic, I am only adding new clocks and resets.

> 
> The current code is incomplete and missing several steps.

Current you mean what was:
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
?

> Please review and provide a corrected version.
> 
> 
>>
>>>> +	if (ret)
>>>> +		goto disable_power;
>>>> +
>>>> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
>>> Could you share the reference for this sqeunece, this looks half-cooked.
>>> Would recommend following Hardware programmin guide(HPG) for this.
>>
>>
>> Why? Look at existing code. It's the same.
> 
> 
> Which existing code? Please be specific.


Existing upstream VPU33 which this builts on top of. And that existing
upstream VPU33 was Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

> I don't think you referred to downstream code for this, because I see a lot
> of missing pieces here.
> 
> 
>>
>> I think I responded to all your comments - it barely possible to spot
>> them in the quote.
>>
> 
> 
> No, you have missed some of the later comments. Since the code is snipped,
> I can’t point out those comments here.


It's impossible to find them in the original response.


Best regards,
Krzysztof

