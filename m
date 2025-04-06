Return-Path: <linux-media+bounces-29437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6AA7CE2D
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 15:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955013B2039
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 13:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0ED218EA7;
	Sun,  6 Apr 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyVbZWmx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABD2185BC
	for <linux-media@vger.kernel.org>; Sun,  6 Apr 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743946979; cv=none; b=c7OPCYLEXAPovyBevCaoaSfmje1V5nWCB4oVOMlBWd0aDl0mAFwL+GqfcJ92sU0Oru4Y0SnSfzvpgJtNzIkI7G8RkUP+o4osQN6SkQUNxhDdhjdKQ+C1jJ/H1/UOhEjCf7gh1cTNi2FsFcLb6Vv5fvHlPdvOO/oT53UBdXAtK3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743946979; c=relaxed/simple;
	bh=PD9GNIrrnrt2kMfBmhXn7JrpnwAp6se47WiAoF1e78g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmPe/woOm5N9/KMsgQUMGU8TadS/f4FWZHF7v77mNJjy1bhC4uTuZwTDfcr/ASU/SBfWe0kPyxrB/PEQa4iRZdClFgElvlfqGUITM8BGCqAscVbuUkqCZ5PRkFpouhA8ARdWZrGhWsFXSKXJbjIqeM6MyjdN9O9xsSljGsjYcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyVbZWmx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so39102225e9.3
        for <linux-media@vger.kernel.org>; Sun, 06 Apr 2025 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743946975; x=1744551775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKSh/Lkr7vxqs+CQ/v3pTweJchjYC4e1pzyu9PYjl1w=;
        b=WyVbZWmxpopzV59+JmmxRf4FhPw1bbZi2wpxhj7nBV3jfPbs2ffgDy/uKrAjc4ceVr
         8q1t9jmWtlCpj9BjbTDyjSd6roO3do/JASDaY0U+oW/jzZrf7Lluwy8hwss9hloXxtEE
         6SoHKtyur+iguKqYaPwk7fX9H17k3nXrZWFzUmFG+Pm7VH8CfCTgds2tgFGQvMUsx9VY
         zhRNZgRjSTy8TaYHxkgmDbQr4/++JLGrsvviWRafFejbCMs9OhJwcYFy6ugIvh0whavX
         LYv58WMCLZ0cpvJyqIvs6DZR3oGNvJpw7ArOHWwOJPASxs9tYssM/ij7m4g/+9Ydtw0K
         m5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743946975; x=1744551775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKSh/Lkr7vxqs+CQ/v3pTweJchjYC4e1pzyu9PYjl1w=;
        b=Nq6tvmM7b/ArymduRcPj8tIc5XANv+jw5xh7agcy+dZXdFbk1J3r54qp50YnVpfJ1M
         +Bzw1p5kvNIiy6vhPetvGXWSQJ+Z4wJ+dbkIrXiSnvfIagMBOM/zoxndzvkrBy4MJ2DG
         uueIkaKP6nlJvg4G3//DqzM6ErJhTw3+ytzdBUgJL2k6rEbF2N4beRQV349UlgrRO8kU
         1hgYLR/eUI5vlJRyxfdOsflZHBG7a+VRQWRIROFn24g2s1LIiuauyRV8K9zmSssCPMY/
         NbWWTCprDQbJQly3OxharBhcLhq9JwNjYQOdaQWbkh9fxtyX5u3PduRY8fmNfU8rL1sz
         9wqw==
X-Gm-Message-State: AOJu0Yy93e6KdydBLjcxWrqt0iMU9mJeOmZv904Fbjc71xl55ZBHHGas
	HVcRCrasMdEvqVziebIU8oJ7AfPNEKl9t2JGaKoabv0lGIsLuDfxrV9W8dDi8QU=
X-Gm-Gg: ASbGnctj6Dfo2TRTEOLAigfQ/vZzqd+zzRpm2IMoLXDdYIa5muFRqEFgF7T4MEKur7e
	OFRdI+e71fmMih3N6XT4Ttsg9KljnOD6Rk61dSr/6FxdtjFG8Z/Ab8lOhOWacdkqnVvt8l14ll8
	hz7xWL3EVxMj/8q99VmqtpG7VazKZKDAKyhvgr4c9mRopZMPkZ8SHNG4eAYu66TWR//VQQgxshg
	5B3/8a2iS/Yv3OuL2nLy0Lf/fab5LITsjwI6OnGdw3rXAkjDEdV8n7emUiBVKbdolKUfaWx4gIg
	acOnNrCMcGGhbM7IeODkea6eGYe2sMWaFXZOFDdUQ6Fe2XejlDBlSwqWfk3PmxB6qjNB0yDPDQL
	/+A46l110Jg==
