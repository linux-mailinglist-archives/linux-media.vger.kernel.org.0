Return-Path: <linux-media+bounces-21444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ABB9C968A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 01:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637411F215D1
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C421FDA;
	Fri, 15 Nov 2024 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gU3ZvJUy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C8645;
	Fri, 15 Nov 2024 00:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731629209; cv=none; b=asKKkM9ThzzljEVz5Tb4xpk6xAatcP6KuOAdY4bssVh8CwDSGXjYJ1qjgmAZUwFalrtZWmsKWchnvHWBYVMky1DiaMhX4y/rGfDL0Mj/wj5QeVzbFpG0s/h7Omx2YMW9Rgxi0CPdjeKtzEVN42JqH9mE6WxnXFAnGKpi8A4fKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731629209; c=relaxed/simple;
	bh=YIj6SduvmKlaP26Hm+4C5+sfBfCiYj0SI/KKG3wsqVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3uLMnEZ/A97NKVjA5+glr3svCWJxw7Dl8Yt15QVktxXvp5EAYJT+rINlruf9Y79WK7TAWVLZ5GhtPAdbiHWlDTvkeh2W7exd6V0LeB0tdyg5ZxYzLBPIb9x3WScashCeWYvnv6oMoSNRubar49jXE0L8kJJ4UxCwrWIPntCBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gU3ZvJUy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9B28502;
	Fri, 15 Nov 2024 01:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731629191;
	bh=YIj6SduvmKlaP26Hm+4C5+sfBfCiYj0SI/KKG3wsqVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gU3ZvJUyDerP3jeKWJbLcX2XrOTqceYAlxv3dPUVk/rNaWWfkuTm1J4S86vvnx1Ol
	 63ysJOeS1bNUAN+Abunmo3O6yN8mDx2marQjfDBPmlFwr8XhSRiqkpiPP/C6+tWaNz
	 XMQUp+cSQjLRRa8CezRNOk8tpQH/IqNr/oUtIXEI=
Date: Fri, 15 Nov 2024 02:06:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
Message-ID: <20241115000637.GK26171@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, and wants very minor
> changes to the register setup.
> 
> Add the relevant configuration to support it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index da654deb444a..f1780cc5d7cc 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -170,6 +170,8 @@ enum imx290_model {
>  	IMX290_MODEL_IMX290LQR,
>  	IMX290_MODEL_IMX290LLR,
>  	IMX290_MODEL_IMX327LQR,
> +	IMX290_MODEL_IMX462LQR,
> +	IMX290_MODEL_IMX462LLR,
>  };
>  
>  struct imx290_model_info {
> @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
>  	{ CCI_REG8(0x33b3), 0x04 },
>  };
>  
> +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> +	{ CCI_REG8(0x300f), 0x00 },
> +	{ CCI_REG8(0x3010), 0x21 },
> +	{ CCI_REG8(0x3011), 0x02 },

As far as I can tell, the only difference in the init sequence between
imx290_global_init_settings_290 and imx290_global_init_settings_462 is
0x3011 register which is not present in imx290_global_init_settings_290.
It is however included in imx290_global_init_settings, and set to 0x02.
Could we therefore use imx290_global_init_settings_290 for the imx462 ?

> +	{ CCI_REG8(0x3016), 0x09 },
> +	{ CCI_REG8(0x3070), 0x02 },
> +	{ CCI_REG8(0x3071), 0x11 },
> +	{ CCI_REG8(0x309b), 0x10 },
> +	{ CCI_REG8(0x309c), 0x22 },
> +	{ CCI_REG8(0x30a2), 0x02 },
> +	{ CCI_REG8(0x30a6), 0x20 },
> +	{ CCI_REG8(0x30a8), 0x20 },
> +	{ CCI_REG8(0x30aa), 0x20 },
> +	{ CCI_REG8(0x30ac), 0x20 },
> +	{ CCI_REG8(0x30b0), 0x43 },
> +	{ CCI_REG8(0x3119), 0x9e },
> +	{ CCI_REG8(0x311c), 0x1e },
> +	{ CCI_REG8(0x311e), 0x08 },
> +	{ CCI_REG8(0x3128), 0x05 },
> +	{ CCI_REG8(0x313d), 0x83 },
> +	{ CCI_REG8(0x3150), 0x03 },
> +	{ CCI_REG8(0x317e), 0x00 },
> +	{ CCI_REG8(0x32b8), 0x50 },
> +	{ CCI_REG8(0x32b9), 0x10 },
> +	{ CCI_REG8(0x32ba), 0x00 },
> +	{ CCI_REG8(0x32bb), 0x04 },
> +	{ CCI_REG8(0x32c8), 0x50 },
> +	{ CCI_REG8(0x32c9), 0x10 },
> +	{ CCI_REG8(0x32ca), 0x00 },
> +	{ CCI_REG8(0x32cb), 0x04 },
> +	{ CCI_REG8(0x332c), 0xd3 },
> +	{ CCI_REG8(0x332d), 0x10 },
> +	{ CCI_REG8(0x332e), 0x0d },
> +	{ CCI_REG8(0x3358), 0x06 },
> +	{ CCI_REG8(0x3359), 0xe1 },
> +	{ CCI_REG8(0x335a), 0x11 },
> +	{ CCI_REG8(0x3360), 0x1e },
> +	{ CCI_REG8(0x3361), 0x61 },
> +	{ CCI_REG8(0x3362), 0x10 },
> +	{ CCI_REG8(0x33b0), 0x50 },
> +	{ CCI_REG8(0x33b2), 0x1a },
> +	{ CCI_REG8(0x33b3), 0x04 },
> +};
> +
>  #define IMX290_NUM_CLK_REGS	2
>  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  	[IMX290_CLK_37_125] = {
> @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
>  		.max_analog_gain = 98,
>  		.name = "imx327",
>  	},
> +	[IMX290_MODEL_IMX462LQR] = {
> +		.colour_variant = IMX290_VARIANT_COLOUR,
> +		.init_regs = imx290_global_init_settings_462,
> +		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> +		.max_analog_gain = 98,
> +		.name = "imx462",
> +	},
> +	[IMX290_MODEL_IMX462LLR] = {
> +		.colour_variant = IMX290_VARIANT_MONO,
> +		.init_regs = imx290_global_init_settings_462,
> +		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> +		.max_analog_gain = 98,
> +		.name = "imx462",
> +	},
>  };
>  
>  static int imx290_parse_dt(struct imx290 *imx290)
> @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
>  	}, {
>  		.compatible = "sony,imx327lqr",
>  		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
> +	}, {
> +		.compatible = "sony,imx462lqr",
> +		.data = &imx290_models[IMX290_MODEL_IMX462LQR],
> +	}, {
> +		.compatible = "sony,imx462llr",
> +		.data = &imx290_models[IMX290_MODEL_IMX462LLR],
>  	},
>  	{ /* sentinel */ },
>  };

-- 
Regards,

Laurent Pinchart

