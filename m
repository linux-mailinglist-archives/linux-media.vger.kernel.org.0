Return-Path: <linux-media+bounces-32565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C4AB824F
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746844C55F9
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E31295DB5;
	Thu, 15 May 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUZiF7wh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30B928F946;
	Thu, 15 May 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300670; cv=none; b=tntH8WQecrl121pDZrWjgOuKNU9yjgs8T3ffW4q0RKyFagumQDZHlv+AUR8+Y7Qnvths+IR+xKw5ckHaB9U94Vvpzm/bWcy169D6OS5HGCTIvrIRHI0veEQ7hk+DCiTbdgTW/dxdPHaYKhkPxCzrTj50Xk6SN4J3/RBajb8R4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300670; c=relaxed/simple;
	bh=VoBuvvaTggt88pD7cLcxjXVZ1+vn0MjJRMAsFFfswOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PndH7MBFLUZGaKBomJaAp8NQCnBLZQMYiNlCzsihxvdXPP4eKF+o63qcU47qhxBQ4XN6iuWrJLzUIS2fhGxnLKA/z+2HIEP1d075LNqY0w011zVGJdUbXTxVr33WDAqr2ETOWW4uwF7yoFkerd+MaCZj0J7q0+MGWtvXQMgiH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUZiF7wh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747300669; x=1778836669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VoBuvvaTggt88pD7cLcxjXVZ1+vn0MjJRMAsFFfswOs=;
  b=kUZiF7wheL2RqPSjS/sAxw2Iss9+tf/a5Ygs5wJekd+JsmgyR0+/5Ti9
   IGKAhyn54B1WIPLHzlq8746f9IbQToqrpjBRZI+VcnKIlBGAw9KM5NNL5
   +n5x/Mpy+X4ugEq1GbKywJdY4v2QqAI4HJ6M0F8B4ggcabT0W3+5w7ALX
   +a2UdgBfyHIw0NRb8qBch1UnlYYo8Lp6QEOXdkDmP3lacrWTpfV3reduv
   PqnzqS8S3Y3sl/OfYFt67fx3YbK6u6synf3c9tcwBSuzKXfQAhja3ehjh
   dyURpC+UfKcUFoFk2c/XMZ2yOM1giXy17XH+wmRlOQHa9uaRWIPuGAVNt
   g==;
X-CSE-ConnectionGUID: 78hNJraSSP6cR28byC+v5Q==
X-CSE-MsgGUID: vMUnyG//RZW30tL5zSw2+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48477377"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48477377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 02:17:48 -0700
X-CSE-ConnectionGUID: q9JTUy0kTPqTg+cAcpx97g==
X-CSE-MsgGUID: BqZ2l4BkRA+EEqzfRq836A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138193263"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.201])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 02:17:44 -0700
Date: Thu, 15 May 2025 11:17:37 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, sakari.ailus@linux.intel.com, 
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, 
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com, mchehab@kernel.org, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515084403.GQ23592@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > platforms to retrieve a reference to the clock producer from firmware.
> > > 
> > > This helper behaves the same as clk_get_optional() except where there is
> > > no clock producer like in ACPI-based platforms.
> > > 
> > > For ACPI-based platforms the function will read the "clock-frequency"
> > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > indicated in the property.
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > This certainly looks quite useful, thank you for working
> > on this.
> > 
> > Note on some IPU3 platforms where the clk is provided by
> > a clk-generator which is part of a special sensor-PMIC
> > the situation is a bit more complicated.
> > 
> > Basically if there is both a clk provider and a clock-frequency
> > property then the clock-frequency value should be set as freq
> > to the clk-provider, see:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > 
> > for an example of a driver which handles this case.
> 
> On a side note, the DT bindings for the OV8865 doesn't specify the
> clock-frequency property...
> 

Is this wrong ?

The OV8865 driver was introduced for DT-based systems, where you will
get a reference to the "struct clk corresponding to the clock producer"
and then get the clock-rate/frequency with a call to:

	rate = clk_get_rate(sensor->extclk);

