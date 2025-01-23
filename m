Return-Path: <linux-media+bounces-25203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B57A1A51C
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 14:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356DF1695CB
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 13:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBCE20F98E;
	Thu, 23 Jan 2025 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBDUpu5K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C1320B;
	Thu, 23 Jan 2025 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639340; cv=none; b=Il+RgnHnZDnfWfSUWQKujYFyr/WkQdIVi2rZJcuz9sQAK4AWSezlogsMACNX9wImtzIvjEUDQD9WqNDDgKCn60nCQ8qo1HFzhahUoS/6Z+DBP9glou3Yyp1WD3XfgLXEu3NDQK3trw4feegXv5UfVeV4bIZf1Tuq/ePALkJcaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639340; c=relaxed/simple;
	bh=y/oPi8DuBlps26Xat1kPe3W8L2HrDiOYkBKU1HrizOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fziIIffYCCuZn45XzEDpp338eKyfm+YP45egsZBFyWwDThxUgeUNJgavY/Kaq8BoeFXRNDhRGc5ZiAPOVtpEM0Are1JS/nXSC+LU6pSMrzkxKv8kYzmKSFeUgSEB3Vu7wXKYGcfiPcUomiuluEIEHQ1vsJ2B+iBESQFvlBZ6YN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBDUpu5K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737639339; x=1769175339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/oPi8DuBlps26Xat1kPe3W8L2HrDiOYkBKU1HrizOw=;
  b=QBDUpu5KNFYoHSUQuIuOsR0+D/v72GCptrg/Fkq+NuFL+4MDhFkApxBn
   E9iEZj5aoJG+p++VOzToTBhaXH7qCc7+5jE6zmq4UGAZZshYTmYc3XQ3L
   33b0V9aAMJPDhwpVSyCJcWPLlwDDwcUmCVh75T8q8pKVrkap6jBvHUAJ3
   k99fv0P6w8d0/OjoNOxVAt4HuxbEQK4ZW4wSVxpVg9+W9HDK6LVe3XKX3
   /iNAZbXaoqsr3WpB7GndZY9xWKBfhonYVR7eCHfnFnwnaTe/02baDFM5O
   EFtdbvSE6YzbMDPIAc/Vim5wM4YkCsuUFkG4dA6BNBNCq3VLY9qEzxItD
   A==;
X-CSE-ConnectionGUID: hXHyCTStRSGvyS5cHSSgVw==
X-CSE-MsgGUID: 1vgp0iHKTLqyzvZ3G4CX9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41893004"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41893004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:35:39 -0800
X-CSE-ConnectionGUID: jY1JoTFFSB2GMpU9bdc1Ow==
X-CSE-MsgGUID: 110YquKrS8OqMM/KB9kdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107272149"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:35:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1taxMs-00000004PtS-0RFI;
	Thu, 23 Jan 2025 15:35:34 +0200
Date: Thu, 23 Jan 2025 15:35:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z5JFpTknh9tiE5lB@smile.fi.intel.com>
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com>
 <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 23, 2025 at 09:14:56AM +0000, Sakari Ailus wrote:
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:

...

> > > + * @func: The function, e.g. "enable"
> > 
> > Should we speak in terms of GPIOLIB, like connection ID ?
> 
> That rename should be done in the entire driver probably then. I can post a
> patch if Hans agrees, after this one.

Ah, this makes sense. I didn't pay attention that this is already in use
in the driver.

...

> > > +	unsigned int polarity;
> > 
> > Hmm... In other cases we usually use
> > 
> > 	bool active_low;
> > 
> > Can we do the same here?
> 
> This goes to the flags field of struct gpiod_lookup. Bool is a poor choice
> for that (but u32 isn't correct either). We can put polarity here but pass
> GPIO_ACTIVE_{HIGH,LOW} to GPIO_LOOKUP().

Maybe then name it as gpio_flags or so to match that structure member?

...

> Putting polarity before function would same some bytes, too. Hans, any
> thoughts?

I'm fine with that. I would also save bytes in the cases when it doesn't
affect code generation (and here seems the case). Also, if we talk about
readability of the each quirk entry the current implementation calls for
a macro to make it neater. In such a case, we save double type and may
put macro's arguments in a better order than structure, which may be optimised
for size.

...

> > > -	int3472_get_func_and_polarity(type, &func, &polarity);
> > > +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
> > > +				      &polarity);
> > 
> > AFAIK, we don't have hard attachment to the 80-[character limit rule, please
> > use more room on the previous line.
> 
> There's no reason for the line to be above 80 characters.

It's the opposite. There is no reason to make it two lines.
It's not a v4l2 subsystem, we are not cargo-cult here, I believe.
I.o.w. a common sense should be the first one to be considered.

Now, I even tried myself, and...

	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &polarity);

...ha-ha, it's exactly 80 characters! What's wrong with your editor settings?

-- 
With Best Regards,
Andy Shevchenko