X-Google-Smtp-Source: AGHT+IENivBk2jsjBaWq+wSNsl1e7Aq00Uqgt50LmnMarcev0yDMmtMA3gEheom2v6QN12Lg/N3F2g==
X-Received: by 2002:a05:600c:350b:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43ed0d6b07cmr67764825e9.20.1743946974670;
        Sun, 06 Apr 2025 06:42:54 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d16d35sm117529675e9.0.2025.04.06.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 06:42:53 -0700 (PDT)
Message-ID: <ae06a3a3-bf7b-41ba-9c2c-8754c5c7c8a2@linaro.org>
Date: Sun, 6 Apr 2025 14:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <BvlsGF1XePEGyPlecg4xIRy_z4TPBsWUwm6cTT4NIsOjkxTILIsopQ5js4omlx--7OLkNHUDehSVQ36pGvhkyA==@protonmail.internalid>
 <20250305-topic-sm8x50-iris-v10-v2-4-bd65a3fc099e@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-4-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 19:05, Neil Armstrong wrote:
> Introduce an optional controller_rst_tbl use to store reset lines
> used to reset part of the controller.
> 
> This is necessary for the vpu3 support, when the xo reset line
> must be asserted separately from the other reset line
> on power off operation.
> 
> Factor the iris_init_resets() logic to allow requesting
> multiple reset tables.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
>   3 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc62182784b4dca90fcab47dd38a80..78143855b277cd3ebdc7a1e7f35f6df284aa364c 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -82,6 +82,7 @@ struct iris_core {
>   	struct clk_bulk_data			*clock_tbl;
>   	u32					clk_count;
>   	struct reset_control_bulk_data		*resets;
> +	struct reset_control_bulk_data		*controller_resets;
>   	const struct iris_platform_data		*iris_platform_data;
>   	enum iris_core_state			state;
>   	dma_addr_t				iface_q_table_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -156,6 +156,8 @@ struct iris_platform_data {
>   	unsigned int clk_tbl_size;
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
> +	const char * const *controller_rst_tbl;
> +	unsigned int controller_rst_tbl_size;
>   	u64 dma_mask;
>   	const char *fwname;
>   	u32 pas_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
>   	return 0;
>   }
> 
> -static int iris_init_resets(struct iris_core *core)
> +static int iris_init_reset_table(struct iris_core *core,
> +				 struct reset_control_bulk_data **resets,
> +				 const char * const *rst_tbl, u32 rst_tbl_size)
>   {
> -	const char * const *rst_tbl;
> -	u32 rst_tbl_size;
>   	u32 i = 0;
> 
> -	rst_tbl = core->iris_platform_data->clk_rst_tbl;
> -	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> -
> -	core->resets = devm_kzalloc(core->dev,
> -				    sizeof(*core->resets) * rst_tbl_size,
> -				    GFP_KERNEL);
> -	if (!core->resets)
> +	*resets = devm_kzalloc(core->dev,
> +			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
> +			       GFP_KERNEL);
> +	if (!*resets)
>   		return -ENOMEM;
> 
>   	for (i = 0; i < rst_tbl_size; i++)
> -		core->resets[i].id = rst_tbl[i];
> +		(*resets)[i].id = rst_tbl[i];
> +
> +	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
> +}
> +
> +static int iris_init_resets(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_init_reset_table(core, &core->resets,
> +				    core->iris_platform_data->clk_rst_tbl,
> +				    core->iris_platform_data->clk_rst_tbl_size);
> +	if (ret)
> +		return ret;
> +
> +	if (!core->iris_platform_data->controller_rst_tbl_size)
> +		return 0;
> 
> -	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
> +	return iris_init_reset_table(core, &core->controller_resets,
> +				     core->iris_platform_data->controller_rst_tbl,
> +				     core->iris_platform_data->controller_rst_tbl_size);
>   }
> 
>   static int iris_init_resources(struct iris_core *core)
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

