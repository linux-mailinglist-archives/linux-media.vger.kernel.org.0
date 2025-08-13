Return-Path: <linux-media+bounces-39817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B1B24A36
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8B617DF48
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CC92E6134;
	Wed, 13 Aug 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W2tQDVu5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8172746A
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090536; cv=none; b=i/ixEhejDeTcEL6h8tNTnxrJ2B00WYpusNbCqsWR+Zs16MvP+BwaEimkiy44ABlaxjOY0v7EXAtRq+hbUB160XbLi7Rsw8trTbBTCjz5OCfJWLEXMkTKOgk6ek/JM+ESY0qiBFKK8NhMlnow47aqzWoe5gmkubO66mFKC3kA04Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090536; c=relaxed/simple;
	bh=teGTMBwkIb1BHAx0pEbmYgF5uRy3cBt0D675swXtIzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY8f2Xm2vnX7F8a67XhD9fPE2HaAe+a4UVhzj53CJUx6w2UbVETk+I+1IZIbvbR8ScGkIUyZVkMDxkxxACayK2Z1VxLhS50sDqGYMObV0f/OG9afsoPa7vwK6kvbdR4ie754bbN3sGqOBVJuGieJm18FTsS+dtazuD6E2xUIvcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W2tQDVu5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 703F33A4;
	Wed, 13 Aug 2025 15:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755090476;
	bh=teGTMBwkIb1BHAx0pEbmYgF5uRy3cBt0D675swXtIzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2tQDVu51G1tDM50H3ePxsqUMnJL7FMXZJn1RlZbW97oWGoBKKnEHVNpjEi8OpKW1
	 +fHCq4ZaXJtrFKOok4/n5Db2w92iBGWfVpesDp2LFQ5C2uQz+g8rsBO0Fy30FixlCY
	 Gdhz86b91j7Po+Uz/BSKyAHbX5OKOA9CILAmyUP8=
Date: Wed, 13 Aug 2025 16:08:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
	m.felsch@pengutronix.de, matthias.fend@emfend.at,
	mchehab@kernel.org, michael.riesch@collabora.com,
	naush@raspberrypi.com, nicholas@rothemail.net,
	nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250813130831.GG20174@pendragon.ideasonboard.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
 <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>

On Wed, Aug 13, 2025 at 12:59:36PM +0000, Sakari Ailus wrote:
> On Wed, Aug 13, 2025 at 12:15:29PM +0200, Hans Verkuil wrote:
> > On 26/06/2025 15:33, Mehdi Djait wrote:
> > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > platforms to retrieve a reference to the clock producer from firmware.
> > > 
> > > This helper behaves the same as devm_clk_get() except where there is
> > > no clock producer like in ACPI-based platforms.
> > > 
> > > For ACPI-based platforms the function will read the "clock-frequency"
> > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > indicated in the property.
> > > 
> > > This function also handles the special ACPI-based system case where:
> > > The clock-frequency _DSD property is present.
> > > A reference to the clock producer is present, where the clock is provided
> > > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > In this case try to set the clock-frequency value to the provided clock.
> > 
> > On irc I wondered about the name of the new function since it is sensor
> > specific, and if it can also be used for e.g. video receivers, then it
> > should be renamed to something more generic.
> > 
> > According to Laurent there is no ACPI standard for video receivers, so
> > that's the reason this is sensor specific.
> > 
> > I'd like to see that documented in this patch. Either in the commit log,
> > or, preferred, in the header in the function description.
> 
> Given this patch has been around for quite some time and I've sent a PR on
> it, I'd prefer to proceed with the current PR. I'm fine with adding more
> documentation though if you think we should do that.

How about a separate patch that Hans can merge just on top of your PR ?
Could you send one ?

> > I made a suggestion below.
> > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> > >  include/media/v4l2-common.h           | 27 ++++++++++++++
> > >  2 files changed, 79 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > 
> > <snip>
> > 
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index 0a43f56578bc..1c79ca4d5c73 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> > >  struct v4l2_device;
> > >  struct v4l2_subdev;
> > >  struct v4l2_subdev_ops;
> > > +struct clk;
> > >  
> > >  /* I2C Helper functions */
> > >  #include <linux/i2c.h>
> > > @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > >  			     unsigned int num_of_driver_link_freqs,
> > >  			     unsigned long *bitmap);
> > >  
> > > +/**
> > > + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> > > + *	for a camera sensor.
> > > + *
> > > + * @dev: device for v4l2 sensor clock "consumer"
> > > + * @id: clock consumer ID
> > > + *
> > > + * This function behaves the same way as devm_clk_get() except where there
> > > + * is no clock producer like in ACPI-based platforms.
> > > + *
> > > + * For ACPI-based platforms, the function will read the "clock-frequency"
> > > + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> > > + * in the property.
> > > + *
> > > + * This function also handles the special ACPI-based system case where:
> > > + *
> > > + * * The clock-frequency _DSD property is present.
> > > + * * A reference to the clock producer is present, where the clock is provided
> > > + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > + *
> > > + * In this case try to set the clock-frequency value to the provided clock.
> > 
> >     *
> >     * While ACPI has standardized sensor support, there is no standard support for
> >     * e.g. video receivers. So this function is specific to sensors, hence the
> >     * chosen function name.
> > 
> > Better suggestions are welcome.
> 
> ACPI itself does not standardise camera sensor support. What driver authors

But there's a de facto standard that makes this helper function
suitable, isn't there ?

> should know indeed is that this function provides a clock that can be at
> least queried for frequency, independently of how that clock is controlled
> or how its frequency is configured.
> 
> How about:
> 
>  * This function may be used in camera sensor drivers only.
> 
> > If it is just adding a paragraph, then I can just add that manually. If the change
> > is more involved, then a v2.1 for just this patch should be posted.
> > 
> > Other than this, the series looks good.

-- 
Regards,

Laurent Pinchart

