Return-Path: <linux-media+bounces-28558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F1A6B88A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 11:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1EDF19C29DF
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8A11F4E57;
	Fri, 21 Mar 2025 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O45aUPQd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8EE1D514A;
	Fri, 21 Mar 2025 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551912; cv=none; b=Qd6q4320lrOwg9hsiLDZiIo6jd2FRPTHYi4k7UrrFCah7nVWRH5rrrfezOa+38NSQ9N+qrdVQ+bUB6lBkge2l/XXoHjKvTbtM4tX4TZife8q9THMq/bhfMIJ5gBy/v4o4hyRnRf0RNje8cBNh2KQQrSnfYSkL56nBRsTinSRZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551912; c=relaxed/simple;
	bh=u1fDJwY0KnI6T+SKP6FXZkOthu+525MlJxD6jg0kFto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0EZf2Kx6xRRSsqV7u0Hy1HOYSMIVnRwvAqFYQnFoj2b+fHalGDqopQYwcbmuBRADK6uRV84Hv9dyG1y7D/sqGKPLZ2C4HHOr5ivMjknbPIBhALbMXD62HxAJDgD0pVERkAnWBGDD2wQ8G6ItQM7bbuMLA/1pVfsiGiIVhH/iH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O45aUPQd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B13CF9FF;
	Fri, 21 Mar 2025 11:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742551803;
	bh=u1fDJwY0KnI6T+SKP6FXZkOthu+525MlJxD6jg0kFto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O45aUPQdey0sMF5N+2Cvyk1zrAxrpuoRSwVbiDWD3x0C5+cgypu285DzgMK0zNN+O
	 W+Bek55zTjtOOIsc18Y6AZd2D/IpzUQ6i1vCZ4blsHPi/Yth2HMC0uJ80TaOBRU8CF
	 YyzQ8vCkCCWmVJRMsl6GR4zZoRgTwluqie+cc+eQ=
Date: Fri, 21 Mar 2025 12:11:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250321101124.GB25483@pendragon.ideasonboard.com>
References: <20250321093814.18159-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093814.18159-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

Thank you for the patch.

On Fri, Mar 21, 2025 at 10:38:14AM +0100, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like in ACPI-based platforms.
> 
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequency
> indicated in the property.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
> Link for discussion (where this patch was proposed): https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/
> 
> v1 -> v2:
> Suggested by Sakari:
>     - removed clk_name
>     - removed the IS_ERR() check
>     - improved the kernel-doc comment and commit msg
> Link for v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com
> 
> v2 -> v3:
> - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> 
>  drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 18 +++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..4e30f8b777b7 100644
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
> @@ -636,3 +639,39 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);
> +	if (clk)
> +		return clk;
> +
> +#ifdef CONFIG_COMMON_CLK

This patch will cause warnings when CONFIG_COMMON_CLK is disabled. Could
you use

	if (IS_REACHABLE(CONFIG_COMMON_CLK)) {
		...
	}

instead ? It will also ensure that all code gets compile-tested, even
when CONFIG_COMMON_CLK is disabled ?

If you want to minimize implementation, you could write

	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
		return ERR_PTR(-ENOENT);

and keep the code below as-is.

> +	if (!is_acpi_node(dev_fwnode(dev)))
> +		return ERR_PTR(-ENOENT);
> +
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!id) {
> +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));

As far as I understand, the name doesn't need to stay valid after
devm_clk_hw_register_fixed_rate() returns. You can call kasprintf here,
and call kfree after devm_clk_hw_register_fixed_rate(). You could use
__free to manage the memory life time:

	const char *clk_id __free(kfree) = NULL;

	if (!id) {
		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
		if (!clk_id)
			return ERR_PTR(-ENOMEM);
		id = clk_id;
	}

> +		if (!id)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
> +#else
> +	return ERR_PTR(-ENOENT);
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..35b9ac698e8a 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -573,6 +573,24 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
> + * is no clock producer like in ACPI-based platforms.
> + * For ACPI-based platforms, the function will read the "clock-frequency"
> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> + * in the property.
> + *
> + * Return:
> + * * pointer to a struct clk on success or an error code on failure.
> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*

-- 
Regards,

Laurent Pinchart

