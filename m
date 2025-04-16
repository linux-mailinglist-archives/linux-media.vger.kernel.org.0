Return-Path: <linux-media+bounces-30374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CFA9091A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3605816FE2C
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 16:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9A9211A3D;
	Wed, 16 Apr 2025 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhiLd91y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB00178395;
	Wed, 16 Apr 2025 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821104; cv=none; b=BFZzv/b5kW6J/sfajhNUOxizonVYJVmDsMHgoXvFFL49g5JvdNe0f3mq2FJwQQu6fqC6rtHlDVo18cuAct7js0XFdynaQ/U7UZiCmQSm9dcxiU5VHOIABW7EqtOWjHDBZjSQY95iy0VML/vWo3NOZHVTXcezG0Bl9UPi5MJfCL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821104; c=relaxed/simple;
	bh=VOxCjrQ46jmcN2nEj9Qihg84D1Vv/TX3E9KpOjQWLWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLhNGZVkCX5W1bnRNHaeXsNq6ikN1rA0dspzRSA9mSW+D/VAJPkLRGLa/J77tifKBz8ot8tGORxs3aBKdsyL+7dV+pRS8wgajImCbmKk118KHzqqmPQyZW7ACBpjKTZn2398DmAUw1xoq5nISX9FM1wo7pu3svNL7KWramc95L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhiLd91y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744821103; x=1776357103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VOxCjrQ46jmcN2nEj9Qihg84D1Vv/TX3E9KpOjQWLWc=;
  b=fhiLd91yiW2V5dFcDmuEOrSjXq3N08fNc/gZf0ltGqca1Rc0JsNrtXGu
   N1nlYJbL+yjxgBLQ/r0LdI6YcB4G0U6TjQdk5PiSkTK87kgn4Ik7gQTos
   mvxiUCnbpTV6HYoO9Lm2YFA96zpkF3iI/Xb3NiSnEAOoTPzsH9LxRR9HO
   +9XyOo7JJdzDJr0k6nOkf63Sj11A+A225IACWIb41IrfWAKsRlmF1cqhe
   3POzd6wtptWJG9587oj1VBPRLLBGJQHEQYTgZ4fhcDKmd8aJtPd5H+nIY
   /uFGdgwLJ0s/ZCytzc+VSd/U+9+SxdDVcvGVRIaoVpowLKwR9Hpcmgr95
   Q==;
X-CSE-ConnectionGUID: Tl+J1vwhR22UcyL7W2OGfg==
X-CSE-MsgGUID: at/MKXceRUGk8uYpnPGEzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46546025"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46546025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:31:41 -0700
X-CSE-ConnectionGUID: p6VMp7xNS6OXrotq0HaQBg==
X-CSE-MsgGUID: +wzwyImBS/KpginAdzk7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="153724291"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.65])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:31:39 -0700
Date: Wed, 16 Apr 2025 18:31:30 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, 
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <2f73luvvsoxqikskvkxw4yadlhq4vl7ywh5givld7pivj2lyal@ncsyli2uoz74>
References: <20250321093814.18159-1-mehdi.djait@linux.intel.com>
 <20250321101124.GB25483@pendragon.ideasonboard.com>
 <ryzkubgzndeyufi2i4vuwmgaekyapol36oln237ki4m3fh32yl@mpr7g5woiqcf>
 <Z-EL1Y9Fh_0Z8KBt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-EL1Y9Fh_0Z8KBt@kekkonen.localdomain>

Hi Sakari, Laurent,

On Mon, Mar 24, 2025 at 07:37:57AM +0000, Sakari Ailus wrote:
> Hi Laurent, Mehdi,
> 
> On Fri, Mar 21, 2025 at 01:30:43PM +0100, Mehdi Djait wrote:
> > Hi Laurent,
> > 
> > thank you for the review!
> > 
> > On Fri, Mar 21, 2025 at 12:11:24PM +0200, Laurent Pinchart wrote:
> > > Hi Mehdi,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Fri, Mar 21, 2025 at 10:38:14AM +0100, Mehdi Djait wrote:
> > 
> > SNIP
> > 
> > > > +
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
> > > > +#ifdef CONFIG_COMMON_CLK
> > > 
> > > This patch will cause warnings when CONFIG_COMMON_CLK is disabled. Could
> > > you use
> > > 
> > > 	if (IS_REACHABLE(CONFIG_COMMON_CLK)) {
> > > 		...
> > > 	}
> > > 
> > > instead ? It will also ensure that all code gets compile-tested, even
> > > when CONFIG_COMMON_CLK is disabled ?
> > > 
> > > If you want to minimize implementation, you could write
> > > 
> > > 	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> > > 		return ERR_PTR(-ENOENT);
> > > 
> > > and keep the code below as-is.
> > > 
> > 
> > this is indeed way better! I will change this in the v3
> 
> This would work at the moment if devm_clk_hw_register_fixed_rate() was
> always available but it evaluates to __clk_hw_register_fixed_rate() that
> depends on COMMON_CLK.
> 
> I think t he best option would be to add a stub for it for !COMMON_CLK
> case. It may take some time to get that merged and into the media tree. C99
> also allows declaring variables midst of a basic block so declaring rate
> and clkhw later should address the warning.

I don't fully understand the concern with the availability of the
function. It is used by drivers in multiple subsystems and any change to
it should take care of the API users.

Don't you think that adding a stub for !COMMON_CLK would make the series
take a much longer time to get merged and complicate the situation ?

--
Kind Regards
Mehdi Djait

