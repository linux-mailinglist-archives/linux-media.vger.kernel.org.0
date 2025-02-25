Return-Path: <linux-media+bounces-26937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D710EA43D30
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D03177B0E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8819020AF82;
	Tue, 25 Feb 2025 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5HOIwYN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081311917D0
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481902; cv=none; b=Z7oo3xlyyrOIBCaeBMAWrbRp1avUnuozrHyL+3kjoAtL+/dvgSqXtWhN451ntAxCYF3Eb5b8U7we7OKnKjvqh/zB0gNUtpY0UCfH9qHgUiDfOYsX3l147kfykbOjuUcaE9nukqtUheqEm/YmEiK9HJwJms1IowoaLTJNTxLYQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481902; c=relaxed/simple;
	bh=3C6Ln6ysSKdbvazRtB1trMUhQEqYYk2yic7/5fX0gfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm4Hxy5VFYRXMUNNRbpuZh2zjev7sx++je2y4425oQ0OE18DGsU0N0kD/xEARog8pDT0WTlIrrx7O66tagoetduOgYOFthwTJ0jTo0pgDNJAJd0HHULS5JK8Y01YYeaxLGrI1Tzo4BBDbspghH03myX3gusnw8qqfrOKkcJsnHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5HOIwYN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740481900; x=1772017900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3C6Ln6ysSKdbvazRtB1trMUhQEqYYk2yic7/5fX0gfM=;
  b=M5HOIwYNWv9806FUkA9E3u9cWfoAYOUDAlZ9qeIHIB/BMqBSdBTTBAwp
   6Kh1zDhtldJOSIzq8h3MaRMt99fwT1Coxiw0lFlFuSgaPOepFNLSu+MiL
   7+BvQ9N7GxhIj7iqYxwT4ge3ZmV9eqJNYkd/WTBG+pWjkEbMxCsPEJCtW
   IXYgqVVa9KaU74IP5HSDvuklonp58uoSQDQ1gWncgODRRo7QZ9hicrgaR
   2uQdycGR8So8p15QTTgL+4gHzZ6zkx7z+jVcvT/dGDcjrdhZGdrNRCmEa
   DAlHmdL6R4kBnTleGNEDIbfFmW4GpnLivv9gZfDXUHh1rsrFPXC9YyihN
   g==;
