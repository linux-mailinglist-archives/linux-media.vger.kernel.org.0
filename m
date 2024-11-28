Return-Path: <linux-media+bounces-22208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCDB9DB47C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 10:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5963B210D9
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E3A1552FD;
	Thu, 28 Nov 2024 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aw6YtTlL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265A1153573
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732784574; cv=none; b=FYjNakfLPjn0IMxi3J8Vzr3qYD1798LViTLxXkpaNx0ZQFIVt4MIlp8gXG2NagFiRiAlt0K+y+sbHGVezHfwSYb5NTMDD2xkY5C7D42qYhxfghJIWLKKsK9S69FdX0W41ffcedFKSdUox7XZG6f0hlR9OJDbPMou4wqdUudJNnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732784574; c=relaxed/simple;
	bh=tgBIfB8SxWwQp8+zMp6ASTsC0WZ3pIoK7QGA2cAXRcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KaEitAfpR6eoVFtTMz+p+zor8pGf2W4/7OH2WpO1I8T0psvKxSbwcGEEzXS4/x9F7uBTkaRBquTGjkP2Ob/lNiOs/pviHxmvSY31nk66zKJjZ3SqCzjwEyyd/W/QCI/3pil8e14jZwFms0Ym6JDOjUP06+C8wSFYTpvtq32Ng4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aw6YtTlL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffcd3c2b46so247691fa.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732784570; x=1733389370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8Tx6Iiuy8eVN6hHJzNzsfvX/A9uglxUHEhu2KC59CI=;
        b=Aw6YtTlLJ4M1/5Y5/bsP5H28GQVIYconxVKNrujqPT/IONY7yWB/FuOA5bvmu983Rm
         jEEy6cSCTqmIVGZDxibtewjdm0HEn6t8TJwoBLGcFyN15zoQuyQ7rzIqsGGvKzyhYxVm
         uI/3vGLn29KOhmdeXlI1enkN2FEX1LYLzWLwP1VVf0RLC8O0w7ZxTvZ3rjLchSrfS3V+
         Pu/KwZ/eWANwHL2AjaUx3Yy6BdDLiAAj8al4++VXJOAL6+EnQJEQF181BbK3FkXdW2f2
         n0JKXGEb0vd46Ui1PkcLFkYblRuHIa9mvPIOkUYb7WseNT+ngNkWHL2EJio5A5uiBO7E
         d+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784570; x=1733389370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8Tx6Iiuy8eVN6hHJzNzsfvX/A9uglxUHEhu2KC59CI=;
        b=IVbKK4GvLtfvpqgklDAQb5WUn4Koj6CF5q0RS0edGP4ZHjZofUuHxhGeMWBnyhaNac
         gm4vXl2a8cKidfp3DWiRLh7r9FGxwnWeOenosUT+AL1VOx86EosP2aksWiU/gUnfbwqH
         tE2GHnSGHUOlDWADnQlHYc5hJQShToxYKcR0AsvUefdYUhfcuCdMr6Z2G6D0ilHOGtpb
         sTyGrppBX3w+AsX9t6oUEDKgigqI5m36Z2qXZ0d0A4pGMVx7YTHQn465DXSTzRU3rm4R
         fjfCMI1Ht6vzU0qpBgfBKcbCABpYKfeLGQj0tbM/DfmoMaGVOKT38lH2SQ+ux4LmaYf7
         Ilbw==
X-Forwarded-Encrypted: i=1; AJvYcCX4PCnr/SjA4sdae0p1JWeCsq6cUvERejLgaQ+yZijS/SE5/uTEZzWBqweLmznqt2AmhG1VJzERcNv4cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhfg5yIG7W979e4SMITudsX1Vu8Q/kuIE47Qk0wxXIdQkyWHV
	hye47FwDmiBI9OsID94Jzze0hVysAEBK8oQqGLn3+zvsQrueLQ6YZll3nBNGtkU=
X-Gm-Gg: ASbGnctpe8QqhKN7tTQqXaIEaDcLfpqHxMmDWDO5F+fpi5A0RL5SMUU8ExtPHR16CdC
	WNECVUl5QFDKsqVNvtFDmqRbOs7o7sEWseV5qFDPJ+BLFB8l5eoEp6FdfyvMorGuJtvoQx3qHNc
	BNReYLsN4F+1NE7+3sGpvjxphHh2ul12ybzU2osISGDpJi/BrYrY31vOy0G9BgldyyYl/Bfztak
	urJ7nZG7z5sx7NeDlcPgqv9ll0uLaiyLT5elBpIohcrjRYkS6sfPVjrRK2JC7F0yZDF1mvS5VZA
	ubE9uSjD6OdKSAIXZzd1HweJFaWG
