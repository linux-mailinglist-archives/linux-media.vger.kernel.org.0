Return-Path: <linux-media+bounces-35447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FEAE0F72
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 00:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2047D3B0506
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2E825B67D;
	Thu, 19 Jun 2025 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuHo8U6c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24235DF42;
	Thu, 19 Jun 2025 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370866; cv=none; b=peJ4Xm6pfvePQteWFL/6C5nYjHYOlhMQIrkNWyfI0lcgMrrwQdvVt9gGK3nSBTMO8DI9FqazoNJcIR96MH/Q/mQ0l2J5B0nMl4MkvGtFX5Fn61dCgarLjOd4hjNHM2uDKjMwDkilps9mbCZ+R9gY3ZYmKTuGIBqh+n4BOgkun4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370866; c=relaxed/simple;
	bh=eyvxHiBaTfMMOYycw+Lo/h1964z+2I9bQWbkS4kwDwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvCrH70XyYWCUQVNBaDVJkAlWgsZn7/XhVeR4Kjfr8ttZUEkqDNvgxe1vRpZxSmBxxUSD/hIQeljzMq3A0Yt7oxJubvtliLctK3l9mm4Fv3RKVJV4NB1OPqG8eQ3fEx9EimmfTq0SzKzsWOarFfZqXMINwisR6xiLh2kXYYeAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DuHo8U6c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21BF0778;
	Fri, 20 Jun 2025 00:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750370847;
	bh=eyvxHiBaTfMMOYycw+Lo/h1964z+2I9bQWbkS4kwDwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuHo8U6cEMxryW1flrQ4Opl4Fl9tHpg1WTA/eLtbrFEQpLOwfy+a/BU5j7HzwOwdb
	 KNSgAE+AT/k8l9g9eKXRXGm/WRcxYKcciRrdEFwwRR69Ni2otGrKWqkDES/S0nIqOn
	 PE3lJ5I3h0RMi2f20hCHE0k1C7M0vsi4+CgxAOQw=
Date: Fri, 20 Jun 2025 01:07:23 +0300
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
Subject: Re: [PATCH v1 01/55] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250619220723.GU22102@pendragon.ideasonboard.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <1f8a0bb1896a57e818fad30a236b350127689be6.1750352394.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f8a0bb1896a57e818fad30a236b350127689be6.1750352394.git.mehdi.djait@linux.intel.com>

Hi Mehdi,

Thank you for the patch.

On Thu, Jun 19, 2025 at 07:58:54PM +0200, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is

It actually behaves like devm_clk_get(). The _optional variant returns
NULL when the clok is not found, while the helper here return
ERR_PTR(-ENOENT).

> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> This function also handles the special ACPI-based system case where:
> The clock-frequency _DSD property is present.
> A reference to the clock producer is present, where the clock is provided
> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> In this case try to set the clock-frequency value to the provided clock.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index bd160a8c9efe..c53221165c5a 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -34,6 +34,9 @@
>   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/kernel.h>
> @@ -673,3 +676,49 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	const char *clk_id __free(kfree) = NULL;
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	bool acpi_node;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	acpi_node = is_acpi_node(dev_fwnode(dev));
> +
> +	if (clk) {
> +		if (!ret && acpi_node) {
> +			ret = clk_set_rate(clk, rate);
> +			if (ret) {
> +				dev_err(dev, "Failed to set clock rate: %u\n",
> +					rate);
> +				return ERR_PTR(ret);
> +			}
> +		}
> +		return clk;
> +	}
> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!id) {
> +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> +		if (!clk_id)
> +			return ERR_PTR(-ENOMEM);
> +		id = clk_id;
> +	}
> +
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
> +}
> +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..72d8fcc6057f 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -620,6 +620,31 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  			     unsigned int num_of_driver_link_freqs,
>  			     unsigned long *bitmap);
>  
> +/**
> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to an optional clock
> + *			      producer for a camera sensor.
> + *
> + * @dev: device for v4l2 sensor clock "consumer"
> + * @id: clock consumer ID
> + *
> + * This function behaves the same way as clk_get_optional() except where there

s/clk_get_optional/devm_clk_get/

> + * is no clock producer like in ACPI-based platforms.
> + *
> + * For ACPI-based platforms, the function will read the "clock-frequency"
> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> + * in the property.
> + *
> + * This function also handles the special ACPI-based system case where:
> + * The clock-frequency _DSD property is present.
> + * A reference to the clock producer is present, where the clock is provided by
> + * a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> + * In this case try to set the clock-frequency value to the provided clock.

 * This function also handles the special ACPI-based system case where:
 *
 * * The clock-frequency _DSD property is present.
 * * A reference to the clock producer is present, where the clock is provided
 *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c).
 *
 * In this case try to set the clock-frequency value to the provided clock.

to get proper formatting in the generated documentation.

> + *
> + * Return:
> + * * pointer to a struct clk on success or an error code on failure.

 * Returns a pointer to a struct clk on success or an error pointer on failure.

> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +

Please add a forward declaration of struct clk towards the top of the
file, with the other forwar declarations.

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*

-- 
Regards,

Laurent Pinchart

