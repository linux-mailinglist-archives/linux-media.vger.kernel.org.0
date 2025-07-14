Return-Path: <linux-media+bounces-37607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF068B03F0B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EDB016F9EE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 12:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F8A248F74;
	Mon, 14 Jul 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP0mqd/5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559FE1C3BE0
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752497704; cv=none; b=suyomq5wv0ob5/ucQYcqufpzrzk+KbhFors4BzkIPqDSMZYPm6L69R6OnHYnfU2NI7P/gQzqvkODUDZ1FCCOSWiZDFh5bIxprmZS8N9gID4n0JGp8bBS2PNXGZKiprnNhXzVGD/J4p/CFZVGUrRoAhiLYyOT1vKgDYvgkvbfh5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752497704; c=relaxed/simple;
	bh=MgezkHBreeOiU8tHS22m/LQ8JiemjuHZqR4ad6bPxpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiutMmeiKSushofI2d0FQIDMWRnVjodTjX5j93kxTS1f1BvdjR1gmP0pIhs4KMK2PrptiOSHYWEg4+LG8Rs2rzi/GYALokY3fx6P4FAvehTIYsxPP/Q+Gd+lIrQPonPcsC+XSqixdnQ19AiXXWYht5V0oXL8DKcnUBTMRRgYX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP0mqd/5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752497703; x=1784033703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgezkHBreeOiU8tHS22m/LQ8JiemjuHZqR4ad6bPxpk=;
  b=QP0mqd/5kfxCCOHg2UfLWuYxS5jSbob8yaNAcUV6zvnAFNQTZoEBM9xl
   9HI6lKFSvhaTSpkCjJSciNCa2aR+RdLxCxS+JVsCJAQNk242S+5Jt0KFW
   qT6Kui6RaL22ubhE7t8ri3Bk6gq+H9da+3e/uPZyViH9bvZQiDmbtyJBl
   mwIcgnTk5sIc5xQEXXupqvbKAoqD9fWuT34QOCk23t3jxigKJA71CdAzC
   euAbMelzcmSGoRtswNLn3p6D5xykLYUhuHAcT2aLWhqY+NfULIz56EUsB
   yZkGeJFe1IGXwTmjNePfYuora0zg76SIaODzWO413Gs4N7nv4Lr4V5Z6s
   A==;
X-CSE-ConnectionGUID: AUPuQ+xvQoijQ6OVg3Ow6A==
X-CSE-MsgGUID: o925KuCMRr6EQTZSJYFKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54815295"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54815295"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 05:55:02 -0700
X-CSE-ConnectionGUID: nxgUNovIRaqNze7vBJmMag==
X-CSE-MsgGUID: 9pAiwTvESzqvSL4uPyJjfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156345818"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.75])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 05:55:01 -0700
Date: Mon, 14 Jul 2025 14:54:52 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Matthew Majewski <mattwmajewski@gmail.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 55/72] media: v4l2-common: Add legacy camera sensor clock
 helper
Message-ID: <uidbgwyn7b47zathqq7qdl3iygppvjwzfsytbjmud62csuy2ht@lxa6tgz4w3pc>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-56-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-56-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thank you for the patches!

On Thu, Jul 10, 2025 at 08:47:51PM +0300, Laurent Pinchart wrote:
> The recently introduced devm_v4l2_sensor_clk_get() helper aims at
> simplifying sensor drivers by centralizing clock handling code, as well
> as reducing cargo-cult and deprecated behaviour.
> 
> A set of drivers implement external clock handling in a non-standard
> way. This can't be changed as there is a high risk of breaking existing
> platforms, but keeping the code as-is creates a risk of new drivers
> copying deprecated behaviour.
> 
> To fix this, introduce a new devm_v4l2_sensor_clk_get_legacy() helper
> and use it in those driver. Compared to devm_v4l2_sensor_clk_get(), the
> new helper takes the "clock-frequency" property into account and sets
> the external clock rate on OF platforms, and adds the ability to specify
> a fixed default or fallback clock rate in case the "clock-frequency"
> property is not present.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++------
>  include/media/v4l2-common.h           | 41 ++++++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index cfc78ea6276c..6f140a78e683 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -703,24 +703,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
>  
> -struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
> +				       bool legacy, bool fixed_rate,
> +				       unsigned long clk_rate)
>  {
> +	bool of_node = is_of_node(dev_fwnode(dev));
>  	const char *clk_id __free(kfree) = NULL;
>  	struct clk_hw *clk_hw;
>  	struct clk *clk;
> -	bool of_node;
> -	u32 rate;
> -	int ret;
> +	u32 rate = clk_rate;

[..]

> +	int ret = 0;
>  
>  	clk = devm_clk_get_optional(dev, id);
>  	if (IS_ERR(clk))
>  		return clk;
>  
> -	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -	of_node = is_of_node(dev_fwnode(dev));
> +	/*
> +	 * If the caller didn't request a fixed rate, retrieve it from the
> +	 * clock-frequency property. -EINVAL indicates the property is absent,
> +	 * and is not a failure. Other errors, or success with a clock-frequency
> +	 * value of 0, are hard failures.
> +	 */
> +	if (!fixed_rate || !clk_rate) {
> +		ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +		if (ret != -EINVAL || !rate)

[..]

Let's take the case of camera sensor on a DT-system:

it will call the following:
devm_v4l2_sensor_clk_get(dev, NULL);
-> __devm_v4l2_sensor_clk_get(dev, id, false, false, 0);
--> with fixed_rate = 0 and clk_rate = 0 which will be assigned to
u32 rate

so it will go into the if statement and try to read the
"clock-frequency" property, which does not exist.

ret from device_property_read_u32() is -EINVAL and that is handled but
rate will still be 0 so we will return ERR_PTR(-EINVAL)

> +			return ERR_PTR(-EINVAL);
> +	}
>  
>  	if (clk) {
> -		if (!ret && !of_node) {
> +		/*
> +		 * On non-OF platforms, or when legacy behaviour is requested,
> +		 * set the clock rate if a rate has been specified by the caller
> +		 * of by the clock-frequency property.
		   |
nit:		   +-> or ? 

> +		 */
> +		if (rate && (!of_node || legacy)) {
>  			ret = clk_set_rate(clk, rate);
>  			if (ret) {
>  				dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -731,9 +747,14 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>  		return clk;
>  	}
>  
> -	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
> +	/*
> +	 * Register a dummy fixed clock on non-OF platforms or when legacy
> +	 * behaviour is requested. This required the common clock framework.
> +	 */
> +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || (of_node && !legacy))
>  		return ERR_PTR(-ENOENT);
>  
> +	/* We need a rate to create a clock. */
>  	if (ret)
>  		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
>  
> @@ -750,4 +771,4 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>  
>  	return clk_hw->clk;
>  }
> -EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> +EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);

--
Kind Regards
Mehdi Djait