The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
adding support for clock-frequency came later to support ACPI-based
systems (IPU3 here)

> > IMHO it would be good if the generic helper would handle
> > this case too and if there is both a clk-provider and
> > a clock-frequency property then try to set the clock-frequency
> > value with clk_set_rate(), arguably you could just warn on
> > a failure to set the rate though, instead of the error
> > the ov8865 driver currently throws.
> > 
> > Sakari, Laurent any opinions on adding handling this case
> > to the generic helper ?
> 
> We really need to standardize the clock-frequency property, and document
> it accordingly. Some drivers use it to set the external clock rate,
> while others use it to inform themselves about the clock rate, without
> changing it, for platforms that have no CCF clock providers. Some
> drivers also set the clock rate to a fixed value, or to a value that
> depends on the link frequency selected by userspace. I don't like this
> situation much.
> 
> > > ---
> > > v1 -> v2:
> > > Suggested by Sakari:
> > >     - removed clk_name
> > >     - removed the IS_ERR() check
> > >     - improved the kernel-doc comment and commit msg
> > > Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com
> > > 
> > > v2 -> v3:
> > > - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> > > Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/
> > > 
> > > v3 -> v4:
> > > Suggested by Laurent:
> > > 	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
> > > 	- changed to kasprintf() to allocate the clk name when id is NULL and
> > > 	  used the __free(kfree) scope-based cleanup helper when
> > > 	  defining the variable to hold the allocated name
> > > Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/
> > > 
> > > 
> > >  drivers/media/v4l2-core/v4l2-common.c | 40 +++++++++++++++++++++++++++
> > >  include/media/v4l2-common.h           | 18 ++++++++++++
> > >  2 files changed, 58 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index 0a2f4f0d0a07..b33152e2c3af 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -34,6 +34,9 @@
> > >   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
> > >   */
> > >  
> > > +#include <linux/clk.h>
> > > +#include <linux/clkdev.h>
> > > +#include <linux/clk-provider.h>
> > >  #include <linux/module.h>
> > >  #include <linux/types.h>
> > >  #include <linux/kernel.h>
> > > @@ -636,3 +639,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > >  	return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> > > +
> > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > +{
> > > +	const char *clk_id __free(kfree) = NULL;
> > > +	struct clk_hw *clk_hw;
> > > +	struct clk *clk;
> > > +	u32 rate;
> > > +	int ret;
> > > +
> > > +	clk = devm_clk_get_optional(dev, id);
> > > +	if (clk)
> > > +		return clk;
> > > +
> > > +	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> > > +		return ERR_PTR(-ENOENT);
> > > +
> > > +	if (!is_acpi_node(dev_fwnode(dev)))
> > > +		return ERR_PTR(-ENOENT);
> > > +
> > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	if (!id) {
> > > +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> > > +		if (!clk_id)
> > > +			return ERR_PTR(-ENOMEM);
> > > +		id = clk_id;
> > > +	}
> > > +
> > > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > > +	if (IS_ERR(clk_hw))
> > > +		return ERR_CAST(clk_hw);
> > > +
> > > +	return clk_hw->clk;
> > > +}
> > > +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index 63ad36f04f72..35b9ac698e8a 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -573,6 +573,24 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > >  			     unsigned int num_of_driver_link_freqs,
> > >  			     unsigned long *bitmap);
> > >  
> > > +/**
> > > + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to an optional clock
> > > + *			      producer for a camera sensor.
> > > + *
> > > + * @dev: device for v4l2 sensor clock "consumer"
> > > + * @id: clock consumer ID
> > > + *
> > > + * This function behaves the same way as clk_get_optional() except where there
> > > + * is no clock producer like in ACPI-based platforms.
> > > + * For ACPI-based platforms, the function will read the "clock-frequency"
> > > + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> > > + * in the property.
> > > + *
> > > + * Return:
> > > + * * pointer to a struct clk on success or an error code on failure.
> > > + */
> > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> > > +
> > >  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
> > >  {
> > >  	/*
> 
> -- 
> Regards,
> 
> Laurent Pinchart

--
Kind Regards
Mehdi Djait

