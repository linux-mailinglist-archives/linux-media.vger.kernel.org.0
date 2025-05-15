Return-Path: <linux-media+bounces-32590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8548AB8699
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 14:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4302E17CD38
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 12:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905D3299A84;
	Thu, 15 May 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hxCEZUW6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E5299927;
	Thu, 15 May 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312864; cv=none; b=P2RhFKgcs5viuVSoOWPXShkz5OV9/Xim/UpCQF+uZnpgvHJGgiagSBLMTbJg3HP1rTj/QM3e1KOnra/NbJ/39l7At8EAZjEluhnhcj0VlF1wAptnsTXyGLlGs63u/2/WmbJC53y/GSBMCBHj8M93W+mwM+xWD2XczMx6LPu6fzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312864; c=relaxed/simple;
	bh=3T0xW/Palmd6d3QVa6l03mYqggerddll7QaGqrYkVjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+ZdUCTB1UmM1TvWm8ZqWXYEpqwlCUjYvRXH4pwBEpYyaRpi//6EOYJdrdLP7ndARYAG412Jtn0LEIKLzpCt6DK9GU1FaKx/wyKsEZXLqkSYL3B3ZUcN/OB8ynqZpWA+o8ac6I+1G01vmWv4krAiBOjempJKimDapvYpkJApvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hxCEZUW6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-100-182-nat.elisa-mobile.fi [85.76.100.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C63F836;
	Thu, 15 May 2025 14:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747312842;
	bh=3T0xW/Palmd6d3QVa6l03mYqggerddll7QaGqrYkVjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxCEZUW67EUR9e/VlF1itr+8qu4iihHjZiTQ59FY+1cfsGv/GfK0hmvm1YX/4K25D
	 BGSA726FcmI/WV6xbCSer3QaUrk93pS79Ti2cujUq9uiBNsc5JF5pJPcG6qyq8OT6f
	 7hy68aMZT0zxgTj+dAxpN4/hSCtWqe5XCqSrpQTE=
Date: Thu, 15 May 2025 14:40:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250515124050.GA12492@pendragon.ideasonboard.com>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>

On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > 
> > > > This helper behaves the same as clk_get_optional() except where there is
> > > > no clock producer like in ACPI-based platforms.
> > > > 
> > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > indicated in the property.
> > > > 
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > 
> > > This certainly looks quite useful, thank you for working
> > > on this.
> > > 
> > > Note on some IPU3 platforms where the clk is provided by
> > > a clk-generator which is part of a special sensor-PMIC
> > > the situation is a bit more complicated.
> > > 
> > > Basically if there is both a clk provider and a clock-frequency
> > > property then the clock-frequency value should be set as freq
> > > to the clk-provider, see:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > 
> > > for an example of a driver which handles this case.
> > 
> > On a side note, the DT bindings for the OV8865 doesn't specify the
> > clock-frequency property...
> 
> Is this wrong ?
> 
> The OV8865 driver was introduced for DT-based systems, where you will
> get a reference to the "struct clk corresponding to the clock producer"
> and then get the clock-rate/frequency with a call to:
> 
> 	rate = clk_get_rate(sensor->extclk);
> 
> The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> adding support for clock-frequency came later to support ACPI-based
> systems (IPU3 here)

I'd expect all device properties to be documented in DT bindings. Is
that an incorrect assumption ?

> > > IMHO it would be good if the generic helper would handle
> > > this case too and if there is both a clk-provider and
> > > a clock-frequency property then try to set the clock-frequency
> > > value with clk_set_rate(), arguably you could just warn on
> > > a failure to set the rate though, instead of the error
> > > the ov8865 driver currently throws.
> > > 
> > > Sakari, Laurent any opinions on adding handling this case
> > > to the generic helper ?
> > 
> > We really need to standardize the clock-frequency property, and document
> > it accordingly. Some drivers use it to set the external clock rate,
> > while others use it to inform themselves about the clock rate, without
> > changing it, for platforms that have no CCF clock providers. Some
> > drivers also set the clock rate to a fixed value, or to a value that
> > depends on the link frequency selected by userspace. I don't like this
> > situation much.
> > 
> > > > ---
> > > > v1 -> v2:
> > > > Suggested by Sakari:
> > > >     - removed clk_name
> > > >     - removed the IS_ERR() check
> > > >     - improved the kernel-doc comment and commit msg
> > > > Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com
> > > > 
> > > > v2 -> v3:
> > > > - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> > > > Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/
> > > > 
> > > > v3 -> v4:
> > > > Suggested by Laurent:
> > > > 	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
> > > > 	- changed to kasprintf() to allocate the clk name when id is NULL and
> > > > 	  used the __free(kfree) scope-based cleanup helper when
> > > > 	  defining the variable to hold the allocated name
> > > > Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/
> > > > 
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-common.c | 40 +++++++++++++++++++++++++++
> > > >  include/media/v4l2-common.h           | 18 ++++++++++++
> > > >  2 files changed, 58 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > index 0a2f4f0d0a07..b33152e2c3af 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > @@ -34,6 +34,9 @@
> > > >   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
> > > >   */
> > > >  
> > > > +#include <linux/clk.h>
> > > > +#include <linux/clkdev.h>
> > > > +#include <linux/clk-provider.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/types.h>
> > > >  #include <linux/kernel.h>
> > > > @@ -636,3 +639,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > > >  	return 0;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> > > > +
> > > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > > +{
> > > > +	const char *clk_id __free(kfree) = NULL;
> > > > +	struct clk_hw *clk_hw;
> > > > +	struct clk *clk;
> > > > +	u32 rate;
> > > > +	int ret;
> > > > +
> > > > +	clk = devm_clk_get_optional(dev, id);
> > > > +	if (clk)
> > > > +		return clk;
> > > > +
> > > > +	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> > > > +		return ERR_PTR(-ENOENT);
> > > > +
> > > > +	if (!is_acpi_node(dev_fwnode(dev)))
> > > > +		return ERR_PTR(-ENOENT);
> > > > +
> > > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > > +
> > > > +	if (!id) {
> > > > +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> > > > +		if (!clk_id)
> > > > +			return ERR_PTR(-ENOMEM);
> > > > +		id = clk_id;
> > > > +	}
> > > > +
> > > > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > > > +	if (IS_ERR(clk_hw))
> > > > +		return ERR_CAST(clk_hw);
> > > > +
> > > > +	return clk_hw->clk;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > > index 63ad36f04f72..35b9ac698e8a 100644
> > > > --- a/include/media/v4l2-common.h
> > > > +++ b/include/media/v4l2-common.h
> > > > @@ -573,6 +573,24 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > > >  			     unsigned int num_of_driver_link_freqs,
> > > >  			     unsigned long *bitmap);
> > > >  
> > > > +/**
> > > > + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to an optional clock
> > > > + *			      producer for a camera sensor.
> > > > + *
> > > > + * @dev: device for v4l2 sensor clock "consumer"
> > > > + * @id: clock consumer ID
> > > > + *
> > > > + * This function behaves the same way as clk_get_optional() except where there
> > > > + * is no clock producer like in ACPI-based platforms.
> > > > + * For ACPI-based platforms, the function will read the "clock-frequency"
> > > > + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> > > > + * in the property.
> > > > + *
> > > > + * Return:
> > > > + * * pointer to a struct clk on success or an error code on failure.
> > > > + */
> > > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> > > > +
> > > >  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
> > > >  {
> > > >  	/*

-- 
Regards,

Laurent Pinchart

