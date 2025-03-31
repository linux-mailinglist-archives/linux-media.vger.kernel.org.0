Return-Path: <linux-media+bounces-29049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F81A765BA
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF1B1888E7A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CAA1E521E;
	Mon, 31 Mar 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOZ9PRp1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2A155393;
	Mon, 31 Mar 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423807; cv=none; b=t6S6SFjl/hNlv19J/aODwLMzX/6zoukEetqw0LYAIJqjxkvPvMytmX+37Vnl3BTqC5b5egRVCsDEbujAxq0zG0/zVe8UpP2gtdSdR60RR+fzFt+jcvOBmoyKyGXuwImpIzQSwdQA14W19wL13Gb3FIdQR+MrZ2utHCNWb9ef2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423807; c=relaxed/simple;
	bh=EWi5wLB7Wj6tdZhL6cBkn1q8F5l/GoBCMtA+/cgU3ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYK6+jn8FTNw9RcNpHLBvQt1iHZwEuD/f5vVhwuiR/ZIk0qGtDn3YpvPDMP2zHzLSBE8f7YcN7q5bgV9Hle/vuaBiLT5H1pwZJ77WE3hPWUv8BdVrZabdiAOGgs7BWyUEVgYOQQSTvxs9UauaYCOvnUS8xNeP9WsW135JfkgSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOZ9PRp1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743423807; x=1774959807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWi5wLB7Wj6tdZhL6cBkn1q8F5l/GoBCMtA+/cgU3ac=;
  b=LOZ9PRp1XpLCFkmY6F7Dkc3f9sKIT8COYxTTEv2h2+TTGu0DVvBJDLG2
   sdzjrv8aUorD7uuejRChcje60pkqqs4rN5yv3ch1nGqOskyKV1l+QgsC9
   VNOofQoc6EVEoTMXwpSVJsiIUUr2e+I/GaBMpd7zkI0NzangzcgDW2V0w
   E1wXr0Ed3uWNf2JVy00UMZxfndHsoV3cavq+Cn80TYhKEa/UQEeAX5sin
   3JMRBWMP73eIQxo/F/PSCsGIucgPrFOjf5lPlgKUjr3yCuri8UhzI0syI
   SMWEfLd0OH0RW3vr9KW1cNt5iJ6PN9VuS0B9ayiy8W46X1zU6begWwkhY
   A==;
X-CSE-ConnectionGUID: fqiUbfAfT6GeIgjRBAwmPw==
X-CSE-MsgGUID: c+ssvwIpQuaxVThanwDibg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54905682"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="54905682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:23:26 -0700
X-CSE-ConnectionGUID: Um1B+pBuTl2FsDe6/uB38w==
X-CSE-MsgGUID: 0LwPE9hdQJu83eFjcxWQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126061692"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:23:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tzEAj-00000007f3o-1a7D;
	Mon, 31 Mar 2025 15:23:21 +0300
Date: Mon, 31 Mar 2025 15:23:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
 <20250331120748.GB28722@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331120748.GB28722@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 03:07:48PM +0300, Laurent Pinchart wrote:
> On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> > Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > > Convert the module to be property provider agnostic and allow
> > > it to be used on non-OF platforms.
> > 
> > Looks reasonable to me.
> 
> Is that going to work out of the box though ? The calls below read the
> "reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
> addresses using ACPI-specific methods.
> 
> Andy, have you tested this patch on an ACPI system ?

Only compile-tested. But you are right, this is something different here
between OF and ACPI.

I can rephrase the commit message to just point out that fwnode.h shouldn't
be in the drivers and either converting to device property in an assumption
that later it can be easier to support non-OF cases, or using of.h.

-- 
With Best Regards,
Andy Shevchenko



