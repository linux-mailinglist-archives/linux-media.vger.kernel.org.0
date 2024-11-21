Return-Path: <linux-media+bounces-21706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB89D4654
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CFD3282D9C
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 03:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0A912DD88;
	Thu, 21 Nov 2024 03:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RqZ15P5G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD422309B6;
	Thu, 21 Nov 2024 03:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732160758; cv=none; b=I3GtHH1lozUgRE7XnPoh83odSVlahupt37G4ZaofuvCqWRB6XfJWea4tbyaamaIGoNjJzjmA3DJdimDXgZWOeusmWdJo4LBOfUUJcgrw8Cj8ykpr+3Y6QpAo7IVhS6mgZ/Sn8wJ86cR0FNu4Q8JWhiGhnPw+ok1CYzEA0W+nIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732160758; c=relaxed/simple;
	bh=W6NRhNfE/tN5Hbr1vVe7ak6L9aO11G7A1l6/pEAVtAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtYdVAVUlsGXvYkVGD43YSRcq/zEFFsDnn+iwqlKVnS4aFLsqROIwrDZQ4d0mYzNvw9MsU3pn7OhMVCnpVNR8+/poUut6pYmeKkM9s1rfZusXfGo6NxK83xigw8cHWGXwiPQ9O4qdP4CuE3YNbBJj1E8fv1Wzaci5ruuHkeBK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RqZ15P5G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D831E219;
	Thu, 21 Nov 2024 04:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732160737;
	bh=W6NRhNfE/tN5Hbr1vVe7ak6L9aO11G7A1l6/pEAVtAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqZ15P5GNl+znM1p21KhrhS9yJJ+oOxvta1u/t17xJ9auQg+4ohsHufLOVv0R6+XG
	 ySCzDgYUW3FJ1BDlrVbJcFBcJOyq7iiRae2tvX/dPFWX/FyVBA2iYv1YUgxyMdtFxc
	 b1VMAig4wULTt3/G9pjywCsDzPMGH1N/h6YiMLTs=
Date: Thu, 21 Nov 2024 05:45:46 +0200
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
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx290: Add configuration for IMX462
Message-ID: <20241121034546.GG12409@pendragon.ideasonboard.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-4-7e562cf191d8@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-media-imx290-imx462-v2-4-7e562cf191d8@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Wed, Nov 20, 2024 at 07:17:06PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, and wants very minor
> changes to the register setup.
> 
> Add the relevant configuration to support it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7d794a509670..3bad7779d0d0 100644
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
> @@ -1456,6 +1502,20 @@ static const struct imx290_model_info imx290_models[] = {
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
> @@ -1654,6 +1714,12 @@ static const struct of_device_id imx290_of_match[] = {
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

