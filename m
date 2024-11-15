Return-Path: <linux-media+bounces-21441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AB9C9682
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 01:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EC431F22785
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977F51B0F28;
	Fri, 15 Nov 2024 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KIb6hzSj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC433FE;
	Fri, 15 Nov 2024 00:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731628831; cv=none; b=ktF9svBolv/4SLZZqlPenc/a1MZ7B79MeJWSAedsOwNR/0IRaHB8WQavQtW9HUPwBdM3qxMD9lpCHsyCrVjAKV8pIQ9yv8UUW4Fk+JJs69sWCQ21k9HCRxl7FJGWscIuk7AMO216yq3ohjBbfSHcQyHFsbNoDHCWZLDg6NBmDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731628831; c=relaxed/simple;
	bh=seximQ95TY/KDhb+vB8Hrmxf7e199hCpmjuNkdXkuG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfreFOlnaw39s94MV3zMg9r0ODWmHtmwXQun0VN3Nhm5X8CFYKGUmk6ha6bBjZXameOJr+NaJx44TQ9X6vU9upZCRUpa7zrZ1BA3uMnFivoJUqruH/nbWgKoZRKCDISH8kthj/DzuUwNUYO0ucOExfh/Kmk7esaW8IrsaEJKSes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KIb6hzSj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A70BBFF1;
	Fri, 15 Nov 2024 01:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628811;
	bh=seximQ95TY/KDhb+vB8Hrmxf7e199hCpmjuNkdXkuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIb6hzSjvZi+J215tZhJkpOSoFXv9XqPGhABEBwjpXQ4B6N+OPgaj15PQGDZO4pgG
	 pKW5P8w1nGcKc5bGr2PBfR7q5jQey9fnnYvZSfTfFtY41ijd0Ze6hX8Q+iawcm0wIh
	 XZ3nwvYYRJhkMlpoqSZ5EaeR/3UouV089nRb9ztc=
Date: Fri, 15 Nov 2024 02:00:17 +0200
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
Subject: Re: [PATCH 1/3] media: i2c: imx290: Limit analogue gain according to
 module
Message-ID: <20241115000017.GH31681@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:13PM +0000, Dave Stevenson wrote:
> The imx327 only supports up to 29.4dB of analogue gain, vs
> the imx290 going up to 30dB. Both are in 0.3dB steps.
> 
> As we now have model specific config, fix this mismatch,
> and delete the comment referencing it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ee698c99001d..da654deb444a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -176,6 +176,7 @@ struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
>  	const struct cci_reg_sequence *init_regs;
>  	size_t init_regs_num;
> +	unsigned int max_analog_gain;
>  	const char *name;
>  };
>  
> @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	 * up to 72.0dB (240) add further digital gain. Limit the range to
>  	 * analog gain only, support for digital gain can be added separately
>  	 * if needed.
> -	 *
> -	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> -	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> -	 * gain. When support for those sensors gets added to the driver, the
> -	 * gain control should be adjusted accordingly.
>  	 */
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> +			  V4L2_CID_ANALOGUE_GAIN, 0,
> +			  imx290->model->max_analog_gain, 1, 0);
>  
>  	/*
>  	 * Correct range will be determined through imx290_ctrl_update setting
> @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX290LLR] = {
>  		.colour_variant = IMX290_VARIANT_MONO,
>  		.init_regs = imx290_global_init_settings_290,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain = 100,
>  		.name = "imx290",
>  	},
>  	[IMX290_MODEL_IMX327LQR] = {
>  		.colour_variant = IMX290_VARIANT_COLOUR,
>  		.init_regs = imx290_global_init_settings_327,
>  		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
> +		.max_analog_gain = 98,
>  		.name = "imx327",
>  	},
>  };
> 

-- 
Regards,

Laurent Pinchart