X-Google-Smtp-Source: AGHT+IHFCYv/L+GfgztX9o167DNb3MQyZOqjXulx2fah3yuoiM9+QVfRTsflijOJMqAsVCMCc9ktCA==
X-Received: by 2002:a2e:a98f:0:b0:2ff:9449:fe02 with SMTP id 38308e7fff4ca-2ffd5e9a69cmr7842171fa.0.1732784570235;
        Thu, 28 Nov 2024 01:02:50 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc74f94sm1348201fa.83.2024.11.28.01.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:02:48 -0800 (PST)
Message-ID: <ad906baa-a93f-42c4-bbe5-968fa939c653@linaro.org>
Date: Thu, 28 Nov 2024 11:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-1-c010fd45f7ff@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-1-c010fd45f7ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/24 13:44, Bryan O'Donoghue wrote:
> Add resource structure data and probe() logic to support static
> declarations of encoder and decoder.
> 
> Right now we rely on video encoder/decoder selection happening in the dtb
> but, this goes against the remit of device tree which is supposed to
> describe hardware, not select functional logic in Linux drivers.
> 
> Provide two strings in the venus resource structure enc_nodename and
> dec_nodename.
> 
> When set the venus driver will create an OF entry in-memory consistent
> with:
> 
> dec_nodename {
>      compat = "video-decoder";
> };
> 
> and/or
> 
> enc_nodename {
>      compat = "video-encoder";
> };
> 
> This will allow us to reuse the existing driver scheme of relying on compat
> names maintaining compatibility with old dtb files.
> 
> dec_nodename can be "video-decoder" or "video0"
> enc_nodename can be "video-encoder" or "video1"
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/core.c | 56 ++++++++++++++++++++++++++++++++
>   drivers/media/platform/qcom/venus/core.h |  2 ++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4e26b18790537885a77d66c1917a4e7a146eaf57..17506d547a6172b89acb77879337750c22f993cf 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -286,6 +286,36 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
>   	return ret;
>   }
>   
> +static int venus_add_video_core(struct device *dev, struct of_changeset *ocs,
> +				const char *node_name, const char *compat)
> +{
> +	struct device_node *np, *enp;
> +	int ret;
> +
> +	if (!node_name)
> +		return 0;
> +
> +	enp = of_find_node_by_name(dev->of_node, node_name);
> +	if (enp) {
> +		of_node_put(enp);
> +		return 0;
> +	}
> +
> +	np = of_changeset_create_node(ocs, dev->of_node, node_name);
> +	if (!np) {
> +		dev_err(dev, "Unable to create new node\n");
> +		return -ENODEV;

Leaked reference to np.

> +	}
> +
> +	ret = of_changeset_add_prop_string(ocs, np, "compatible", compat);
> +	if (ret)
> +		dev_err(dev, "unable to add %s\n", compat);
> +
> +	of_node_put(np);
> +
> +	return ret;
> +}
> +
>   static int venus_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -365,6 +395,32 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_runtime_disable;
>   
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		struct of_changeset *ocs;
> +
> +		ocs = devm_kmalloc(dev, sizeof(*ocs), GFP_KERNEL);
> +		if (!ocs) {
> +			ret = -ENOMEM;
> +			goto err_runtime_disable;
> +		}
> +
> +		of_changeset_init(ocs);
> +
> +		ret = venus_add_video_core(dev, ocs, core->res->dec_nodename, "venus-decoder");
> +		if (ret)
> +			goto err_runtime_disable;
> +
> +		ret = venus_add_video_core(dev, ocs, core->res->enc_nodename, "venus-encoder");
> +		if (ret)
> +			goto err_runtime_disable;
> +
> +		ret = of_changeset_apply(ocs);
> +		if (ret) {
> +			dev_err(dev, "applying changeset fail ret %d\n", ret);
> +			goto err_runtime_disable;
> +		}
> +	}
> +
>   	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>   	if (ret)
>   		goto err_runtime_disable;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 27784fd7082c321222b23ca4b2902a04c49e19ca..4ce98a3ef186823a57ac40e2e8e42b08fafed575 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -90,6 +90,8 @@ struct venus_resources {
>   	u32 cp_nonpixel_start;
>   	u32 cp_nonpixel_size;
>   	const char *fwname;
> +	const char *enc_nodename;
> +	const char *dec_nodename;
>   };
>   
>   enum venus_fmt {
> 

--
Best wishes,
Vladimir

