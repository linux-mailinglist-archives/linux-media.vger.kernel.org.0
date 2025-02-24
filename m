Return-Path: <linux-media+bounces-26817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D99A41E4D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD0D179465
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03BB23C8B6;
	Mon, 24 Feb 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AojqAkgL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15F2505C2
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740398067; cv=none; b=NKEpaz8BVxFhA82owE3hpfgoGH9fgrtcjD4ngjQyVjdnPc1Hqrf5I/s55EYHRuR6VeANXdBpNfsjKmukk/Y4TlhmysLaGOgeganl/R43JqvxtaBBJR8HsRcCV0T4r1sbfehXzLrYoKnwGIqQFx7oZWqMrFJqu+N4AmR8cCaC+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740398067; c=relaxed/simple;
	bh=lVMh9s+4Zy97BnaGCF+YIZwUvFOG0UFPIsX7MHabyrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxBVY50K+moDQdGNl+9fnPvvg9ZZ1eUdNsDenQKlCqYTjoFozYht2hUQZRfRJHs/gYawK2peEMcFBzBDCtrdgv9DVhWeK+KtrqxarEobDnpZ20sXqPWAxseFxd/GdvK/jbd+Brt4yI0fGV6MZOOaYYMfpyVumHvke1ZZ1v3Cy2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AojqAkgL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740398066; x=1771934066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVMh9s+4Zy97BnaGCF+YIZwUvFOG0UFPIsX7MHabyrQ=;
  b=AojqAkgLwPUBkWs5Gy4OucQLnjzkeHxnBIcN8g/cYL0VmmJz+nUjBvJk
   Jye+Bq7HGsEQ/8h1CLDRajHwBwFHkigGQiSNxOTLyTkXLaQ6dAgEEyZTL
   8SiXlElcmAvtn65A+geVAfkJEgXTJMe9zVdyI9jHm25HuHwafwA2SQqgO
   9a37rCH2iXg8fCnFxtRrtvAzbnlxSATRg0MN794vNBiDY1T6W/FcY0ikO
   B76QK7mmqPnELHs5hIfM6FNvwYUFc7SpYWmqLwfLdSRC5+gtfEg/B2hSL
   pObxH4Yaum8Zz/ReKOHcjnLNKtRzjll29SHf08X8Vo1MNKU6qem5C+FwN
   g==;
X-CSE-ConnectionGUID: Z8cU3HEwRmO8VH2xEvG+TA==
X-CSE-MsgGUID: C+3CCNbvQvO5zqiA4cDNZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41025927"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41025927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:54:25 -0800
X-CSE-ConnectionGUID: 9+zU11AiT8ihmgCR9cFcgQ==
X-CSE-MsgGUID: MdI3tH6NSnS4Cq5xpzw11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="121123720"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.208])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:54:24 -0800
Date: Mon, 24 Feb 2025 12:54:16 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	dave.stevenson@raspberrypi.com, tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7w-9DjMOIDtndti@kekkonen.localdomain>

Hi Sakari,

On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > Hi Laurent,
> > 
> > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > Hi Mehdi,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > Make the clock producer reference lookup optional
> > > > 
> > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > property when no clock producer is available
> > > > 
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > >  				     "failed to initialize CCI\n");
> > > >  
> > > >  	/* Get system clock (xclk) */
> > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > >  	if (IS_ERR(imx219->xclk))
> > > >  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > >  				     "failed to get xclk\n");
> > > >  
> > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > +	if (imx219->xclk) {
> > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > +	} else {
> > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > +					       "clock-frequency",
> > > > +					       &imx219->xclk_freq);
> > > > +		if (ret)
> > > > +			return dev_err_probe(dev, ret,
> > > > +					     "failed to get clock frequency");
> > > > +	}
> > > > +
> > > 
> > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > into a generic V4L2 sensor helper that would take a struct device and a
> > > clock name, and return the frequency, either retrieved from the clock,
> > > or from the clock-frequency property as a fallback ?
> > > 
> > > Some drivers will also need to control the clock, so the clock should
> > > probably be returned too.
> > > 
> > 
> > Yes, I saw that many sensor drivers have the same issue.
> > 
> > I will try to make it into a generic V4L2 helper and send the patches.
> 
> There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> Perhaps this is where the new helper could be located as well?
> 

I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
v4l2-common.c is more appropriate we can go with that.

--
Kind Regards
Mehdi Djait

