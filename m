Return-Path: <linux-media+bounces-33012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F10ABF2E5
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D961B67B5E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 11:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9665263F47;
	Wed, 21 May 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxWo9dp5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF825EF8B;
	Wed, 21 May 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827277; cv=none; b=XHR/RQK3keeeuECAB9SyqZcqPm9mczeQ/pGj3hOeUBx3FCs4GSdQVG2NJ9j2KAsIU6VN4Ks31yD2EjsMVNA0BRJc7uBLZm4LgwmdKN/AtxQS7DR7Ncd+kK457jCNSudD3nKdn/XrNa7eWlL7h2SJz6VIgjy3yF0dgOPLF1J8FHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827277; c=relaxed/simple;
	bh=Mh1HSkD+W+jD0xGkcpOKJianUrmXNdpN6De05zeNjGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Azf/njxxQyWpq5rNj+1vcWaVPWdva7BDovTxcBtuv9Y3zfbsl/EOudHALxQyZfuB4LhVhvQfk108V6vGcriSN05RU5DTjp5onby+za+G/oUk1gv9iZIpw3jNTcI4P4ZNteB+9U+zdpWXiUPNCNQ0g0V4fKnsdkRb7l/lCNyM2jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxWo9dp5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747827276; x=1779363276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mh1HSkD+W+jD0xGkcpOKJianUrmXNdpN6De05zeNjGE=;
  b=BxWo9dp5vufIYadaLtU+zfSFBMtIPVaEf7Nm9aU5Ahtn2JWzDr0HaV+g
   jjM9DjwXcXLOyWGXbIrKgYAV4bc1Pa+NxCbUQ4KkZfUf1Hpf00KZFWzXQ
   aNpA3FlCy5UvahXXJInhI4P5QXYSOBUxvWRv1ERsA3cCAJ2SxovVHsMpN
   gC7lvobGjyET/AbrXrTdnsjh9NOWigM+Zu7ZLERiTBchwEav1HfIGw6tx
   jgDs4bAwqPMxiX6BdMzuGSPz4nfW7BQwDXVae8usSM6K9Lg5lbbL2SfJH
   Fs/fZ51xyECLw52oWpblFi6YFkNLadDHJXm5TEpOvsu/tJQSn7/9iSLtH
   A==;
X-CSE-ConnectionGUID: XtLAlc9eSFu+YqEtuvD7bw==
X-CSE-MsgGUID: di3FqTajR26jAE/ZcB1fDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67215376"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67215376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:34:35 -0700
X-CSE-ConnectionGUID: IB9wprPNTiy/FqIHQkPLmQ==
X-CSE-MsgGUID: EUVSTCmPS06OMST+BICqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140550405"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.129])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:34:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2721F1201BE;
	Wed, 21 May 2025 14:34:29 +0300 (EEST)
Date: Wed, 21 May 2025 11:34:29 +0000
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
Message-ID: <aC26RUhpevSVXudw@kekkonen.localdomain>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
 <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
 <aCZTi2odVXVZjJE8@svinhufvud>
 <20250521105141.GF12514@pendragon.ideasonboard.com>
 <aC2wzFD_bPgESZpR@kekkonen.localdomain>
 <20250521110817.GA4116@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521110817.GA4116@pendragon.ideasonboard.com>

On Wed, May 21, 2025 at 01:08:17PM +0200, Laurent Pinchart wrote:
> On Wed, May 21, 2025 at 10:54:04AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Wed, May 21, 2025 at 12:51:41PM +0200, Laurent Pinchart wrote:
> > > On Thu, May 15, 2025 at 11:50:19PM +0300, Sakari Ailus wrote:
> > > > On Thu, May 15, 2025 at 03:51:33PM +0200, Mehdi Djait wrote:
> > > > > On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> > > > > > On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > > > > > > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > > > > > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > > > > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > > > > > > 
> > > > > > > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > > > > > > no clock producer like in ACPI-based platforms.
> > > > > > > > > > 
> > > > > > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > > > > > indicated in the property.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > > > > 
> > > > > > > > > This certainly looks quite useful, thank you for working
> > > > > > > > > on this.
> > > > > > > > > 
> > > > > > > > > Note on some IPU3 platforms where the clk is provided by
> > > > > > > > > a clk-generator which is part of a special sensor-PMIC
> > > > > > > > > the situation is a bit more complicated.
> > > > > > > > > 
> > > > > > > > > Basically if there is both a clk provider and a clock-frequency
> > > > > > > > > property then the clock-frequency value should be set as freq
> > > > > > > > > to the clk-provider, see:
> > > > > > > > > 
> > > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > > > > > > 
> > > > > > > > > for an example of a driver which handles this case.
> > > > > > > > 
> > > > > > > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > > > > > > clock-frequency property...
> > > > > > > 
> > > > > > > Is this wrong ?
> > > > > > > 
> > > > > > > The OV8865 driver was introduced for DT-based systems, where you will
> > > > > > > get a reference to the "struct clk corresponding to the clock producer"
> > > > > > > and then get the clock-rate/frequency with a call to:
> > > > > > > 
> > > > > > > 	rate = clk_get_rate(sensor->extclk);
> > > > > > > 
> > > > > > > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > > > > > > adding support for clock-frequency came later to support ACPI-based
> > > > > > > systems (IPU3 here)
> > > > > > 
> > > > > > I'd expect all device properties to be documented in DT bindings. Is
> > > > > > that an incorrect assumption ?
> > > > > > 
> > > > > 
> > > > > I am actually genuinely asking, is the clock-frequency a device property
> > > > > of the ov8865 camera sensor or the clock source, which is a separate device ?
> > > > 
> > > > The sensor's.
> > > >
> > > > Could we document how this is supposed to work on DT and ACPI?
> > > 
> > > Yes please. Would you like to send a patch ? :-)
> > 
> > I'd add this to the helper's documentation. We'll work this out with Mehdi.
> > 
> > > > I think we should also select COMMON_CLK on ACPI systems for sensor
> > > > drivers (in a separate patch maybe?), instead of relying on distributions
> > > > enabling it.
> > > > 
> > > > > Example the imx258 with a fixed-clock, which has its own compatible
> > > > > and DT bindings under bindings/clock/fixed-clock.yaml
> > > > > 
> > > > > So when adding support for ACPI-based systems, the DT bindings should
> > > > > not be changed because getting the clock-frequency from the ACPI _DSD
> > > > > property is a workaround only needed on ACPI-based systems.
> > > > 
> > > > I wouldn't say it's a workaround, but something that's only needed on ACPI
> > > > systems.
> > > 
> > > Does that mean that the clock-frequency property should be deprecated on
> > > DT-based systems, and not used in any new sensor bindings ?
> > 
> > I don't think we've added any "clock-frequency" properties in DT bindings
> > for camera sensors since around 2020 or so.
> 
> That's good news, but I'm not sure it's well known or well documented.
> 
> On a side note, should we try to make the existing clock-frequency
> properties optional (or even deprecate them and drop them from bindings)
> when they are currently mandatory ? The following five YAML bindings
> require the property:
> 
> - mipi-ccs.yaml
> - ovti,ov02a10.yaml
> - ovti,ov8856.yaml
> - sony,imx214.yaml
> - sony,imx290.yaml
> 
> The CCS driver treats the property as optional, the imx214 driver
> doesn't use it at all, and the other drivers require it. There are other
> drivers that require the property, in particular ACPI-only drivers.

Given the discussion in the context of the André's imx214 patches, I think
we can drop them all, both in drivers and DT.

-- 
Sakari Ailus

