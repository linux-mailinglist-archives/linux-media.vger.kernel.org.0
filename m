Return-Path: <linux-media+bounces-36892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DE8AFA26D
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 02:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65B513BDC64
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 00:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A04219E8;
	Sun,  6 Jul 2025 00:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tu+Ppsi+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82978EEBB
	for <linux-media@vger.kernel.org>; Sun,  6 Jul 2025 00:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751761862; cv=none; b=Tput9YB9qOzuWy9e3TOAgW2LUHqbkCHjGxPPxSccUYDEnRO6nNw1nKDJ7uXgy4pKLSQcws637KTseLiYJ5nYkp5IQsIZpoAcD7QWr1gsfhMqVEF874U1Tn6714Oi52seLf52YkBuxbn2GAecwLai7lsqptw0HgKMUuKR1sfTMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751761862; c=relaxed/simple;
	bh=dKX3BXc8k8WCCVBBrVzAp71mWSLJnPxAK1/gpD87jBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWdZIVulR4HYGsDer5EGE5jaP9MmoK8XTo252gtdsMz4xjrOv6++egjW+BeZfVFPk8k58DJpLxjxT0QgsiV7IJrCtIY18Z7qCrQcNRnRFnZlb5UBQasbusqVQdpwLgGJV2JAIxQSTptCX+olTEy/GlkiwnjUpHmBw7x8w50qzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tu+Ppsi+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2A76289;
	Sun,  6 Jul 2025 02:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751761831;
	bh=dKX3BXc8k8WCCVBBrVzAp71mWSLJnPxAK1/gpD87jBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tu+Ppsi+HbOVkrt5LvOBv8D42onUB2F7rESIdbZBChX7TR0fkAeeaTygbFTcIbkTR
	 LDM5UKjMw9+sO8WV9w5jEEf4XcLeTONqnjoe5Ucz05xaVucuiKfEBqc4MEIquJRDyM
	 uURXpxvusMcfg1QTa9YCscju7jTAjozQGJ0i9r84=
Date: Sun, 6 Jul 2025 03:30:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
	m.felsch@pengutronix.de, matthias.fend@emfend.at,
	mchehab@kernel.org, michael.riesch@collabora.com,
	naush@raspberrypi.com, nicholas@rothemail.net,
	nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250706003027.GA30859@pendragon.ideasonboard.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>

Hi Mehdi,

One more comment.

On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as devm_clk_get() except where there is
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
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 27 ++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index bd160a8c9efe..ac98895b0394 100644
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
> @@ -673,3 +676,52 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	const char *clk_id __free(kfree) = NULL;
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	bool of_node;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);

Shouldn't your return here if there's an error ?

	if (IS_ERR(clk))
		return clk;

because ...

> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	of_node = is_of_node(dev_fwnode(dev));
> +
> +	if (clk) {
> +		if (!ret && !of_node) {
> +			ret = clk_set_rate(clk, rate);

... here clk_set_rate() will dereference clk and crash if it's an error
pointer ...

> +			if (ret) {
> +				dev_err(dev, "Failed to set clock rate: %u\n",
> +					rate);
> +				return ERR_PTR(ret);
> +			}
> +		}
> +		return clk;
> +	}
> +
> +	if (PTR_ERR(clk) == -EPROBE_DEFER)
> +		return ERR_PTR(-EPROBE_DEFER);

... and this will never be reached.

> +
> +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (ret)
> +		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
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
> index 0a43f56578bc..1c79ca4d5c73 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
>  struct v4l2_device;
>  struct v4l2_subdev;
>  struct v4l2_subdev_ops;
> +struct clk;

Please keep forward declarations sorted.

You don't need to resubmit the whole series for this, but it would be
useful if you could retest it, and then send a new version of just this
patch.

>  
>  /* I2C Helper functions */
>  #include <linux/i2c.h>
> @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  			     unsigned int num_of_driver_link_freqs,
>  			     unsigned long *bitmap);
>  
> +/**
> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> + *	for a camera sensor.
> + *
> + * @dev: device for v4l2 sensor clock "consumer"
> + * @id: clock consumer ID
> + *
> + * This function behaves the same way as devm_clk_get() except where there
> + * is no clock producer like in ACPI-based platforms.
> + *
> + * For ACPI-based platforms, the function will read the "clock-frequency"
> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> + * in the property.
> + *
> + * This function also handles the special ACPI-based system case where:
> + *
> + * * The clock-frequency _DSD property is present.
> + * * A reference to the clock producer is present, where the clock is provided
> + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> + *
> + * In this case try to set the clock-frequency value to the provided clock.
> + *
> + * Returns a pointer to a struct clk on success or an error pointer on failure.
> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*

-- 
Regards,

Laurent Pinchart

