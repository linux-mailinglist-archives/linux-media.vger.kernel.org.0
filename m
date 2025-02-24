Return-Path: <linux-media+bounces-26784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC1A41962
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90C311888A11
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17E0245006;
	Mon, 24 Feb 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt/zKJyI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25F1FC0F4
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390139; cv=none; b=n2EX5uPkb+PBALbuKfJEhKM8xev+R1BaWVOfpmGlX1inEbQdKReV22EaoFVr3sdlS+L33exeOznlUyUHY5POhvOsw2DiL8Vj1dd2frtLVn4qxXf89SKYuxKm744V+59nuWdOmojSQSiiVvU44sius5LybFHcuwv+BHpc9o5xf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390139; c=relaxed/simple;
	bh=FgHQD7SeG6lBVMbdX9GSgvb8+g/GGVCLRSH7ylshlM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5CrZ9AbRmksZNttIRTjxflEWuG9RxFS5eXQmmkDIezKKOD4QPdoAOmi3pP+C9nLGRVSQfxb94tMr7lcdJODG6NlY9aUV1Mob+qp6sD6OBZvTPODDzXgPKw6f5fJKYDWGlZG5gy++PV98cEAujLO4OhLIel6fq9SCZVHwNHen5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt/zKJyI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740390138; x=1771926138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FgHQD7SeG6lBVMbdX9GSgvb8+g/GGVCLRSH7ylshlM8=;
  b=Bt/zKJyIcdxoyRvPPpvUVrVS5376q6636YY7UI6IcCu9EOmO8hE6KHaH
   RVGVs58XbtJSoCyjPeu4RbIUAPpKDVfdLClXJcU7ViqnWKLoCTUdqJmEM
   86wIpG5NSHo5nSkKGcmiKvuBvP/mGMQ0cxYn+NuDuADs7WlEjBJmFKdR4
   M520SPOoEea7Nrnfb0ebOF0JIxmGecfAcfwDpcgPuGDQbM3H8pmcPv2hu
   Eaq8jE7O38lnmo2oKtvL9hQUOskobR2d0tAXxnthr0b8a9JwVW116gwx8
   KMHz2e+ZogLfjSSdW7x7HdXhjaHV/9l8QTykk6PJLSID6fAGb0TGUvZBO
   Q==;
X-CSE-ConnectionGUID: 7QruzwmiS+qrGkrNMYHL4A==
X-CSE-MsgGUID: GxNRR5FpQRWmEQ8HQV+IDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41348068"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41348068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:42:17 -0800
X-CSE-ConnectionGUID: weDt41/tSoSO8SOHVSwDtg==
X-CSE-MsgGUID: u6Zvfwx+SZOQpnwBF8q4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116203652"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:42:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E6FA11F944;
	Mon, 24 Feb 2025 11:42:12 +0200 (EET)
Date: Mon, 24 Feb 2025 09:42:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dave.stevenson@raspberrypi.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <Z7w-9DjMOIDtndti@kekkonen.localdomain>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>

Hi Mehdi,

On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> Hi Laurent,
> 
> On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > Hi Mehdi,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > Make the clock producer reference lookup optional
> > > 
> > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > property when no clock producer is available
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 2d54cea113e1..a876a6d80a47 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > >  				     "failed to initialize CCI\n");
> > >  
> > >  	/* Get system clock (xclk) */
> > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > >  	if (IS_ERR(imx219->xclk))
> > >  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > >  				     "failed to get xclk\n");
> > >  
> > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > +	if (imx219->xclk) {
> > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > +	} else {
> > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > +					       "clock-frequency",
> > > +					       &imx219->xclk_freq);
> > > +		if (ret)
> > > +			return dev_err_probe(dev, ret,
> > > +					     "failed to get clock frequency");
> > > +	}
> > > +
> > 
> > This doesn't seem specific to the imx219 driver. Could you turn this
> > into a generic V4L2 sensor helper that would take a struct device and a
> > clock name, and return the frequency, either retrieved from the clock,
> > or from the clock-frequency property as a fallback ?
> > 
> > Some drivers will also need to control the clock, so the clock should
> > probably be returned too.
> > 
> 
> Yes, I saw that many sensor drivers have the same issue.
> 
> I will try to make it into a generic V4L2 helper and send the patches.

There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
Perhaps this is where the new helper could be located as well?

-- 
Regards,

Sakari Ailus

