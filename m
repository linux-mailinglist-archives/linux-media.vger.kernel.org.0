Return-Path: <linux-media+bounces-36399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4605AEF468
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B89CB7B0B4A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D792270EC5;
	Tue,  1 Jul 2025 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYhpIzAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED02026C3A3
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364223; cv=none; b=mT2pZJkF09OMtnUGNaEK5IOocRjm4I5bdGVbRUBQZIgEgxlS1LNnPesy0Uwhm4iA1zir+bng8rEU+J/Obw8zE0UYF6cFp9Pm10SY6bcSKbO5lcwu7rPzJLLYvGCzmLE6zomimN4XVfebgYLgkXFnt+c8BUCDoTZEyQW3Nr8idO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364223; c=relaxed/simple;
	bh=BoWP4XeNIqS8SzXoIeOnHfa9YPQLj9oBjQBdNZnU/qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqUOe28uPIZQM9gVEsZarZeSQoQ9uev370a5M9L2DdRXesP23eeKc1WYf1wE6z1FOP9xA/KpVIcp4dQjfa3JzYgGnJewfucTETsS0Kccr/y748uOek4JyvskIXfrtQjNSiV6ZAhjmuHZn9XBiJZevq/nk/FpNG69HG3Y375d/XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYhpIzAI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751364222; x=1782900222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BoWP4XeNIqS8SzXoIeOnHfa9YPQLj9oBjQBdNZnU/qk=;
  b=EYhpIzAI3EteY52qsCsuxkjH/Z0jc4bboLSnxalQaAbMu7nA0mQ4f6lh
   /4VR6P0GxH0s+qP8E978haLqxdy3k7ibHUVt3jVDMXInjky7EcGjx00cj
   qZo1sN3xl5sQUEs6ou4mJFHWY8HS2oFvSmV4Tjg6bE7Dzoay9X1w0ruIH
   ux1xtFd9dNdU+4ece7dV4Dv8nfDLb9e5suFrxEhJrAoM4bTeidTs2H+Ml
   dKHgOxAjGG4NPNJB8zvXjmXLj5bKU8diBDDP6cK11I7D8OkQR5ogDRzUP
   oq754ol2ul8kW52KjKKVMSonXSlNTSLpzvhFZyVX3X1dc63NDPBYf/tMT
   A==;
X-CSE-ConnectionGUID: d98OiQjTQXODJLMJ1nddZw==
X-CSE-MsgGUID: FPEWmNY/Rk+QqZ2Qbs5cVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57429619"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57429619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:03:41 -0700
X-CSE-ConnectionGUID: u6hjgcuaSwWHErX8r5puTA==
X-CSE-MsgGUID: MqWycbjjQQWUUdu61bqoTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184656058"
Received: from abityuts-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:03:33 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id D668C44366;
	Tue,  1 Jul 2025 13:03:30 +0300 (EEST)
Date: Tue, 1 Jul 2025 13:03:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, stanislaw.gruszka@linux.intel.com,
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
Message-ID: <aGOyb7ZcoZ57WXYF@svinhufvud>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <aF5ERIaLioVAzjZm@kekkonen.localdomain>
 <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcmikcuq4xio47ceyxoeuwomjj26phpvzt4plz3p63j427hft6@yiaq6l4fxlpu>

Hi Mehdi,

On Tue, Jul 01, 2025 at 11:51:02AM +0200, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Fri, Jun 27, 2025 at 07:12:04AM +0000, Sakari Ailus wrote:
> > Hi Mehdi,
> > 
> > On Thu, Jun 26, 2025 at 03:33:52PM +0200, Mehdi Djait wrote:
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
> > 
> > Missing leading dot. You could also rewrap this paragraph, using longer
> > lines up to 75 characters.
> > 
> > If there's not going to be further versions of the patch, I'll just rewrap
> > this while applying.
> 
> Two things before applying:
> 
> - A missing Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> for the Documentation patch -> [PATCH 02/48]

Is Co-developed-by: also relevant?

> 
> - We still need to agree on how to proceed for the sensor drivers I mentioned
>   in the cover Letter:
> 
> 1) drivers/media/i2c/s5k5baf.c
> 	Always returns -EPROBE_DEFER if getting the clock fails ?!

This can be fixed later on IMO.

> 
> 2) drivers/media/i2c/mt9t112.c
> 	This drivers seems to be implementing the behaviour of
> 	devm_clk_get_optional() while using devm_clk_get(): remove it from the
> 	list of changed drivers ?

There are no DT bindings. I wonder if this is still relevant. Maybe Jacopo
has an idea?

> 
> 3) drivers/media/i2c/ov8856.c
> 	Getting the clock, setting the rate, getting the optional gpio and the
> 	regulator_bulk is only when the fwnode is NOT acpi.

Isn't this a similar case than the other sensor (which I can't remember
anymore), where effectively the rate set couldn't be different than the
clock already had?

I think this also could be handled after this set.

-- 
Kind regards,

Sakari Ailus

