Return-Path: <linux-media+bounces-16929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837A960C22
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E5A1F25158
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE831C0DF7;
	Tue, 27 Aug 2024 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZQHp6BwL"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7104B1C4EEA;
	Tue, 27 Aug 2024 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765577; cv=pass; b=pJ7F+A3FmvNq7UWxl5yG/aPTwvxH0x3SnrpgCGZdMePp7lp/SL2Y6JnNFqWbioypYYFhy+XOWHk5yEOEaX/ThP8AthWAiiU1TeVnvWdpr4eF6EvXam9EtGRzvzKJhGFIBSJDgcBnl4XgizrOLQpvgMA05YJKWPeac6K1IqCL2qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765577; c=relaxed/simple;
	bh=2RXsdPsLWHOfXe2MiYULKvHWCxZ9JUN5zKbQe5Bzzmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFW/PgqAonO4a/GoBU7TL2dR74oBbxLp9ZO3wsZrT6k2ZtOKd4X+vLi3LCTEs4ha2Gm8YZdlE1bpxGSArsdk+BhIVBDmYfRXzsP1ONaDwn9hRntVq2141vtkYu5bzSl/BhyilM9RwyNqnnUv3Z1qGVObchOJ5hb8UlJFPNXXlDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZQHp6BwL; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WtT4Y240LzySt;
	Tue, 27 Aug 2024 16:32:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1724765566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oE5nE4hsHCZlM2jqEFpjDxqfVKbEDl8kopxtlJUYWnc=;
	b=ZQHp6BwL43dZJNh/Ab5Zj/zBXQSbohwlT6djjnpWVJTGV0iuUOCgNEaaB25+SC7nKqjrVR
	xmnbqpKzP4Ta2SPQIxvscHZIeutn6ndke69rE2Qz/oQkolMb2YRU+y16wzjiiQMLy+Se1r
	bNRzmZ2OyPWpkhFfKbu2OjjRaEwof0c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1724765566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oE5nE4hsHCZlM2jqEFpjDxqfVKbEDl8kopxtlJUYWnc=;
	b=JvbiXyB0oKoK3UDhKkkT8P8JS+N/Q179eqF8EIkLZNePbpHSfp6qZnV38f/htfQ6pckDiH
	1XRRi+WB6h68Fu99pAsTy/tKIia6ivDKg4qoCyF+YBwLjSYGnU/O0Pkj/UXkNfDlyHZ1yp
	XWahi1N/SMQrHuUbBlrU62z+md4iCGQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1724765566; a=rsa-sha256; cv=none;
	b=XuTyYrYo2K9hrgXjZcR1M5k4u+uqcHTsDC6MeHZGDkNx6chbpl2n8niQ2HLYnENRKlwhMg
	HC8xdGQuaHCl27krMO9zE5tYHAKyF2lBUyT5CXCG44xc2gLFIFxIJb4deZrx4w+nN7HOlf
	P3JjXxoKHpjLujJNbLBoOn0xzQSf4ew=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2AFE9634C93;
	Tue, 27 Aug 2024 16:32:44 +0300 (EEST)
Date: Tue, 27 Aug 2024 13:32:43 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <Zs3Vey0NEdGJAyTE@valkosipuli.retiisi.eu>
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

Hejssan,

Tack för lappan!

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

It'd be nice to have a macro for this, espeically now that the driver
supports more than one chip.

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

How about adding compatible specific data to convey the model, instead of a
switch? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.

You could store the DPLL frequency there, too.

>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, max96712_of_table);
> 

-- 
Trevliga hälsningar,

Sakari Ailus

