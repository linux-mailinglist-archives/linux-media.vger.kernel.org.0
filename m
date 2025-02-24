Return-Path: <linux-media+bounces-26827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D0A41F9E
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15DD87A9AC0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE3823BCE8;
	Mon, 24 Feb 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGXNQTYA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF42A233737
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401395; cv=none; b=MDzQHYwfuiMoFUxG71dpw9LiMPsh/x/zCEi8rv4SksfhCe5jhKJmpCmpaz68h2nv/hB/SPYmkmDnMqSSUW8RAAME0rOu3xC3COOxw/ZqrBbZ0rnbaL0237Q2rzlS633DZagqqNgQVgmQkQIScZXUaFvSQzMmhx5Ukvcpx+FCBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401395; c=relaxed/simple;
	bh=/5FyNeSSLUyrh9MblxL7mjJ5IHR6hr3zGcS6Fv7+X00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgbXkXuTul3EacSvp6TlF8meH9WMQvwzl2tQAqS7HhtmSJL81SAGLCRnV86j/1Xknkryv19xM92QoXVBkpRaNgcdrV3K673t8sMqUFIcJIhKExVLLCBD4EBsWZ++4jVif+APsWchUrhyL6C+24wQ6uc5nMiWkkGW9+l0EM8HP8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGXNQTYA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740401393; x=1771937393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/5FyNeSSLUyrh9MblxL7mjJ5IHR6hr3zGcS6Fv7+X00=;
  b=aGXNQTYAA3PmntqGwyAJjWyzhoRvzXPZC7ugQHQf8R5DFTp0Yrr/q+D8
   ZsninGpqASOInYY6b6CfS3x0gq5YHfC9Dbfwn8uws9nDmPKAEmHGdtcPE
   1eCB0C72RMnybsZO61q4HJYwMmYkJ/MRGetbA3Go+Nfk3a1bYkhoDQ1sH
   JsUdeICN/LMAq7pkD80Dx0MVvCYnUfAHE8sp8pSuIkrJG/vpklG9My/vm
   YPoJvfJqzZoDxptNtK3LrrTYPcTNDXah2RRXm0lHl89FZPDxuEXKwWPJI
   ANEku/wiORITxoBWB8XXwZb52tGABGLqPujWZGEgDR0gf4K0GD399+LSY
   Q==;
X-CSE-ConnectionGUID: 6qdFm3BITRKTt84YcqhJhg==
X-CSE-MsgGUID: svhCYGFVS025XUM/cUJ05w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41363797"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41363797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:49:52 -0800
X-CSE-ConnectionGUID: VL8NWsMbQAqj8bbSjEJboA==
X-CSE-MsgGUID: 3CeX8wKvQ/KnSv0oI23s+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116955007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:49:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FE1A11F944;
	Mon, 24 Feb 2025 14:49:48 +0200 (EET)
Date: Mon, 24 Feb 2025 12:49:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
 <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>

Moi,

On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 24/02/2025 13:54, Mehdi Djait wrote:
> > Hi Sakari,
> > 
> > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > Hi Mehdi,
> > > 
> > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > Hi Laurent,
> > > > 
> > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > Hi Mehdi,
> > > > > 
> > > > > Thank you for the patch.
> > > > > 
> > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > Make the clock producer reference lookup optional
> > > > > > 
> > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > property when no clock producer is available
> > > > > > 
> > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > ---
> > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > >   				     "failed to initialize CCI\n");
> > > > > >   	/* Get system clock (xclk) */
> > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > >   				     "failed to get xclk\n");
> > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > +	if (imx219->xclk) {
> > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > +	} else {
> > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > +					       "clock-frequency",
> > > > > > +					       &imx219->xclk_freq);
> > > > > > +		if (ret)
> > > > > > +			return dev_err_probe(dev, ret,
> > > > > > +					     "failed to get clock frequency");
> > > > > > +	}
> > > > > > +
> > > > > 
> > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > or from the clock-frequency property as a fallback ?
> > > > > 
> > > > > Some drivers will also need to control the clock, so the clock should
> > > > > probably be returned too.
> > > > > 
> > > > 
> > > > Yes, I saw that many sensor drivers have the same issue.
> > > > 
> > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > 
> > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > Perhaps this is where the new helper could be located as well?
> > > 
> > 
> > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > v4l2-common.c is more appropriate we can go with that.
> 
> I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> doesn't clock framework do this for us?

The "clock-frequency" isn't really specific to ACPI but it's used on some
boards with DT, too, that precede the current clock bindings. Clocks aren't
generally available to OS in ACPI either but the sensor drivers still need
them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
Imaging code deep down in the ACPI framework will offer to drivers as
"clock-frequency". A lot of this is actually specific to cameras. On top of
that, camera sensors tend to be devices that are used equally on both DT
and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
natural place for this code is actually the V4L2 framework.

-- 
Kind regards,

Sakari Ailus

