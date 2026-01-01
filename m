Return-Path: <linux-media+bounces-49831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCADCED51A
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 20:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E0703003BE2
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 19:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A512F1FEA;
	Thu,  1 Jan 2026 19:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSl8T51V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90D16DEB1
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767297478; cv=none; b=OObv/9KLEqY+DKwCETd3qCLFIvPqcUDEMovsz7WDIGV4dddaX5YpzSe6a2i1WOAf0+mYfXkRIuzB5Yvb5mvT+7FVW8/RtD0ZD77kWmKGdsVXLuRZMMfDXzH6ocI1SCuoeK7BlSF3F060ekJriTe5OnBugHeRBj3dQnL33ILM+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767297478; c=relaxed/simple;
	bh=JwMs6s7MF0kflnqc/rOJGVoLFYgFM/IrQ0wTA9Zb088=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu5IeFAyVUMr2/aAygMmZngHwB1XoJwlZTw4VXQ+RqS9KFmaw3IPC2W1+hnCpGnFUqi+FxoJ1X6fJYOTx0yg6E1dduA6QExVHRm0/CtJKlUtSHiA48OxIbZ1AQB04KNGMhxfOLhnTI+0F1NwIgKPeiU0pULz715jVKmtfHMWzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSl8T51V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767297476; x=1798833476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JwMs6s7MF0kflnqc/rOJGVoLFYgFM/IrQ0wTA9Zb088=;
  b=FSl8T51VPAqZnV4EogRw4xBgDKhmklyd+i8xKIFOP8dhHqTq9hfQKNWa
   1GwHmDlTl7mlaxS7iK3cYi0ydBkhAfzXGRMTq9lBqp+FGlIAyeT5Gl5fU
   5peRJt0zrClOcB0SaBUzt16pv855X/3huYOfGx6uq8EvIn/RQ1xJkXUq4
   5N/caxaiAAvWpKvMpeqAR8XdfQaS9pGrFV8A0t9sGsDFitNCveMTAe8Nl
   qu7S2A2IRyrcyk4p8jFiPUmjiW3L/TL56PjdHXcvc6tl9jgzqKIySKdxM
   YzD8l0sLXI6T4eAh5KhtsTwRVjNViKoggLzx7Sv7hF6lYwKJmr48FmBrZ
   Q==;
X-CSE-ConnectionGUID: luZSoZx6RQyx3nvsQ8K+8A==
X-CSE-MsgGUID: 0FqE/jGITm6jBFWMXCQGwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67830966"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="67830966"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:57:55 -0800
X-CSE-ConnectionGUID: zLWTECVKRTGq9DpD9nLDTQ==
X-CSE-MsgGUID: 1Mni4CkXSUOPJXqLnwALDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="206183069"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.249])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 11:57:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2631C11F87B;
	Thu, 01 Jan 2026 21:58:04 +0200 (EET)
Date: Thu, 1 Jan 2026 21:58:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v3 07/13] media: ipu6: Close firmware streams on
 streaming enable failure
Message-ID: <aVbRzJOgMxUc7ln6@kekkonen.localdomain>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-8-sakari.ailus@linux.intel.com>
 <6594dfc9-bfb9-a99e-fe92-da2493397e9d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6594dfc9-bfb9-a99e-fe92-da2493397e9d@linux.intel.com>

Hi Bingbu,

On Wed, Dec 31, 2025 at 02:11:40PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> Thanks for the patch.
> 
> On 12/30/25 9:10 PM, Sakari Ailus wrote:
> > When enabling streaming fails, the stream is stopped in firmware but not
> > closed. Do this to release resources on firmware side.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index dec8f5ffcfa5..919b77107cef 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  
> >  out_media_entity_stop_streaming_firmware:
> >  	stop_streaming_firmware(av);
> > +	close_streaming_firmware(av);
> 
> It looks the close_streaming_firmware() has no chance to run if
> v4l2_subdev_disable_streams() above failed. Beside, the
> stop_streaming_firmware() is better called after subdev
> disable_streams().

Do you mean we wouldn't need to call stop_streaming_firmware() at all here?
That would be actually aligned with start_streaming_firmware() error
handling.

-- 
Regards,

Sakari Ailus

