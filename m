Return-Path: <linux-media+bounces-32615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E216AB90F1
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 22:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259614A7A5A
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 20:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AC12882C0;
	Thu, 15 May 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moeMcJEI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F41F9A8B;
	Thu, 15 May 2025 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342227; cv=none; b=l+w5hxSZHggO0LqsZHfuLyOulz3oNrphMZ2nzB6/+xp8jG1Xyn9yPUD96gLIwPV5mh2J65S26WNEBpcNGPGbHYYE8D512A2G2C0xIQ3F/YlIN74gOrLvIs14wb4yZDkG9QhKziQ4hIitDJFEAwaEHZDGE10b0vA7c4+ProgWazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342227; c=relaxed/simple;
	bh=dY3z1CMqK4/8ea95ZIrCw0VAUNtiyGPXqLu0MHeP0ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNqrntbxk+N/KwoHaNV+3iC0/1VLATaZaBdFitYTTL+VEEm3cXNLMF3XAS7ndeV+3yAy+ZFcIgF7ynkJOTKu/hbFhxJ7mEt5lHZuXTLKX/NIMKsC0SzgdrPLrHWIb+akt151V4krWClvv5uQgKqtSSO4PahQOyyfg0wLgAsRXSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moeMcJEI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747342225; x=1778878225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dY3z1CMqK4/8ea95ZIrCw0VAUNtiyGPXqLu0MHeP0ZY=;
  b=moeMcJEIWEwHrUMzwps4nvIZH6LqMknoxUzoQ5874BGGfD5Gh9ofP/XW
   JQD3EoEgmLUPKodKScA9V5FGVfzo4NxEUNhARgStqcev1QddySJpdjRCD
   i1pI4sqJBfXN6pnHSH3u/JhL2tVgPaM1gnd8+c1zJBHd5GW3c26+T/zWj
   m12rnFA2tdilUSvklgx8mMpQ706oxtidSM8G7EhNhNDtiBS1egJ5b7j+3
   cpy4Om0dp5qiDBJ4ODziFpeCijzlH995gy+8T7ZFHbXYeQHIXFd46fK7h
   kyUjsveglFpmQdijYxrReBqRwaybmQaUD9iYO7RU5pKwYeRHPXJ20LQvb
   g==;
X-CSE-ConnectionGUID: GQZJu0pkRsy2wkA5+i9Rwg==
X-CSE-MsgGUID: ImZAzwZNQxOqpbJnqKGU6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49200150"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="49200150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:50:25 -0700
X-CSE-ConnectionGUID: u6/6xRvUTkyaDtbNrYMezA==
X-CSE-MsgGUID: NCiDefrxTcKrE/7FNGf8pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="139027006"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO svinhufvud) ([10.245.245.59])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:50:22 -0700
Date: Thu, 15 May 2025 23:50:19 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aCZTi2odVXVZjJE8@svinhufvud>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <20250515084403.GQ23592@pendragon.ideasonboard.com>
 <id2ikiio23ahslghpx56niwxrvaqdgmrgk3k647i3u27cptqgz@hwqrkdvljd3b>
 <20250515124050.GA12492@pendragon.ideasonboard.com>
 <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2egx7hakxleahk5o3ngydrcgtlnpgpdj4kgcijfij2bmss7u4d@2yho4udpzjtm>

Hi Mehdi, Laurent,

On Thu, May 15, 2025 at 03:51:33PM +0200, Mehdi Djait wrote:
> Hi Laurent,
> 
> On Thu, May 15, 2025 at 02:40:50PM +0200, Laurent Pinchart wrote:
> > On Thu, May 15, 2025 at 11:17:37AM +0200, Mehdi Djait wrote:
> > > On Thu, May 15, 2025 at 10:44:03AM +0200, Laurent Pinchart wrote:
> > > > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> > > > > On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > > > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > > > 
> > > > > > This helper behaves the same as clk_get_optional() except where there is
> > > > > > no clock producer like in ACPI-based platforms.
> > > > > > 
> > > > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > > > indicated in the property.
> > > > > > 
> > > > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > > 
> > > > > This certainly looks quite useful, thank you for working
> > > > > on this.
> > > > > 
> > > > > Note on some IPU3 platforms where the clk is provided by
> > > > > a clk-generator which is part of a special sensor-PMIC
> > > > > the situation is a bit more complicated.
> > > > > 
> > > > > Basically if there is both a clk provider and a clock-frequency
> > > > > property then the clock-frequency value should be set as freq
> > > > > to the clk-provider, see:
> > > > > 
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> > > > > 
> > > > > for an example of a driver which handles this case.
> > > > 
> > > > On a side note, the DT bindings for the OV8865 doesn't specify the
> > > > clock-frequency property...
> > > 
> > > Is this wrong ?
> > > 
> > > The OV8865 driver was introduced for DT-based systems, where you will
> > > get a reference to the "struct clk corresponding to the clock producer"
> > > and then get the clock-rate/frequency with a call to:
> > > 
> > > 	rate = clk_get_rate(sensor->extclk);
> > > 
> > > The patch "73dcffeb2ff9 media: i2c: Support 19.2MHz input clock in ov8865"
> > > adding support for clock-frequency came later to support ACPI-based
> > > systems (IPU3 here)
> > 
> > I'd expect all device properties to be documented in DT bindings. Is
> > that an incorrect assumption ?
> > 
> 
> I am actually genuinely asking, is the clock-frequency a device property
> of the ov8865 camera sensor or the clock source, which is a separate device ?

The sensor's.

Could we document how this is supposed to work on DT and ACPI?

I think we should also select COMMON_CLK on ACPI systems for sensor
drivers (in a separate patch maybe?), instead of relying on distributions
enabling it.

> 
> Example the imx258 with a fixed-clock, which has its own compatible
> and DT bindings under bindings/clock/fixed-clock.yaml
> 
> So when adding support for ACPI-based systems, the DT bindings should
> not be changed because getting the clock-frequency from the ACPI _DSD
> property is a workaround only needed on ACPI-based systems.

I wouldn't say it's a workaround, but something that's only needed on ACPI
systems.

> 
>     i2c {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         sensor@6c {
>             compatible = "sony,imx258";
>             reg = <0x6c>;
>             clocks = <&imx258_clk>;
> 
>             port {
>                 endpoint {
>                     remote-endpoint = <&csi1_ep>;
>                     data-lanes = <1 2 3 4>;
>                     link-frequencies = /bits/ 64 <320000000>;
>                 };
>             };
>         };
>     };
> 
>     /* Oscillator on the camera board */
>     imx258_clk: clk {
>         compatible = "fixed-clock";
>         #clock-cells = <0>;
>         clock-frequency = <19200000>;
>     };
> 

-- 
Regards,

Sakari Ailus

