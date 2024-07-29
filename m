Return-Path: <linux-media+bounces-15446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0F93F3BE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3193E1F22236
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1AC145B06;
	Mon, 29 Jul 2024 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iqlHPLXe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C9142915;
	Mon, 29 Jul 2024 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251621; cv=none; b=o6iejUBcx9ShL8TZAlpYcTG3R4shfz4l1zTnYP0RIs3t4404PwSj+oB3hGqZqj5CV07b37bC/3jKZhj90rU2ugqAe7oDRjEHtR6RiPy+APaB3mSW94ioSICC375TnzlFZ18Ow9KZBT/WYFm5XVkoBsnexY6Pdb9Cayzl+nfjJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251621; c=relaxed/simple;
	bh=VYGVaQaOPwWbNaHkySEhiltIfSEgwW6sgkycdl86jUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWLIDPBznWfU9dgYHKz71F/F7EyHVeoLwPzFoCEe7TWdwBDWaWB/32b80XQgrjpvbGPPLVeLSyu7t9ARsFy/WGO7Maz/kN+IEuaqlGPXOLBonx8VzqtPm2YZ0CfYPhgC19w/dwIEjJPxfQIP8q8fpoDb5EOVYvtJG+X/q+GSZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iqlHPLXe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8602145A;
	Mon, 29 Jul 2024 13:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722251571;
	bh=VYGVaQaOPwWbNaHkySEhiltIfSEgwW6sgkycdl86jUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqlHPLXehTmFHZCh2MLK0ghL1EsdygA+CgI/5BhKXXAcI1uJibF7Rn6/YPR0q5TKh
	 npzjnp69KEEB5jyD0Ak64Tkhi1oIxfXziT1ObyHZB3OzVyygBPH+2Swj6AMC5NCtIh
	 XHM42LvwLDaWMc8r2weSjJM17jMiY9OP2MCbwbHM=
Date: Mon, 29 Jul 2024 14:13:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <20240729111315.GI2320@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729110437.199428-3-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Mon, Jul 29, 2024 at 04:34:37PM +0530, Umang Jain wrote:
> Rectify the logical value of reset-gpio so that it is set to
> 0 (disabled) during power-on and to 1 (enabled) during power-off.
> 
> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
> time to make sure it starts off in reset.
> 
> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index cd150606a8a9..7241fc87ef84 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -1057,7 +1057,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
>  
>  	/* Request optional reset pin */
>  	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> -						     GPIOD_OUT_LOW);
> +						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx335->reset_gpio)) {
>  		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
>  			PTR_ERR(imx335->reset_gpio));
> @@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
>  	usleep_range(500, 550); /* Tlow */
>  
>  	/* Set XCLR */

I would replace this with

	/* Deassert the reset (XCLR) signal. */

or something similar.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
> +	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
>  
>  	ret = clk_prepare_enable(imx335->inclk);
>  	if (ret) {
> @@ -1184,7 +1184,7 @@ static int imx335_power_on(struct device *dev)
>  	return 0;
>  
>  error_reset:
> -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
> +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
>  	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
>  
>  	return ret;
> @@ -1201,7 +1201,7 @@ static int imx335_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct imx335 *imx335 = to_imx335(sd);
>  
> -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
> +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
>  	clk_disable_unprepare(imx335->inclk);
>  	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
>  

-- 
Regards,

Laurent Pinchart

