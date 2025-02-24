Return-Path: <linux-media+bounces-26850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C088AA427FD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 17:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E48927A447A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 16:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957FF261570;
	Mon, 24 Feb 2025 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="apf3aMDe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51DC254848
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414884; cv=none; b=emC943Y7sFFByGQ3hF2rujodzXpK+f8xv0lBJCGoYyNoR6fyJQI5epUincCy0gWmj5iNA0IVhS0W5o1essqpzwk30vbkg5R5hZg0VXAExfHXuUH+J27dJRf9WtmMhBvDRFK3vtzcnLtV3cUpBcmrbVAjeoKWUIwL8ifKE0+C8l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414884; c=relaxed/simple;
	bh=GGBVKbtB07j4WL/mX2QnYkyB0e72gCYTl3tmi6LXnws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGGmaOoguycYBvwLesp0K0ixsKe2sFr10mzmDL6D+TYyl+WWzoB1FFY+Pzux5fgL+aBOPLCYVd+l2NSLwA5RbTvd58n5dxB6uVtPfrOMwATFoe2el9NUNxgRwFWgYM/PXgDF2BAscxDEaI5/Vq55CQiJH6v5voeg7QDNG1zWxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=apf3aMDe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51318220;
	Mon, 24 Feb 2025 17:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740414793;
	bh=GGBVKbtB07j4WL/mX2QnYkyB0e72gCYTl3tmi6LXnws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apf3aMDejXOVTg2HNqngM8sXy4h93YnLK6LI5wBY/fVf+tpdhuWHPV1cbQGIC73X7
	 aKV7mck4cpSHwSlqpeVcy6O+CxYqVP+9oNUufn+ZsF4O31m58XouodSBpojw0RYyRo
	 lJ1Rw+t053DYYS9/gsfOeZ61EjQljg2FHsMaF37g=
Date: Mon, 24 Feb 2025 18:34:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <20250224163421.GB6778@pendragon.ideasonboard.com>
References: <20250223230649.GD16159@pendragon.ideasonboard.com>
 <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
 <Z7w-9DjMOIDtndti@kekkonen.localdomain>
 <hs5odm7vni4va2wikso7htyqcgbaiqbfrjqzeofzofrrabn5d6@cportdepyasr>
 <2462254c-bd3f-488b-94d9-e11e16108327@ideasonboard.com>
 <Z7xq7EqpBFEvVRjR@kekkonen.localdomain>
 <20250224132536.GE25447@pendragon.ideasonboard.com>
 <Z7yEa--OvfQU1BVJ@kekkonen.localdomain>
 <20250224161640.GA6778@pendragon.ideasonboard.com>
 <Z7yeP_sORqiVAh_Y@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7yeP_sORqiVAh_Y@kekkonen.localdomain>

