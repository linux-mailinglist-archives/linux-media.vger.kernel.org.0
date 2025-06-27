Return-Path: <linux-media+bounces-36067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C43AEAFDB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 09:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38EF656262E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 07:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA9521ABB7;
	Fri, 27 Jun 2025 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nc9Fqaru"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE514219E8F
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008336; cv=none; b=cbUQclerfpjfKX1xG763sW9zrkcj+0K78cxWrsuddh+GaTOBcUy7IsSexBNa0enzoh11RegK7jUUitloL5vxLN7if6eSWj5pprsZMLFV2SjPObdAk2MzNVehnsvVPBFJxOjyNGHJ5RTBddYS1GgZvCkyOoHCxEJ8MVLeAhqGppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008336; c=relaxed/simple;
	bh=G4mOwyHz0Ufcl+OeuXCySYD2zUfrq8NGR7mKwb8DnUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCXWsHsBE6hIara3P/Flbv8G0uzvVKbf/oZdh4YAsfcxfgCsxJQdfT7rDkcLhBwCGo7AI9L/Bq0g3Ln6JpI/5LKIFGo2aeXXSCaPqqfSsDXFk/xlWLrB5guIsPUYHd8y70/XtOImJMZf+bdnfGY/sVpO8fzWFbF0DseaVacP6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nc9Fqaru; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751008335; x=1782544335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4mOwyHz0Ufcl+OeuXCySYD2zUfrq8NGR7mKwb8DnUg=;
  b=nc9FqaruwNB+3HsNU6L7ynNzTS9u0u52dwUr+3nMTlFT79QTtF2uUyDp
   vxuncep1v6QIC6GhNIZPSf7g/PY3IDUUYIbrBlNNFdV9zmMVFLRshAx34
   96649FjqLuLBYvWMJGxEsSjlP32zcSO8dhNXTg6V/olKyKc86AqcSKSEi
   t/Z8tMhoh24HeZv61DdK7ht2ml8tcNhN8vP4q5hgkn6Qi7mpHNGcdE5eo
   I4pcNuQMZD5wP2ZRa270lcu97eVnzIOgst5UR/msSBDV5YvF0b0bXMBqN
   SBH7oCW0F6zQBhHht3SD2q6jWHy3uBNGqRjzmIYUzwV4jH/LhSRaavEck
   w==;
X-CSE-ConnectionGUID: tE+RytpBSM2V0NIFYKpbHQ==
X-CSE-MsgGUID: VPslDMenT7+uuGBnIJ5OLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="56996198"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="56996198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:12:14 -0700
X-CSE-ConnectionGUID: KchA0Tf3TxKgEmZCbyWH5g==
X-CSE-MsgGUID: Lg5qjUVjSkSa4RObSZorFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="158211927"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:12:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 65BB912072E;
	Fri, 27 Jun 2025 10:12:04 +0300 (EEST)
Date: Fri, 27 Jun 2025 07:12:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, stanislaw.gruszka@linux.intel.com,
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
Message-ID: <aF5ERIaLioVAzjZm@kekkonen.localdomain>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>

Hi Mehdi,

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

Missing leading dot. You could also rewrap this paragraph, using longer
lines up to 75 characters.

If there's not going to be further versions of the patch, I'll just rewrap
this while applying.

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
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	of_node = is_of_node(dev_fwnode(dev));
> +
> +	if (clk) {
> +		if (!ret && !of_node) {
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
> +	if (PTR_ERR(clk) == -EPROBE_DEFER)
> +		return ERR_PTR(-EPROBE_DEFER);
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

Sakari Ailus

