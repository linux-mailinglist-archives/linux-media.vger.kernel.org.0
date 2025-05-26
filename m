Return-Path: <linux-media+bounces-33360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FEAC3B86
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F9616CE9B
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 08:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32C91E492D;
	Mon, 26 May 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mL/Mozhh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68B1DC994
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247626; cv=none; b=Qe8FYWAcrdvrBlH5s2khBNMZA9B27h/ILMmjolRobRwhWRE1XK4KiaeZIKz3tse//xTo56yrDnAjJlAp0aiHc4djKG9Bm+Q7fyCa4eWrQVWD0Oht1x3A+9lUUge2tctyz6T0puSGfGVcFT11+aXOE1AJvRcrZn0N6O/vpEqNKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247626; c=relaxed/simple;
	bh=kiIkXPF0mzMsp0+vmMLj34FpGFqIHfWevMok9dqiXjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1sSPH7AZNVzb/w+X7ZyoQH17wU6U6DPGpZaANypoUaCmC1/bYjqkPRBukiHPshUoIyJ4J/Uv0VndR1kkCTYZuS+5j+qgsxlCMk5if3lcuPsMDyqCVvALu+38EnrkjEBPjX/MpJ0ILkEpA4/MtFdunKHfzqEFPvVyZPx5+YTxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mL/Mozhh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-440685d6afcso25137355e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247622; x=1748852422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=mL/MozhhkVuofUlbor+IFY+2NwW0ZELSrO8K+CBs/PwGDlRlzoB+q6m8IwEVyCNUVO
         W3Sn2BV9YGJHWkqNRPUxL5I2Lwda7/z38Td17Q6OT7BPRFW6nHk+TUashFQTiNFuUJ8w
         Mef3p7U/WyofrZEnMdnOF222b87UNcwidNq6z7P0GkrU9x5ZgKEGvccXAJup0DveNEYq
         Izi62BwCIXfGfmk1SL3mKUeFcIqi1ddOnSXHg66Im28lYvJqLUeicfZggYB+pBiyWJuk
         NbXgOPrfwRrZHDqsTU2x9jI5z/BR2uwA+vrUeE/9ajCxX9aEQeFBKUFTHral7BpaP2X9
         bboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247622; x=1748852422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=JCKRrqKSuZw8b6dL2pC/EDI+KWmJFUni3JzOFDJrqFpTuiAYPqolzL3cisjugAF1wa
         YlST+WwR7uooXajK94afeWwNVfN4MHHRLZYTU4iCUdes67ZTjc3s4Tuwet388wt8WVKI
         J8Zm4zs9Iz8zMFqtDmx/RTONGUyAAUWXM+Uzoy9UgZa9+2rxnPsEfe2sGZNFfTVSH9Qf
         MT8xyNxkVo18rLxwC2AO7kk2ShoQ+nyWmEjnc9lrhBSUG4GBXECHcxYgkQh8l3e2Z3Ji
         1wnv8adQ4jnjsPM+7Sm6z2+a/f+KP6ZQ3VAgeA/v7gugNN4ShhCr8Vr1bR0GOaK3tuAs
         mwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoH2LtBGpLU1fr8zKcREXD2db50H88bYkMJbIYdWUxxfx6Tpp1qIFEqEdXAVyfPwZoLBm/tpVfhTALUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHE1EMpZzwCUXezWf5m+i31EvuOABYT0HLPnRT6zn6n42TDJ2I
	IU52b3Sb7+YoRyP/VE9BBp4STMrxjfa30STP4wMa0qjmkTMoT3lomT091TycLNERQ4U=
X-Gm-Gg: ASbGncvc1yUEINIyggZi4dlcIps0XRmNN+tcVNGtpb3bEJSvFd9SbXueK7JMsZ6bFrW
	XKhWRwE3K9m0AQI7uptgAYUkNbICQ5SguI6EludbBvy49h7RtA4OXS7nKOjJqXvUpkyzSn0Zx8L
	8ZgQsT3V+4guWtw+GAnlyNki5l2O+1wo8xetru6OhXH0pDlzq9/Qvt1TOgBHmKQllXP90yDBbqo
	DNOFHjV2DU6DArDhabj22pjHUhqSNoLEaQDp1dILL3HYaTiAgVl6BAFlBVK2aX1RtTg8XoLLelT
	qlzfX9qDtdf33T1NK+hjw4SITx/SO1AGKm+DT0QytFXSNhlsjy6ONP+jXAUbBzQN3yJxux9KJcr
	Lo0zWMCuONq+P20Ng
X-Google-Smtp-Source: AGHT+IFp4oweCau504HUSsYtRlu63mwxtFVBOtfguUvjdqDFiDjl115gPPjk6xM6N13cuUqyj7SIPA==
X-Received: by 2002:a05:600c:5249:b0:442:f990:3ce7 with SMTP id 5b1f17b1804b1-44c9465cecfmr71103325e9.16.1748247622533;
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1fasm16458356f8f.1.2025.05.26.01.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Message-ID: <cc43d9b7-13ba-44ea-9b37-fc54c0d1f2e0@linaro.org>
Date: Mon, 26 May 2025 09:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>   drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   7 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   6 files changed, 173 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff3781d7fc3ace0253c2d64c91e847..6311fc2975aa1345e430a477c8a6476f1d7e5663 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -605,6 +605,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		return PTR_ERR(csiphy->base);
>   
>   	if (camss->res->version == CAMSS_8x16 ||
> +	    camss->res->version == CAMSS_8x39 ||
>   	    camss->res->version == CAMSS_8x53 ||
>   	    camss->res->version == CAMSS_8x96) {
>   		csiphy->base_clk_mux =
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 2dc585c6123dd248a5bacd9c7a88cb5375644311..aaf3caa42d33dcb641651e7f5bc0c2a564d85bfa 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1112,6 +1112,8 @@ int msm_ispif_subdev_init(struct camss *camss,
>   	/* Number of ISPIF lines - same as number of CSID hardware modules */
>   	if (camss->res->version == CAMSS_8x16)
>   		ispif->line_num = 2;
> +	else if (camss->res->version == CAMSS_8x39)
> +		ispif->line_num = 3;

> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,

Hmm should we really be setting line_num inline in the code ?

I don't believe we should.

These parameters should be passed from the resources structures.

---
bod

