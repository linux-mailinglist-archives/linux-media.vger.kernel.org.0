Return-Path: <linux-media+bounces-15421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4FC93EF92
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D39EB20FAB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB5113A407;
	Mon, 29 Jul 2024 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t0vSuPkI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26D139568;
	Mon, 29 Jul 2024 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240771; cv=none; b=QJXaRDCE9Ofsk4IoetiEz3beskJenUQeqMPWY965cdOaBKeeIgXj9IHb8/3W0jVUdRjJeCLGw5AvSaMnec7dNFQLW8xRGoJCGJci4vEXdsUHK3lDPegWiCKsxG12w+3GcUPCQw2fku8hW0mFSUjydvRRJr6HKay/sSH27WrbhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240771; c=relaxed/simple;
	bh=83CiqU+QrBWVBllgbln4QZY+abqFLmce4N2heMdSqrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1WYp2xwf9VJuVxm+oKf3pMkGxIA4Mf7VKDH/Hyt6JCqrJJFRInuQPHZGf8K8hZ3MRO03Kfrcah3fEPcOrBsVLAU13dTDIrVNHKkhp5drP4P+Ne0NlhyjmokoZRO4AN9IWRwHt4oegBbJXLwMXfpUNguENpHED2lq/RN1gM9VuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t0vSuPkI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-112.net.vodafone.it [5.90.63.112])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0FB8596;
	Mon, 29 Jul 2024 10:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722240721;
	bh=83CiqU+QrBWVBllgbln4QZY+abqFLmce4N2heMdSqrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0vSuPkIc4382keCYfaPa3COeCYFHwnw0CZiahEblfcLEifoUuOeyKI4Gxd/yIjrp
	 jww/bVSeDJJAG222ueQ9846Zp6j+rhEs5FIgo73Vo7/0JrlnMESsSNn3ZIu1mV++6C
	 Ob5XhVDMp95ggBz2DlNyRIY91MrDWt66MA427xz0=
Date: Mon, 29 Jul 2024 10:12:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	open list <linux-kernel@vger.kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
Message-ID: <4me3tw572feft3x4dn3ritpr6avss6ebupixrg7qrlsy5z6kny@mqeoqhr7uh2x>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729060535.3227-1-umang.jain@ideasonboard.com>

Hi Umang

On Mon, Jul 29, 2024 at 11:35:35AM GMT, Umang Jain wrote:
> The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.

How is this related to this change ? The value to which the GPIO is
initialized to in probe is the physical level.

What matters is the gpio line active level, which should be described
in the sensor's datasheet. What's the active level of the reset gpio
line ?

> However, the reset-gpio logical value is set to 1 in during power-on
> and to 0 on power-off. This is incorrect as the reset line
> cannot be high during power-on and low during power-off.

If the line is physically high or low only depends on how the active
level is specified in DTS, not by the logical value provided to
gpiod_set_value[_cansleep]()
>
> Rectify the logical value of reset-gpio so that it is set to
> 0 during power-on and to 1 during power-off.

This is correct, the reset line should be set to logical 0 (inactive)
during power on and to logical 1 (active) when powering off. However
the GPIO active state should have been specified in bindings and as
this driver has been mainline quite some time, this change will break
.dtbo already used succesfully with previous kernel releases.

Is this an issue ?

>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index cd150606a8a9..878d88b5f476 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
>  	usleep_range(500, 550); /* Tlow */
>
>  	/* Set XCLR */
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
> --
> 2.45.0
>
>

