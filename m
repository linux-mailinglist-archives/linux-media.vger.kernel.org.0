Return-Path: <linux-media+bounces-35446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE1AE0F35
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 00:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05519176E52
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB4125EFB9;
	Thu, 19 Jun 2025 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E8D7zcGq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FC30E841;
	Thu, 19 Jun 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370424; cv=none; b=Ez8gmf8u2of3yq4YSJ2AZ6kdDUin4+kG/Rg5j2ucf/xAnExgyMrB5qDrnui4s+cqGHvjMEyvTNesTdEp/2zgVeTFnjZySUpnw8zvZN6TMwincvk55OeiR5w/4j/KFAZnXWHFMCx6cZX6Jli5808+E40eezRNVwjKRCR2DvQcWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370424; c=relaxed/simple;
	bh=ZhAj9EaJitHr/cAXKtiepcQ5JA3JEcKVwI110cN5ZTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOgqRnXBxN+XaxctoxrvypLWJUV1lYjceDzQUfiFG4QkA3y0cOxKOipHiM7W+ZZY2jSFxc8LlZnNtqFzu9p5fnrZEp0MYZbuxC/302cMhec7NIcBDBQbskFXnMkX9qeNkhBT9zehCqf+08OsFyQ1DLJE8fyX6tz/5e/fkHMT/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E8D7zcGq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E676319AD;
	Fri, 20 Jun 2025 00:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750370406;
	bh=ZhAj9EaJitHr/cAXKtiepcQ5JA3JEcKVwI110cN5ZTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8D7zcGqwvZK3TSU5MgWukWUVLLNbQht3tmCmYE9y90Jatwr1cMtHR/i/62pzKZAd
	 FyzoOeP+fgthlSwqUfEoeYFHyup4WqdZU2m4rGEP8oNSnrcXqmwNiK48qhys09k7L8
	 SYBfEuQpcmVSx6/g2e4/4Rt1M1epcUIpAQP5yN68=
Date: Fri, 20 Jun 2025 01:00:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se, kieran.bingham@ideasonboard.com, khalasa@piap.pl,
	prabhakar.csengg@gmail.com, mani@kernel.org,
	m.felsch@pengutronix.de, martink@posteo.de, mattwmajewski@gmail.com,
	matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com,
	pavel@kernel.org, petrcvekcz@gmail.com, rashanmu@gmail.com,
	ribalda@chromium.org, rmfrfs@gmail.com, zhengsq@rock-chips.com,
	slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 55/55] media: i2c: ov2680: Use the v4l2 helper for
 obtaining the clock
Message-ID: <20250619220002.GT22102@pendragon.ideasonboard.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <6284706df845a3c88826f1c3bd17f60d3e71ecd9.1750352394.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6284706df845a3c88826f1c3bd17f60d3e71ecd9.1750352394.git.mehdi.djait@linux.intel.com>

Hi Mehdi,

Thank you for the patch.

On Thu, Jun 19, 2025 at 08:11:24PM +0200, Mehdi Djait wrote:
> Use the new v4l2 helper devm_v4l2_sensor_clk_get() that works on both
> DT- and ACPI-based platforms to retrieve a reference to the clock
> producer from firmware.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 7237fb27ecd0..c974169c92f8 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1079,7 +1079,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  	struct device *dev = sensor->dev;
>  	struct fwnode_handle *ep_fwnode;
>  	struct gpio_desc *gpio;
> -	unsigned int rate = 0;
>  	int i, ret;
>  
>  	/*
> @@ -1114,13 +1113,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  
>  	sensor->pwdn_gpio = gpio;
>  
> -	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
> -	if (IS_ERR(sensor->xvclk)) {
> -		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
> -				    "xvclk clock missing or invalid\n");
> -		goto out_free_bus_cfg;
> -	}
> -
>  	/*
>  	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
>  	 * ACPI... but we also need to support the weird IPU3 case which will
> @@ -1130,22 +1122,15 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  	 * uses devicetree then the configured rate should already be set, so
>  	 * we can just read it.
>  	 */

Shouldn't you drop the comment, as in 41/55 ?

Apart from that, the patch looks good to me.

> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &rate);
> -	if (ret && !sensor->xvclk) {
> -		dev_err_probe(dev, ret, "invalid clock config\n");
> +
> +	sensor->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
> +	if (IS_ERR(sensor->xvclk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
> +				    "xvclk clock missing or invalid\n");
>  		goto out_free_bus_cfg;
>  	}
>  
> -	if (!ret && sensor->xvclk) {
> -		ret = clk_set_rate(sensor->xvclk, rate);
> -		if (ret) {
> -			dev_err_probe(dev, ret, "failed to set clock rate\n");
> -			goto out_free_bus_cfg;
> -		}
> -	}
> -
> -	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
> +	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
>  
>  	for (i = 0; i < ARRAY_SIZE(ov2680_xvclk_freqs); i++) {
>  		if (sensor->xvclk_freq == ov2680_xvclk_freqs[i])

-- 
Regards,

Laurent Pinchart

