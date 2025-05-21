Return-Path: <linux-media+bounces-33008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9FCABF220
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EAF13B700C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517D246B5;
	Wed, 21 May 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdQUd5Dl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79D25F99E;
	Wed, 21 May 2025 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824740; cv=none; b=Dj6qyaLSZ4oUO/P6C1CpLg2CuU7kn2XmI2m58mq6IbVZ/GbmExQp65/5xrlhP3I5HnfF2aDmDzV1WvCOhNaaDLU6xMeY/s7wFGRkb1c/OTzpqCUgldAMIsZoqZSJowkAFtnwtcBOxS493fc4lma4Z9Y+TDLxgA3U3LzwcDtqKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824740; c=relaxed/simple;
	bh=uSzAO8B/+bNOvLeGXhZjYJcoaTPl+F3Gl/UgRMIRJUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTV4p/yNXRw5h8ZX7PhhSGpze5VXLZniEptMQ1PLUdNoA/enwZ/dRStEDV4GOeeJ95w7jQ9tZw2sTmMojXjoIj55RLr88+cJvem0vbR94P4AtVqRT/O/HuW2uvabOlJNI7rVXU1n9kQWFbyMJYTs9KK3Whu8WdAIyUT5paXO0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdQUd5Dl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747824739; x=1779360739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uSzAO8B/+bNOvLeGXhZjYJcoaTPl+F3Gl/UgRMIRJUM=;
  b=GdQUd5Dlw4JXlzUgubQ9sgitYER7q+hYKA7s5oF28wyKaQo8E6gevPcE
   lPjd2dYacJf8Uwjv7bH4GoDqnh8QDxJcP53UfiOP4p8GklefH9C4HdwRR
   qLswGM7r9OZdSKztb1DKCptNisls+Vz0oG6OlyVWQS4u4FTohQ/OKhFmu
   rwzVWMUI73PDFg9DSUpWnFQxcIEVAkTLwmZVSkmkbXC38XdoPLi64G29A
   QerMkWFF28XPi2e7vgkoJjkytf1nlznRQ6Vcl98WbSuWmdLn53sARu0F9
   oK0Zc7J0PDC8YnmxINgTfsGYeSFdyYrXU8onUhBtyLSkKxi4tXOx3C7Fx
   g==;
X-CSE-ConnectionGUID: Ju9K5/tWTlSKRYQEjuzKdA==
X-CSE-MsgGUID: cmYZm0PUTzuWtfbAmCGNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60436482"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60436482"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:52:18 -0700
X-CSE-ConnectionGUID: 9JPFTNBpRniJedcaO9y3sg==
X-CSE-MsgGUID: I9ii5ppXSBO2zW1fJ9wc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139867885"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.231])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:52:15 -0700
Date: Wed, 21 May 2025 12:52:08 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, naush@raspberrypi.com, 
	mchehab@kernel.org, hdegoede@redhat.com, dave.stevenson@raspberrypi.com, 
	arnd@arndb.de, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <mwh7xx675kulx6tdebuvqtdjfa4ih3ehi2brrcdxfemfnvxsrs@i5nxkvfskfhe>
References: <20250521104115.176950-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521104115.176950-1-mehdi.djait@linux.intel.com>

Hi everyone,

On Wed, May 21, 2025 at 12:41:15PM +0200, Mehdi Djait wrote:
>  drivers/media/v4l2-core/v4l2-common.c | 46 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 25 +++++++++++++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 4ee4aa19efe6..6099acd339ad 100644
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
> @@ -665,3 +668,46 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> +
> +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	const char *clk_id __free(kfree) = NULL;
> +	struct clk_hw *clk_hw;
> +	struct clk *clk;
> +	u32 rate;
> +	int ret;
> +
> +	clk = devm_clk_get_optional(dev, id);
> +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +
> +	if (clk) {
> +		if (!ret) {
> +			ret = clk_set_rate(clk, rate);
> +			if (ret)
> +				dev_warn(dev, "Failed to set clock rate: %u\n",
> +					 rate);
> +		}
> +
> +		return clk;
> +	}
> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_acpi_node(dev_fwnode(dev)))
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

I sent this as an RFC because I am still unsure and need comments on two
things. After they are addressed, I plan to send a patch, documentation
patch (what Sakari proposed in the RFC V4 discussion) and convert the
camera sensors using devm_clk_get()

1. Should the case where both the clock and the clock-frequency are
present be reserved just for ACPI systems ? In other words if a DT
system provides both, should we also attempt to set the provided clock
rate ?

If the former makes more sense, maybe add this:

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6099acd339ad..3dfbbd699c67 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -674,14 +674,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
        const char *clk_id __free(kfree) = NULL;
        struct clk_hw *clk_hw;
        struct clk *clk;
+       bool acpi_node;
        u32 rate;
        int ret;
 
        clk = devm_clk_get_optional(dev, id);
        ret = device_property_read_u32(dev, "clock-frequency", &rate);
+       acpi_node = is_acpi_node(dev_fwnode(dev));
 
        if (clk) {
-               if (!ret) {
+               if (!ret && acpi_node) {
                        ret = clk_set_rate(clk, rate);
                        if (ret)
                                dev_warn(dev, "Failed to set clock rate: %u\n",
@@ -694,7 +696,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
        if (ret)
                return ERR_PTR(ret);
 
-       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_acpi_node(dev_fwnode(dev)))
+       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
                return ERR_PTR(-ENOENT);

2. Should we just warn when the clk_set_rate() fails or return err code
and exit ?

