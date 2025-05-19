Return-Path: <linux-media+bounces-32753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831EABBA43
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C219F1B6182B
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 09:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5A626E176;
	Mon, 19 May 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4sncMub"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA941C84B8;
	Mon, 19 May 2025 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647964; cv=none; b=unDXnvXU4PwRaYE9Ml4TZkujSfi8yXi1ecTrhBWyjMU3s2tWHYMUzAb5Lk6seEG2yjujGEwYuxFNI2LDd6hDOBQKKlMLJ7o2y7QFjM2EsaJreaiKEKe/EU/AIjcFQJH4dUVCaTzJlTHFfIB/87F9Xq5IlxjSofUE3TKfa4/jYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647964; c=relaxed/simple;
	bh=v1zk102uKTVC4imT+UtGRjoS7bC/SRZoc5fRnhB9cqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnogZ9S8vjlwHVe5uEoAviBfq6/ujYNuMsR2VOAXmGCzDSZ7UwmBGNhh4TGP61yhfqlBKEcVMKs/cHB5SE22pxEP4LhTTVuYimcXGTPoqM8ApEETvw6xXx77p3SdODmerPYsn8QH9JI0BcYHvNLa0ryBJ4O1V8oVOtxwh02hD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4sncMub; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747647961; x=1779183961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v1zk102uKTVC4imT+UtGRjoS7bC/SRZoc5fRnhB9cqg=;
  b=N4sncMub0cJYPhR6Q5q3jydTktD9uUEkHtCP4DChgFPO0qXq7t9aThWo
   +P07aXsSz9ZNGbO7vvqMis2NGjQxneA7WpamRQrZ67aGoIA0D7tIk4QX9
   J2zehoXnrdW+/b97bD+VoQmKr12Vc5CrE67A28utl1/zInqzQT++De9OB
   WPa+tMDNPPbocwc63hz0tmEDwUxyP5EblT7P29RjhozJc/6umPqAZCnHy
   Q7GLnxzhrI+RibE7GxFOKZFdwcSJDALnkG1pX8+N22w8Tc++U5c63a2qB
   Y/7lT+/7J9mv1/U589BVPIZO1/XDC9xo7Eu2qguz9HE3LkIkf/ofM/ni5
   Q==;
X-CSE-ConnectionGUID: d9f6lwwjRIurGQh6L3SKiA==
X-CSE-MsgGUID: ID4AxI6bSLyHVa+jEa2MwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60193783"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60193783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:46:00 -0700
X-CSE-ConnectionGUID: yPlT+hViQ9O+tOiod6B+6A==
X-CSE-MsgGUID: yFbWCfFHRjq9JzxlJPiOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139222597"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.253])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:45:57 -0700
Date: Mon, 19 May 2025 11:45:49 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hdegoede@redhat.com>, tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, naush@raspberrypi.com, 
	mchehab@kernel.org, dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <bmvv2cc75baovi5hxfyuubl332btxxq7h6w447dwngzmizykoq@ly6lonub3qxy>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
 <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
 <aCZTi2odVXVZjJE8@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCZTi2odVXVZjJE8@svinhufvud>

Hi Sakari,

On Thu, May 15, 2025 at 11:50:19PM +0300, Sakari Ailus wrote:
> Hi Mehdi, Laurent,
> 
> On Thu, May 15, 2025 at 03:51:33PM +0200, Mehdi Djait wrote:
> > Hi Laurent,
> > 
> > On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> > > On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > > > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > > > 
> > > > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > > > no clock producer like in ACPI-based platforms.
> > > > > > > 
> > > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > > indicated in the property.
> > > > > > > 
> > > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > > 
> > > > > > This certainly looks quite useful, thank you for working
> > > > > > on this.
> > > > > > 
> > > > > > Note on some IPU3 platforms where the clk is provided by
> > > > > > a clk-generator which is part of a special sensor-PMIC
> > > > > > the situation is a bit more complicated.
> > > > > > 
> > > > > > Basically if there is both a clk provider and a clock-frequency
> > > > > > property then the clock-frequency value should be set as freq
> > > > > > to the clk-provider, see:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > > > 
> > > > > > for an example of a driver which handles this case.
> > > > > 
> > > > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > > > clock-frequency property...
> > > > 
> > > > Is this wrong ?
> > > > 
> > > > The OV8865 driver was introduced for DT-based systems, where you will
> > > > get a reference to the "struct clk corresponding to the clock producer"
> > > > and then get the clock-rate/frequency with a call to:
> > > > 
> > > > 	rate = clk_get_rate(sensor->extclk);
> > > > 
> > > > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > > > adding support for clock-frequency came later to support ACPI-based
> > > > systems (IPU3 here)
> > > 
> > > I'd expect all device properties to be documented in DT bindings. Is
> > > that an incorrect assumption ?
> > > 
> > 
> > I am actually genuinely asking, is the clock-frequency a device property
> > of the ov8865 camera sensor or the clock source, which is a separate device ?
> 
> The sensor's.

Ack.

> 
> Could we document how this is supposed to work on DT and ACPI?

I can include a documentation patch in the next version.

> 
> I think we should also select COMMON_CLK on ACPI systems for sensor
> drivers (in a separate patch maybe?), instead of relying on distributions
> enabling it.
> 

makes sense.

> > 
> > Example the imx258 with a fixed-clock, which has its own compatible
> > and DT bindings under bindings/clock/fixed-clock.yaml
> > 
> > So when adding support for ACPI-based systems, the DT bindings should
> > not be changed because getting the clock-frequency from the ACPI _DSD
> > property is a workaround only needed on ACPI-based systems.
> 
> I wouldn't say it's a workaround, but something that's only needed on ACPI
> systems.
> 

Ack.

--
Kind Regards
Mehdi Djait

