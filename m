Return-Path: <linux-media+bounces-30790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C68A98742
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7D7D44333C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 10:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C16266F15;
	Wed, 23 Apr 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meZKe5CE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572B2CCC9
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404002; cv=none; b=jn/g6Rs9MLtFmdjR5C/dUhaBj9CCvk/nDu5bpO/BvFiDZDf34u1lySftKiw0BuT3CO0e3v6kGlYRxxyQX95+x8A54mf0y9ERTM7h2QiuD+og1NGxc+GG8YVynK7HWYg4yxhcXfHXnQmEWxJFvurpFJ9B1fg+zXwL+kp/u9GxImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404002; c=relaxed/simple;
	bh=eC+lAVT4rZVMvYu/4l6zfKKUCrby91WI/mpneqQ0DKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0cvASn39JbU/JsenLhwG+Y9OFQuhNnSl4RSGaoMV9lp+twCu8SEJCP9xbyS2v/InZGgEEokydzbxN96yJtlXF9ld+r25yomNIJ0AukEzYKteYnwQ+dA/Gk8pERUqOwcvCo+bDc7Bv5w6GWqQfyBdO6LhCvvHhY4/mWQ9BsApsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meZKe5CE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745404000; x=1776940000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eC+lAVT4rZVMvYu/4l6zfKKUCrby91WI/mpneqQ0DKU=;
  b=meZKe5CE4TV79Lexa/W4EY+6CpS1P+lb5HHjo51W6B71QzLHZSH3kyLW
   4Rqwvpma9tfY8iZsrHKhuBQUMUK95OveJJ5LAi0zO9oSvkVL/V/BoFTMA
   8pcdM+CQsQ1iT5iOhrOPZ2BXoFLXlZova2eQGEkrI6QwWBa2RJlNNiUPf
   Mimu0uCnyIMzuQN69j5J1cvU5/VyOkURJch6m/hWfYhdS7bbgxRvdxRnR
   oSt7SmUFHcXbU+aQoNuV6lOuKt9b5QPk4pr8347VWAngAIfHDM3XR8Wf+
   mGqYn65IUx3F1D45zkk9ajXLKcL8FV1qEdXSV3SSROA5crLhoDGEv9hVd
   A==;
X-CSE-ConnectionGUID: L7J6/mBjRomAKi/kgQkggw==
X-CSE-MsgGUID: Dz2Bsii+Sz+btkT7Z2fXxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69479682"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69479682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 03:26:40 -0700
X-CSE-ConnectionGUID: Fqz3fPzCR1yKHPyTZDzjrA==
X-CSE-MsgGUID: 17FSGYUzSD+p0GODmIEwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133159395"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 03:26:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BE54D11F8D4;
	Wed, 23 Apr 2025 13:26:35 +0300 (EEST)
Date: Wed, 23 Apr 2025 10:26:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 09/11] media: ccs-pll: Better validate VT PLL branch
Message-ID: <aAjAW04qy6Y3fdol@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-10-sakari.ailus@linux.intel.com>
 <20250421202429.GJ17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421202429.GJ17813@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 21, 2025 at 11:24:29PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 17, 2025 at 09:53:52AM +0300, Sakari Ailus wrote:
> > Check that the VT PLL dividers are actually found, don't trust they always
> > are even though they should be.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > index 3f8153fb4af0..fc6f8aff5fd8 100644
> > --- a/drivers/media/i2c/ccs-pll.c
> > +++ b/drivers/media/i2c/ccs-pll.c
> > @@ -449,7 +449,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
> >  	return -EINVAL;
> >  }
> >  
> > -static void
> > +static int
> >  ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
> >  		     const struct ccs_pll_branch_limits_bk *op_lim_bk,
> >  		     struct ccs_pll *pll, struct ccs_pll_branch_fr *pll_fr,
> > @@ -572,6 +572,8 @@ ccs_pll_calculate_vt(struct device *dev, const struct ccs_pll_limits *lim,
> >  		if (best_pix_div < SHRT_MAX >> 1)
> >  			break;
> >  	}
> > +	if (best_pix_div == SHRT_MAX >> 1)
> > +		return -EINVAL;
> 
> I think I would have written
> 
> 	if (vt_div > max_vt_div)
> 		return -EINVAL;
> 
> to match the for loop condition, this seems a bit more readable to me.

Comparing with the value assigned in the variable initialisation seems most
straightforward to me. But the value could be U16_MAX, that'd be nicer than
SHRT_MAX >> 1. U16_MAX was added before the first instance of this was
merged. :-)

I'll add a new patch to change this, after this set.

> The result should be the same though, so either way,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

-- 
Regards,

Sakari Ailus

