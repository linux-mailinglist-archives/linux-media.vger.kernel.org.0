Return-Path: <linux-media+bounces-32173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B0AB1CB1
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4753BF1E4
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1806E2405E8;
	Fri,  9 May 2025 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lAlAASU0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E866722D4CE
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816719; cv=none; b=pyCw6Y3ygOq4aKx1donB9TxLpnU4kJMeH8B+RiLJ5zwgrCBtWG/gB0iXZ9Xi8U6Y7oOU/WXA8jZ569XcxyHveFpNjEXlAc87Em7hWHzYPX/CX1ZLtemn2YtwiLRLh0pw0xfXvbs6n8xXAbcE8DVhb+qUForydDcO5K/N7vJFCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816719; c=relaxed/simple;
	bh=KDaoEAEnWi7tsqEC1tzc0nW+R6tqaaQiifi4KbVHvJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJi9EMcsaC+n4W6PSJ/5Xnx4td4YT4HT8TXtm3Zg0GTEwSZIxINA08ZtQ+N5m4yqdjvR7hK/7c5nIZmNAMP0c/Xa+DPZUl9Pk6+J7SbbLE4ErfAU9dyxhguVz1H4uoAooccvEDoS8zszSDVnElMaMat/rvEb/D7d5FVIkkkO9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lAlAASU0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6843C9CE;
	Fri,  9 May 2025 20:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746816703;
	bh=KDaoEAEnWi7tsqEC1tzc0nW+R6tqaaQiifi4KbVHvJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAlAASU0kL7nkLYM8+7hl+3G+JzEuMoKGqIve0/3ij1Kg78pVdYoh+q5HbXdE9eWg
	 GT23n2Dzwdq+Ntk2xE6tVG1WblSK5LJl1a5/xI5mXuo8gOp8ib+aDqkTmu0C1yBGE0
	 Yrr2XF8ZFOnc1efgdmNdMi2Kz/GxRdl7XS5rYqlE=
Date: Fri, 9 May 2025 20:51:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/13] media: mt9m114: Add support for clock-frequency
 property
Message-ID: <20250509185147.GB19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250504101336.18748-3-hdegoede@redhat.com>

Hi Hans,

On Sun, May 04, 2025 at 12:13:23PM +0200, Hans de Goede wrote:
> Add support for platforms that do not have a clock provider, but instead
> specify the clock frequency by using the "clock-frequency" property.
> 
> E.g. ACPI platforms turn the clock on/off through ACPI power-resources
> depending on the runtime-pm state, so there is no clock provider.

https://lore.kernel.org/r/20250321130329.342236-1-mehdi.djait@linux.intel.com
is a solution to this problem that will scale better.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 5f0b0ad8f885..be1d2ec64b89 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -377,6 +377,7 @@ struct mt9m114 {
>  	struct gpio_desc *reset;
>  	struct regulator_bulk_data supplies[3];
>  	struct v4l2_fwnode_endpoint bus_cfg;
> +	u32 clk_freq;
>  
>  	struct {
>  		unsigned int m;
> @@ -2122,14 +2123,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  
>  	/* Perform a hard reset if available, or a soft reset otherwise. */
>  	if (sensor->reset) {
> -		long freq = clk_get_rate(sensor->clk);
>  		unsigned int duration;
>  
>  		/*
>  		 * The minimum duration is 50 clock cycles, thus typically
>  		 * around 2µs. Double it to be safe.
>  		 */
> -		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
> +		duration = DIV_ROUND_UP(2 * 50 * 1000000, sensor->clk_freq);
>  
>  		gpiod_set_value(sensor->reset, 1);
>  		fsleep(duration);
> @@ -2249,7 +2249,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
>  	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
>  	 */
> -	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
> +	sensor->pixrate = sensor->clk_freq * sensor->pll.m
>  			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
>  
>  	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
> @@ -2360,13 +2360,25 @@ static int mt9m114_probe(struct i2c_client *client)
>  		return ret;
>  
>  	/* Acquire clocks, GPIOs and regulators. */
> -	sensor->clk = devm_clk_get(dev, NULL);
> +	sensor->clk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(sensor->clk)) {
>  		ret = PTR_ERR(sensor->clk);
>  		dev_err_probe(dev, ret, "Failed to get clock\n");
>  		goto error_ep_free;
>  	}
>  
> +	if (sensor->clk) {
> +		sensor->clk_freq = clk_get_rate(sensor->clk);
> +	} else {
> +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> +					       "clock-frequency",
> +					       &sensor->clk_freq);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to read clock-freq\n");
> +			goto error_ep_free;
> +		}
> +	}
> +
>  	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(sensor->reset)) {
>  		ret = PTR_ERR(sensor->reset);

-- 
Regards,

Laurent Pinchart

