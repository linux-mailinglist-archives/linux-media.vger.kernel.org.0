Return-Path: <linux-media+bounces-22756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D59E6219
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 01:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8C018814B4
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 00:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FA81BC20;
	Fri,  6 Dec 2024 00:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwkAAHyX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C64A1E
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 00:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444371; cv=none; b=gfUS8sTL8VE7dfpMXnog3irQeF4pJkucQB5MW9bOI0WUlZX5C8NhlA20GHZymz1/0upWL99mdhlPhaeUnIw5ZiGykdka4aieWhYha1On8fUNVoND/xhtjWor0+xks/OnyokMk8vH7aqOZ7TWd5oitfJiGU+dN5fvCXNaIP+aGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444371; c=relaxed/simple;
	bh=+o+uO9we61Ogto6tM+61xmVisEVe55gj1oe2gTMe3FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTih3IzxtNkiANhXE6GlxC5YMnfMVis6nRGEHsAPjLEoEF81qeR+3BhlF3lY2IuO3h21kxgnzinAAwgJqfl1LvnuQAPRoYbHtvSr5bz+c0IEx1B2y3c2AqEMbN1SsX1yENwlqbZOK4GIrjBEojQFsslki+W/ALsujPXPs2k6EvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwkAAHyX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a766b475so15201215e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 16:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733444368; x=1734049168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7GuXdIFBw0hSC/RhGqob/K/UPv4WM4UiBAEYTtPbes=;
        b=JwkAAHyXOhoAs+Qfch2GyLcCZDIfWCBf1XZ5x83PEHJFdyYuNzacMLVM3EcXFXv8Vv
         O1p/aQf4PeEYiUeionSOZGGCkxUWjqezqeNvVB6S5p8U42GdHtxmp96Dr8tGxWgF1C94
         heigV9o4rM0xIH+JmjcVvgF1tBqMtxkC6DpX5JwXlIt9+6sdmVH2WUev6B/RPmC/lb52
         vOj6ImH6GirabLJHYqaS7dQLiWfq1ChNSH38wujAU1KkvA6uFDavt96p5zABm52I+Dka
         jjCLwGanOu98TrPF/JNf8zONX9ZfdOYi16rZ+ZUs6rv+X18v88dMU4lvWIkuXZHMvHsx
         BaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733444368; x=1734049168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7GuXdIFBw0hSC/RhGqob/K/UPv4WM4UiBAEYTtPbes=;
        b=pIfdOoVlxZWNCkluogutObm6ad9lTniJaNM+fjrM0qFw9tMGUM/jCpO/2LtQ+v1uRD
         X5jBfT6a/ca3wxVujsBCUolMDDQQTK6QQwL6/GGmT9P+ixN7M8kJnNLr3HU92yYeuv0P
         s66JU9nugizlQWJca1+8OyIG/ldV3xBD2+ytLOJNsTg9ZEB/e4u+nppz09urOA5GfWCz
         1e85m7oT9iotOXLxHYK5jFidiSOFvqbEOY4OQBZ3Ksj/xfXnr21NomIs2HKnYKwHKbv7
         XbLJSXrzya2Q34XJWi6Ga2klUlr30hSPBDlhyPC/zbqPPyjT+kV1yqq0Cn2PTDfX7rBz
         +Q0A==
X-Forwarded-Encrypted: i=1; AJvYcCVeZpkHIIazCyiaFdWJcbI8V/p7xgSr/nYeDEkqSuPuKMdT7WiuWUFgIbd7b5NY0tJdEIbhrk//bXYg2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBa9wylzr8X/XRDsOTzihrl5yXU7RtEQr23jfN8AI/iruB18K/
	zT/YfsdBRggyk5doKVhWSShyZDrtR9zKZsd3ibopy07LoKCPDonc4AOBw3r7RlY=
X-Gm-Gg: ASbGncvDYGLVVa0k1yroEUyf0txDInUUmRHgALJJQYIaPMLTVQI7bdM2s1js+9bOpwH
	5P+nP7QNHjuQQdLUyUkVqy6axdZYPKjTiGfggbMqJSXEpgo1SupWM5LIAy8P5nFJMTEqVT0sOOc
	eW/f6yXoVgON2DVzoZ/J36PiIiucx2slSV+epf9Rb5C80CzLSDEXshWz77hlzgOhHXhTXHr6eu7
	9s0j8b8W5XiePu5hSXOeaNXRu0W5Omoeje9gS8/Ae3c8ot3sQ3M0CWwv303IUI=
X-Google-Smtp-Source: AGHT+IEVgR6g8ndVIAMTngaFxCk18nWwxULdTjO+OFxZxjsRo3kL/Wfx6trIPXpCNbJrzoKXXJnMng==
X-Received: by 2002:a05:600c:3ca3:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-434ddeb04bemr9813725e9.9.1733444368473;
        Thu, 05 Dec 2024 16:19:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm865300f8f.25.2024.12.05.16.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:19:27 -0800 (PST)
Message-ID: <929636b0-0cee-4673-9d1f-5987b19c5958@linaro.org>
Date: Fri, 6 Dec 2024 00:19:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] media: qcom: camss: Add sm8550 compatible
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> Add CAMSS_8550 enum, sm8550 compatible and sm8550 camss drvier private
> data, the private data just include some basic information now, later
> changes will enumerate with csiphy, csid and vfe resources.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 32 +++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e24084ff88de..2f7697540578 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1634,6 +1634,29 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8550[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "hf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "icp_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -2644,6 +2667,14 @@ static const struct camss_resources sc8280xp_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sm8550_resources = {
> +	.version = CAMSS_8550,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8550,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -2652,6 +2683,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
> +	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6dceff8ce319..cf6672baea1c 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -84,6 +84,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8550,
>   };
>   
>   enum icc_count {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

