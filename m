Return-Path: <linux-media+bounces-41247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4717B39E8A
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01053B1D99
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0833126C7;
	Thu, 28 Aug 2025 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oORpWphW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE9F311946
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387115; cv=none; b=DkyJybp8XOB5OJ1dJT/unOGbeDKOQWRBW5x2ANfTE6Eew9jHtjCdGKrJ+u2sZqd3/X7AgiRPL2AlyODksk2Dqzxl9tfeNiD9A+OcMq6YYZTjkEbpbmEpdGbtiqfPMlhgnM77yEHoZIogXelg+qIjeujKotTXhZrPWUL7CNDcvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387115; c=relaxed/simple;
	bh=ebhj/zH63szQOxrn2XmKEdObSLoftIObuFab2TP5dTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rbb5kTUeJSV/WSS9mcsU2+28ZCdBDzGQcHOfecBraIuoBliPmcMNrih2MKI1DXL/QMg/dyC/dThP7dx/P9uLtNlh1dEGAO5cmAWAvDIknm9xJu9cyhhyVa7AdHGnFiPTw+2FxU4DXsxUni+qQIDmReCIe/2AxBYqYKheoXsbyOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oORpWphW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb72d51dcso131098766b.0
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387111; x=1756991911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViZhgiI208mpprvGOd6oxNdz3FM6ZQalsGn/kG8/O+A=;
        b=oORpWphWN9cY8aM8/UiVD8VlC4Mn/GWm2SszlmT/asgvLyRZkC/c8PX9sYlUEwnMhr
         mpwlJKUlYmhH75xiVSe3XHqidTm5LgMymbthbNQZeXqRjJxO6uHehLqV6+gCrPTIwgXp
         Wp5soukZlFm6a9FOc+2FNVTeqA6wSzNq96R00wUldfZ+l5iHInG2C0sTcfLgf3mBY3nL
         9iCbi5jiQhrj9RPlPpPVa5MsV8XNPYNQ97Ajg1uznWpvHvpEmxPk+D+PD9lAqkx7P4+H
         dfoab2OWtAtcKj7Nk6dhOpufxPsUq2LQzCvkUP+Q5PP5k3yusWFvayGx8Yqk8Lrvu8Uz
         aQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387111; x=1756991911;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViZhgiI208mpprvGOd6oxNdz3FM6ZQalsGn/kG8/O+A=;
        b=CGlM2xCUUx2KapHwVZF7uttm7dW2Z4VhD5GybjzM0Tcu7MLOyFNmv7mfgmgoV7d2qd
         RkwLI29y5c1+Swn8/mzMSMwH+PQZzZtLw0lgMpEdrbBA2FqVbZFfydVfsy4EVtd0GYoN
         ir+tbERYOS+mG4FGoBAmN8nsgoBxybD/ZL+dPGSVKjpVFjJBwBguVCPaCoDp4T7xXOcB
         Dbgr2rzkwjnI9njFyLpREh18WeKYJCzZWDdaZvVpmhzXyHN9z5pgSAGXGcBvVmn7Dz+8
         0u1mcArZK4fMTw0fkyncDqpA8+uxzW6l1+hSlN2ReriNyZfK5nlAI4EzHeuJaFHjrTuv
         V4sg==
X-Gm-Message-State: AOJu0Yz1tOG9f2LUQjFpI8MKLP5lktgN8iNQAf+FvCfO7He4z9++R933
	ozxcotz8R/hrrLInqHFoGOrze6Ujdi2qfcVIdVH13EUrE6sMZ0KGWzwkn7ylDAiYS+s=
X-Gm-Gg: ASbGnctnq2wDoKFaXjOF1OB3gWN6dIR7gUzjgAtjjo4zqfKXOCtoGHCOtyd+0O4R/ce
	s5CIa+8l6A+bsJsKE8qRCiTKqbi+aU1M3P4XBcgtY87tgK1ij/tf+UAgjwSt5zAbW6AnSkF4xUr
	AQWRWMcgFWkuxzgBWvtxl7L8kQqU0dI1s9lKS9kudlb2N7DGip/Kt9o8rt4nmGGPhKrlofilqjZ
	y7MSAK2y+BwcQpQmdJiUG6t5D+SGLzL43g2z8L9myMJwqBkvmKA2JKY+O1H7ASGGCSljAPJZoHu
	itRcAR1H+7unkydPDltF+3XhdHoQp8BEAa/enqVWptWCuArdzaeM6UWUr2Tub879rUEBzNT19Fm
	SuidH9mfUW22R2uC6KQsYvUTwF8GAPYyMuOiJE9ex8Oxv3PHYwkCyPLWG4wM1g+ZHdGs5Z5igby
	wu4P0EsLPdh69e
X-Google-Smtp-Source: AGHT+IEaSNs6TM+t6ZkGhDUEgtd04oIngPsTBonqSpot3F8/HKB8oZ6LSxQKQNPdYyIrbplDJe/VjA==
X-Received: by 2002:a17:907:7f90:b0:afe:82ef:5433 with SMTP id a640c23a62f3a-afe82ef59a0mr1449610066b.10.1756387110829;
        Thu, 28 Aug 2025 06:18:30 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe790e382csm945788466b.79.2025.08.28.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:18:30 -0700 (PDT)
Message-ID: <1b00069b-e9b8-411f-9a66-de449ce4420d@linaro.org>
Date: Thu, 28 Aug 2025 15:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 01:26, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
> are featured in many Rockchip SoCs in different variations.
> Enable the drivers for them in the default configuration.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..625cb5b47fb5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -876,6 +876,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
>   CONFIG_VIDEO_RENESAS_FDP1=m
>   CONFIG_VIDEO_RENESAS_VSP1=m
>   CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_ROCKCHIP_CIF=m
> +CONFIG_VIDEO_ROCKCHIP_CSI=m
>   CONFIG_VIDEO_ROCKCHIP_RGA=m
>   CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>   CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

