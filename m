Return-Path: <linux-media+bounces-31490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B68AA5925
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 02:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69B767B955D
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 00:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EDC1E04BD;
	Thu,  1 May 2025 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyYpig2A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94008EEBB
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746060430; cv=none; b=grs5twqkmbWbzaR7I2mZlxVNuQXOcvp3ZV5anztm5Th3sgR9nn71vE/WKzJ8ByH3Nftd1D1OTCaLt30WAcoGgOZZCtcZnFx7WzvlkSlfL9+o2xFDqol5Wt8wbML7btbxQelz7Jqrad2IPO25g7gcXs84vzxm2QU7ePngx+W2vyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746060430; c=relaxed/simple;
	bh=Icb+pZJ2iMM+dVdas91milhwACkwA8zPurhW9pyoKvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoDxaod+9DO3fH3eTRH5gI7bkHRh7JT9F0GkVc9WTBILYMTKtkWy8QKJuMMYkxpCHZvV74vJ04b3D4lFbvHH5UwQjSAgd3gFoUk7DbqkGXsPqUaGWJSfnwkW4BDQL9VUBr2slu9vJF3oYzz1gGtz2SU8964pLz2UQuDydmc1gV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyYpig2A; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so3890975e9.3
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746060427; x=1746665227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=HyYpig2AIfYoeUAq/llZGud19quXMEWFDG8DM9O4LGpGU/KsLFodxu1qsKxNbHBlcG
         5f3L7EPdRP4cyGDtUQIKlIsG6BxylFyWcsjJOv+5iLNjFbRlbzdHOn1+ciMu8zfUkISB
         dAkM/Ijq2ksbbhviOiTNnz3cL8PVsSs3nqpmwibjlj35qWLf3Db3g2cRcWoDqCHtKQ9L
         DdvUaEA/cdybN7+9Dq0gqgcw+TfNd9IAWqq5XEm1wr9eVHRB6Qs2Xt9sU2yBlWQPsxDy
         6xMNU0r+hoe8CEjAjnnDsLxcBpLwL/rBO1hvphfaJnttoU5f0vtmT/xRVSUsqGlt5iyZ
         0mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746060427; x=1746665227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtBcAAqRumzpJ4rTrz/zowPnd5Z+XJBF3Z8VAMzb0d8=;
        b=w4yugn/1XUJQ+Y3Gqd5O0s+It4tTQkMDb1e4XfZRT5KjdFiYPOtWc3PZTZYcr+pPQv
         2z6ubNKv6hQzPGY1f3tKagV8YLH5eGpfBoHGq+NR8bHOaO/InR3mYXwe50I8T6IdiiQ8
         wwq+NpZNk/JGgYrmfktSr18Yb26XfRgrfr5nKhLhJDXWGSb/qE4l3QoLLGFc4ITO0YEL
         F9kxE3KgJr9t20Fn8ZM11dlOIupiC/4hB/9D2D5YBvzowqGO7LgVNRL4kx0suWfTHAql
         CAeLyVrrSqidXaI1pfxTbuNaiPTxJ/gIiT25gnSeo8nZDRRPhn9UdO+cypc390LKW3dR
         yI+A==
X-Gm-Message-State: AOJu0YybjFEFRsvnR0xzWYTREChL60cks94H0q30H8DvrmLLiISzCKKG
	09PU/neCBENts5OdZTTCTGhnTgzdmsfe3WzEY5tUDHeCE+u/g4GJXdr5mOoKdbI=
X-Gm-Gg: ASbGncsknKRRCZccv1RADTQeuom3R/8VsOvERpc4nHe+4v4Ep4GY6GL/CqtlcHfPKXQ
	b6a6EN2DUJHh2RVNRLTGkHjN6UTEpmla4TsqMAhjMJP1B+DfCtUBXY4E1EqI9nOulFauZHxMM+2
	8gSiQmlEy9PjiiJXlDyry9mxbN20wHnPjyDETGyNH+hvpcNhjunjkeir77PqNl7/G+gef3leKJ3
	xJUbLxExh8O225YDW/gEu404pgiXppG0UjgHpKdUPtWqY4ZCFZj0qF4004mPnXkrOAcvARy6Nvo
	F47cBxpyfXwABQKdbs+Ehub6MTywhATEuA6m8mMCqN9pdoVlTOh6tayAOnakL3yVTTh+niIG0lc
	oNx5kVQ==
X-Google-Smtp-Source: AGHT+IFmbHtqypFHAYEgz34XK2p65MJanyk+f1Rp4pEz/8sdgn2En5b9QtiOnbh8idGH+h36WMLiqw==
X-Received: by 2002:a05:6000:40c9:b0:39f:fd4:aec7 with SMTP id ffacd0b85a97d-3a08f752673mr4547696f8f.7.1746060426770;
        Wed, 30 Apr 2025 17:47:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm18107538f8f.20.2025.04.30.17.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:47:05 -0700 (PDT)
Message-ID: <5aa6b273-bb99-421d-a2c5-deef7839d284@linaro.org>
Date: Thu, 1 May 2025 01:47:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] arm64: defconfig: enable rockchip camera
 interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <Vz96yQCdUZBjbVQtcrC3gaAUO1ximV0-SLkMByaR1p3EoVY61j98hMKsCQf1K1MnhDA6w92yhopnWMuUQRaRsw==@protonmail.internalid>
 <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 10:15, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. Enable the driver for it in the default
> configuration.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5bb8f09422a2..110ff52195a6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -858,6 +858,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
>   CONFIG_VIDEO_RENESAS_FDP1=m
>   CONFIG_VIDEO_RENESAS_VSP1=m
>   CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_ROCKCHIP_CIF=m
>   CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>   CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>   CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> 
> --
> 2.39.5
> 
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

