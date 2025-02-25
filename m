Return-Path: <linux-media+bounces-26942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D8A43E0F
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBE53BEA83
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DDB267B89;
	Tue, 25 Feb 2025 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKA0802T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705A2661B5
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483814; cv=none; b=Ww0spuceugywKFUcIEJ0H0wihY3MAy6bx5IFn5mjqgvTRRTYfVFfEi75/M98MC0iwJlfd9s/4L29y6g8fHwtz3alsoeA/xBq94Lves51OnMLgT79uEiYzlEaBIC+SJLJ+AKxhgIszCvrK1G7eqtLSqcMhcAJUpn/A9A6qGOVHYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483814; c=relaxed/simple;
	bh=J1ZbQMcMHcaCu8SNRYSNVJuVOPQwVmM/o+v2wWAeMlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/WIoV/IMPeVYg8O+rDltOfV5uA8fvNsDWRbPn+vcDp7wx1A+pEogIpctBttToFrN3WJppib9/hOFv2xXlSe1wdZJLadGQbomjcCkOHUKTdMkRfQdWIm1yF+oNmpz2V4woHSv1attYtrBsXM3G2QlqFOm7FVZJd+VFin1Ady9/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKA0802T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740483811; x=1772019811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1ZbQMcMHcaCu8SNRYSNVJuVOPQwVmM/o+v2wWAeMlM=;
  b=HKA0802TimtJJNQrgFNeiiLw86PeT05PZ2/qKyBSnYOSVNkvyNpRsql0
   AfYBBGOTUGC8ItoOzD8ISBNqJi58jIRV5r2zUGJ98wKTAKqK796ZR+iul
   yz/2pQyCmvp6MRSWnl7WA23Ou31ucYOtvJ31VLlttOmgpDwUkTTX+3r/M
   zHHBts3RPfjFXhwHu2oZP9lRGK7+fofcU7SByidT2lIdWu9XqkUoHHlCp
   RSfBAjyRFFdn15uvpmN+s5tFIwe7SpmVCixzUyyURo9c07NifvZ+i/LRM
   feHESLzD0+9VeezzYoOdZC4nDMLmH61wImDhXQ6WZEd8vsImMMV23Y2wi
   w==;
X-CSE-ConnectionGUID: cPFwfrvTRFy4eXBZK5oBHg==
X-CSE-MsgGUID: OSLJj0pKSWWTeCSlhOETFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63748274"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="63748274"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:43:31 -0800
X-CSE-ConnectionGUID: O8q/Xq11Q66lZOKmtWrKQg==
X-CSE-MsgGUID: wJc44z4OSaS2NtJdioPckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116378537"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:43:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 755B111F944;
	Tue, 25 Feb 2025 13:43:27 +0200 (EET)
Date: Tue, 25 Feb 2025 11:43:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <Z72s30PkYqieAl7R@kekkonen.localdomain>
References: <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
 <20250224132536.GE25447@pendragon.ideasonboard.com>
 <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>
 <20250224161640.GA6778@pendragon.ideasonboard.com>
 <Z7yeP_sORqiVAh_Y@kekkonen.localdomain>
 <20250224163421.GB6778@pendragon.ideasonboard.com>
 <Z7ynKZOIaUQUZVHn@kekkonen.localdomain>
 <20250224181935.GC6778@pendragon.ideasonboard.com>
 <ntemjkhsm4cq6qbvs5bc55pjjdborq2mqotrghhpb2re3y5gg7@t6emagpijkn2>
 <rikg5bw4d3npkbtapscgmmv54xio2csalf7omiu7j6aictlzwm@fxhxjgfldzo4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rikg5bw4d3npkbtapscgmmv54xio2csalf7omiu7j6aictlzwm@fxhxjgfldzo4>

Hi Mehdi,

