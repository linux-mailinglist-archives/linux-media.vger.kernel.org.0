Return-Path: <linux-media+bounces-44480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB8BDB5E5
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 23:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E0304F5D4A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 21:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F92B30C606;
	Tue, 14 Oct 2025 21:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hGU6+te2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68430BF5C
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476235; cv=none; b=bGJrSmn2BzdDbaKXyAmh5KAzVcYkmCr97Ap73p1/1KYrjrVOCzYoFy7NRsDqkvcZfiPkAx+sFLk8wnG1MnLVDOL2bZk9gm7uXDiBfAcpLEzy7usXnfp9+TInrfZOnt//rM1cCHSGU/5D70CRxRd1Nrmz/4DeiT1pU3J37SDFNWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476235; c=relaxed/simple;
	bh=EDvODqamZOphTpcYh9B/CCtQYxjXGLO+jG1P52nUNI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKwJmM0XOJS1ANDNnj85Hu7e2TnpTSCvy1LYP9+O2KjLuU80RmnYAWua89XiVJ99Q1b4rUQduJQmp8WBPpDIwLyUodQU+ayGIk1zqYMjtGZic24RauzSMMCJI4zml3T2IkQDh8nPWhmFIeRuDUb8aL7LbrvK+ANwoc58WZaXFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hGU6+te2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so59188165e9.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476230; x=1761081030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=hGU6+te2xAvQlu822yEMq8zkxWyDinD9GiurHIO+1OypWjmgpojwuob/jjYZKM9eGC
         xmz8p9Un1JbbfPVQHFfvnI9wk06SPtbNkVHQW3AHSW4HaB3LutNq+dXEv3KOS1F+IKiN
         1Q2xhz8tPwb0rLfbubhuW4e9VGO/3KMV8Zwel3MJk3EmGAfEOED6plYz9L04Xz9DUy0M
         4LLLlhdB8sBryPcpc6xKpTJJdFG+f6SDB9a5Anh0H0gwlipMJeqQhBUKKpEA/ocKvXmc
         XZS26hXvXg+TtFeWpJAW/cB46iRCXSS1bBHjQkkfKrvhZmPlSmFcZ3yXW86S7VPj4Rve
         6YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476230; x=1761081030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=wPQPTv0O66Du6t4Dk0f3rKMSV3QnWAoj9ADIYQZFkEnj5mRRhbJIRxFKINRBwU3IzD
         zADlD1tgZYAZqaY4JqL9t9EkOmPyxyUX4zZzbhdPa/NJu0KHfbSV2Gjy9UwvY+VWXXUR
         8+bhypF58cPgbP0hvJCt2joYjZqlkYaOjJsF+IM7yNU0ODkBKPD+ZJUQ0YeyecY+7C9W
         CqaQMX4NxP0tx/Q+Knv+TAW5OyQfLQUqgUz9DBAY6EwAPU7r5Qn9uXa2Fnr/rlgtuj84
         A2ktUQcc8eJcv/HfTVNXdceRsXGautMdXB1nIZqEncdp24YAUhS7cV93BXLBvkeHsBlY
         SnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh7QCygQLWD46smRulmu/Kl++ZGSAXjLHZxkDvm97d7BONxdNao3YuH6EqQRlhqg/4pc+5aUS8qQRH+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmm74iIATB2yAbTyQI3aR4ZilQF0v34hT/EJ9i8/eHPL/9gBO
	9Lbp0devaL1IPF0QsUZMlvBNI3MDMgHmeXFaQ8Ii/di4f1XEvzq4Tb1pLUBv4mrSUWo=
X-Gm-Gg: ASbGnctJIOWKGin35nDFYi879onmt3aRG8JevUruyWtn/3G7VSqKZy1+8/KI7LPk93Z
	fr5FIKSN9ibuYCtWFXAZpPXsTqdq7U6bnFtdmoB/auwjbLAf7MfYIUuMvXU4+n+cU+GsmZdQJVB
	eS5azdQRoMTAAhimpJe4tp6PqXLLo1w7/jM1xRW4XkCh66T8Eej3EBe0FHWgTIkd7jnpszlen1i
	zkBzoXWRmgrwG6vJ3iYIExeViyaWhymU0HwNNFiomhuPdQO2AxmCCyJur5cQYL7AAHsrMOUGvZN
	L241M7bv3uouwPRQBVEAyor6WcD+fb6wELFgOLICIUX1GJ/yr2hcnTm5GRh9yt3i2gFmPabxpOw
	AZRaTJcoo8XP5/hmWLzOMtoSwTnEKDcxvzgqhtZ8Dc778NAN95RQUC6pVqwb0tZ9kgy/tskHaRt
	GnxYGvm27t+xA=
X-Google-Smtp-Source: AGHT+IEbhID2cy30VH28xdYyFKoHwK5zb9GEgSYaTfKLNAL9ivTZVl5Wqfb64+N4E6V8zmftUTcSQw==
X-Received: by 2002:a05:600c:502c:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46fa9aa0eacmr170991135e9.10.1760476230196;
        Tue, 14 Oct 2025 14:10:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm25122327f8f.35.2025.10.14.14.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:29 -0700 (PDT)
Message-ID: <269f3575-b315-4855-a2f8-243a91cd62f4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <mtwaxgCCtRmzwKQWossgjGCuiRpYsskzaiJXACP41oCx5DY1kIZtPt-agjTCBTTa_kRJb5g4XI-AoGUeIQ8nmQ==@protonmail.internalid>
 <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov5675.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
>   	if (IS_ERR(ov5675->xvclk))
>   		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %ld\n",
> -				     PTR_ERR(ov5675->xvclk));
> +				     "failed to get xvclk: %pe\n",
> +				     ov5675->xvclk);
> 
>   	xvclk_rate = clk_get_rate(ov5675->xvclk);
>   	if (xvclk_rate != OV5675_XVCLK_19_2) {
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

