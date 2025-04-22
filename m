Return-Path: <linux-media+bounces-30705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA76A96808
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72AB93A3AB5
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781BE1F17F7;
	Tue, 22 Apr 2025 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fe+OAp/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5F14286
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322204; cv=none; b=KQ91Kp+hteE9Nr2MPdxrHIgm3Scu8mTPog1C35TphNjFy6M6vvCO5QvKEFFRy4ENeKEAkPZ6pMHmLmRKZLI3KJmIobMtSTUqS8IA5KvD4l9n9W2+ly+1eWK48n4knyzBQ1kQxEYUUsp1gieGaMbQ+OhjztQPJw7SVEwiZYseVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322204; c=relaxed/simple;
	bh=/VFfdO/LZbmExteZm5JorNtZVf7W9PllJpkN++LRCUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRMpp8KZUncWoSEg4EqK75//ZSjTpBlnS561xCsu70KuMRG7dmZA1ozKUsgB5fLrIBajkcLGGOXktXbdyYliyTlQSH9wUG1q/jd1im5WrHCCvBIsQbuEmKKAqpt3gZA60qXhKioliPN0lTpqJQxM3Dn/wRqwoSZTFG3Bqwleaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fe+OAp/0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745322203; x=1776858203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VFfdO/LZbmExteZm5JorNtZVf7W9PllJpkN++LRCUI=;
  b=fe+OAp/0CwQZRh0+e2t5DQSzPbwqEJEP1parsvtSvr6yBH73j4JaO6k0
   Li3Zdz+8TZlygS1Ir2cVptFuUCChegCYftjclHzIf1SbE2BmNQy2KF76t
   Ks4zJKxDHgdXE4FbxlRdByDx1EQlidPBDv8ETJbIHYMu3ety8wk/j86kp
   GVj4hV21aubPT2bv5n2X/IdaCdIQkffzrYB49H0NCBqgBe/BfunGxqHy1
   oiVNUf4VZMNRC9YYgI3IZ8+/Fo2HFFCFyaOyr1UWReiwO1ZNZH9XRCarP
   ryPa8xRv+p1k1hsWjSPiFpC3urWJA4wV22jHttNxdjmx8WrWJiknx63aj
   w==;
X-CSE-ConnectionGUID: NerfZoIDRiS5Dwk8lZgwlg==
X-CSE-MsgGUID: 6UU120w9RWygBfwhv6pt2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57528332"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="57528332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 04:43:22 -0700
X-CSE-ConnectionGUID: iBXDiSQ5SCOrQRKjpFfdyA==
X-CSE-MsgGUID: UYYgtQ+cRhuWm/T6zdWnWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="136985046"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 04:43:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8E76311F853;
	Tue, 22 Apr 2025 14:43:18 +0300 (EEST)
Date: Tue, 22 Apr 2025 11:43:18 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 01/11] media: ccs-pll: Start OP pre-PLL multiplier
 search from correct value
Message-ID: <aAeA1ncpTCgfuI25@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-2-sakari.ailus@linux.intel.com>
 <20250421195004.GA17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421195004.GA17813@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Mon, Apr 21, 2025 at 10:50:04PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 17, 2025 at 09:53:44AM +0300, Sakari Ailus wrote:
> > The ccs_pll_calculate() function does a search over possible PLL
> > configurations to find the "best" one. If the sensor did not support odd
> 
> s/did not/does not/
> 
> > pre-PLL divisors and the minimum value (with constraints) wasn't 1, other
> 
> s/wasn't/isn't/
> 
> > even values could have errorneously searched (and selected) for the
> 
> s/could have errorneously searched/
> s/could be erroneously searched/
> 
> Do you mean "other odd values" ?

Odd values that aren't 1.

> 
> > pre-PLL divisor. Fix this.
> > 
> > Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > index 34ccda666524..e516ed23e899 100644
> > --- a/drivers/media/i2c/ccs-pll.c
> > +++ b/drivers/media/i2c/ccs-pll.c
> > @@ -815,6 +815,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
> >  			      one_or_more(
> >  				      DIV_ROUND_UP(op_lim_fr->max_pll_op_clk_freq_hz,
> >  						   pll->ext_clk_freq_hz))));
> > +	if (!(pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER))
> > +		min_op_pre_pll_clk_div = clk_div_even(min_op_pre_pll_clk_div);
> >  	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
> >  		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
> >  
> 
> Is my understanding correct that the problem can only occur during the
> first iteration of the loop just below ? If so, with the commit message
> fixed,

Correct.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If not, there's something I don't get :-)
> 

:-)

-- 
Regards,

Sakari Ailus