On Tue, Feb 25, 2025 at 12:11:30PM +0100, Mehdi Djait wrote:
> Hi everyone,
> 
> On Mon, Feb 24, 2025 at 07:28:26PM +0100, Mehdi Djait wrote:
> > Hi Laurent, Hi Sakari,
> > 
> > On Mon, Feb 24, 2025 at 08:19:35PM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 24, 2025 at 05:06:49PM +0000, Sakari Ailus wrote:
> > > > Hi Laurent,
> > > > 
> > > > On Mon, Feb 24, 2025 at 06:34:21PM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Feb 24, 2025 at 04:28:47PM +0000, Sakari Ailus wrote:
> > > > > > On Mon, Feb 24, 2025 at 06:16:40PM +0200, Laurent Pinchart wrote:
> > > > > > > On Mon, Feb 24, 2025 at 02:38:35PM +0000, Sakari Ailus wrote:
> > > > > > > > On Mon, Feb 24, 2025 at 03:25:36PM +0200, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Feb 24, 2025 at 12:49:48PM +0000, Sakari Ailus wrote:
> > > > > > > > > > On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> > > > > > > > > > > On 24/02/2025 13:54, Mehdi Djait wrote:
> > > > > > > > > > > > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > > > > > > > > > > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > > > > > > > > > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > > > > > > > > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > > > > > > > > > > > Make the clock producer reference lookup optional
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > > > > > > > > > > > property when no clock producer is available
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > > > > > > > > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > > > > > > > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > > > > > > > > > > > >   				     "failed to initialize CCI\n");
> > > > > > > > > > > > > > > >   	/* Get system clock (xclk) */
> > > > > > > > > > > > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > > > > > > > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > > > > > > > > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > > > > > > > > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > > > > > > > > > > > >   				     "failed to get xclk\n");
> > > > > > > > > > > > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > > > > > > +	if (imx219->xclk) {
> > > > > > > > > > > > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > > > > > > +	} else {
> > > > > > > > > > > > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > > > > > > > > > > > +					       "clock-frequency",
> > > > > > > > > > > > > > > > +					       &imx219->xclk_freq);
> > > > > > > > > > > > > > > > +		if (ret)
> > > > > > > > > > > > > > > > +			return dev_err_probe(dev, ret,
> > > > > > > > > > > > > > > > +					     "failed to get clock frequency");
> > > > > > > > > > > > > > > > +	}
> > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > > > > > > > > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > > > > > > > > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > > > > > > > > > > > or from the clock-frequency property as a fallback ?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Some drivers will also need to control the clock, so the clock should
> > > > > > > > > > > > > > > probably be returned too.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Yes, I saw that many sensor drivers have the same issue.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > > > > > > > > > > > Perhaps this is where the new helper could be located as well?
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > > > > > > > > > > > v4l2-common.c is more appropriate we can go with that.
> > > > > > > > > > > 
> > > > > > > > > > > I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> > > > > > > > > > > doesn't clock framework do this for us?
> > > > > > > > > > 
> > > > > > > > > > The "clock-frequency" isn't really specific to ACPI but it's used on some
> > > > > > > > > > boards with DT, too, that precede the current clock bindings. Clocks aren't
> > > > > > > > > > generally available to OS in ACPI either but the sensor drivers still need
> > > > > > > > > > them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
> > > > > > > > > > Imaging code deep down in the ACPI framework will offer to drivers as
> > > > > > > > > > "clock-frequency". A lot of this is actually specific to cameras. On top of
> > > > > > > > > > that, camera sensors tend to be devices that are used equally on both DT
> > > > > > > > > > and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
> > > > > > > > > > natural place for this code is actually the V4L2 framework.
> > > > > > > > > 
> > > > > > > > > Can ACPI devices support programmable sensor clock frequency ?
> > > > > > > > 
> > > > > > > > Do you mean sensor's external clock or PLL? And do you mean programmable
> > > > > > > > as configured in system firmware or at runtime?
> > > > > > > 
> > > > > > > I mean external clock, and configurable at runtime.
> > > > > > 
> > > > > > There's basically no standard API to change a clock's frequency at runtime
> > > > > > (as there is no API to handle clocks) -- which is why we have a property
> > > > > > instead of that presumed API.
> > > > > 
> > > > > I wonder, for ACPI devices that have a clock-frequency property, could
> > > > > we automatically register a fixed-frequency clock ?
> > > > 
> > > > That's an interesting idea.
> > > > 
> > > > It still could have potential to break something even if it may be
> > > > unlikely. I don't know what others are doing with clocks (if anything)
> > > > outside cameras on ACPI.
> > > > 
> > > > Maybe a case for an RFC? Doing this would be nice as we could get rid of
> > > > one of the few remaining DT/ACPI differences in sensor drivers.
> > > > 
> > > > That being said, this should not hold back merging the patch.
> > > 
> > > An RFC sounds good. For this specific patch, I think we agree we need a
> > > helper function. I wonder if the helper could register a fixed clock if
> > > there's no clocks property, that way we could easily change the
> > > implementation later while minimizing changes to drivers. Some sort of
> > > 
> > > struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *name);
> > > 
> > > that sensor drivers would call instead of devm_clk_get(). There may be
> > > issues I don't foresee though, but maybe worth trying ?
> > > 
> > 
> > I will give it a try and eventually send patches.
> > 
> > Thanks everyone for all the answers.
> 
> While looking around, I found the following:
> 
> - ClockInput resource added to ACPI v6.5: https://uefi.org/specs/ACPI/6.5/19_ASL_Reference.html#clockinput-clock-input-resource-descriptor-macro
> - commit adding ClockInput resource to acpica: https://github.com/acpica/acpica/commit/661feab5ee01a34af95a389a18c82e79f1aba05a
> - commit kernel upstream: 520d4a0ee5b6d9c7a1258ace6caa13a94ac35ef8 "ACPICA: add support
>   for ClockInput resource (v6.5)"
> 
> this does not mean we can use it: I found this out-of-tree patch to supports fixed clock sources
> https://github.com/niyas-sait/linux-acpi/blob/main/0001-acpi-add-clock-bindings-for-fixed-clock-resources.patch
> it was not sent to the acpi mailing list. It was mentioned in this
> dicussion: https://lore.kernel.org/linux-kernel/78763d69bae04204b2af37201b09f8b5@huawei.com/
> 
> Another interesting link: https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28822175758/ACPI+Clock+Input+Resources
> 
> Anyway, things to look out for as it seems that people are working on
> this.

Nice find. This doesn't answer to the existing needs but good to know
there's work being done to support this.

I still think what Laurent suggested should be doable. Clocks based on
properties just need to be parsed after resource descriptors, that's all it
should take for the two to co-exist.

-- 
Regards,

Sakari Ailus

