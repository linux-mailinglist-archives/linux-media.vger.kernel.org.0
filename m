Return-Path: <linux-media+bounces-36413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE09AEF6F4
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C13D1C01A30
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABBF2609F7;
	Tue,  1 Jul 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnmdkg2H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7650D149C4A
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370380; cv=none; b=nv6YsXoLyOA3lgD6dwLZe/55idEr3UR59SUZaNmpd285hgBHnK9nuKJWZ85gOnWbJdmhNYO8HhWwYebCF+Dr8iTuxk38s0mxLHKmCPdl2uSqv+ISunHDi6H+OKf08Wzumz3zhvFAXTnWORLEFoqK0GrEXdHweSHeWUHCmVgdIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370380; c=relaxed/simple;
	bh=Wvl/hxWcvcsNcRa6h/udO1zTCsQprd+dTWro/Qdn/30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qciGeaq5/s7tOQmkDfZESpcpsUM4o1mTyl52VSYWlZJENsNhV7LT7OJH8f/Hsn+LwNu9a6FNvZ0s8pBOA6DJw4Lbfe8Ox8RJ2iA9E2xryydvEG2zvVp1eVynQE0sAdSBJVovkGqRTYWSypqdDIOZvPYJtujQIjHA5AesfqtOyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnmdkg2H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751370378; x=1782906378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wvl/hxWcvcsNcRa6h/udO1zTCsQprd+dTWro/Qdn/30=;
  b=bnmdkg2HrJrr5GtUTKCaYsTKPriMnQ6ECUw17zHr+akNgxXWZH7sqSXw
   pY6co5b9Bk9dnO82J9WlWg+Lx5fGYWlDKvyIaKRy7LbojoKhgIW6i3dNi
   EK70+Me0+BkvRtM/dme0XgdUwUpA1VkRQE4a3XlctpSIq8UbHFSDB2qm5
   BGPozZGtyRfZv9G3aX1pNq/NmNqHCZeXXFuzR4KugV2zpKpsrpj7Akjay
   R387ZYGremBMTHdBXFlqXsBtLG3TGZEt3IB1eUE2xmEhi4MtUXLRctQTv
   lbJwSz7UdkP1ukNE8sn6YJm8tqVQDEHVZNjNdNw5Idy0qz5Bcz2JvQYUR
   Q==;
X-CSE-ConnectionGUID: igizq5WaTluQmA2xgfgR5A==
X-CSE-MsgGUID: 3+DuUh7+RdidMXOLg2ZaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53736550"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53736550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:46:17 -0700
X-CSE-ConnectionGUID: c3oEXHQZQM+Phb3ae7q8nQ==
X-CSE-MsgGUID: v6OQGcZYSnusjAh8Y+Enbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="177417823"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.241])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:46:10 -0700
Date: Tue, 1 Jul 2025 13:46:02 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com, 
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com, 
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com, hansg@kernel.org, 
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, khalasa@piap.pl, 
	mani@kernel.org, m.felsch@pengutronix.de, matthias.fend@emfend.at, 
	mchehab@kernel.org, michael.riesch@collabora.com, naush@raspberrypi.com, 
	nicholas@rothemail.net, nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com, 
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com, ribalda@chromium.org, 
	slongerbeam@gmail.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, 
	linux-media@vger.kernel.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <w3y7ielc6ptwbzy2pff4kdjdotsuevqwwraoaop7wjhber7z5g@y3hzqlxhv2vf>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <aF5ERIaLioVAzjZm@kekkonen.localdomain>
 <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>
 <aGOyb7ZcoZ57WXYF@svinhufvud>
 <hiug6e7fuzxe3v3nja2nghons3q3ghax3ic6wx6usliotvtlxh@3akcx4g62fwj>
 <20250701111742.GJ15184@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701111742.GJ15184@pendragon.ideasonboard.com>

Hello everyone,

On Tue, Jul 01, 2025 at 02:17:42PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 01, 2025 at 12:47:16PM +0200, Jacopo Mondi wrote:
> > On Tue, Jul 01, 2025 at 01:03:27PM +0300, Sakari Ailus wrote:
> > > On Tue, Jul 01, 2025 at 11:51:02AM +0200, Mehdi Djait wrote:
> > > > On Fri, Jun 27, 2025 at 07:12:04AM +0000, Sakari Ailus wrote:
> > > > > On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > >
> > > > > > This helper behaves the same as devm_clk_get() except where there is
> > > > > > no clock producer like in ACPI-based platforms.
> > > > > >
> > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > indicated in the property.
> > > > > >
> > > > > > This function also handles the special ACPI-based system case where:
> > > > > > The clock-frequency _DSD property is present.
> > > > > > A reference to the clock producer is present, where the clock is provided
> > > > > > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > > >
> > > > > Missing leading dot. You could also rewrap this paragraph, using longer
> > > > > lines up to 75 characters.
> > > > >
> > > > > If there's not going to be further versions of the patch, I'll just rewrap
> > > > > this while applying.
> > > >
> > > > Two things before applying:
> > > >
> > > > - A missing Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > for the Documentation patch -> [PATCH 02/48]
> 
> Fixed.

Thanks!

> 
> > > Is Co-developed-by: also relevant?
> > >

Yes it is relevant for that patch.

> > > > - We still need to agree on how to proceed for the sensor drivers I mentioned
> > > >   in the cover Letter:
> > > >
> > > > 1) drivers/media/i2c/s5k5baf.c
> > > > 	Always returns -EPROBE_DEFER if getting the clock fails ?!
> > >
> > > This can be fixed later on IMO.
> 
> Agreed.
> 
> > > >
> > > > 2) drivers/media/i2c/mt9t112.c
> > > > 	This drivers seems to be implementing the behaviour of
> > > > 	devm_clk_get_optional() while using devm_clk_get(): remove it from the
> > > > 	list of changed drivers ?
> > >
> > > There are no DT bindings. I wonder if this is still relevant. Maybe Jacopo
> > > has an idea?
> > 
> > Not really, the driver has been ported to be a regular i2c driver from
> > its soc-camera-based legacy implementation but has seen basically no
> > development since then, if not for sub-system wide changes or odd fixes.
> > 
> > Looking at the implementatio, the driver indeed seems to implement what
> > _optional() does already, so it might be more opportune to convert it
> > to _optional() first maybe ? However in my understanding your patch
> > doesn't change the current behaviour, doesn't it ? In this case I think
> > you can go ahead.
> 
> Agreed too.
> 
> > > > 3) drivers/media/i2c/ov8856.c
> > > > 	Getting the clock, setting the rate, getting the optional gpio and the
> > > > 	regulator_bulk is only when the fwnode is NOT acpi.
> > >
> > > Isn't this a similar case than the other sensor (which I can't remember
> > > anymore), where effectively the rate set couldn't be different than the
> > > clock already had?
> > > 
> > > I think this also could be handled after this set.
> 
> Ideally we should stop setting the rate and simplify the driver, but we
> have to be careful about regressions. I agree with Sakari, we can
> address this later.
> 

Ok, good to know.

Thank you everyone for the reviews!

--
Kind Regards
Mehdi Djait

