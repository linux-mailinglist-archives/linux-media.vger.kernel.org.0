Return-Path: <linux-media+bounces-33009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A6ABF22A
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B84416DF53
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669CF2609CE;
	Wed, 21 May 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLyyxhSe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7C2135CB;
	Wed, 21 May 2025 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824852; cv=none; b=gfAgVh+d/9cQdEkMQK688FmzKGhgClP/4pXHedtp7ikh2+RJELTouf/PHAsXDILVPnkSVG7mtUQvkBMvueCIgvAmMvg53NXe43myjW9TE0iukaggDltp6grJ41YYXx9C/MIyD2TkZskyZQqOmHknDcXqrlGPxUunLVxsYa3GbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824852; c=relaxed/simple;
	bh=yJST4V1p2lT4OlOFqlzq6sJXxC9a/GQw99I+mn99G4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjFzxs4NX02179Qzgd68MyP0paxnJuEgwsM40ePPgSTwdLNP9RUgxUVHCl31Fqkk+ouMp2TC2isN5Y3UeLNb6UAl6WjrYSyL887uXtV9J6pohZDcth3PLdnZGW9Vmel2+DhvkeDJuYISXwl9hJOm4X/FzAf+tKV5RRUwf/65EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLyyxhSe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747824851; x=1779360851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yJST4V1p2lT4OlOFqlzq6sJXxC9a/GQw99I+mn99G4c=;
  b=OLyyxhSed/3B/t3HQe4sZ4EC9xPNv1UlHIUMA6T3nJGaXLYr2QhHIfqC
   +ob9Zv1IGole5+seD9OIRxtTlu8il3ILh1HVbtnA/H8xyKMxjtERKSCxg
   H9BbXdi/xTbAKw51tvBNDi1QzKKXVEIwVmKpxSy1DsPCrUneDlrP3n1mn
   BSASD8GgFqLrDnM8ojpI3eseo/gSOXBzU6NGiLo1HY8r/YzuQ/ixg/PU/
   9L2/GBy2stf2QdoTYASnbBeT/YdMRRqvC0QyoSLp0MUvLoqwdUQXyIe/q
   Nfk/oIe8WqijlZ/B7mSuzgm6fk/AzudQu5UavEIDGN1BWKZ8WT1i/dv6D
   Q==;
X-CSE-ConnectionGUID: 2wnz3wozSfSnll6jtA4OuA==
X-CSE-MsgGUID: GWJBMqhdQWCSJZKYuORUeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75192722"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="75192722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:54:10 -0700
X-CSE-ConnectionGUID: Lz3TQqzKSGi0epEREQ3SxA==
X-CSE-MsgGUID: ukpyLMYfRqy20TWYNNXk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="163297816"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.129])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:54:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E943F11F746;
	Wed, 21 May 2025 13:54:04 +0300 (EEST)
Date: Wed, 21 May 2025 10:54:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aC2wzFD_bPgESZpR@kekkonen.localdomain>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
 <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
 <aCZTi2odVXVZjJE8@svinhufvud>
 <20250521105141.GF12514@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521105141.GF12514@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, May 21, 2025 at 12:51:41PM +0200, Laurent Pinchart wrote:
> On Thu, May 15, 2025 at 11:50:19PM +0300, Sakari Ailus wrote:
> > On Thu, May 15, 2025 at 03:51:33PM +0200, Mehdi Djait wrote:
> > > On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> > > > On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > > > > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > > > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > > > > 
> > > > > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > > > > no clock producer like in ACPI-based platforms.
> > > > > > > > 
> > > > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > > > indicated in the property.
> > > > > > > > 
> > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > 
> > > > > > > This certainly looks quite useful, thank you for working
> > > > > > > on this.
> > > > > > > 
> > > > > > > Note on some IPU3 platforms where the clk is provided by
> > > > > > > a clk-generator which is part of a special sensor-PMIC
> > > > > > > the situation is a bit more complicated.
> > > > > > > 
> > > > > > > Basically if there is both a clk provider and a clock-frequency
> > > > > > > property then the clock-frequency value should be set as freq
> > > > > > > to the clk-provider, see:
> > > > > > > 
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > > > > 
> > > > > > > for an example of a driver which handles this case.
> > > > > > 
> > > > > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > > > > clock-frequency property...
> > > > > 
> > > > > Is this wrong ?
> > > > > 
> > > > > The OV8865 driver was introduced for DT-based systems, where you will
> > > > > get a reference to the "struct clk corresponding to the clock producer"
> > > > > and then get the clock-rate/frequency with a call to:
> > > > > 
> > > > > 	rate = clk_get_rate(sensor->extclk);
> > > > > 
> > > > > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > > > > adding support for clock-frequency came later to support ACPI-based
> > > > > systems (IPU3 here)
> > > > 
> > > > I'd expect all device properties to be documented in DT bindings. Is
> > > > that an incorrect assumption ?
> > > > 
> > > 
> > > I am actually genuinely asking, is the clock-frequency a device property
> > > of the ov8865 camera sensor or the clock source, which is a separate device ?
> > 
> > The sensor's.
> >
> > Could we document how this is supposed to work on DT and ACPI?
> 
> Yes please. Would you like to send a patch ? :-)

I'd add this to the helper's documentation. We'll work this out with Mehdi.

> 
> > I think we should also select COMMON_CLK on ACPI systems for sensor
> > drivers (in a separate patch maybe?), instead of relying on distributions
> > enabling it.
> > 
> > > Example the imx258 with a fixed-clock, which has its own compatible
> > > and DT bindings under bindings/clock/fixed-clock.yaml
> > > 
> > > So when adding support for ACPI-based systems, the DT bindings should
> > > not be changed because getting the clock-frequency from the ACPI _DSD
> > > property is a workaround only needed on ACPI-based systems.
> > 
> > I wouldn't say it's a workaround, but something that's only needed on ACPI
> > systems.
> 
> Does that mean that the clock-frequency property should be deprecated on
> DT-based systems, and not used in any new sensor bindings ?

I don't think we've added any "clock-frequency" properties in DT bindings
for camera sensors since around 2020 or so.

-- 
Regards,

Sakari Ailus

