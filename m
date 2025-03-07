Return-Path: <linux-media+bounces-27836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AEA5673B
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 12:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98CED18991DA
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFD32185AC;
	Fri,  7 Mar 2025 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fm2ao2nT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55238DEC;
	Fri,  7 Mar 2025 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348629; cv=none; b=lAgiXvyqr7EeucRSex0d/o5t9fRBglv5XE/o5cOvmVQEluTa3bVY4K1b7TQAHalHLh5eKVjG5ciZen8XZKh5LngSmqiAJFUn6HY36Zt2OxdzxGDUJTWJounbF8e8HkhdGmEN3W67nqrCE/eNsDr38AtHZ+EsYwmBGIglrmeBwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348629; c=relaxed/simple;
	bh=WIiWFEQkX+KjLhuG43nGWN+Pk1JJ5HVyulINm8vWbQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PppZP6LqmRew6YCoSJbqsBgGa1QFDJJVYVzctRhdJTJY5tP1FY3SMu/FyB4jNlSgcTYHxonYdfpFfhvwKGVewcLbd7fBqUJtQmF19TWnoYeqhNTHc6EbZ/dPQ2Ys8yZCyForAP1UgksZGBIe58YfLDNRFycINevpQyY3GK+TIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fm2ao2nT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741348628; x=1772884628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WIiWFEQkX+KjLhuG43nGWN+Pk1JJ5HVyulINm8vWbQg=;
  b=Fm2ao2nTz0Pikvh2WGZIIISrkziUZl/R4Y3Sefl+4Br3Nash42fkXA8b
   bTXyTzNbym/gIr5m7u+ttng8YH0/QLmJaTqpxncDUfqhKnNprethTqfq2
   9h8ndR+t55lIDb1q2Mibt5WifWr/+AcODZMyEcq2r1f1GfE/lMg2AyaMa
   duA5BCtS2z/wkCPubsPIyiQEA22K9wLbfE3pyPSjr7jcr1Xlt2cHdy2/5
   o0V9g3aUbBrijJfmd9QGTRQstaIMonojM3eFzrH0kK3NVnQRHRktyIk2R
   CdlHjFgABT7bJuY6wueEQ8iT/PbYshmuhV18BkzPCeeAr1aJGMeTdtn9Q
   w==;
X-CSE-ConnectionGUID: /qmosvCxRTuNX4+6JMddsw==
X-CSE-MsgGUID: NTVP2wMQQnGge4LyYGEL9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46049578"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="46049578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:57:08 -0800
X-CSE-ConnectionGUID: uGNvnUiUQxq1x1PJqx4H2g==
X-CSE-MsgGUID: OBs2jp60Tsqnh2ThmVtZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124396113"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:57:04 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E078711F9DA;
	Fri,  7 Mar 2025 13:57:01 +0200 (EET)
Date: Fri, 7 Mar 2025 11:57:01 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <Z8rfDVow6hDeuZRS@kekkonen.localdomain>
References: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
 <Z8rd3ipjkbaE4zfc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8rd3ipjkbaE4zfc@kekkonen.localdomain>

On Fri, Mar 07, 2025 at 11:51:58AM +0000, Sakari Ailus wrote:
> > +	int ret;
> > +
> > +	clk = devm_clk_get_optional(dev, id);
> > +	if (clk || IS_ERR(clk))

I forgot this bit earlier. The IS_ERR() check is redundant.

> > +		return clk;
> > +
> > +	if (!is_acpi_node(dev_fwnode(dev)))
> > +		return ERR_PTR(-EINVAL);

How about -ENOENT? That's what devm_clk_get() returns when there's no such
clock.

-- 
Sakari Ailus

