Return-Path: <linux-media+bounces-32222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B312CAB23E2
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 14:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BEB04C3BD9
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 12:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02CE2586D5;
	Sat, 10 May 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fm87MaZr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CE219E4;
	Sat, 10 May 2025 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881770; cv=none; b=Anbvii1Lzf2sMYV/7lvHa6WXg90xIBONwcB/ApJuCQcXPsiV6s9DA9LGHodCObjySwiow4ZokX0PQZ7Bhz9jX5LWyF5b5vVUapV9B4lPKiq1BiuWu1RgJHWOqxur+R+vtQY+uASTnBGiFWANsjwY5dO+fHDCeDPaZweQ3puThec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881770; c=relaxed/simple;
	bh=eGXhWc4LMZvP6uULI0tq53w4eI/7N4b3BmO92mcL71s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpIr23gMnu3HAn3PK3Cn3HqyEgB20vno/tcSYrk4JvBoKyl8tWervOL/ik3NElzFaHQ4fI/Mu2k+KyGXGRquMhhzPSnO3psJG14tE/Ly3P7GQj9x9atAeIo2ptUrFP+yXvBva22g+2XSH58w/hfmyx5VtFEWW22Aqn+bgNzRyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fm87MaZr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746881769; x=1778417769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eGXhWc4LMZvP6uULI0tq53w4eI/7N4b3BmO92mcL71s=;
  b=fm87MaZrU4QDtrqijQH1jPCNfFYMviCFjiGBXtgtIa3z1maHjhEUf2t+
   vMNNCHIZGRtKHAlU8+8el1JOU5342UnRUJOnygSomcxCYRQvUEAz6V2n8
   5sG9VUekp9nka2Vm8uG70nlePdLtRjgTLrq/BBJPUrIh+jvcAdO6Mcmk3
   8exwrjk5x9U/xrlQJQ46fUSbEcVcJIjcUUWuPuBNQGH/pNR6szD9sL+5J
   xDsFw/OZJ+vdHDwms8uG8t7L8RZlBQ3jCu/TKDqfjNiLAL0h5S6DkB6iC
   07l2Fau8lYSZwo21Y7TiZtTS2n6ipEKEutW97V612DiyQPvQ0TIF95AG7
   Q==;
X-CSE-ConnectionGUID: otwaq+RFSNSRi6RssJ6HVw==
X-CSE-MsgGUID: YcBMDw7CRiyixb2KsGDvHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59340847"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="59340847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:56:08 -0700
X-CSE-ConnectionGUID: nnxKV96WQBml8ooeUlsasA==
X-CSE-MsgGUID: yswAqtIsSuqv3UZ+FORl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="160159403"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:56:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59AA81201BC;
	Sat, 10 May 2025 15:56:02 +0300 (EEST)
Date: Sat, 10 May 2025 12:56:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aB9M4jUsGA9YAkSm@kekkonen.localdomain>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310122305.209534-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

On Mon, Mar 10, 2025 at 01:23:05PM +0100, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like ACPI-based platforms.
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
>  drivers/media/v4l2-core/v4l2-common.c | 35 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 18 ++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..99d826acb213 100644
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
> @@ -636,3 +639,35 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
> +	if (!is_acpi_node(dev_fwnode(dev)))
> +		return ERR_PTR(-ENOENT);
> +
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!id) {
> +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> +		if (!id)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);

devm_clk_hw_register_fixed_rate() is only available when COMMON_CLK is
enabled. You need #ifdefs here. In practice without CCF only
devm_clk_get_optional() is useful I guess.

Another question is then how commonly COMMON_CLK is enabled e.g. on x86
systems. At least Debian kernel has it. Presumably it's common elsewhere,
too.

> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
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

Sakari Ailus

