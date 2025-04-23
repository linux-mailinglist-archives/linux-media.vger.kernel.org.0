Return-Path: <linux-media+bounces-30789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154FA9872E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189A95A2309
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B5C262FD5;
	Wed, 23 Apr 2025 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBjwrksd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21C25CC51
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403592; cv=none; b=uKd8VW0n8knaOAXeWbMRO2k2z5vKcyVp/Osd7eeRFHim1fDilroft/befL9/tOeghPVSSYlb6yWbl5GOv7GsdkMNZaIIN/0EZCu1gLXcyoZJvdI0Tztrr/TexDjnBW7/pJlLvGxVUhcInFhaprK0CKoj+ve3POwhk5n4lYLtlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403592; c=relaxed/simple;
	bh=7XRYn16L0cqQU9dOv3CEh1dEkmpQsc4JaMe58cuDHws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUNbZg95ryhlivxeT4k91LtLj9ISBqpGHIWXxGNT1aFc88cal2yXMDUxskuLu6o75xkWCsx7OcqrAs/epMMvJhwzfleiEzTAewDda3MTpaySUCA3LhKkDNSSppJdu01Cz9UJAWd25M7qNySHbsawPDb6TuluhSy3MKQLpsgqUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBjwrksd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745403591; x=1776939591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7XRYn16L0cqQU9dOv3CEh1dEkmpQsc4JaMe58cuDHws=;
  b=hBjwrksdXl8/3y8o7txpmpXjTGii1UbAH8efCEpk4zXTCp+/yPHmhLNo
   G4TzyOWp0Ww3hIPZIVk+M2Utz0tkgjsyCZTVQD+/4aCBVbLwV+iRIPHFe
   BS2cw72txFrGC93rou0FKiQITvxdXyF+62y2uFUOgDS7v5GQqxm3ityWZ
   uTRyZxNAvPyRwsBLkynwloF9nEQUiMU+MFMvXZ9n1QQci1XDRmt406V7m
   QAl4++i1qGBKEji+j38GyjIo0BlDh5RGSra7vfLguLy/tdP8UR7eTFZBa
   Zu82RpGO97SvsuaKrfvjm6mAWeE2GzU+diJef/WV40WNa3RkMiab34hUe
   A==;
X-CSE-ConnectionGUID: ggXdTeIYSoq7P/EFec4Z9Q==
X-CSE-MsgGUID: NXeChQofQcO3woRQc4JClg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50820243"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50820243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 03:19:50 -0700
X-CSE-ConnectionGUID: pDeU64lQRl2Ns/zu0ZQg1A==
X-CSE-MsgGUID: KXxkoWQYSMaxNSJ7oLPzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132817374"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 03:19:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 55DA211F8D4;
	Wed, 23 Apr 2025 13:19:46 +0300 (EEST)
Date: Wed, 23 Apr 2025 10:19:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 08/11] media: ccs-pll: Add a flag for even PLL
 multipliers
Message-ID: <aAi-wiwZrmLiXUlR@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-9-sakari.ailus@linux.intel.com>
 <20250421201924.GI17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421201924.GI17813@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 21, 2025 at 11:19:24PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review!

> 
> On Thu, Apr 17, 2025 at 09:53:51AM +0300, Sakari Ailus wrote:
> > Some devices (not entirely CCS compliant) only support even PLL
> > multipliers. Add support for this through a PLL flag.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.c | 11 ++++++++++-
> >  drivers/media/i2c/ccs-pll.h |  1 +
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > index ebbc5e323244..3f8153fb4af0 100644
> > --- a/drivers/media/i2c/ccs-pll.c
> > +++ b/drivers/media/i2c/ccs-pll.c
> > @@ -124,9 +124,10 @@ static void print_pll(struct device *dev, const struct ccs_pll *pll)
> >  	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
> >  		pll->pixel_rate_csi);
> >  
> > -	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s\n",
> > +	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s%s%s\n",
> >  		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
> >  		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
> > +		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
> >  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
> >  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
> >  		" ext-ip-pll-divider" : "",
> > @@ -312,6 +313,10 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
> >  	more_mul *= DIV_ROUND_UP(lim_fr->min_pll_multiplier, mul * more_mul);
> >  	dev_dbg(dev, "more_mul2: %u\n", more_mul);
> >  
> > +	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
> > +	    mul & 1 && more_mul & 1)
> 
> Even if not mandated by the C standard, I'd write
> 
> 	    (mul & 1) && (more_mul & 1))
> 
> to make the code easier to read.

I'll address this in v3.

> 
> > +		more_mul <<= 1;
> 
> I'm not sure to get the logic behind this :-/

Multiplying an odd number with an even number results in an even number,
this is what we need if the above flag is set.

> 
> > +
> >  	pll_fr->pll_multiplier = mul * more_mul;
> >  	if (pll_fr->pll_multiplier > lim_fr->max_pll_multiplier) {
> >  		dev_dbg(dev, "pll multiplier %u too high\n",
> > @@ -668,6 +673,10 @@ ccs_pll_calculate_op(struct device *dev, const struct ccs_pll_limits *lim,
> >  	if (!is_one_or_even(i))
> >  		i <<= 1;
> >  
> > +	if (pll->flags & CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER &&
> > +	    mul & 1 && i & 1)
> 
> Same here.
> 
> > +		i <<= 1;
> > +
> >  	dev_dbg(dev, "final more_mul: %u\n", i);
> >  	if (i > more_mul_max) {
> >  		dev_dbg(dev, "final more_mul is bad, max %u\n", more_mul_max);
> > diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> > index ee206e5b287b..e8297db45460 100644
> > --- a/drivers/media/i2c/ccs-pll.h
> > +++ b/drivers/media/i2c/ccs-pll.h
> > @@ -31,6 +31,7 @@
> >  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
> >  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
> >  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
> > +#define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
> 
> You could reuse bit 3, as it got dropped in patch 06/11.

I'll move it there, also for the reason that this isn't a CCS flag.

> 
> >  
> >  /**
> >   * struct ccs_pll_branch_fr - CCS PLL configuration (front)
> 

-- 
Regards,

Sakari Ailus

