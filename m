Return-Path: <linux-media+bounces-36409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93108AEF654
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616A73AAF40
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA4D257451;
	Tue,  1 Jul 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HoYkqoGS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB18821
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368695; cv=none; b=YLS5PLi7RWlW9JDkH5re+5ddO7liGQEHPxsZbfC+/4+goE4xn90tc/85VvT6hgmXtwnYrTQ2hvJlSDLp4idZfkpXgzHBLOCC9E0fTiZLlKVHqF54p0agjVtQU4M1aTu3GSL6PY5WxKzYOsN1y0Xs9rNfYjjGCA18RRZ7Z7h3rPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368695; c=relaxed/simple;
	bh=yhVEqUKOZ6RwAWXxbfXkLf5aJ8AMIySbswPBYfE2/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LenfLfnxdcC9+2vL01tvwHXQSoeo3Jw5Nl3+8uodAGe8Zwj5Hti9w5s5E9YM3ESAC2EeDOT8wXBcpAT4KtyQJmPtyPmmKJ3OFgttWqFlzND+jOq0lWGYntki6CTcNMckMffG/+XVOjYT6vIFGjCGTm6IgN1p2YGi77g4RwB4Uw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HoYkqoGS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECC3D78C;
	Tue,  1 Jul 2025 13:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751368666;
	bh=yhVEqUKOZ6RwAWXxbfXkLf5aJ8AMIySbswPBYfE2/iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HoYkqoGSsFA/W6Hoi3uiUbUeARbXdKcwookW9zPMSc9IsCaTsMEXEHrUAMSQLQwCX
	 LfqnUJ1HDeN5Uup1bxKvdapVsao0JsG2Y6lnDyVXWkvR4iEPyzH2S+LFY8FNd9C9Wg
	 QG84kp/XF5pCA8Rqwh2UgqDGZcWpS54H9Z9g9Lv0=
Date: Tue, 1 Jul 2025 14:17:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl,
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
Message-ID: <20250701111742.GJ15184@pendragon.ideasonboard.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <aF5ERIaLioVAzjZm@kekkonen.localdomain>
 <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>
 <aGOyb7ZcoZ57WXYF@svinhufvud>
 <hiug6e7fuzxe3v3nja2nghons3q3ghax3ic6wx6usliotvtlxh@3akcx4g62fwj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <hiug6e7fuzxe3v3nja2nghons3q3ghax3ic6wx6usliotvtlxh@3akcx4g62fwj>

On Tue, Jul 01, 2025 at 12:47:16PM +0200, Jacopo Mondi wrote:
> On Tue, Jul 01, 2025 at 01:03:27PM +0300, Sakari Ailus wrote:
> > On Tue, Jul 01, 2025 at 11:51:02AM +0200, Mehdi Djait wrote:
> > > On Fri, Jun 27, 2025 at 07:12:04AM +0000, Sakari Ailus wrote:
> > > > On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > >
> > > > > This helper behaves the same as devm_clk_get() except where there is
> > > > > no clock producer like in ACPI-based platforms.
> > > > >
> > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > indicated in the property.
> > > > >
> > > > > This function also handles the special ACPI-based system case where:
> > > > > The clock-frequency _DSD property is present.
> > > > > A reference to the clock producer is present, where the clock is provided
> > > > > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > >
> > > > Missing leading dot. You could also rewrap this paragraph, using longer
> > > > lines up to 75 characters.
> > > >
> > > > If there's not going to be further versions of the patch, I'll just rewrap
> > > > this while applying.
> > >
> > > Two things before applying:
> > >
> > > - A missing Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > for the Documentation patch -> [PATCH 02/48]

Fixed.

> > Is Co-developed-by: also relevant?
> >
> > > - We still need to agree on how to proceed for the sensor drivers I mentioned
> > >   in the cover Letter:
> > >
> > > 1) drivers/media/i2c/s5k5baf.c
> > > 	Always returns -EPROBE_DEFER if getting the clock fails ?!
> >
> > This can be fixed later on IMO.

Agreed.

> > >
> > > 2) drivers/media/i2c/mt9t112.c
> > > 	This drivers seems to be implementing the behaviour of
> > > 	devm_clk_get_optional() while using devm_clk_get(): remove it from the
> > > 	list of changed drivers ?
> >
> > There are no DT bindings. I wonder if this is still relevant. Maybe Jacopo
> > has an idea?
> 
> Not really, the driver has been ported to be a regular i2c driver from
> its soc-camera-based legacy implementation but has seen basically no
> development since then, if not for sub-system wide changes or odd fixes.
> 
> Looking at the implementatio, the driver indeed seems to implement what
> _optional() does already, so it might be more opportune to convert it
> to _optional() first maybe ? However in my understanding your patch
> doesn't change the current behaviour, doesn't it ? In this case I think
> you can go ahead.

Agreed too.

> > > 3) drivers/media/i2c/ov8856.c
> > > 	Getting the clock, setting the rate, getting the optional gpio and the
> > > 	regulator_bulk is only when the fwnode is NOT acpi.
> >
> > Isn't this a similar case than the other sensor (which I can't remember
> > anymore), where effectively the rate set couldn't be different than the
> > clock already had?
> > 
> > I think this also could be handled after this set.

Ideally we should stop setting the rate and simplify the driver, but we
have to be careful about regressions. I agree with Sakari, we can
address this later.

-- 
Regards,

Laurent Pinchart

