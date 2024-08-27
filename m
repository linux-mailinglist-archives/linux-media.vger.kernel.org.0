Return-Path: <linux-media+bounces-16933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E0960CAD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41C31C22925
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A171C3F19;
	Tue, 27 Aug 2024 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZP8leIM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F719ADBE;
	Tue, 27 Aug 2024 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766934; cv=none; b=NyzxLajXxORDx0Vugc7UfSDkY+PCME9SPCQxWcSN1u4ypYEJTGwTeK/t13l16xH6EjoiG+KxxSTS8HYNIPu+HGcyCfR4s1GuG6yxA+S570Gxi8Q1Av0zd3aoZGSXdEA4oud62D8SxsT2pq2iNLFaUdyC0Wk43UDOpmmOrLGKcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766934; c=relaxed/simple;
	bh=BQ59D5hX/sMmMwLtN1HvKH/ZppCnb8N6a4QrNUn1ez8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYAN2oP1K69Q3GnTDurxUNLlAEiatewmnTuevIVgZJ2LBijcO7OclRv79xMl7xVxjxMkX9Q4+gcmG3RMfJT7ARorSnxGgZ1NrECO0K7k5j8naITMlh/Mbk0OmhfX+F3whRrj8EmbpoIkRDvTfJ7RCqfLxYutzisB9bJI1++KLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZP8leIM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-371a13c7c80so3787183f8f.0;
        Tue, 27 Aug 2024 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766931; x=1725371731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGkXmJO7+ehJTc5gDtx5XxEE1THr9uwQmGYarHbXZ7Q=;
        b=ZZP8leIMWnHeZgFcOLA/uSlScit9HOPz/wFHefw1g9A0EocL+d2dS7uPKwRy85cKM3
         u4nwnK/1H2CZW7ivYtZYMFMVkID7kj/l056j32rQwHfGIkdjMceBt3MzAXmFV9gKhZNL
         sXrG3A2sU0vHm/bVUChlV3Rpf7NjGj7EUNcGnISfANk1LuK5ZdwqjQvcz2Yg2Aqp9s2s
         GNFGuRrxy9GAn6huUJkk86hivDK3ac2wLBPYuyIyuCmms4bRd7S2sNYysUTCNB2luIQh
         /s11zGWGwaZyF9lAWS0LmkauZTInuXaHX1ZwStfqNZPXE9YiWzNoLz1k19aRNe8eqBVS
         jQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766931; x=1725371731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGkXmJO7+ehJTc5gDtx5XxEE1THr9uwQmGYarHbXZ7Q=;
        b=Mw6uOkiJv/GjIFV6CefsA880gFM9wG278LOpADURSUyrET9X/3oD5tFsI0BPy1QxVO
         /XCHL6UxqIQHSulwSLATCfBobNa2yUT5QfBRVsyFGREJJIpKFWzLpAWBHNzAmx+Ot/jn
         MX286zzsRUoqgkLIX3D/o+zsaHksDIEhPDl91ZdzhnCerEAUfROk+zIvXSal4N+kwaa3
         sGtnGm1aNLKT+XFwhFgYP9te1dGBEOQ3Wj3UH1NAspgEEQeIqTb8PLFiYsMRqPKfrOfr
         uoM4D7qXcp6VKoUYE9HEN6YxnfiLT61IxvGgiVs+M8iMoO+36D3hC/C37Hdpjl5ejOtG
         Mi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcGszSmw8EwiwE6eSFwu+7nDn8kkQ2cRPH/J9G/QcHL9gv540RfUUagJLuDfsYYWQgUziVlcdX2e9sqf8=@vger.kernel.org, AJvYcCVH/i0UV8v/BD7ZGXyM/IPqZXd5poC0MSE/AKWdiZ+4lQC/wU1sRHt0/JmZyDqvxw0JWcOlzNbsS1GWLYm1bxHzL6E=@vger.kernel.org, AJvYcCXZj/Nkukdd0y9K9l+ya7GVxGAPQcvzUtv8wMQexsjcSI9bMHicabzQ3KtoRj9to6wNbXXM7thVKT3t@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaPqC1jvbDehfobiCuBb/FSS7Ht99huqAAE3qlzwES2sGJ2pi
	zg7ZJw2QqsKtF5UmAMf41NeBYLJK5BmQPxzzusW0eAOf2J6F93Pd
