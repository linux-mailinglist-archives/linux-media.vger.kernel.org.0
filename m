Return-Path: <linux-media+bounces-28603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590BA6D550
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4EF3B2D0F
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 07:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0082580DF;
	Mon, 24 Mar 2025 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i182jnZT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6802580CC;
	Mon, 24 Mar 2025 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801885; cv=none; b=be//CP5PmyYlnv9pQfa4xXGGiZ6Br8Cv7peuiUecRkNCaBQ+wDJMssdmce1fXLHYCdwospBWDIkhqE94b2xAbOb78z3AFsj88Pd4CjEW8AzojTa3EXMbIQFEzTwfLEaW3OiOfXLP+g8gzvWYbElxS7bRBxgup/46+PqzvnIP4LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801885; c=relaxed/simple;
	bh=+zNwDvBHc6Iy+Bym23/g2A0Pz5hmPzXzTjB2AtRQzuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF7myiPg3vLZQGsJ2qYiY9R31phZUH4AjfxOodqZ+1GLY3DjV/7kzVMzAnZXc829aw4kkct5w9GYx3oH2QqUc7z/UBCgq9Oc34BYm9lA7jxT5C2bo4htsj2teQF72ajEiq1EOlfJSWDnMxJdjXqp88mdrqD9scq6AKXfRCUi6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i182jnZT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742801884; x=1774337884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zNwDvBHc6Iy+Bym23/g2A0Pz5hmPzXzTjB2AtRQzuc=;
  b=i182jnZTbd8HZEz7446QDXC4DHAcbw68tjO0zVvwJk+T65+/CNHAD8fo
   iMy3D9IfEvOH+hmdh98RQXu1RCBUbK9y7meS1f803n2w+PgXEwTfKNVjk
   EUbnq4cJcHozOHLjmgI0zViLO+MWjcIyyL60cRTTVpKsXdqdfthRuElMl
   wBKMKlI2Lr7KZmDm/6/hEoxsxiTqrMof7CFWjNuKzDaE+lb6zo39dYs6E
   YgUOb7lhyZ/1J3P8ub5bpGGZeiS0wqSEUrTSXdMMQqWPLBc8x0ZwqlbbQ
   +d1VnLOd5OjNGNn/kpN1d2y93w/mgRriNqNt6yyBl2jitFbOS3ZAIzHIs
   g==;
X-CSE-ConnectionGUID: S5ASHaJkRqmPIQkL1JbMsA==
X-CSE-MsgGUID: NeUkaGr1RsCuJLsevJlnig==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="66459034"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="66459034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 00:38:03 -0700
X-CSE-ConnectionGUID: jzLYqVEJSuKkE0GJaXaozA==
X-CSE-MsgGUID: eEFpxMbATiuaylW4BJHlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="124125564"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 00:38:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A6CE120AB3;
	Mon, 24 Mar 2025 09:37:57 +0200 (EET)
Date: Mon, 24 Mar 2025 07:37:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <Z-EL1Y9Fh_0Z8KBt@kekkonen.localdomain>
References: <20250321093814.18159-1-mehdi.djait@linux.intel.com>
 <20250321101124.GB25483@pendragon.ideasonboard.com>
 <ryzkubgzndeyufi2i4vuwmgaekyapol36oln237ki4m3fh32yl@mpr7g5woiqcf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ryzkubgzndeyufi2i4vuwmgaekyapol36oln237ki4m3fh32yl@mpr7g5woiqcf>

Hi Laurent, Mehdi,

On Fri, Mar 21, 2025 at 01:30:43PM +0100, Mehdi Djait wrote:
> Hi Laurent,
> 
> thank you for the review!
> 
> On Fri, Mar 21, 2025 at 12:11:24PM +0200, Laurent Pinchart wrote:
> > Hi Mehdi,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Mar 21, 2025 at 10:38:14AM +0100, Mehdi Djait wrote:
> 
> SNIP
> 
> > > +
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
> > > +#ifdef CONFIG_COMMON_CLK
> > 
> > This patch will cause warnings when CONFIG_COMMON_CLK is disabled. Could
> > you use
> > 
> > 	if (IS_REACHABLE(CONFIG_COMMON_CLK)) {
> > 		...
> > 	}
> > 
> > instead ? It will also ensure that all code gets compile-tested, even
> > when CONFIG_COMMON_CLK is disabled ?
> > 
> > If you want to minimize implementation, you could write
> > 
> > 	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> > 		return ERR_PTR(-ENOENT);
> > 
> > and keep the code below as-is.
> > 
> 
> this is indeed way better! I will change this in the v3

This would work at the moment if devm_clk_hw_register_fixed_rate() was
always available but it evaluates to __clk_hw_register_fixed_rate() that
depends on COMMON_CLK.

I think t he best option would be to add a stub for it for !COMMON_CLK
case. It may take some time to get that merged and into the media tree. C99
also allows declaring variables midst of a basic block so declaring rate
and clkhw later should address the warning.

> 
> > > +	if (!is_acpi_node(dev_fwnode(dev)))
> > > +		return ERR_PTR(-ENOENT);
> > > +
> > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	if (!id) {
> > > +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> > 
> > As far as I understand, the name doesn't need to stay valid after
> > devm_clk_hw_register_fixed_rate() returns. You can call kasprintf here,
> > and call kfree after devm_clk_hw_register_fixed_rate(). You could use
> > __free to manage the memory life time:
> > 
> > 	const char *clk_id __free(kfree) = NULL;
> > 
> > 	if (!id) {
> > 		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> > 		if (!clk_id)
> > 			return ERR_PTR(-ENOMEM);
> > 		id = clk_id;
> > 	}
> > 
> 
> Ack.
> 

-- 
Kind regards,

Sakari Ailus

