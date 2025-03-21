Return-Path: <linux-media+bounces-28565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEBA6BABA
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 13:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267A219C0094
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 12:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18642288D2;
	Fri, 21 Mar 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+gHOcvZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D02253FC;
	Fri, 21 Mar 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560256; cv=none; b=YXLJzvbGE6bqaB02EB3FPHC/ePIxbGE3CVT+ob4s31JDm1qW2L3eE02SSiEgpzAV9Pd6FAiymB1CZm/XwmuF2pQIXCf5eBR175iWHEG09AnFY2BMAP/63HzwzoPg36xY9zqEc8JmR6aaf85ueWphGC9WXz9dIHkiu6l8752p3M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560256; c=relaxed/simple;
	bh=Jd+JJd6lzgEfL1eIohG724QZbmIdDrYxX1bFqtpyW18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRSBXkzQcOL0dA/1DPESQx0ZpeXA83whfJFBa+ruuh6gqtLr0werB03Rqe5WVB5AS+5uonFbhbbVyIJSdMKeP7oEZmMfpEl4XpQ75bLFoDAdN3REPWCNTPPFDnEuxxNFU+PLrVfghBSRvh3GcYzR9NUEozOI27UQbODnhoBg1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+gHOcvZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742560255; x=1774096255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jd+JJd6lzgEfL1eIohG724QZbmIdDrYxX1bFqtpyW18=;
  b=k+gHOcvZ8xhYPJpShzDCUL0rqB8W7BLbqFwpS+UQ3uxySoutlee4m/R9
   J7BytlT1WYW0ttjJRlV5Inuo3+vubQnCyLI96f/qcYOQJt8Y072QT+XBU
   /Yws+1t6i9OxS43JknyyEW7enw3rWRNqOoo8P39zjrxuAxCBoMfeYpapx
   kGHJ9jUCOHfKKc4wmiyGcsei8lexgpWvxHsf8AG9z568lsw86VTXPocpn
   rwVqs90ZgxmsqyGEPB5jNHF/qPl9kR4k2jukJlQmsZ2CHEgQkzevOaQ6Z
   TYuu9ZVhqRy0IL8SjK4CQVeu6Mvn257bc8Gmp5qlaqVGPl8KqW/FMWpev
   Q==;
X-CSE-ConnectionGUID: 2E4UgMJtSg+9ZdyT+uXqGg==
X-CSE-MsgGUID: NiSavQ0tQ0W4+dDXqSqobQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43838239"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43838239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 05:30:54 -0700
X-CSE-ConnectionGUID: 2s/hjFg9Tva+bnES1mMocA==
X-CSE-MsgGUID: nawoRJgzQqiNnr0Lnsx3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128214603"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.43])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 05:30:51 -0700
Date: Fri, 21 Mar 2025 13:30:43 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com, 
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com, 
	naush@raspberrypi.com, mchehab@kernel.org, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <ryzkubgzndeyufi2i4vuwmgaekyapol36oln237ki4m3fh32yl@mpr7g5woiqcf>
References: <20250321093814.18159-1-mehdi.djait@linux.intel.com>
 <20250321101124.GB25483@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321101124.GB25483@pendragon.ideasonboard.com>

Hi Laurent,

thank you for the review!

On Fri, Mar 21, 2025 at 12:11:24PM +0200, Laurent Pinchart wrote:
> Hi Mehdi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 21, 2025 at 10:38:14AM +0100, Mehdi Djait wrote:

SNIP

> > +
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
> > +#ifdef CONFIG_COMMON_CLK
> 
> This patch will cause warnings when CONFIG_COMMON_CLK is disabled. Could
> you use
> 
> 	if (IS_REACHABLE(CONFIG_COMMON_CLK)) {
> 		...
> 	}
> 
> instead ? It will also ensure that all code gets compile-tested, even
> when CONFIG_COMMON_CLK is disabled ?
> 
> If you want to minimize implementation, you could write
> 
> 	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
> 		return ERR_PTR(-ENOENT);
> 
> and keep the code below as-is.
> 

this is indeed way better! I will change this in the v3

> > +	if (!is_acpi_node(dev_fwnode(dev)))
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	if (!id) {
> > +		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
> 
> As far as I understand, the name doesn't need to stay valid after
> devm_clk_hw_register_fixed_rate() returns. You can call kasprintf here,
> and call kfree after devm_clk_hw_register_fixed_rate(). You could use
> __free to manage the memory life time:
> 
> 	const char *clk_id __free(kfree) = NULL;
> 
> 	if (!id) {
> 		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> 		if (!clk_id)
> 			return ERR_PTR(-ENOMEM);
> 		id = clk_id;
> 	}
> 

Ack.

--
Kind Regards
Mehdi Djait

