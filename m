Return-Path: <linux-media+bounces-44481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC0BDB5F4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 23:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3178543CD3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 21:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D4930CD84;
	Tue, 14 Oct 2025 21:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbJzPl8b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C891E47CA
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476255; cv=none; b=hdLxbrAnaqUL6gQy090EUQuAaCHyEwyZPurC33yloeilUQgFQssun9Odbu3UCTHFnml+//VHdrbDkELpC5yS99m4JWGoM6LTA45ykIWHQ+LRyw8QjTvxTpGwbCINNjvCfMVnYdq7NUheA0mXIpbPb6a3kVE50oY28D5Am3NE8IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476255; c=relaxed/simple;
	bh=BQJLULTT/Wn1VgzHKtiLeywejDNqOrYVAnsXBZ3US70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dF7Sm2ZvPf0dg9nNmqf4F/QdY4YxtC+nz9NJamR+2hmKls3ORWVA80J3nU8zxh57SuLcRoTByJ2K7FJOHcNclTosKYCPXZPhv2qMrbHS3/DtmFnIZuTVJvfkXGaMBCl1+0HjiCOeLcsFO+HxdrBAn3BBvhP1TTI9T79Aktekx60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbJzPl8b; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42420c7de22so2715067f8f.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476250; x=1761081050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=ZbJzPl8bPNCMym5feI7/o2aOEF/tWHhMsATv3KmaMXPx+M444TxSmAwCxW1+XYULAD
         mwu5exkDWQmwduqtokHm7w5lz8SQ8/RoHcZpkgQNML0saav1Qp4pc45eT77MvZdps2fW
         5UF8OWAMWt6mXwnD+n7Pxy3i6vh8oHadLBVcNMW6gKgTwYfS6lFFN37m9L2Y28GR8LwY
         ICkGnUegvjf+0k+6M0EnSuTzj22IcXtI0wv0onIPIQAVlkfpF/Fu6Ppi/mCzfn+yKG+k
         mUd/TTtZKX71n9/u04tArcXcXMscXdj0tWWX9pns/q+QZ9ckqVyDoZbemuvCyxhoPJOk
         mo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476250; x=1761081050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=sttdrGQJGHn8f9sJn3yQJ3LBUS0m6Uwyj81EgtrePoPiNtAlHODPLE2DrEMu3gHvzd
         i45TesIwWlyBzISXk6+EBLpxGUEXTJbNQ2BSyKVbZLHBu5uXK1nmMdJgOoogwN1RAe09
         wHjp3sNMP2Qf4cm6CZyiTb/VCdchD1EZXzuoiyd8qTp2WXGkuNq89C3AwriXufeAjiJu
         QaiVy4F4zDI138gXndGNi3iomyluRE+zhA0zUyot0VvzA5QZkcSUG55SX6Pb33o68v/E
         MPZXxMFQjcIJtRVagtb7eguvte1ZbnsxAc3s1ddZNSQmC06wF8biUvxwoLlEtkNDdq6F
         fMBg==
X-Forwarded-Encrypted: i=1; AJvYcCVo4gQWL8pY4kOSs1wPF2t0TQDNfovDUHTUT9APRuXF68tfI+wCO+LMDXDpRgCNECb8MRSe2DgwVXoQ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4VPvgPEzwbVezgA8WZVLvq/PI+q9L/lIuhs8kTjTuX1dGS/R
	ZsB/kW/GyLdBPHMvukgOhBArNcGZiczb+KyEQ/QVQ22wAkSLVbt7CPH3+WK4+vGS5kw=
X-Gm-Gg: ASbGncsNeAFjU+C1hq7CtQr/NkEaG+rUd+WrhPbSJyRWejy5IK/921t7Np2as1zBFHD
	exEPi0g4zRjZD7DetM27Qi9OMJoe6VUiLajOsT6U4YGcv63OBM3N94pJyAxvYiFYKtJUAYgU6q5
	/fZPqzHFoiOgn5pO3uGOS6PpLLlkQ0NOaLQpCdpq2BO3azfZFufPv37dhRQeFAM9c8pPmc5BXYB
	cmSBZ2y69IZhTVQkfirNm1oySxyGNbcOh2TRQB9MmHHGQH8fKDx6I0bAH2GOIIyrZhOQswX+lgG
	+I5tXjto4PdpA9qTaIf7O0F/8j956WXXKeWTl67LA7vGGTHEcjkGp0nQzlwNbgwiTgmQD6VX6/t
	X517vqbcxiW4Ry+OcBszRTrnnDusfpqMYuxRuxDGhgspgjK5WeqJY9BKztEJYTzYAehaxQ8Tkk0
	EXF3+vAx123kavNe1qksxV4w==
X-Google-Smtp-Source: AGHT+IG4aszTNfWkZ+8pnaYDUBRKBttfxEAtdOpVVT5WH4tPRBG36HzZa82lsANKG9dSujuWlON6Tg==
X-Received: by 2002:a5d:64e8:0:b0:426:d71c:9a34 with SMTP id ffacd0b85a97d-426d71ca0b4mr7446024f8f.51.1760476250194;
        Tue, 14 Oct 2025 14:10:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm25578034f8f.7.2025.10.14.14.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:49 -0700 (PDT)
Message-ID: <8b64ff99-d3c3-4d5d-ad7e-1d11d0a8fcb4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
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
 <MY_AlfixYZV-8oPbVR2rAt2c2MXqa44vOl4wBVxfvw8IARVU6fXVfIgMIEjDtagmcTUarlGkxLViwG6BYfcSUA==@protonmail.internalid>
 <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov9282.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(ov9282->reset_gpio)) {
> -		dev_err(ov9282->dev, "failed to get reset gpio %ld",
> -			PTR_ERR(ov9282->reset_gpio));
> +		dev_err(ov9282->dev, "failed to get reset gpio %pe",
> +			ov9282->reset_gpio);
>   		return PTR_ERR(ov9282->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

