Return-Path: <linux-media+bounces-36398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3FAEF3E7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DBE3A277A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622E226CE0E;
	Tue,  1 Jul 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKNvMLaL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24C221281
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363481; cv=none; b=bTh9tOkGxH/hhPumYHhMzjMvrJFXm5+ApNwJLJbsnONwjs63rDDA4HKfQGL+aiyrfHYji3GiuPiWb/vS0reYF66fGP0GfvsvdZqS4Y9zR8BfgV6SOrZF0jfBpewarulpOUnX98hAB2rJ+UoqJzDExLCwD9TH+246Sok3rQvZkgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363481; c=relaxed/simple;
	bh=Z86qmC+/Tezzmef9/x9xu7S7nMxXp8PhqUBxltJfbHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY08X0N9OFUxo4CL6c3VuXOBrstebFWu/JDxGEBzHWfReeks9i2f+/BPHPN9ZLS3Nir+Ry7/4G/ivrxKoQBok5R3pk0iA4fhqQvOXSIgM1Fou5+YmbXy2w+f563Pg9zGmdi6Bl0CEMKYtLWMnGBIth6ZqtOgqCla6HwbDp/OhvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKNvMLaL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751363479; x=1782899479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z86qmC+/Tezzmef9/x9xu7S7nMxXp8PhqUBxltJfbHk=;
  b=GKNvMLaLpnCZjMBhERkcpqUuXsLLqTB+1ejuEiw3Uq2KNh9G4t4M6et8
   8d4BREfwUFqsW/4AaPJe9BOXCOD/KLnBlX1ymrXpp+L6mGi4pvKMN1IVN
   fUwpnHmBd9v6mHevhzO1xUuHb46BL1sggwI4gZrW02mmTD7yCd8OSm34s
   xxjsOoeMxaU3HPmxOHzDfOzcarK4cO8vzzXY8jT+rMyOr0CHL2Q4TQxZL
   ggNtTE4tBEJ0r6oqQ53DpGmHHM/VghFkAvYTPz4wRKIfZwQMATHYqZOK7
   sDLJQ1Z71BuYLDqnibMmXjCBGs1GHJ5x8cZvxADY+dFRS6AurCLHLrbCA
   w==;
X-CSE-ConnectionGUID: Xdk3/kUDRcitAsN6GSEv6Q==
X-CSE-MsgGUID: 3lXpOKIsR2WnVXHmJSu6Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53711424"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53711424"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:51:18 -0700
X-CSE-ConnectionGUID: H3Bj73kKQeSMwdZQUFpYvg==
X-CSE-MsgGUID: /zFR5moWQm+TuEwvmTrbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158275247"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.241])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:51:11 -0700
Date: Tue, 1 Jul 2025 11:51:02 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, stanislaw.gruszka@linux.intel.com, 
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com, 
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
Message-ID: <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <aF5ERIaLioVAzjZm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF5ERIaLioVAzjZm@kekkonen.localdomain>

Hi Sakari,

On Fri, Jun 27, 2025 at 07:12:04AM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
> > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > This helper behaves the same as devm_clk_get() except where there is
> > no clock producer like in ACPI-based platforms.
> > 
> > For ACPI-based platforms the function will read the "clock-frequency"
> > ACPI _DSD property and register a fixed frequency clock with the frequency
> > indicated in the property.
> > 
> > This function also handles the special ACPI-based system case where:
> > The clock-frequency _DSD property is present.
> > A reference to the clock producer is present, where the clock is provided
> > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> 
> Missing leading dot. You could also rewrap this paragraph, using longer
> lines up to 75 characters.
> 
> If there's not going to be further versions of the patch, I'll just rewrap
> this while applying.

Two things before applying:

- A missing Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
for the Documentation patch -> [PATCH 02/48]

- We still need to agree on how to proceed for the sensor drivers I mentioned
  in the cover Letter:

1) drivers/media/i2c/s5k5baf.c
	Always returns -EPROBE_DEFER if getting the clock fails ?!

2) drivers/media/i2c/mt9t112.c
	This drivers seems to be implementing the behaviour of
	devm_clk_get_optional() while using devm_clk_get(): remove it from the
	list of changed drivers ?

3) drivers/media/i2c/ov8856.c
	Getting the clock, setting the rate, getting the optional gpio and the
	regulator_bulk is only when the fwnode is NOT acpi.

--
Kind Regards
Mehdi Djait

