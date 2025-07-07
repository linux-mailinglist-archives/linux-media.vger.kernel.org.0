Return-Path: <linux-media+bounces-37025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776DAFB632
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EA097B3E92
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721E12DFA24;
	Mon,  7 Jul 2025 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFQW9Ymy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23F2DECCB
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898651; cv=none; b=jN0+Co4zbqG5Tz1UTqAlRfDYqmTpKF22fqr62HPUUJRLKzoJkIteK1yZsPen+0r3/Yu9p0LeCSFH7wQUePkSPuFRztJLKgKJUzOpT4AVo5say1ZiLnL5Cw7uLBzQsLuu9lWhmNSST/H1JIbun/h4uI5FKyykod9zTgG6THKGpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898651; c=relaxed/simple;
	bh=8oujB0qUspYTzr5p8EZvGcBoDnDr0roUETf3vaNlf3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XObRuL6/ThCcc1sbvNl6lLEVI4gIg3RyARm4pSfhHD6OYGLY+Q88k5sp1ZNCxXPfnbeFigj7SdrgT8Y5haFF8wRvl60s2fLdAE45+QlIX9v4Q92AkF/H/SjuUBCI1ijXdafzog0eaAdUb3Dj8xJjeziY8u/4ViiA8gLpMB9gf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFQW9Ymy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751898651; x=1783434651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8oujB0qUspYTzr5p8EZvGcBoDnDr0roUETf3vaNlf3A=;
  b=XFQW9YmydLZ7rmiaErOdmgsACqC6wPM2Utd7+mBABxanuI3Fdm9vcgSs
   AtQ0LfUffXDTh90r+RFbgsVJ0DcGFMbo45DIZumy8/g0S91ErgJ2Md2ON
   NbpKp+8KQxb9z33ral7rPfZBnU2PNb8o9/JCm64ZWlYY4GPVORHRRQL6r
   TXR4C1OPMW48UDE+VjIMunQDzW22sLCgXbTypW7qzy9xFz5velFM9o7AA
   nn1AieRiSeeMnVj7nOtOCmDCmw6Nz5BUxYqdLgwQbY+1jeJhm0kV0lzbn
   t2WieRzdYTBjv/uTestlUo9cV7hHI7MfjlvfN0M13i/eHCbiP7CxzAuNE
   g==;
X-CSE-ConnectionGUID: hq99L46ARg2L1eUVogCmQw==
X-CSE-MsgGUID: c3VvLjVTSzmNtlPapJaecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53979523"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="53979523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 07:30:50 -0700
X-CSE-ConnectionGUID: /3kX83mCQBGghL/e5n+x+Q==
X-CSE-MsgGUID: tR8IRcEWQM6rsHzu/kQyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="154961483"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.123])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 07:30:42 -0700
Date: Mon, 7 Jul 2025 16:30:34 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com, 
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com, 
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com, hansg@kernel.org, 
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, kieran.bingham@ideasonboard.com, 
	khalasa@piap.pl, mani@kernel.org, m.felsch@pengutronix.de, 
	matthias.fend@emfend.at, mchehab@kernel.org, michael.riesch@collabora.com, 
	naush@raspberrypi.com, nicholas@rothemail.net, nicolas.dufresne@collabora.com, 
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com, pavel@kernel.org, 
	rashanmu@gmail.com, ribalda@chromium.org, slongerbeam@gmail.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, linux-media@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <kobm27v4vkwj7akssxll57yybkfbwfk3vakhweub5e6tl6otkc@qtl2dgd2xei2>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <20250706003027.GA30859@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706003027.GA30859@pendragon.ideasonboard.com>

Hi Laurent,

Thank you for the review!

On Sun, Jul 06, 2025 at 03:30:27AM +0300, Laurent Pinchart wrote:
> Hi Mehdi,
> 
> One more comment.
> 
> On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > This helper behaves the same as devm_clk_get() except where there is
> > no clock producer like in ACPI-based platforms.
> > 
> > For ACPI-based platforms the function will read the "clock-frequency"
> > ACPI _DSD property and register a fixed frequency clock with the frequency
> > indicated in the property.
> > 
> > This function also handles the special ACPI-based system case where:
> > The clock-frequency _DSD property is present.
> > A reference to the clock producer is present, where the clock is provided
> > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > In this case try to set the clock-frequency value to the provided clock.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> >  include/media/v4l2-common.h           | 27 ++++++++++++++
> >  2 files changed, 79 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index bd160a8c9efe..ac98895b0394 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -34,6 +34,9 @@
> >   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
> >   */
> >  
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/module.h>
> >  #include <linux/types.h>
> >  #include <linux/kernel.h>
> > @@ -673,3 +676,52 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> > +
> > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > +{
> > +	const char *clk_id __free(kfree) = NULL;
> > +	struct clk_hw *clk_hw;
> > +	struct clk *clk;
> > +	bool of_node;
> > +	u32 rate;
> > +	int ret;
> > +
> > +	clk = devm_clk_get_optional(dev, id);
> 
> Shouldn't your return here if there's an error ?
> 
> 	if (IS_ERR(clk))
> 		return clk;
> 
> because ...
> 
> > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > +	of_node = is_of_node(dev_fwnode(dev));
> > +
> > +	if (clk) {
> > +		if (!ret && !of_node) {
> > +			ret = clk_set_rate(clk, rate);
> 
> ... here clk_set_rate() will dereference clk and crash if it's an error
> pointer ...
> 

Ack.

> > +			if (ret) {
> > +				dev_err(dev, "Failed to set clock rate: %u\n",
> > +					rate);
> > +				return ERR_PTR(ret);
> > +			}
> > +		}
> > +		return clk;
> > +	}
> > +
> > +	if (PTR_ERR(clk) == -EPROBE_DEFER)
> > +		return ERR_PTR(-EPROBE_DEFER);
> 
> ... and this will never be reached.
> 

Ack.

> > +
> > +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	if (ret)
> > +		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
> > +
> > +	if (!id) {
> > +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> > +		if (!clk_id)
> > +			return ERR_PTR(-ENOMEM);
> > +		id = clk_id;
> > +	}
> > +
> > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > +	if (IS_ERR(clk_hw))
> > +		return ERR_CAST(clk_hw);
> > +
> > +	return clk_hw->clk;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..1c79ca4d5c73 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> >  struct v4l2_device;
> >  struct v4l2_subdev;
> >  struct v4l2_subdev_ops;
> > +struct clk;
> 
> Please keep forward declarations sorted.
> 
> You don't need to resubmit the whole series for this, but it would be
> useful if you could retest it, and then send a new version of just this
> patch.

You are totally right about the comment.

@Sakari: I will send the patch as a reply to this, I went ahead and
added the missing leading dots you mentioned in your reply. Tell me if
this okay for you when you pick up the patches or should I send you the
complete v3 ?

--
Kind Regards
Mehdi Djait

