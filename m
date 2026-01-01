Return-Path: <linux-media+bounces-49828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BCCED4FF
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 20:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE773007969
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 19:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F6D29A309;
	Thu,  1 Jan 2026 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgIcWEyP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885BC202963
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767296349; cv=none; b=BhAkAqC8q7HGRvAHruhppW0TkAJ8K42lt3NC6F6ZnWUYRVPAnctl05ioZuIEsUn1yyYF447xEKujoiYtuSPvhv+5ZRSJnJd4Cv7iPIMCIUrHK5qh6i+umAcF+D5H2ifVc8qNSERRoHICprQazh7b8dbBG+X11xQdixnogtQuvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767296349; c=relaxed/simple;
	bh=suETZyDLt5H76te9Bl1oKMv/XRQnds1llUml6ncWBIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcQ7zCgQDXoLuD7KCT71QRrtmJyPu6e6clPevEwTIzZRpFXXtNyd9ajyQbU251/dr7+/EaRbMGSgqeLXj2x4/6RpyqweW2hMlbJspywbJv52/Rz7pExnBamwizNr23ln7rLwwVmOmaBuMqG8GnJPqOKqWfBhiIEziXGNR634iSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgIcWEyP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767296347; x=1798832347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=suETZyDLt5H76te9Bl1oKMv/XRQnds1llUml6ncWBIg=;
  b=RgIcWEyPSgg5LyAU68MpfkKKNozcNDJls82dUbt3DAf9CNYZCvjJt/0U
   SotTgiDj3yJRereWOlbtCdrcQhjRFmHnFpgsXt9+9NZECUP+vflLzGsl4
   2WDBfwMP2c04EmWdw4EQH1K2PD+19OvauRS+VmUwUpwL4qDS5DraMsjQf
   lyuea0OFcQyGZ5rUgQDh2KHVms1EU7iyXrkR7BIcutJSqfeUYr8sxsvdx
   yQNwfHFkGVmrum8PY1y2lWEEc9lmznDhrIqSZcwzLKj0CIuwX4Avy0Dou
   2CTVnvX3a3Jd4gfcTl/oZ3A5/0RqndYXukMQJEjgByXEOKDySIldVPJXg
   w==;
X-CSE-ConnectionGUID: o8dE0oVlRoeiypJuPNZ7tg==
X-CSE-MsgGUID: frNuQUWZSk+3iwGNiZ/PBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68725911"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="68725911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:39:06 -0800
X-CSE-ConnectionGUID: GyM1yS3ISHmcjZlZ1wyHGw==
X-CSE-MsgGUID: 7Fyu0+D5TSuxhMM+7rMCMQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.249])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:39:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B25F811F87B;
	Thu, 01 Jan 2026 21:39:14 +0200 (EET)
Date: Thu, 1 Jan 2026 21:39:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v3 02/13] media: ipu6: Drop MMU hardware initialisation
 in probe()
Message-ID: <aVbNYh0UEskdVLhB@kekkonen.localdomain>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-3-sakari.ailus@linux.intel.com>
 <6edacdf3-05ad-f5d4-d919-4b2e57cd2e91@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6edacdf3-05ad-f5d4-d919-4b2e57cd2e91@linux.intel.com>

Hi Bingbu,

Thanks for the review.

On Wed, Dec 31, 2025 at 01:38:00PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> Thanks for the patch.
> 
> On 12/30/25 9:10 PM, Sakari Ailus wrote:
> > The MMU hardware is initialised in the runtime PM resume callback. Do not
> > do it in probe().
> 
> It's correct. The MMU hardware initialization was there as firmware
> open happen during ISYS probe before, but now it was moved at stream
> starting stage.
> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > index fc0ec0a4b8f5..eb45544a9f05 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > @@ -1070,10 +1070,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
> >  	if (!isys->csi2)
> >  		return -ENOMEM;
> >  
> > -	ret = ipu6_mmu_hw_init(adev->mmu);
> > -	if (ret)
> > -		return ret;
> > -
> 
> So, also need to remove the ipu6_mmu_hw_cleanup() below. :)

I'll add that for v4.

> 
> >  	/* initial sensor type */
> >  	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
> >  
> > 
> 

-- 
Kind regards,

Sakari Ailus