On Mon, Feb 24, 2025 at 04:28:47PM +0000, Sakari Ailus wrote:
> On Mon, Feb 24, 2025 at 06:16:40PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 24, 2025 at 02:38:35PM +0000, Sakari Ailus wrote:
> > > On Mon, Feb 24, 2025 at 03:25:36PM +0200, Laurent Pinchart wrote:
> > > > On Mon, Feb 24, 2025 at 12:49:48PM +0000, Sakari Ailus wrote:
> > > > > On Mon, Feb 24, 2025 at 02:24:29PM +0200, Tomi Valkeinen wrote:
> > > > > > On 24/02/2025 13:54, Mehdi Djait wrote:
> > > > > > > On Mon, Feb 24, 2025 at 09:42:12AM +0000, Sakari Ailus wrote:
> > > > > > > > On Mon, Feb 24, 2025 at 08:59:34AM +0100, Mehdi Djait wrote:
> > > > > > > > > On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> > > > > > > > > > On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > > > > > > > > > > Make the clock producer reference lookup optional
> > > > > > > > > > > 
> > > > > > > > > > > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > > > > > > > > > > property when no clock producer is available
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > >   drivers/media/i2c/imx219.c | 14 ++++++++++++--
> > > > > > > > > > >   1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > > > > > > > > index 2d54cea113e1..a876a6d80a47 100644
> > > > > > > > > > > --- a/drivers/media/i2c/imx219.c
> > > > > > > > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > > > > > > > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> > > > > > > > > > >   				     "failed to initialize CCI\n");
> > > > > > > > > > >   	/* Get system clock (xclk) */
> > > > > > > > > > > -	imx219->xclk = devm_clk_get(dev, NULL);
> > > > > > > > > > > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> > > > > > > > > > >   	if (IS_ERR(imx219->xclk))
> > > > > > > > > > >   		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > > > > > > > > >   				     "failed to get xclk\n");
> > > > > > > > > > > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > +	if (imx219->xclk) {
> > > > > > > > > > > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > > > > > > > > > > +	} else {
> > > > > > > > > > > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > > > > > > > > > > +					       "clock-frequency",
> > > > > > > > > > > +					       &imx219->xclk_freq);
> > > > > > > > > > > +		if (ret)
> > > > > > > > > > > +			return dev_err_probe(dev, ret,
> > > > > > > > > > > +					     "failed to get clock frequency");
> > > > > > > > > > > +	}
> > > > > > > > > > > +
> > > > > > > > > > 
> > > > > > > > > > This doesn't seem specific to the imx219 driver. Could you turn this
> > > > > > > > > > into a generic V4L2 sensor helper that would take a struct device and a
> > > > > > > > > > clock name, and return the frequency, either retrieved from the clock,
> > > > > > > > > > or from the clock-frequency property as a fallback ?
> > > > > > > > > > 
> > > > > > > > > > Some drivers will also need to control the clock, so the clock should
> > > > > > > > > > probably be returned too.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Yes, I saw that many sensor drivers have the same issue.
> > > > > > > > > 
> > > > > > > > > I will try to make it into a generic V4L2 helper and send the patches.
> > > > > > > > 
> > > > > > > > There are other such functions in drivers/media/v4l2-core/v4l2-common.c.
> > > > > > > > Perhaps this is where the new helper could be located as well?
> > > > > > > > 
> > > > > > > 
> > > > > > > I was thinking about drivers/media/v4l2-core/v4l2-fwnode.c but if
> > > > > > > v4l2-common.c is more appropriate we can go with that.
> > > > > > 
> > > > > > I admit I have no clue about ACPI, but why is this v4l2 specific? Why
> > > > > > doesn't clock framework do this for us?
> > > > > 
> > > > > The "clock-frequency" isn't really specific to ACPI but it's used on some
> > > > > boards with DT, too, that precede the current clock bindings. Clocks aren't
> > > > > generally available to OS in ACPI either but the sensor drivers still need
> > > > > them. DisCo for Imaging uses "mipi-img-clock-frequency" which DisCo for
> > > > > Imaging code deep down in the ACPI framework will offer to drivers as
> > > > > "clock-frequency". A lot of this is actually specific to cameras. On top of
> > > > > that, camera sensors tend to be devices that are used equally on both DT
> > > > > and ACPI systems, it's quite uncommon elsewhere. Therefore I do think the
> > > > > natural place for this code is actually the V4L2 framework.
> > > > 
> > > > Can ACPI devices support programmable sensor clock frequency ?
> > > 
> > > Do you mean sensor's external clock or PLL? And do you mean programmable
> > > as configured in system firmware or at runtime?
> > 
> > I mean external clock, and configurable at runtime.
> 
> There's basically no standard API to change a clock's frequency at runtime
> (as there is no API to handle clocks) -- which is why we have a property
> instead of that presumed API.

I wonder, for ACPI devices that have a clock-frequency property, could
we automatically register a fixed-frequency clock ?

-- 
Regards,

Laurent Pinchart