X-Google-Smtp-Source: AGHT+IGMlJfM4oTqypQRhPCQu5jbMTPV1df56N2ITKW6B/3nFmGl5sIHK66o3lyBNIs6QCOaeIK1eQ==
X-Received: by 2002:adf:e7cd:0:b0:367:938f:550 with SMTP id ffacd0b85a97d-3748c89dca6mr1655410f8f.25.1724766930425;
        Tue, 27 Aug 2024 06:55:30 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308265518sm13087268f8f.108.2024.08.27.06.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:55:30 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:55:27 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	julien.massot@collabora.com
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <Zs3az1G/e5y5lkf1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,
Thanks for your work.

Hi Julien,
I think we can adopt a similar approach for the max96716 deserializer using your work
on max96714 driver. What do you think?

Thanks in advance.

On Tue, Aug 27, 2024 at 03:18:41PM +0200, Niklas Söderlund wrote:
> The MAX96724 is almost identical to the MAX96712 and can be supported by
> the same driver, add support for it.
> 
> For the staging driver which only supports patter generation the big
> difference is that the datasheet (rev 4) for MAX96724 do not describe
> the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
> not clear if this register is removed or moved to a different offset.
> What is known is writing to register 0x0009 have no effect on MAX96724.
> 
> This makes it impossible to increase the test pattern clock frequency
> from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
> pattern the DPLL frequency have to be increase instead to compensate for
> this. The frequency selected is found by experimentation as the MAX96724
> datasheet is much sparser then what's available for MAX96712.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Group in series together with binding.
> ---
>  drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 6bdbccbee05a..6bd02276c413 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -17,8 +17,10 @@
>  #include <media/v4l2-subdev.h>
>  
>  #define MAX96712_ID 0x20
> +#define MAX96724_ID 0xA7
>  
>  #define MAX96712_DPLL_FREQ 1000
> +#define MAX96724_DPLL_FREQ 1200
>  
>  enum max96712_pattern {
>  	MAX96712_PATTERN_CHECKERBOARD = 0,
> @@ -31,6 +33,7 @@ struct max96712_priv {
>  	struct gpio_desc *gpiod_pwdn;
>  
>  	bool cphy;
> +	bool max96724;
>  	struct v4l2_mbus_config_mipi_csi2 mipi;
>  
>  	struct v4l2_subdev sd;
> @@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
>  
>  static void max96712_mipi_configure(struct max96712_priv *priv)
>  {
> +	unsigned int dpll_freq;
>  	unsigned int i;
>  	u8 phy5 = 0;
>  
> @@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>  	max96712_write(priv, 0x8a5, phy5);
>  
>  	/* Set link frequency for PHY0 and PHY1. */
> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
>  	max96712_update_bits(priv, 0x415, 0x3f,
> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>  	max96712_update_bits(priv, 0x418, 0x3f,
> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>  
>  	/* Enable PHY0 and PHY1 */
>  	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	}
>  
>  	/* PCLK 75MHz. */
> -	max96712_write(priv, 0x0009, 0x01);
> +	if (!priv->max96724)
> +		max96712_write(priv, 0x0009, 0x01);
>  
>  	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
>  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> @@ -303,6 +309,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
>  
>  static int max96712_v4l2_register(struct max96712_priv *priv)
>  {
> +	unsigned int dpll_freq;
>  	long pixel_rate;
>  	int ret;
>  
> @@ -317,7 +324,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>  	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
>  	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
>  	 */
> -	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> +	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
>  	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
>  			  pixel_rate, pixel_rate, 1, pixel_rate);
>  
> @@ -438,8 +446,15 @@ static int max96712_probe(struct i2c_client *client)
>  	if (priv->gpiod_pwdn)
>  		usleep_range(4000, 5000);
>  
> -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> +	switch (max96712_read(priv, 0x4a)) {
> +	case MAX96712_ID:
> +		break;
> +	case MAX96724_ID:
> +		priv->max96724 = true;
> +		break;
> +	default:
>  		return -ENODEV;
> +	}
>  
>  	max96712_reset(priv);
>  
> @@ -463,6 +478,7 @@ static void max96712_remove(struct i2c_client *client)
>  
>  static const struct of_device_id max96712_of_table[] = {
>  	{ .compatible = "maxim,max96712" },
> +	{ .compatible = "maxim,max96724" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, max96712_of_table);

Thanks & Regards,
Tommaso

> -- 
> 2.46.0
> 
> 

