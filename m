Return-Path: <linux-media+bounces-27835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27DA56719
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 12:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E3717760D
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A9821859F;
	Fri,  7 Mar 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSIu15jh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9C217736;
	Fri,  7 Mar 2025 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348326; cv=none; b=coljCTjyqCihBTCBixVdswmueb0nxS9yfsRfwKAAmE27ciuQfUQcufxbvqYr1hZSHWYevJSgToFF+AM1zqNHWfA1wsAlId/MiSrPWUYBCBE8HWN5D/Kua9zWR95i5ZD3QcJOpcWApqZYtjz7+H6rOdmf8EbejMzQKk76mMuL2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348326; c=relaxed/simple;
	bh=W3+ni5MUCvKj/Ze1tjwgOIkkeuMSsjuc55EEWApFOiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpekhJgaMNKwPeOSgS33s44YVFb/I/z/YK0tiBe7nce/4tyG2otcEQ4gGDM8yTxiRXADqXO4yivoTKLgwUFDb8ygROTGEqiR8uOdkTFtbit7d7r4a9Pjj6ENaAHPDq9Yy/5fyTjkuEI4XPH4CyZ6C0lk/Kh+22NAnLfm78H3MUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSIu15jh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741348325; x=1772884325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W3+ni5MUCvKj/Ze1tjwgOIkkeuMSsjuc55EEWApFOiw=;
  b=bSIu15jhz7G5mji9OIx2iAJKp7TIbRDpf2Moy09wI6Swtg4HrqLJaSPh
   o2zhQeAWmrJ9NCZCJ0PgJURm6KWpHK5BHrJqBfbMBdgOix9ObAcCbwcP5
   T86dViaiL2NrkIJrLKrORC5ZvljEZ0ZvSWpAXeA3p5+1jy5YNODQlVBST
   fMtZn1E8ggoJo7Hk/mDgvxps73eTmvbv8w/DjVknJUsfxy4sSaVWb4dDR
   T//mhClUoBowQJ9UBNUzkFse4FXUz8xcq7xBWrN1V43XizlG0zq7L2At9
   hIr4OQN87c9iOd5kYKwOBZPv+n5m5ufjaqHl0dcJ81sSQkIZ0W0m8cqNu
   g==;
X-CSE-ConnectionGUID: qsJCeXUaT5q6LSjB9T8ydQ==
X-CSE-MsgGUID: rMGrYzOmSlKGZQLKD8aOvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46048914"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="46048914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:52:05 -0800
X-CSE-ConnectionGUID: Qb6o41uBQg6bm64DhtCbVA==
X-CSE-MsgGUID: wb4lO8l+RHiqgj+xxQprow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124526097"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:52:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C4C2811F9DA;
	Fri,  7 Mar 2025 13:51:58 +0200 (EET)
Date: Fri, 7 Mar 2025 11:51:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <Z8rd3ipjkbaE4zfc@kekkonen.localdomain>
References: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227092643.113939-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

On Thu, Feb 27, 2025 at 10:26:43AM +0100, Mehdi Djait wrote:
> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like typically in ACPI-based platforms.
> For ACPI-based platforms the function will read the "clock-frequency"
> property (_DSD ACPI property) and register a fixed frequency clock with
> the frequency indicated in the property.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 38 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 19 ++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..308a13536ac3 100644
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
> @@ -636,3 +639,38 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	char *clk_name;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);
> +	if (clk || IS_ERR(clk))
> +		return clk;
> +
> +	if (!is_acpi_node(dev_fwnode(dev)))
> +		return ERR_PTR(-EINVAL);
> +
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!id) {
> +		clk_name = devm_kasprintf(dev, GFP_KERNEL, "clk-%s",
> +					  dev_name(dev));

You could just assign to "id" and omit clk_name altogether.

> +		if (!clk_name)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id ? id : clk_name, NULL,
> +						 0, rate);
> +	if (IS_ERR(clk_hw))
> +		return ERR_CAST(clk_hw);
> +
> +	return clk_hw->clk;
> +}
> +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 63ad36f04f72..6446575b2a75 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -573,6 +573,25 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
> + * property (_DSD ACPI property) and register a fixed-clock with the frequency

s/property (_DSD ACPI property)/ACPI _DSD property/

> + * indicated in the property.
> + *
> + * Return:
> + * * %pointer to a struct clk: Success
> + * * %valid IS_ERR() condition containing errno: Failure

% should precede a value, but neither is describing a value here. How
about:

Return:
A pointer to a struct clk on success or an error code on failure.

> + */
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*

-- 
Kind regards,

Sakari Ailus

