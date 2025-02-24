Return-Path: <linux-media+bounces-26840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14698A423CF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 15:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83ECE3B15EC
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F43221F20;
	Mon, 24 Feb 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBnhj4+c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49A4A33
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407924; cv=none; b=R1cd+PTIQ4Fl+DjjuwcZMk61ufWURQ48VtqpqHVtYbJaeOmnXNeVRnwzM9AeEDVX4Z54ABVq/QysHqMkKTm7hOuwXVoZDm1T604bH01DBupHbwKTaxJmKkfJKFuGAYm+jzeAteGlDbnytMqhl08/wPH6byGnYKJKKU/vzhDxHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407924; c=relaxed/simple;
	bh=9T9hARGO1IXs7GfmYuvbqjXlcPx880HJBq97Au4RxPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skl/hdL67eQYrrI1zZMSzEtzoqVdjm0qWyq0YsiYIbUeGsfaiBmI23keLVMTGe8jTNUTT+PXyMRqxC+eWYSXfqIxgxqCURcI+CW/SEWHcLElHPvDOhjtkDqkK2hZq+MVsJN4IfrrrsBP9micfanKBQOWVTXVos971kTu6GNw+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBnhj4+c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740407923; x=1771943923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9T9hARGO1IXs7GfmYuvbqjXlcPx880HJBq97Au4RxPo=;
  b=RBnhj4+cYXkaylH3Eb2VUZ67Wh2ffAVs7hpJ4sEk21TRiqkVv530Om9F
   Ept269TcX2r9OEk1ECi1IhbHEm1BabiYN9dbOeeqmltTdMsFAPQBZeNRx
   J0EWrRej+yVoDuLsH6AoLo/z7wRw7Fmm3QWRjanda/fo296jMQvshLt9J
   y9IfFNnNHf4s24YwV0u0KhnELbOZ5R39wU4OQLuZ/JH2TBmwNMk+sp6Ff
   3QSW7+I5aWp9xUfhr4jA3tFB5IG8yYbLjEAfl9Y2umlZs+kOHGXHI0PEk
   9e+AC/uKA0EbPVXl8LVRsHLK1XqkuHyiI/20eb0SW+FNF67SOjB5bB0In
   g==;
X-CSE-ConnectionGUID: uu3rklGOQVSz5JNIzlyIuQ==
X-CSE-MsgGUID: aqvPFpLOTPSR8HaV19QIKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45071610"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="45071610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:38:40 -0800
X-CSE-ConnectionGUID: dM8p1BALTYOU3dVHOMLzsA==
X-CSE-MsgGUID: OCkXEH40QkiujcGN1JfmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="121170362"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:38:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 04D9611F7E8;
	Mon, 24 Feb 2025 16:38:36 +0200 (EET)
Date: Mon, 24 Feb 2025 14:38:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
 <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
 <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
 <20250224132536.GE25447@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224132536.GE25447@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Feb 24, 2025 at 03:25:36PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 24, 2025 at 12:49:48PM +0000, Sakari Ailus wrote:
> > On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> > > On 24/02/2025 13:54, Mehdi Djait wrote:
> > > > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > > > Make the clock producer reference lookup optional
> > > > > > > > 
> > > > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > > > property when no clock producer is available
> > > > > > > > 
> > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > ---
> > > > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > > > >   				     "failed to initialize CCI\n");
> > > > > > > >   	/* Get system clock (xclk) */
> > > > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > > > >   				     "failed to get xclk\n");
> > > > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > +	if (imx219->xclk) {
> > > > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > +	} else {
> > > > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > > > +					       "clock-frequency",
> > > > > > > > +					       &imx219->xclk_freq);
> > > > > > > > +		if (ret)
> > > > > > > > +			return dev_err_probe(dev, ret,
> > > > > > > > +					     "failed to get clock frequency");
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > 
> > > > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > > > or from the clock-frequency property as a fallback ?
> > > > > > > 
> > > > > > > Some drivers will also need to control the clock, so the clock should
> > > > > > > probably be returned too.
> > > > > > > 
> > > > > > 
> > > > > > Yes, I saw that many sensor drivers have the same issue.
> > > > > > 
> > > > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > > > 
> > > > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > > > Perhaps this is where the new helper could be located as well?
> > > > > 
> > > > 
> > > > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > > > v4l2-common.c is more appropriate we can go with that.
> > > 
> > > I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> > > doesn't clock framework do this for us?
> > 
> > The "clock-frequency" isn't really specific to ACPI but it's used on some
> > boards with DT, too, that precede the current clock bindings. Clocks aren't
> > generally available to OS in ACPI either but the sensor drivers still need
> > them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
> > Imaging code deep down in the ACPI framework will offer to drivers as
> > "clock-frequency". A lot of this is actually specific to cameras. On top of
> > that, camera sensors tend to be devices that are used equally on both DT
> > and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
> > natural place for this code is actually the V4L2 framework.
> 
> Can ACPI devices support programmable sensor clock frequency ?

Do you mean sensor's external clock or PLL? And do you mean programmable
as configured in system firmware or at runtime?

-- 
Regards,

Sakari Ailus

