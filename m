Return-Path: <linux-media+bounces-32448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A082AB65E8
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961DB189ED7E
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 08:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46721FF2F;
	Wed, 14 May 2025 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SR9XP5cP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676721FF2D;
	Wed, 14 May 2025 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211151; cv=none; b=Z738/0Zwh8vyOZKivOjtehNhc8jvzWHlDZWPk8KjZrNI57lW5sFZ3IuUf9663JsuMWSntKP92SzdU+zxvOyZmFsgbe6dNBpV81ly5T15nYN37QhrpKDcnQZyTTt7J1q0uL5MhWd00kMvZ06P7MuiQ2/vpNTWVWLDzpyh5S89jjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211151; c=relaxed/simple;
	bh=HtHDjWfGtN0kaERKegXTHdWKl092bZPW8dRDILDzl2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tynRDZvfXau3285mvMxngX451KTUQhKXP57g44CqaIwrtA+wyyLajDl6BlLVm8AaKM2pMGb6++xQ2vbYE98iwURYMDc3o2EtYc9fsaq2pHpGtjF4vdvqL926MwGENm9rHHiwuExiS0jc4UYtvLmGrg2yisTLwtxsCoah4fJSQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SR9XP5cP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747211151; x=1778747151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HtHDjWfGtN0kaERKegXTHdWKl092bZPW8dRDILDzl2Y=;
  b=SR9XP5cPYcM6k7ZcLBUO2Zn6E1wk4F3egk1iG9iYqLsg2wuS0zXrOgZe
   qUDfKe06t/Xjs3NYLREaxBn2ApFSyKtvwG+I8KQ+vLyTz7KcXZuG0Thez
   9j8CvjaRBaFOGBmyloxwC8y7ULjvMK4Bv60dDy2KGtORoawzvzOEDu+Lb
   vJooQBOmA0nzglfuKE58/zuqP3qhZ7Nlz0QxEdKnJl445rGXqpYs/eBis
   5CBRXykPaAY24l4l6e/LrQS8dWCe7MpDKkybJu8sFXXi09hfojzTG2xGQ
   Q/CXTrXR7vVhdQjGbeTvkPF/lOzXbaSbKVUqm/j0lcueXrX2LE8IWKeHA
   A==;
X-CSE-ConnectionGUID: sN1xnEHKSR6L6oYZ5DCubA==
X-CSE-MsgGUID: z7dEfjtLT8KJY8F5NgGQkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48962696"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48962696"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:25:50 -0700
X-CSE-ConnectionGUID: +5oQgNfWS4OKRPz9Fxm98g==
X-CSE-MsgGUID: HWQL2Jd7Q+G2LVGkXeW1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142729518"
Received: from opintica-mobl1 (HELO mdjait-mobl) ([10.245.245.145])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:25:46 -0700
Date: Wed, 14 May 2025 10:25:36 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, 
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com, mchehab@kernel.org, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <dhbbpogydqclblzpd2qn2tr2cyyh5gq5cgostzbiq6ygsixj46@oopsp75svt4c>
References: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
 <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f467e4a8-fcb2-4345-b8f7-7557c1a7552b@redhat.com>

Hello Hans,

thank you for the comment.

On Sat, May 10, 2025 at 04:21:09PM +0200, Hans de Goede wrote:
> Hi Mehdi,
> 
> On 21-Mar-25 2:03 PM, Mehdi Djait wrote:
> > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > This helper behaves the same as clk_get_optional() except where there is
> > no clock producer like in ACPI-based platforms.
> > 
> > For ACPI-based platforms the function will read the "clock-frequency"
> > ACPI _DSD property and register a fixed frequency clock with the frequency
> > indicated in the property.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> This certainly looks quite useful, thank you for working
> on this.
> 
> Note on some IPU3 platforms where the clk is provided by
> a clk-generator which is part of a special sensor-PMIC
> the situation is a bit more complicated.
> 
> Basically if there is both a clk provider and a clock-frequency
> property then the clock-frequency value should be set as freq
> to the clk-provider, see:
> 

is it even possible to get a reference to the clock producer in ACPI
systems or am I missing something here ?

Here is what I gathered online for the discussion leading to this patch:
----------------------------------------------------------------------------------------------------------------------------------------------
ClockInput resource added to ACPI v6.5: https://uefi.org/specs/ACPI/6.5/19_ASL_Reference.html#clockinput-clock-input-resource-descriptor-macro
- commit adding ClockInput resource to acpica: https://github.com/acpica/acpica/commit/661feab5ee01a34af95a389a18c82e79f1aba05a
- commit kernel upstream: 520d4a0ee5b6d9c7a1258ace6caa13a94ac35ef8 "ACPICA: add support
  for ClockInput resource (v6.5)"

this does not mean we can use it: I found this out-of-tree patch to supports fixed clock sources
https://github.com/niyas-sait/linux-acpi/blob/main/0001-acpi-add-clock-bindings-for-fixed-clock-resources.patch
it was not sent to the acpi mailing list. It was mentioned in this
dicussion: https://lore.kernel.org/linux-kernel/78763d69bae04204b2af37201b09f8b5@huawei.com/

Another interesting link: https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28822175758/ACPI+Clock+Input+Resources
----------------------------------------------------------------------------------------------------------------------------------------------

link for the dicussion: https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov8865.c#n3020
> 
> for an example of a driver which handles this case.

So if I understood the above correctly: in the ov8865 IPU3/ACPI case:

1) sensor->extclk is NULL because the clock producer is not available in
ACPI systems. ClockInput() ACPI resource was introduced to acpica after
the ov8865 patch and the resource is not even being used in the upstream kernel.

2) the sensor->extclk_rate will be set from reading
the clock-frequency _DSD property in:

	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);

> 
> IMHO it would be good if the generic helper would handle
> this case too and if there is both a clk-provider and
> a clock-frequency property then try to set the clock-frequency
> value with clk_set_rate(), arguably you could just warn on
> a failure to set the rate though, instead of the error
> the ov8865 driver currently throws.
> 
> Sakari, Laurent any opinions on adding handling this case
> to the generic helper ?
> 
> Regards,
> 
> Hans

--
Kind Regards
Mehdi Djait

