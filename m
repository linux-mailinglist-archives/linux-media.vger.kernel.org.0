Return-Path: <linux-media+bounces-29078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 076EDA76BE1
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E78F1889C63
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C92147E8;
	Mon, 31 Mar 2025 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOY95uwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1242144B6;
	Mon, 31 Mar 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438154; cv=none; b=FjjjgcCKsRUwKH+OavH0xlLKL3kCgqR1xX6mJ/mgKh2LZOQ+7XjZ/ASlme176EsGH/kv3slBY5g2cXwD59HR4LNxuMJv1h4P1OgVx0ZmnKIiwt9prcU6Vk77ZB11uNhyFGt+3Z8kdZR4Q6UqSt4di/1gqYmkav7x3Ha/HtMogks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438154; c=relaxed/simple;
	bh=qu0slTn0cSeXzjKKSsCRKrIcjAlR3G7kl+9OLH/fgPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enkMkMqJ0ivqxRcY3hIjZxVdZIjMvQWFW8cPRK987Zltq5/evjSERJDqlYk3qVUZw7g+1QrYxx9B8v5e08UELScFNQ6j3CBh11DMHUC/oNegj+vTqlcmv40g00qF2mHBk2MM6lokGkTVGVK/RlUCsy59LbCPkWyTMzrshJWKxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOY95uwY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743438153; x=1774974153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qu0slTn0cSeXzjKKSsCRKrIcjAlR3G7kl+9OLH/fgPA=;
  b=fOY95uwYdNBSe4ehsdjM9HHE6+sRMOSebZlwfJManr4zXRpQUkC9ibf4
   nXQqjiocb5lxLQ/6QivAH883vYrnSl+kGI1Wsn8IXJL4oJWx+EZ7qVg5Q
   LbMatu/hc/lAf//FV1WYmJuEuJ0Bz2q9vxnrKNQpQfp25ee+ciwL6K3H9
   5JW1mZjUSvIrMJra5VaDXuU+kiqX2SJgh0vk/kpYj7vo/ZkhxqCIEc6aK
   bF2We0VyAXhJifP4LNNPRmn5ZuNr1jZwAFo5iziLn00IyniTixygFuq+n
   nM03sGcnNHv6GeiFIxxZYWLCjzvFKznlD9V3Swxi+D6EBI0QDkMZcZn3r
   g==;
X-CSE-ConnectionGUID: 6B9oAhLyRJurQeW4pH3iUA==
X-CSE-MsgGUID: NlDv+je/TPSqcDXSCxqCdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55728400"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55728400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:22:32 -0700
X-CSE-ConnectionGUID: l/tesncdSEqnY5m+cfkGPQ==
X-CSE-MsgGUID: Q5exr6RUSfC1gUosjAxRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="130847133"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:22:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tzHu8-00000007ibk-0C49;
	Mon, 31 Mar 2025 19:22:28 +0300
Date: Mon, 31 Mar 2025 19:22:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <Z-rBQ8tsDHW9clYh@smile.fi.intel.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
 <20250331120748.GB28722@pendragon.ideasonboard.com>
 <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>
 <20250331153435.GB14432@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331153435.GB14432@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 06:34:35PM +0300, Laurent Pinchart wrote:
> On Mon, Mar 31, 2025 at 03:23:21PM +0300, Andy Shevchenko wrote:
> > On Mon, Mar 31, 2025 at 03:07:48PM +0300, Laurent Pinchart wrote:
> > > On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> > > > Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > > > > Convert the module to be property provider agnostic and allow
> > > > > it to be used on non-OF platforms.
> > > > 
> > > > Looks reasonable to me.
> > > 
> > > Is that going to work out of the box though ? The calls below read the
> > > "reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
> > > addresses using ACPI-specific methods.
> > > 
> > > Andy, have you tested this patch on an ACPI system ?
> > 
> > Only compile-tested. But you are right, this is something different here
> > between OF and ACPI.
> > 
> > I can rephrase the commit message to just point out that fwnode.h shouldn't
> > be in the drivers and either converting to device property in an assumption
> > that later it can be easier to support non-OF cases, or using of.h.
> 
> I wasn't aware that fwnode.h shouldn't be used in drivers, could you
> explain that ?

The fwnode.h provides the data types and definitions that are meant
to be used by the fwnode / device property API providers. The leaf drivers
shouldn't have any business with those definitions. Everything the drivers
need should be provided via property.h. property.h guarantees the necessary
data types to be visible to the users, when required (mostly think of
struct fwnode_reference_args). Yes, I am aware of v4l2-fwnode.h and it seems
it falls into the category of special device property API provider.

> If this patch is part of an effort to eliminate usage of some APIs from
> all drivers, I'm fine with it. Otherwise, I'm not sure it's worth
> modifying the driver.

These drivers basically include the wrong header.
If you insist, I can patch fwnode.h to add a comment summarizing the above.

-- 
With Best Regards,
Andy Shevchenko



