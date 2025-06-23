Return-Path: <linux-media+bounces-35603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DCAE3D4F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 004131620CF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509D323C8A2;
	Mon, 23 Jun 2025 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp3rTr3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16C1F4E39;
	Mon, 23 Jun 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675782; cv=none; b=AaJpcCaIZN2OJkhS12eKY7DlOK7n6Z+mV9pMTyAVLNOD+uW82p6dhYkFSAuZ03CPr5TE8un7Sxw+WkimUHa3y+N3/7xx5v3wrDx9eAFrQ5YTlt2eT0iKsaJAH0wyjLeJMNT1/FKA1qWAkGmF46nDIWMLGt4KouwmbBlzZFceUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675782; c=relaxed/simple;
	bh=KHAztxVJHUgqnqPaPlSKsa5GmeQPudLPzlRAuAA+pgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzSVe8TCgboqyD2U6MqVi+pUn65KL59ZryqxVM7jjNRd24dTWOxQnQzsXTgc2Y36rImzhWUSzWje8NJpNG0DdyVhlIHs5ZwS5jvUy+BPK8jiX/Cs6Pvv1y2gZWN6SzFDgK0PMesc+aj1MMTfvCEktwJsVnOb0M7LIuvG6Gph6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp3rTr3Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750675782; x=1782211782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KHAztxVJHUgqnqPaPlSKsa5GmeQPudLPzlRAuAA+pgc=;
  b=hp3rTr3ZxKHTwGJbKsofN7b5ZDn0LYFBfjC0VXHIyJUtMxJfBJkSZG0O
   YAHpNqlesFyttvvqY8KiXHkyovWRBaC5UbRfHhbNlt0EeFrP618D6y+C1
   yfySE2D5WX8sEcVKTIxRimWbB+3NBoNYB2xxKeDf6PyH6EWP6B/5WKGkB
   XTTKMN49cPeKMu837KHTgHOAuEmn7lJBa2OpEYIzwxBvHjPH5bzPeGC6u
   qEvHinxbf9+VTidrp3YbVSctmA+/vVRpkAM21rf2bQREr1imzKQ0mUK8B
   qDeB089ULF6VTfWiV0CCCsRp90VxYk0Ro0BLWPesUzrxHkxl4c1lTlKjX
   Q==;
X-CSE-ConnectionGUID: cJxErB3/TMucDART9XP4WA==
X-CSE-MsgGUID: im4LgCUNQKaVpDnPOYPKXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52593388"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52593388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:49:37 -0700
X-CSE-ConnectionGUID: 9GZ1QGZhTgyynab6BY1qSQ==
X-CSE-MsgGUID: 82Pw+woNQrOgLbts22tCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="188785369"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:49:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1B3031201F7;
	Mon, 23 Jun 2025 13:49:24 +0300 (EEST)
Date: Mon, 23 Jun 2025 10:49:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se, kieran.bingham@ideasonboard.com, khalasa@piap.pl,
	prabhakar.csengg@gmail.com, mani@kernel.org,
	m.felsch@pengutronix.de, martink@posteo.de, mattwmajewski@gmail.com,
	matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com,
	pavel@kernel.org, petrcvekcz@gmail.com, rashanmu@gmail.com,
	ribalda@chromium.org, rmfrfs@gmail.com, zhengsq@rock-chips.com,
	slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 02/55] Documentation: media: camera-sensor: Mention
 v4l2_devm_sensor_clk_get() for obtaining the clock
Message-ID: <aFkxNB0EPFzlhOl5@kekkonen.localdomain>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <1261f41358da597fb9900b7880618ebcc392160d.1750352394.git.mehdi.djait@linux.intel.com>
 <20250619214705.GR22102@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619214705.GR22102@pendragon.ideasonboard.com>

Hi Mehdi, Laurent,

On Fri, Jun 20, 2025 at 12:47:05AM +0300, Laurent Pinchart wrote:
> Hi Mehdi,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 07:58:55PM +0200, Mehdi Djait wrote:
> > Add the new v4l2 helper devm_v4l2_sensor_clk_get() to Documentation. the
> > helper works on both DT- and ACPI-based platforms to retrieve a
> > reference to the clock producer from firmware.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index c290833165e6..c82c018a5f40 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -32,7 +32,8 @@ user.
> >  ACPI
> >  ~~~~
> >  
> > -Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
> > +Use ``devm_v4l2_sensor_clk_get()`` to get the clock. The function will read the
> > +``clock-frequency`` _DSD property to denote the frequency. The driver
> >  can rely on this frequency being used.
> 
> This isn't specific to ACPI anymore. I think the documentation should be
> refactored further. Here's a proposal.
> 
> 
> Handling clocks
> ---------------
> 
> Camera sensors have an internal clock tree including a PLL and a number of
> divisors. The clock tree is generally configured by the driver based on a few
> input parameters that are specific to the hardware: the external clock frequency
> and the link frequency. The two parameters generally are specified by system
> firmware. **No other frequencies should be used in any circumstances.**
> 
> The reason why the clock frequencies are so important is that the system is
> usually designed to use specific external clock and link frequencies to ensure
> electro-magnetic compatibility. Using other frequencies may cause harmful
> effects elsewhere. Therefore only the pre-determined frequencies are
> configurable by the user.
> 
> The external clock frequency shall be retrieved by obtaining the external clock
> using the ``devm_v4l2_sensor_clk_get()`` helper function, and then getting its
> frequency with ``clk_get_rate()``. Usage of the helper function guarantees
> correct behaviour regardless of whether the sensor is integrated in a DT-based
> or ACPI-based system.
> 
> ACPI
> ~~~~
> 
> ACPI-based systems typically don't register the sensor external clock with the
> kernel, but specify the external clock frequency in the ``clock-frequency``
> _DSD property. The ``devm_v4l2_sensor_clk_get()`` helper creates and returns a
> fixed clock set at that rate.
> 
> Devicetree
> ~~~~~~~~~~
> 
> Devicetree-based systems declare the sensor external clock in the device tree
> and reference it from the sensor node. The preferred way to select the external
> clock frequency is to use the ``assigned-clocks``, ``assigned-clock-parents``
> and ``assigned-clock-rates`` properties in the sensor node to set the clock
> rate. See the `clock device tree bindings
> <https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml>`_
> for more information. The ``devm_v4l2_sensor_clk_get()`` helper retrieves and
> returns that clock.
> 
> This approach has the drawback that there's no guarantee that the frequency
> hasn't been modified directly or indirectly by another driver, or supported by
> the board's clock tree to begin with. Changes to the Common Clock Framework API
> are required to ensure reliability.

This looks good to me.

> 
> 
> >  
> >  Devicetree
> 

-- 
Regards,

Sakari Ailus

