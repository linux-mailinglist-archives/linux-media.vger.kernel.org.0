Return-Path: <linux-media+bounces-29080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A4A76BFC
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8896B188CCDA
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EFE2147FE;
	Mon, 31 Mar 2025 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/I4ST5v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF111D63F5;
	Mon, 31 Mar 2025 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438830; cv=none; b=t7SFK++IigWuwK65SDHcKppcERGQFtj/3rP5MZMeMiiQz6/TbUu5XVUy/ENYfi3X0cDUKdsDYO4cA4m2HSXZcH38cCu9yLpJIqfMXi3BNPuaYZ9oMdaPPIkWZ/3M1ReiopG6L63UFLm2wKNN1eJljj/JLf2Ik/8KL6Nv+8lJetA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438830; c=relaxed/simple;
	bh=7NzXcx1wagWszAjb/SFZHHrb7ZDuC7tcnfUiQt35+g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paL0hgCGOUsYbx2Av0Ld5E7pftkHEaiTyu/11E41qZjUKgnaikI0ESfGfIuuSlKqBytWwFCePPIrX92Xt7nYPZhqqM1ThZEGni8oSu0aE/Hg9wIF9IZYZgZot5ECRl42jrPet2f9jbSryQ7i4V0D2GA+WieNf7n29NwKigmMic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/I4ST5v; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743438828; x=1774974828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7NzXcx1wagWszAjb/SFZHHrb7ZDuC7tcnfUiQt35+g4=;
  b=B/I4ST5vA150uG9yGNq7VvI1iC4UuzD4s4c34nFkO2sxtqGd3H3Xnw0V
   j5mLzpcT0U9cItoAGfQIKtnbN7ZL1zwwPf1JoN0ZxbZvYJbU8rp2S83zc
   3JvQGKfaqoBQOeAMrnR9dWng4c5p5N/bd6ECSoYRzp0uJrSS0W2/XQwA/
   2EIwSBX1kgn0jKg8YphlK6SRof3kmag7syeajgA0OrlVAEUC/1/1EV3V1
   QGiWnRlWp407/1veKa/Nn3jU6r9Cyi8jf0BH6i/3T+DYWA6upJcXjti3J
   qIxrzuajZevQYv6Vns1pPX0oM5/JVO+p3P6OIhj2dD38hABg6FbzC0q5s
   Q==;
X-CSE-ConnectionGUID: lTgnUcGCScqC/MuLFinxdQ==
X-CSE-MsgGUID: /Vgs1PYpQxKC39ztD+7FQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62267565"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="62267565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:33:47 -0700
X-CSE-ConnectionGUID: yztWpxOtTMCB8/juNKV2kA==
X-CSE-MsgGUID: R7gWUPm6Rb6FF46SFI4yKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="157131896"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:33:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tzI4u-00000007rb1-1qK8;
	Mon, 31 Mar 2025 19:33:36 +0300
Date: Mon, 31 Mar 2025 19:33:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <Z-rD4PX6qRjoM0O6@smile.fi.intel.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
 <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
 <20250331120748.GB28722@pendragon.ideasonboard.com>
 <Z-qJOeeHUgWCtkTv@smile.fi.intel.com>
 <20250331153435.GB14432@pendragon.ideasonboard.com>
 <Z-rBQ8tsDHW9clYh@smile.fi.intel.com>
 <20250331162739.GG14432@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331162739.GG14432@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 07:27:39PM +0300, Laurent Pinchart wrote:
> On Mon, Mar 31, 2025 at 07:22:27PM +0300, Andy Shevchenko wrote:
> > On Mon, Mar 31, 2025 at 06:34:35PM +0300, Laurent Pinchart wrote:
> > > On Mon, Mar 31, 2025 at 03:23:21PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Mar 31, 2025 at 03:07:48PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Mar 31, 2025 at 09:16:36AM +0100, Kieran Bingham wrote:
> > > > > > Quoting Andy Shevchenko (2025-03-31 08:34:35)
> > > > > > > Convert the module to be property provider agnostic and allow
> > > > > > > it to be used on non-OF platforms.
> > > > > > 
> > > > > > Looks reasonable to me.
> > > > > 
> > > > > Is that going to work out of the box though ? The calls below read the
> > > > > "reg" property to get the device I2C addresses. AFAIK, ACPI handles I2C
> > > > > addresses using ACPI-specific methods.
> > > > > 
> > > > > Andy, have you tested this patch on an ACPI system ?
> > > > 
> > > > Only compile-tested. But you are right, this is something different here
> > > > between OF and ACPI.
> > > > 
> > > > I can rephrase the commit message to just point out that fwnode.h shouldn't
> > > > be in the drivers and either converting to device property in an assumption
> > > > that later it can be easier to support non-OF cases, or using of.h.
> > > 
> > > I wasn't aware that fwnode.h shouldn't be used in drivers, could you
> > > explain that ?
> > 
> > The fwnode.h provides the data types and definitions that are meant
> > to be used by the fwnode / device property API providers. The leaf drivers
> > shouldn't have any business with those definitions. Everything the drivers
> > need should be provided via property.h. property.h guarantees the necessary
> > data types to be visible to the users, when required (mostly think of
> > struct fwnode_reference_args). Yes, I am aware of v4l2-fwnode.h and it seems
> > it falls into the category of special device property API provider.
> > 
> > > If this patch is part of an effort to eliminate usage of some APIs from
> > > all drivers, I'm fine with it. Otherwise, I'm not sure it's worth
> > > modifying the driver.
> > 
> > These drivers basically include the wrong header.
> > If you insist, I can patch fwnode.h to add a comment summarizing the above.
> 
> No, it's fine. I mixed fwnode.h and property.h when writing my previous
> reply, but I don't think it's a matter of lack of documentation, more
> likely lack of sleep :-)

NP. but here we are: 20250331163227.280501-1-andriy.shevchenko@linux.intel.com

The bottom line, can you give a tag for this patch and perhaps others of
the same matter against drivers/media/* I sent today?

-- 
With Best Regards,
Andy Shevchenko



