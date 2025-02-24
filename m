Return-Path: <linux-media+bounces-26821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C2A41EF0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F19518879B7
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820561A317A;
	Mon, 24 Feb 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTMhMSi7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BAEEB5
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399852; cv=none; b=ok7/fZ+qOlTXRmnfcMZdez28yug4KluOZN8VZpYg+t3LXn2hlcIamhDNYh0zdJGeciHTyFt5kuK4eQwz8tVfvmjOHMulroxDsgWjKJrnY3WmaWbp/TAR8yvnhx8Wd90j+rnMm89AepZPXjWIz5k7HENcrp4kWRwruE6Ro5BbyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399852; c=relaxed/simple;
	bh=dgug10rsOFyLIXStsqLkk4MYwNNSX44bS/bKtWJSzio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPq1e8zbmfIw7yLf561yLQiQy66vVuEZ74TnJ4V8Tgzme370H0mYDqaJA8xmyG16SxjNR762BmSM7/dQAfhddMIhYQHeq6QU/U8z32MItD3BWl6yOU5yxcvKNeef0grwvMSfijRDtnJanMcfBXRjFe86+sh4k9BGoSSObGK4Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTMhMSi7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740399852; x=1771935852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dgug10rsOFyLIXStsqLkk4MYwNNSX44bS/bKtWJSzio=;
  b=KTMhMSi7cQJt5zTbHx5TlZ/zWcukaf/w3eCBHkaQSmY32LucsExexPw9
   KZw751NQPCqpe34XC2e5qeL64qG/IYugl24x2Ujvm8ApRSWidlH90lV6S
   rHWEe3rk8JT6/yIXIE/AK4nBqx8e3T2fuvyrk9SxenLCNdj2cEhMEJiNR
   CX5rtY7rF8xXxxa1V41Gt5fgOPakar0d03OeL5s95amGEQWA8aO/BR3JY
   iSlSBxvGvBH1fE2tNpjfJf+jb1c6tdxeFh7I6kQXB8UZpvWq02j2uUc/2
   Bn1KWIe4kQvGjsQvX3oogkkC2+pwS0Yz4YqrCwL5lzr9qHXdaQQHDXlhi
   A==;
X-CSE-ConnectionGUID: 1wZNYlscROSUrc+rPCeWCg==
X-CSE-MsgGUID: INfi7KPKRbWT3GFJhv+MDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63621561"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63621561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:24:11 -0800
X-CSE-ConnectionGUID: titUvg9ZQuSRJTr3iQ9OHw==
X-CSE-MsgGUID: eeHMxkjUThiomF7J3oTgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="121134577"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:24:09 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B64BD11F944;
	Mon, 24 Feb 2025 14:24:06 +0200 (EET)
Date: Mon, 24 Feb 2025 12:24:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dave.stevenson@raspberrypi.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <Z7xk5g0jfCLbEFMU@kekkonen.localdomain>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>

Hi Mehdi,

On Mon, Feb 24, 2025 at 12:54:16PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > Hi Mehdi,
> > 
> > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > Hi Laurent,
> > > 
> > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > Hi Mehdi,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > Make the clock producer reference lookup optional
> > > > > 
> > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > property when no clock producer is available
> > > > > 
> > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > --- a/drivers/media/i2c/imx219.c
> > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > >  				     "failed to initialize CCI\n");
> > > > >  
> > > > >  	/* Get system clock (xclk) */
> > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > >  	if (IS_ERR(imx219->xclk))
> > > > >  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > >  				     "failed to get xclk\n");
> > > > >  
> > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > +	if (imx219->xclk) {
> > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > +	} else {
> > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > +					       "clock-frequency",
> > > > > +					       &imx219->xclk_freq);
> > > > > +		if (ret)
> > > > > +			return dev_err_probe(dev, ret,
> > > > > +					     "failed to get clock frequency");
> > > > > +	}
> > > > > +
> > > > 
> > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > clock name, and return the frequency, either retrieved from the clock,
> > > > or from the clock-frequency property as a fallback ?
> > > > 
> > > > Some drivers will also need to control the clock, so the clock should
> > > > probably be returned too.
> > > > 
> > > 
> > > Yes, I saw that many sensor drivers have the same issue.
> > > 
> > > I will try to make it into a generic V4L2 helper and send the patches.
> > 
> > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > Perhaps this is where the new helper could be located as well?
> > 
> 
> I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> v4l2-common.c is more appropriate we can go with that.

That's my suggestion, yes.

-- 
Kind regards,

Sakari Ailus

