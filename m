Return-Path: <linux-media+bounces-33006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B736ABF20B
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A6767A2AC6
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A488425F7AF;
	Wed, 21 May 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GtasTSQy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892D2309B9;
	Wed, 21 May 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824532; cv=none; b=PKwd8RWloGrLzqBB7zrEEr7Z3LLhH4oiKoPEKY+l8QY+xXH/z/VVOLa+USPHx7HF0RFI9OVs0jR+Lqy5YrZtigwU2v5Pin5jUDdEcHppbDy8QV73fkOCxNycdS7a/n4NOSG9OnjsRvaYQQvWG6u0Hba5gHt8xNlkJ1H+aFwzmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824532; c=relaxed/simple;
	bh=6CUKKKeDgV9smgXKUu4MFaeCrIIsIn96LxsfZEQVSL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q54aGIG+x+tCY/7dem0vBUwH9/ZlMm+pi/cWIfKjpQJQFY0EbtjiPfrsGbVsm6sAoLIQUH2ZjUA7l5B7OjUIBMJiD0ynBNNBHkBAoJIOIyyBm77JYGgPwCulgmGDSdZWfaZXSWJKSuOKCKvxeJsOzF+8U2Bm9Ev+Rx3JFLYwUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GtasTSQy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFC5F6B5;
	Wed, 21 May 2025 12:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747824507;
	bh=6CUKKKeDgV9smgXKUu4MFaeCrIIsIn96LxsfZEQVSL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtasTSQy9odMOr5GuEV23Ne/Vn1MDqVTrfBDGCVGkd0j/AqG+sEF5h4HIxSZUVnLW
	 3oIpZ2H7yKxhUFSB6JuMM8Ct8IL/zzBGCVdh8KyZm+++uIto1Ipu4BXR9atXSKDOPv
	 VZnTNlgInKsOwcr30nHFnRmLMM21id0ufEOufO/k=
Date: Wed, 21 May 2025 12:48:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, dave.stevenson@raspberrypi.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250521104842.GE12514@pendragon.ideasonboard.com>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
 <dhbbpogydqclblzpd2qn2tr2cyyh5gq5cgostzbiq6ygsixj46@oopsp75svt4c>
 <1fe6d5fa-d379-4b1b-832c-31923d729833@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1fe6d5fa-d379-4b1b-832c-31923d729833@redhat.com>

Hi Hans,

On Tue, May 20, 2025 at 10:45:17AM +0200, Hans de Goede wrote:
> On 14-May-25 10:25 AM, Mehdi Djait wrote:
> > On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> >> On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> >>> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> >>> platforms to retrieve a reference to the clock producer from firmware.
> >>>
> >>> This helper behaves the same as clk_get_optional() except where there is
> >>> no clock producer like in ACPI-based platforms.
> >>>
> >>> For ACPI-based platforms the function will read the "clock-frequency"
> >>> ACPI _DSD property and register a fixed frequency clock with the frequency
> >>> indicated in the property.
> >>>
> >>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >>
> >> This certainly looks quite useful, thank you for working
> >> on this.
> >>
> >> Note on some IPU3 platforms where the clk is provided by
> >> a clk-generator which is part of a special sensor-PMIC
> >> the situation is a bit more complicated.
> >>
> >> Basically if there is both a clk provider and a clock-frequency
> >> property then the clock-frequency value should be set as freq
> >> to the clk-provider, see:
> > 
> > is it even possible to get a reference to the clock producer in ACPI
> > systems or am I missing something here ?
> 
> Yes in some special cases it is possible to get a reference to
> a clock provider on ACPI. E.g. one is provided by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/int3472/tps68470.c
> 
> on x86 ACPI systems using that sensor PMIC such as the
> "Microsoft Surface Go" and "Microsoft Surface Go 2"
> 
> > Here is what I gathered online for the discussion leading to this patch:
> > ----------------------------------------------------------------------------------------------------------------------------------------------
> > ClockInput resource added to ACPI v6.5: https://uefi.org/specs/ACPI/6.5/19_ASL_Reference.html#clockinput-clock-input-resource-descriptor-macro
> > - commit adding ClockInput resource to acpica: https://github.com/acpica/acpica/commit/661feab5ee01a34af95a389a18c82e79f1aba05a
> > - commit kernel upstream: 520d4a0ee5b6d9c7a1258ace6caa13a94ac35ef8 "ACPICA: add support
> >   for ClockInput resource (v6.5)"
> 
> Ah I see where the confusion is coming from, the clk-provider does not come
> directly from ACPI, it comes from the PMIC driver and the PMIC driver also
> adds a clk-lookup table entry to associate it with the PMIC.
> 
> > this does not mean we can use it: I found this out-of-tree patch to supports fixed clock sources
> > https://github.com/niyas-sait/linux-acpi/blob/main/0001-acpi-add-clock-bindings-for-fixed-clock-resources.patch
> > it was not sent to the acpi mailing list. It was mentioned in this
> > dicussion: https://lore.kernel.org/linux-kernel/78763d69bae04204b2af37201b09f8b5@huawei.com/
> >
> > Another interesting link: https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28822175758/ACPI+Clock+Input+Resources
> > ----------------------------------------------------------------------------------------------------------------------------------------------
> > 
> > link for the dicussion: https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/
> 
> These 2 links are not relevant, the clk-provider is not directly coming from
> ACPI instead the clk is registered by the PMIC driver for the clk-generator
> part of the PMIC.
> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> >>
> >> for an example of a driver which handles this case.
> > 
> > So if I understood the above correctly: in the ov8865 IPU3/ACPI case:
> > 
> > 1) sensor->extclk is NULL because the clock producer is not available in
> > ACPI systems. ClockInput() ACPI resource was introduced to acpica after
> > the ov8865 patch and the resource is not even being used in the upstream kernel.
> 
> In this specific case it will be not NULL because the PMIC driver
> provides a clk-provider and creates a clk-lookup to match that
> to the ov8865 sensor.
> 
> > 2) the sensor->extclk_rate will be set from reading
> > the clock-frequency _DSD property in:
> > 
> > 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);
> 
> This bit is correct, the special thing here is that the PMIC
> clk-provider is programmable so the sensor-driver needs to
> set it to the rate returned by reading "clock-frequency"/
> 
> So basically first call both:
> 
> 1. devm_get_clk()
> 2. fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);
> 
> and in the special case when *both* succeed do a clk_set_rate()
> call on the returned clk setting it to "rate".

An idea that struck me just now: if the ipu-bridge driver creates the
clock-frequency swnode property, couldn't it also (or instead) set the
clock frequency, in a similar way that the assigned-clock-rates property
is handled in DT ? That would unify the ACPI and DT cases for sensor
drivers.

I don't know how difficult this would be to implement, but I see there's
already a call to of_clk_set_defaults() in i2c_device_probe(), so maybe
this could "just" be turned into a fwnode_clk_set_defaults() ?

-- 
Regards,

Laurent Pinchart

