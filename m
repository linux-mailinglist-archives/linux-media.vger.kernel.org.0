Return-Path: <linux-media+bounces-29928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AAA84487
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1FD89A2EE9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 13:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A1C28C5B0;
	Thu, 10 Apr 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buAnpxvB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620A28C5A4
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290768; cv=none; b=mPMgTZyFqJSYFYC635ItWnEIIA3wFfM/Ovn2sj/3sHILi9Du9hZjM0+OnwoTAtYM1Aw9SzPVHDXh8ECWVeqTRM/gjGcdHLod1CRoElL+VXghR6MAEEonzksoS5wy5U3Mk1YGoXxQzco4kt/kLSMjqbggQtGd4AxoQvbyephRbd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290768; c=relaxed/simple;
	bh=TvslsZTSvhxwVk5855Mnty9WAJ8Iey7lSgRHhDX0lYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHaI4/qZL+F7zE6Hfux9rOQSXtnEi0mA7fydEAj0z3U44698VEbQwhDKRkUxROv8Ni3Mo1BctVWaFfGY7Q3y5/mt/m/ilPNhi3KFeJDL27us4Ri37bHDJHFu8kgmL5dtjEroRxLHxMQ2MbVB8zAU1hSsQguZz/k4V6qeYjvAEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buAnpxvB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744290766; x=1775826766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvslsZTSvhxwVk5855Mnty9WAJ8Iey7lSgRHhDX0lYc=;
  b=buAnpxvB75XBbJv/GiKbmFeXerwzQp5rw5YU9SorPi6wxXj+zozGm/ld
   0DTM0p8mufIZ3dmkoLmj1+Hf0GURscovtmMB4C4Ps0HudSVFzdS2tdpxK
   xF06S8PEG9OZoQg9eoxqHkwrSwCApVEuuffnT+qg/vORD880RtySAWLat
   Tn7lgEvHAcYvqXLSz4xbyy4ZhKkKGo9YxtjHgdvVfEsBBtb7wMPeBwgsv
   Kkuljk5BpPbZqH3XOxrfPLzJ3AYpXPnjbiY8ErTismP4Tzu7QLkmuFfz7
   Rbk3JzWmdMsrmW4d3jAQg2NSb2FrqyC6NKqOFyXpftuJiQpHu77mTse4J
   A==;
X-CSE-ConnectionGUID: ll3uXVyxSiKUrvVgFSEYNg==
X-CSE-MsgGUID: y+8KDXOgQam3PEs7Dwj9dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63353736"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="63353736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:12:44 -0700
X-CSE-ConnectionGUID: /tUkbl/9Qgqvdqw/lWq8Iw==
X-CSE-MsgGUID: XwhGkMGUQDujokQ7ILu+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134075816"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:12:43 -0700
Date: Thu, 10 Apr 2025 15:12:40 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 2/7] media: intel/ipu6: Remove line_align
Message-ID: <Z/fDyNb2evbxipY+@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
 <20250407134037.808367-3-stanislaw.gruszka@linux.intel.com>
 <Z_ezvvBNtpcZlAXW@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_ezvvBNtpcZlAXW@kekkonen.localdomain>

On Thu, Apr 10, 2025 at 12:04:14PM +0000, Sakari Ailus wrote:
> Hi Stanislaw,
> 
> Thanks for the set.
> 
> On Mon, Apr 07, 2025 at 03:40:32PM +0200, Stanislaw Gruszka wrote:
> > isys->line_align value is only used in one place and we can just use
> > the proper value directly there.
> > 
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c       | 1 -
> >  drivers/media/pci/intel/ipu6/ipu6-isys.h       | 4 ----
> >  3 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index e36a21aa9040..3165904d7ebf 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -241,7 +241,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
> >  	else
> >  		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
> >  
> > -	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
> > +	*bytesperline = ALIGN(*bytesperline, 64);
> 
> Is this value the same for ipu7?

Yes.

Regards
Stanislaw

