Return-Path: <linux-media+bounces-10388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360198B6624
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 01:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94D90283000
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 23:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B6417B503;
	Mon, 29 Apr 2024 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bf4p0iC2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13B1420BC
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714432777; cv=none; b=IeeBYM3xRkw/82QFqd07/79o62QR3wHAgfM9Zrz9E5VXAziKvgnHPYxnlVajWFSwch7S677icEQOydpj9POuH8t37VtdspkSLBlg2NwjiwDrVQchmt/vOcs0NZ8KFL8Y4p6BuQt7kVnqv3MgJA4J0GMF6oQPG9MJgEoXIeljx1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714432777; c=relaxed/simple;
	bh=YDl9w1EkTj/v2pWKAF9y7AY9x0p3ND4HH4YPjIaN5iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1NQyEI58FBi2PGFucRGVOb6dMFAQyIa6OICFCcP6eIdhclakndKViiKpq4RPR0K7/sNxOT+LXszYNQH/GyFBnHSsPsotcqVxQMzUConVQRriGKNDaPG4EdEZAQK3bd17m6HK6Jadj+Fdox8bGU7cKPYpQ46SuJrBxVLKIDjYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bf4p0iC2; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso24606875e9.1
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714432774; x=1715037574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZruF9aAdU7FlwgIaSSThIeSMqVLzi6IfyA9dy1kfvLA=;
        b=bf4p0iC2SIZu+9TZbxKYPgXPfGwlKWvLfJHaenuwTDoF196rsWZj1dVAZ+7RLBVPVv
         3HacpvPvsNjkZ1lAVT8KpZkg+ow83fZJW8kLHvT/FrOgJ5p5w3RMUB/n8jhIqFHgkmnT
         iWHtqnIJndYsMtcEwm9gx6UJlBl3TfDzvP2hMoE+U4Gq7DG6l7LOIulxiap7SdQGFELy
         qMHiPO8BQcvaqBJw8uObkx2etdZ98QZLljV/4UJbpqYrBtSOQdKg03sS4MjBwUCPkuw4
         gfmrxvpbfT2D8LpgpbuveE8LoPxzcGWL6HpFyi+/yzguT/3B9Fz3qyLb2kFLrjgeSKs8
         elBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714432774; x=1715037574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZruF9aAdU7FlwgIaSSThIeSMqVLzi6IfyA9dy1kfvLA=;
        b=v0bQ0Pp0nogWAMmF9GNiT0kLHG9B+ntXWkd3CETvl8heu4R+mZBiQDEUHCzel6FG0+
         UUC5fueyDxX+IwAxHiajLlvlgeS3Uv2azoGPyZXGHW9Bi//+QBfBqRC8Bm/JS8KAKYYH
         zwSOwGsK3CzgaexbDczPkWv2Cj7osBcZQx41tVKc/VSlNWEwpGzrXaZnJ3pUxXFbztq+
         M9B9+Ax9CwyGlxBhAX2yKErcKyFE1pqd+0AJWligeYS9l8BE8axbg9pbTgo9aHX2kuMt
         Nwuqo9Slfkh/VYU5FGIj5zoecmBx9HoKwGBQJ84uNeMkbB3Q6vkIZ9aD9EdVC7U69RWT
         16Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVuDVPlOEaHdu52lhzmyyaPDNFB1WWr3irKYl2wSEyQeZTqDLMmsTCBU8TLRWm8KnZaat4+ks0eTeJcIpFSnC/QegCvdWsUjRHeD6U=
X-Gm-Message-State: AOJu0YxWNXKyDi4RepooJ1OYIm91Yg2njWRJ7tyuq6dExzVaWxTIoGPv
	8bQC20nMiGa/N/ivGSAakfuzRbo0KSYFXYjvCJ069ooTj3sXPwgvbKKHN4uTXic=
X-Google-Smtp-Source: AGHT+IFKmPSf0wT5Qntysi/+j9qerIfFu8lyI/HjwzbgVzyv+8Lf9G/kvOfRbmTssnrKU8e62owEqA==
X-Received: by 2002:a05:600c:1395:b0:41b:cc7d:1207 with SMTP id u21-20020a05600c139500b0041bcc7d1207mr5968943wmf.19.1714432774176;
        Mon, 29 Apr 2024 16:19:34 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ay39-20020a05600c1e2700b0041b61504565sm16736351wmb.28.2024.04.29.16.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 16:19:33 -0700 (PDT)
Message-ID: <c805843b-041c-4546-8bf8-ce2a0c71a470@linaro.org>
Date: Tue, 30 Apr 2024 00:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] media: venus: add MSM8998 support
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
 <31072144-8880-483f-880b-8c8ca73b2003@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <31072144-8880-483f-880b-8c8ca73b2003@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 17:19, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add the missing bits for MSM8998 support.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..42e0c580e093d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
>   	.fwname = "qcom/venus-4.2/venus.mbn",
>   };
>   
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
> +	{  489600, 346666667 },	/* 1080p @ 60 */
> +	{  244800, 150000000 },	/* 1080p @ 30 */
> +	{  108000,  75000000 },	/* 720p @ 30 */
> +};
> +
> +/*
> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi

Nice touch.

Does encoding/decoding work on -next sans interconnect support ? I think 
we discussed on IRC it does but I'll ask again just to confirm.

> + */
> +static const struct reg_val msm8998_reg_preset[] = {
> +	{ 0x80124, 0x00000003 },
> +	{ 0x80550, 0x01111111 },
> +	{ 0x80560, 0x01111111 },
> +	{ 0x80568, 0x01111111 },
> +	{ 0x80570, 0x01111111 },
> +	{ 0x80580, 0x01111111 },
> +	{ 0x80588, 0x01111111 },
> +	{ 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = { "core", "iface", "bus", "mbus" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "core" },
> +	.vcodec1_clks = { "core" },
> +	.vcodec_clks_num = 1,
> +	.max_load = 2563200,
> +	.hfi_version = HFI_VERSION_3XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-4.4/venus.mbn",
> +};
> +
>   static const struct freq_tbl sdm660_freq_table[] = {
>   	{ 979200, 518400000 },
>   	{ 489600, 441600000 },
> @@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

