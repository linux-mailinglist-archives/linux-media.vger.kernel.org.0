Return-Path: <linux-media+bounces-26847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E908A427B4
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 17:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274693A875F
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 16:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C2B260A56;
	Mon, 24 Feb 2025 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l1FsVu/6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90691553BC
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740413827; cv=none; b=e9gO7vBZtbXMXJOcsQwZihoUJO4poXFUrzA63YvZKXytyceGdNiQMDKsGfIKH8DgdFlW41ilrHjPuSu41eaSRjWxOWWtc4CcxsaBgbbm/8xgy+oAWolHgaUN/hThOGO5LAzj74DcnXZfelqWt53Lcy2sSEAVuD+N2Y2nEwVU2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740413827; c=relaxed/simple;
	bh=MtLnMYI5IwuRpwi2yJjGSUyDIweVCUySro1/f+B8utY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX9CaFC7kgYAvjSbnmRr62A1PuxHhDBBzqj81R+m0mYZMRH9VSB0XJbGoxAxEEwkvLLIddL05JWwzhBUWUfbtbcUCV/0wbFdWQFZERQbpURFSeBHJSxqtu5sP11ESeaH/FRnwAuN5OrssYUGV2igpNqvwsnYzSVKy8dWf8d55c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l1FsVu/6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5437220;
	Mon, 24 Feb 2025 17:15:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740413731;
	bh=MtLnMYI5IwuRpwi2yJjGSUyDIweVCUySro1/f+B8utY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1FsVu/6/6C/5xabAPdSGKxBLNcgMaQLb8V5IZFSBvlc2FJSEkpAfDbfAknNPslRA
	 yJb8uFHfy+1rg4usMSlDYO/TpbOMqoHJ9ImTxnuXgHKgGk8Hw3eIjmqckEtAUSvBhr
	 hqS+Tj1Nnu5URIA4cXXVyQsqeHWYfD8rhKFmq2oA=
Date: Mon, 24 Feb 2025 18:16:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <20250224161640.GA6778@pendragon.ideasonboard.com>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
 <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
 <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
 <20250224132536.GE25447@pendragon.ideasonboard.com>
 <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>

On Mon, Feb 24, 2025 at 02:38:35PM +0000, Sakari Ailus wrote:
> On Mon, Feb 24, 2025 at 03:25:36PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 24, 2025 at 12:49:48PM +0000, Sakari Ailus wrote:
> > > On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> > > > On 24/02/2025 13:54, Mehdi Djait wrote:
> > > > > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > > > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > > > > Make the clock producer reference lookup optional
> > > > > > > > > 
> > > > > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > > > > property when no clock producer is available
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > ---
> > > > > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > > > > >   				     "failed to initialize CCI\n");
> > > > > > > > >   	/* Get system clock (xclk) */
> > > > > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > > > > >   				     "failed to get xclk\n");
> > > > > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > +	if (imx219->xclk) {
> > > > > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > +	} else {
> > > > > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > > > > +					       "clock-frequency",
> > > > > > > > > +					       &imx219->xclk_freq);
> > > > > > > > > +		if (ret)
> > > > > > > > > +			return dev_err_probe(dev, ret,
> > > > > > > > > +					     "failed to get clock frequency");
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > 
> > > > > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > > > > or from the clock-frequency property as a fallback ?
> > > > > > > > 
> > > > > > > > Some drivers will also need to control the clock, so the clock should
> > > > > > > > probably be returned too.
> > > > > > > > 
> > > > > > > 
> > > > > > > Yes, I saw that many sensor drivers have the same issue.
> > > > > > > 
> > > > > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > > > > 
> > > > > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > > > > Perhaps this is where the new helper could be located as well?
> > > > > > 
> > > > > 
> > > > > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > > > > v4l2-common.c is more appropriate we can go with that.
> > > > 
> > > > I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> > > > doesn't clock framework do this for us?
> > > 
> > > The "clock-frequency" isn't really specific to ACPI but it's used on some
> > > boards with DT, too, that precede the current clock bindings. Clocks aren't
> > > generally available to OS in ACPI either but the sensor drivers still need
> > > them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
> > > Imaging code deep down in the ACPI framework will offer to drivers as
> > > "clock-frequency". A lot of this is actually specific to cameras. On top of
> > > that, camera sensors tend to be devices that are used equally on both DT
> > > and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
> > > natural place for this code is actually the V4L2 framework.
> > 
> > Can ACPI devices support programmable sensor clock frequency ?
> 
> Do you mean sensor's external clock or PLL? And do you mean programmable
> as configured in system firmware or at runtime?

I mean external clock, and configurable at runtime.

-- 
Regards,

Laurent Pinchart

