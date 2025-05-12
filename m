Return-Path: <linux-media+bounces-32308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC460AB3C62
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 17:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8B419E119D
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 15:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095DD23C4FB;
	Mon, 12 May 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwuC18iO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C42227E8A;
	Mon, 12 May 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064475; cv=none; b=mm3coPPrzIF2Yt+EXxRG0Dxl+K/9XTsUut7jlpMuWkQSVB1FezuRMy1/Lh3a3CMGmzvGmBOZ7uorxLqM4kqu3DPnp0iBqRLs8h/W/8UosekrGhvRBCrV4l/MA6IZTKlMtw7l2Bqf6Z/bgZjY6/0ojvxhZ6PwjbCGb1HK1Jl/f+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064475; c=relaxed/simple;
	bh=VDdATa+HcKdEYNH1Uezx0/g1TdiHY2c3Y9Aauwfm56M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvlehpTpvKMj/TiHLP0uyjU5tbkQzIbcr1xOfZ1xHb4Xu6HJCXlu5QUZzluLklB3vfuttPP5sT0olB3ODpV6Wy2/0rld3tvPMoi+B4B9ajLcCOPZKjlNf30rLVrqaxK+VkxrDqVAHuiYuarw5vcT7scIYjFILgg7ly2qVgQ3Iao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwuC18iO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747064474; x=1778600474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VDdATa+HcKdEYNH1Uezx0/g1TdiHY2c3Y9Aauwfm56M=;
  b=BwuC18iOB4+9h4tV/zMjSw2T0yhJxyTIIo6T1ZZ593LfYx7o5S/scskO
   R6lG3JXHEACS6SQk0v7l5KqOu9kiVYiAwcfxBiebJ62PVXdWM9jq5T2Q2
   HUoIKUSC7Hs72cagMYhvHspFbvs/17lJi7k6ehwXrddXHvHeG6YGbO5qz
   TeA4U5KgnvMHXSa+2n2O0PkJLOlih8FHRAfSE54Yt3/X78Qg9QEsEAmeu
   IARYW0mRyPhwteUMTZ1Rr8UYh2ca2vLKgKWwJQYA325WlXCKq8y1n6pR1
   ZMeN4kM1TKit8YPAgliny21rykqvid/+adwEhEDv/NU5MaYCEYXveJCh0
   g==;
X-CSE-ConnectionGUID: kXwdPxxIQgyERjzSQDtr1A==
X-CSE-MsgGUID: zxein/zWSnSMHdqiRvIcxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49034608"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="49034608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 08:41:13 -0700
X-CSE-ConnectionGUID: G3tKZJfxQ5uQJSjRtaNfig==
X-CSE-MsgGUID: rLeN7IA+SOqPQzO+D7C2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="138365264"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO svinhufvud) ([10.245.244.52])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 08:41:09 -0700
Date: Mon, 12 May 2025 18:41:07 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aCIWk3tiTUM0TeEa@svinhufvud>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
 <aB9M4jUsGA9YAkSm@kekkonen.localdomain>
 <urd3bng2yixuiny536imfoihhe6uyowynih7gkc4q6pkr6mijy@ggqlz5zu5isf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <urd3bng2yixuiny536imfoihhe6uyowynih7gkc4q6pkr6mijy@ggqlz5zu5isf>

Hi Mehdi,

On Mon, May 12, 2025 at 10:21:21AM +0200, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Sat, May 10, 2025 at 12:56:02PM +0000, Sakari Ailus wrote:
> > Hi Mehdi,
> > 
> > On Mon, Mar 10, 2025 at 01:23:05PM +0100, Mehdi Djait wrote:
> > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > platforms to retrieve a reference to the clock producer from firmware.
> > > 
> > > This helper behaves the same as clk_get_optional() except where there is
> > > no clock producer like ACPI-based platforms.
> > > 
> > > For ACPI-based platforms the function will read the "clock-frequency"
> > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > indicated in the property.
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> SNIP
> 
> > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > +{
> > > +	struct clk_hw *clk_hw;
> > > +	struct clk *clk;
> > > +	u32 rate;
> > > +	int ret;
> > > +
> > > +	clk = devm_clk_get_optional(dev, id);
> > > +	if (clk)
> > > +		return clk;
> > > +
> > > +	if (!is_acpi_node(dev_fwnode(dev)))
> > > +		return ERR_PTR(-ENOENT);
> > > +
> > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	if (!id) {
> > > +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> > > +		if (!id)
> > > +			return ERR_PTR(-ENOMEM);
> > > +	}
> > > +
> > > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > 
> > devm_clk_hw_register_fixed_rate() is only available when COMMON_CLK is
> > enabled. You need #ifdefs here. In practice without CCF only
> > devm_clk_get_optional() is useful I guess.
> > 
> 
> I added a call to IS_REACHABLE(CONFIG_COMMON_CLK) in the v4 of this patch:
> https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/

I wonder if this approach works. Depending on the compiler implementation,
the compiler could (or even should) still run into issues in finding an
unresolvable symbol, even if the symbol is not reachable and can be
optimised away.

> 
> > Another question is then how commonly COMMON_CLK is enabled e.g. on x86
> > systems. At least Debian kernel has it. Presumably it's common elsewhere,
> > too.
> 
> on Arch linux it is also enabled and Fedora also. I would also assume it
> is also enabled in the other linux distros.

Ack, thanks for checking.

-- 
Regards,

Sakari Ailus

