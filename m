Return-Path: <linux-media+bounces-32264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46261AB3173
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA16B18947B1
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3352586F6;
	Mon, 12 May 2025 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkqoU/Sw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD58255F48;
	Mon, 12 May 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038094; cv=none; b=BQKCoQbEIR5GZ2gpXDIe0ujtesqNTliB6p7gkxA+zVzs49Ke8/vKweDVZxJWVyfPy7jg7Yb1KGUSYC4RzAFG/rUzpy/DpWaTVCKl3OSe8913XX4/yp5ZRiAdRbDhxaS09g2ky8MZnu9vAr6UE1Rn/ZydNsLJycoIWQp0Fp5u26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038094; c=relaxed/simple;
	bh=V/9l1nA9GfnSVL4pLbqxHSUlldMYD8xVk/Us4dULE64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tw3AAZxSPtA33GroitQm8OstNLdFWidIPpcFRbbUNpD3LzUotktlNRrWeFscjV/lVdp3ZaymLTquWAZiO/Tb7faFofMLvLe33/QVABS0ERHsyT5iyR3g6AiRABRZW9hheouOQ7B/j8kCZpRT3jN0obTuCu6s7q8Pkf/e9PZVqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkqoU/Sw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747038093; x=1778574093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V/9l1nA9GfnSVL4pLbqxHSUlldMYD8xVk/Us4dULE64=;
  b=PkqoU/SwtBODwx2AkvqCJP82tN2MvIAdpqS3cUofRewi11E/N25mHIIJ
   BFwYg3FMebk/TQE4wG/I9YUFh64VYsK+sVADkyZ7JPPryuFt/E3EqQsGC
   CEWtheOaWg4021XacnsNmM7snWr7Zc04eyNlVRqnJFluJSBGGpALwJk0A
   w6RVZyibwvWe1FnDS0y+VNUBRC0suFqvDv3LIFe2qYfGNx4C0Z0D4tvG/
   YrK52C3GffwsPDH7rXENGyJcUBPw0Qnq+nyzQMkBUD1h6e4KAe9jwg2Mb
   QXMxsvdYUIk4QF6QzfKzbfehvR7QgMcrjEyNqDdHLrv767OibLLQKDCTY
   A==;
X-CSE-ConnectionGUID: K0kmiKF3SqivXd9j8Njy1A==
X-CSE-MsgGUID: 1ypWQp/OSyeq8CQjWGq+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48898141"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48898141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:21:31 -0700
X-CSE-ConnectionGUID: YFe+8u00Q22/K4cwMjqcEw==
X-CSE-MsgGUID: eF5E27aYRjSMlq+SxQ34CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="174447579"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:21:28 -0700
Date: Mon, 12 May 2025 10:21:21 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, 
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <urd3bng2yixuiny536imfoihhe6uyowynih7gkc4q6pkr6mijy@ggqlz5zu5isf>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
 <aB9M4jUsGA9YAkSm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB9M4jUsGA9YAkSm@kekkonen.localdomain>

Hi Sakari,

On Sat, May 10, 2025 at 12:56:02PM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Mon, Mar 10, 2025 at 01:23:05PM +0100, Mehdi Djait wrote:
> > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > This helper behaves the same as clk_get_optional() except where there is
> > no clock producer like ACPI-based platforms.
> > 
> > For ACPI-based platforms the function will read the "clock-frequency"
> > ACPI _DSD property and register a fixed frequency clock with the frequency
> > indicated in the property.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

SNIP

> > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > +{
> > +	struct clk_hw *clk_hw;
> > +	struct clk *clk;
> > +	u32 rate;
> > +	int ret;
> > +
> > +	clk = devm_clk_get_optional(dev, id);
> > +	if (clk)
> > +		return clk;
> > +
> > +	if (!is_acpi_node(dev_fwnode(dev)))
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	if (!id) {
> > +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> > +		if (!id)
> > +			return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> 
> devm_clk_hw_register_fixed_rate() is only available when COMMON_CLK is
> enabled. You need #ifdefs here. In practice without CCF only
> devm_clk_get_optional() is useful I guess.
> 

I added a call to IS_REACHABLE(CONFIG_COMMON_CLK) in the v4 of this patch:
https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/

> Another question is then how commonly COMMON_CLK is enabled e.g. on x86
> systems. At least Debian kernel has it. Presumably it's common elsewhere,
> too.

on Arch linux it is also enabled and Fedora also. I would also assume it
is also enabled in the other linux distros.

--
Kind Regards
Mehdi Djait