X-CSE-ConnectionGUID: HsSyHy9bTyOE2im4YeNCtw==
X-CSE-MsgGUID: ORQxU/FyQse3uaSH+Zauug==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44936519"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="44936519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:11:39 -0800
X-CSE-ConnectionGUID: OTcDETV0RDW/8mZpfGcnxA==
X-CSE-MsgGUID: wKf/QuqJQK6K0d6aizoIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116856338"
Received: from opintica-mobl1 (HELO mdjait-mobl) ([10.245.244.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:11:38 -0800
Date: Tue, 25 Feb 2025 12:11:30 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <rikg5bw4d3npkbtapscgmmv54xio2csalf7omiu7j6aictlzwm@fxhxjgfldzo4>
References: <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
 <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
 <20250224132536.GE25447@pendragon.ideasonboard.com>
 <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>
 <20250224161640.GA6778@pendragon.ideasonboard.com>
 <Z7yeP_sORqiVAh_Y@kekkonen.localdomain>
 <20250224163421.GB6778@pendragon.ideasonboard.com>
 <Z7ynKZOIaUQUZVHn@kekkonen.localdomain>
 <20250224181935.GC6778@pendragon.ideasonboard.com>
 <ntemjkhsm4cq6qbvs5bc55pjjdborq2mqotrghhpb2re3y5gg7@t6emagpijkn2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ntemjkhsm4cq6qbvs5bc55pjjdborq2mqotrghhpb2re3y5gg7@t6emagpijkn2>

Hi everyone,

On Mon, Feb 24, 2025 at 07:28:26PM +0100, Mehdi Djait wrote:
> Hi Laurent, Hi Sakari,
> 
> On Mon, Feb 24, 2025 at 08:19:35PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 24, 2025 at 05:06:49PM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > On Mon, Feb 24, 2025 at 06:34:21PM +0200, Laurent Pinchart wrote:
> > > > On Mon, Feb 24, 2025 at 04:28:47PM +0000, Sakari Ailus wrote:
> > > > > On Mon, Feb 24, 2025 at 06:16:40PM +0200, Laurent Pinchart wrote:
> > > > > > On Mon, Feb 24, 2025 at 02:38:35PM +0000, Sakari Ailus wrote:
> > > > > > > On Mon, Feb 24, 2025 at 03:25:36PM +0200, Laurent Pinchart wrote:
> > > > > > > > On Mon, Feb 24, 2025 at 12:49:48PM +0000, Sakari Ailus wrote:
> > > > > > > > > On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> > > > > > > > > > On 24/02/2025 13:54, Mehdi Djait wrote:
> > > > > > > > > > > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > > > > > > > > > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > > > > > > > > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > > > > > > > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > > > > > > > > > > Make the clock producer reference lookup optional
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > > > > > > > > > > property when no clock producer is available
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > > > > > > > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > > > > > > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > > > > > > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > > > > > > > > > > >   				     "failed to initialize CCI\n");
> > > > > > > > > > > > > > >   	/* Get system clock (xclk) */
> > > > > > > > > > > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > > > > > > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > > > > > > > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > > > > > > > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > > > > > > > > > > >   				     "failed to get xclk\n");
> > > > > > > > > > > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > > > > > +	if (imx219->xclk) {
> > > > > > > > > > > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > > > > > +	} else {
> > > > > > > > > > > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > > > > > > > > > > +					       "clock-frequency",
> > > > > > > > > > > > > > > +					       &imx219->xclk_freq);
> > > > > > > > > > > > > > > +		if (ret)
> > > > > > > > > > > > > > > +			return dev_err_probe(dev, ret,
> > > > > > > > > > > > > > > +					     "failed to get clock frequency");
> > > > > > > > > > > > > > > +	}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > > > > > > > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > > > > > > > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > > > > > > > > > > or from the clock-frequency property as a fallback ?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Some drivers will also need to control the clock, so the clock should
> > > > > > > > > > > > > > probably be returned too.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Yes, I saw that many sensor drivers have the same issue.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > > > > > > > > > > 
> > > > > > > > > > > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > > > > > > > > > > Perhaps this is where the new helper could be located as well?
> > > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > > > > > > > > > > v4l2-common.c is more appropriate we can go with that.
> > > > > > > > > > 
> > > > > > > > > > I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> > > > > > > > > > doesn't clock framework do this for us?
> > > > > > > > > 
> > > > > > > > > The "clock-frequency" isn't really specific to ACPI but it's used on some
> > > > > > > > > boards with DT, too, that precede the current clock bindings. Clocks aren't
> > > > > > > > > generally available to OS in ACPI either but the sensor drivers still need
> > > > > > > > > them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
> > > > > > > > > Imaging code deep down in the ACPI framework will offer to drivers as
> > > > > > > > > "clock-frequency". A lot of this is actually specific to cameras. On top of
> > > > > > > > > that, camera sensors tend to be devices that are used equally on both DT
> > > > > > > > > and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
> > > > > > > > > natural place for this code is actually the V4L2 framework.
> > > > > > > > 
> > > > > > > > Can ACPI devices support programmable sensor clock frequency ?
> > > > > > > 
> > > > > > > Do you mean sensor's external clock or PLL? And do you mean programmable
> > > > > > > as configured in system firmware or at runtime?
> > > > > > 
> > > > > > I mean external clock, and configurable at runtime.
> > > > > 
> > > > > There's basically no standard API to change a clock's frequency at runtime
> > > > > (as there is no API to handle clocks) -- which is why we have a property
> > > > > instead of that presumed API.
> > > > 
> > > > I wonder, for ACPI devices that have a clock-frequency property, could
> > > > we automatically register a fixed-frequency clock ?
> > > 
> > > That's an interesting idea.
> > > 
> > > It still could have potential to break something even if it may be
> > > unlikely. I don't know what others are doing with clocks (if anything)
> > > outside cameras on ACPI.
> > > 
> > > Maybe a case for an RFC? Doing this would be nice as we could get rid of
> > > one of the few remaining DT/ACPI differences in sensor drivers.
> > > 
> > > That being said, this should not hold back merging the patch.
> > 
> > An RFC sounds good. For this specific patch, I think we agree we need a
> > helper function. I wonder if the helper could register a fixed clock if
> > there's no clocks property, that way we could easily change the
> > implementation later while minimizing changes to drivers. Some sort of
> > 
> > struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *name);
> > 
> > that sensor drivers would call instead of devm_clk_get(). There may be
> > issues I don't foresee though, but maybe worth trying ?
> > 
> 
> I will give it a try and eventually send patches.
> 
> Thanks everyone for all the answers.

While looking around, I found the following:

- ClockInput resource added to ACPI v6.5: https://uefi.org/specs/ACPI/6.5/19_ASL_Reference.html#clockinput-clock-input-resource-descriptor-macro
- commit adding ClockInput resource to acpica: https://github.com/acpica/acpica/commit/661feab5ee01a34af95a389a18c82e79f1aba05a
- commit kernel upstream: 520d4a0ee5b6d9c7a1258ace6caa13a94ac35ef8 "ACPICA: add support
  for ClockInput resource (v6.5)"

this does not mean we can use it: I found this out-of-tree patch to supports fixed clock sources
https://github.com/niyas-sait/linux-acpi/blob/main/0001-acpi-add-clock-bindings-for-fixed-clock-resources.patch
it was not sent to the acpi mailing list. It was mentioned in this
dicussion: https://lore.kernel.org/linux-kernel/78763d69bae04204b2af37201b09f8b5@huawei.com/

Another interesting link: https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28822175758/ACPI+Clock+Input+Resources

Anyway, things to look out for as it seems that people are working on
this.

--
Kind Regards
Mehdi Djait

