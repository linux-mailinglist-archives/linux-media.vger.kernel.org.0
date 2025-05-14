Return-Path: <linux-media+bounces-32477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0BAB6A64
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 653FD7A678E
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3D82749C0;
	Wed, 14 May 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg6G6o65"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD5270571;
	Wed, 14 May 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222999; cv=none; b=LAgNjCWEXrozQZKyyuk45aAN4Vt70TBn00+5R7/Rsi9Ox/m11Xm+/5DCnI1Zqled1/3wIjXd+2Tev52C0aOg97E8TgTVu69boveoUhes/K7GXMBxf0UX+Ie1H7Q0TB0RMLaMFKiuEX3ltfyCQrStDFLgNQiIPxIpVQMJtC58AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222999; c=relaxed/simple;
	bh=Wg89B9BF8gDk/rIHsMm38bILu0tdfZNg8CzBjsrLAic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLLGD1f0Lyi/EabEqh5PL06SJSMCG26Hhyd4nd40lHn7CclyAUdf0uFNqYoP6jTv30XyKZIZfGS3FcOwnvNb2RQYQKp9Nf0Iufb0c+V8uIvAvBd8TBh5JKKGlG8VXJ8sGZApAN1GRJPwWf06tMqOkXh6BmLn7hdHLbht2ps/jFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg6G6o65; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747222997; x=1778758997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wg89B9BF8gDk/rIHsMm38bILu0tdfZNg8CzBjsrLAic=;
  b=Tg6G6o65UpU9J3yck4GNovYc6vHuMIsI32egncpdd1j8ClbtUojKIsN7
   To3NHBBmNCcOp+TaHPROsaxNacLv2OiM81B9Rj92vHN55jZB6lJbqjEpX
   gApGMJDjZcpKfcjbm5Mxw3eE2hWQrHwuHNAE+eD8AAiwoVE4p9O96IN1p
   6ued2IWHf5oBn2gdPdQD1TmOVhecYDhmMEHx6bXBq8Or2tTHccQkfncMZ
   Phi4kW99M37boNAWF8OM1lO0qES0mbNeyIj70Db0r6gyjrAVOEdMp4wki
   rMZhuJoezS5AyxeUmDKVo2VMpsrsu2xEGrI/x9EQK9Cy7NmJjQHvRiWfl
   Q==;
X-CSE-ConnectionGUID: dnxgEkT2QuCRM2QlVh6pWg==
X-CSE-MsgGUID: GdGVFgknS6yhS36Owzqd1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48364088"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="48364088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:43:16 -0700
X-CSE-ConnectionGUID: PQfKtnYPTMunV+I4g3NcwQ==
X-CSE-MsgGUID: f+qGa+x2RjCR/jjYLVOSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142781145"
Received: from ettammin-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.222])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:43:14 -0700
Date: Wed, 14 May 2025 13:43:03 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, 
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <dumi72cs5fc423kidnmbtxgbsbir5r3f5u4pyzola7wvznyh2l@4otjmv2qaqjv>
References: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
 <aB9M4jUsGA9YAkSm@kekkonen.localdomain>
 <urd3bng2yixuiny536imfoihhe6uyowynih7gkc4q6pkr6mijy@ggqlz5zu5isf>
 <aCIWk3tiTUM0TeEa@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCIWk3tiTUM0TeEa@svinhufvud>

Hi Sakari,

On Mon, May 12, 2025 at 06:41:07PM +0300, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Mon, May 12, 2025 at 10:21:21AM +0200, Mehdi Djait wrote:
> > Hi Sakari,
> > 
> > On Sat, May 10, 2025 at 12:56:02PM +0000, Sakari Ailus wrote:
> > > Hi Mehdi,
> > > 
> > > On Mon, Mar 10, 2025 at 01:23:05PM +0100, Mehdi Djait wrote:
> > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > 
> > > > This helper behaves the same as clk_get_optional() except where there is
> > > > no clock producer like ACPI-based platforms.
> > > > 
> > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > indicated in the property.
> > > > 
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > SNIP
> > 
> > > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > > +{
> > > > +	struct clk_hw *clk_hw;
> > > > +	struct clk *clk;
> > > > +	u32 rate;
> > > > +	int ret;
> > > > +
> > > > +	clk = devm_clk_get_optional(dev, id);
> > > > +	if (clk)
> > > > +		return clk;
> > > > +
> > > > +	if (!is_acpi_node(dev_fwnode(dev)))
> > > > +		return ERR_PTR(-ENOENT);
> > > > +
> > > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > > > +
> > > > +	if (!id) {
> > > > +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> > > > +		if (!id)
> > > > +			return ERR_PTR(-ENOMEM);
> > > > +	}
> > > > +
> > > > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > > 
> > > devm_clk_hw_register_fixed_rate() is only available when COMMON_CLK is
> > > enabled. You need #ifdefs here. In practice without CCF only
> > > devm_clk_get_optional() is useful I guess.
> > > 
> > 
> > I added a call to IS_REACHABLE(CONFIG_COMMON_CLK) in the v4 of this patch:
> > https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/
> 
> I wonder if this approach works. Depending on the compiler implementation,
> the compiler could (or even should) still run into issues in finding an
> unresolvable symbol, even if the symbol is not reachable and can be
> optimised away.
> 

So I discussed with Arnd about this (He introduced IS_REACHABLE()):

- IS_REACHABLE() is actually discouraged [1]

- COFIG_COMMON_CLK is a bool, so IS_ENABLED() will be the right solution here

- usage of IS_ENABLED() is also encouraged in the coding style [2]

- we will not face compiler issues because the kernel relies on
  dead code elimination in the compiler. (Actually I remember this is
  one of the reasons why you cannot compile the kernel with optimization
  turned off. I don't know how much this argument holds today [3]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/kbuild/kconfig-language.rst?h=next-20250513&id=700bd25bd4f47a0f4e02e0a25dde05f1a6b16eea
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n1178
[3] https://lore.kernel.org/all/20080909160452.GB30160@cs181140183.pp.htv.fi/

> > 
> > > Another question is then how commonly COMMON_CLK is enabled e.g. on x86
> > > systems. At least Debian kernel has it. Presumably it's common elsewhere,
> > > too.
> > 
> > on Arch linux it is also enabled and Fedora also. I would also assume it
> > is also enabled in the other linux distros.
> 
> Ack, thanks for checking.
> 
> -- 
> Regards,
> 
> Sakari Ailus

--
Kind Regards
Mehdi Djait

