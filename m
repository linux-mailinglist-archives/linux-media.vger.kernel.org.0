Return-Path: <linux-media+bounces-36402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BDFAEF57D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7064B4A4D4E
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC5726FDA9;
	Tue,  1 Jul 2025 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="StbridQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C613AA53
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366845; cv=none; b=kDqPp/FYg2EcPZY4ZSB5eKj6cCpb5D6TLfVMRZZRpaRxXRqC37Bvryyi8LstSAMacF5kS8J6LetNjTG187Mq4d8XifJN6banL5pagd2iUQjTYxiMrX/k+qsfYSr2edO1ZjtT6VjxmY/pe7sMMGRM8P01iefmBuA9eZmrJk7DYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366845; c=relaxed/simple;
	bh=jEOE45SJ1iugQkRpA0TPKc2rU9KMQQOdwjokxdoa/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSEoDtGHx2oRvbgDCEx7pJp+D6oQI1mNYrpre6TU0p4CLHJCknuf1jrEi+5/EOYIkqWsOfy4kduR1fPeHDr3rAQvsU2ak1TR9CFt9Rshyl250BVehw5F6RZoq7bFEoPhtoxTJENJ/PoEBPgVY/DZrZrpSPxm6mzqNGW2vYuQx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=StbridQJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 929566F3;
	Tue,  1 Jul 2025 12:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751366818;
	bh=jEOE45SJ1iugQkRpA0TPKc2rU9KMQQOdwjokxdoa/vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StbridQJH3qJeK+ooTE5GauoRugoyFWtxec+UsyY5slx0E4KmsPHiEGMGX2bxSpz/
	 vchj7lAeOOJWCymL53hyuiN+gi59mQ7KldmN/pldP/EAPCOYe25kXoQOwXPHIXH1op
	 pkmYsMnDFDxoNPvCeLD9Bvc15WXjwl0yBpFGrVro=
Date: Tue, 1 Jul 2025 12:47:16 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	laurent.pinchart@ideasonboard.com, stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com, 
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com, 
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com, hansg@kernel.org, 
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, kieran.bingham@ideasonboard.com, 
	khalasa@piap.pl, mani@kernel.org, m.felsch@pengutronix.de, 
	matthias.fend@emfend.at, mchehab@kernel.org, michael.riesch@collabora.com, 
	naush@raspberrypi.com, nicholas@rothemail.net, nicolas.dufresne@collabora.com, 
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com, pavel@kernel.org, 
	rashanmu@gmail.com, ribalda@chromium.org, slongerbeam@gmail.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, linux-media@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <hiug6e7fuzxe3v3nja2nghons3q3ghax3ic6wx6usliotvtlxh@3akcx4g62fwj>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <aF5ERIaLioVAzjZm@kekkonen.localdomain>
 <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>
 <aGOyb7ZcoZ57WXYF@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGOyb7ZcoZ57WXYF@svinhufvud>

Hi Sakari, Mehdi,

On Tue, Jul 01, 2025 at 01:03:27PM +0300, Sakari Ailus wrote:
> Hi Mehdi,
>
> On Tue, Jul 01, 2025 at 11:51:02AM +0200, Mehdi Djait wrote:
> > Hi Sakari,
> >
> > On Fri, Jun 27, 2025 at 07:12:04AM +0000, Sakari Ailus wrote:
> > > Hi Mehdi,
> > >
> > > On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > platforms to retrieve a reference to the clock producer from firmware.
> > > >
> > > > This helper behaves the same as devm_clk_get() except where there is
> > > > no clock producer like in ACPI-based platforms.
> > > >
> > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > indicated in the property.
> > > >
> > > > This function also handles the special ACPI-based system case where:
> > > > The clock-frequency _DSD property is present.
> > > > A reference to the clock producer is present, where the clock is provided
> > > > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > >
> > > Missing leading dot. You could also rewrap this paragraph, using longer
> > > lines up to 75 characters.
> > >
> > > If there's not going to be further versions of the patch, I'll just rewrap
> > > this while applying.
> >
> > Two things before applying:
> >
> > - A missing Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > for the Documentation patch -> [PATCH 02/48]
>
> Is Co-developed-by: also relevant?
>
> >
> > - We still need to agree on how to proceed for the sensor drivers I mentioned
> >   in the cover Letter:
> >
> > 1) drivers/media/i2c/s5k5baf.c
> > 	Always returns -EPROBE_DEFER if getting the clock fails ?!
>
> This can be fixed later on IMO.
>
> >
> > 2) drivers/media/i2c/mt9t112.c
> > 	This drivers seems to be implementing the behaviour of
> > 	devm_clk_get_optional() while using devm_clk_get(): remove it from the
> > 	list of changed drivers ?
>
> There are no DT bindings. I wonder if this is still relevant. Maybe Jacopo
> has an idea?

Not really, the driver has been ported to be a regular i2c driver from
its soc-camera-based legacy implementation but has seen basically no
development since then, if not for sub-system wide changes or odd fixes.

Looking at the implementatio, the driver indeed seems to implement what
_optional() does already, so it might be more opportune to convert it
to _optional() first maybe ? However in my understanding your patch
doesn't change the current behaviour, doesn't it ? In this case I think
you can go ahead.

Thanks
  j

>
> >
> > 3) drivers/media/i2c/ov8856.c
> > 	Getting the clock, setting the rate, getting the optional gpio and the
> > 	regulator_bulk is only when the fwnode is NOT acpi.
>
> Isn't this a similar case than the other sensor (which I can't remember
> anymore), where effectively the rate set couldn't be different than the
> clock already had?
>
> I think this also could be handled after this set.
>
> --
> Kind regards,
>
> Sakari Ailus
>

