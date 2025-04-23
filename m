Return-Path: <linux-media+bounces-30792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FCA988F7
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 13:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05F0B4446BB
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 11:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAC622F758;
	Wed, 23 Apr 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6yvthMr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEE20F09B
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 11:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409318; cv=none; b=ljIgmQp75OsHIuxspPh078BwAnIz3USCQnOgUugZjJaNZUVe0mq1qkbl0guA5whr5TBjMLcwLxv6vNT65IyQiVYbnJpLVjx+QngU9k+cC8AN6KrBEaClFOuGZxBCol/4O3OAkDK0z309mRZJ+zAr+M9QZPCRsyrGFxIgToWGSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409318; c=relaxed/simple;
	bh=Jk1qwZxnYzF4RofI2iJ0EhCDh5WIHmujnkUjzL46AAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmPHsvj3YNBvaTB0dHVdSdudPz9YPHXS/Rcxt4NxmcyZaRlV2k+qeUgjv8NMd16A8dS/YvEph7TtovV32Dp/0RTAeKdbmYkyM2sjw1hRapkRt6FANbmDXIq1+GyEZ+xfJOZuOD+nT1Lp1Ke8PK9ZllF00o/dxhcpAKkQM6NHAlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6yvthMr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745409317; x=1776945317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jk1qwZxnYzF4RofI2iJ0EhCDh5WIHmujnkUjzL46AAs=;
  b=n6yvthMrzYp7U2C0KKBbba9TomP+qIErBe0DBV3xwwxfFVl0bY+SmWvA
   ME3f8kZuvexZjC4vyOAgZBKcjTJEV/2IU+Ao5zLOAD2MR2Qjr+yNYZfzx
   uXQjrOaaYEzEgL0PK8rp6XHfAxDPmrIjYDO75dGTJFUm69UUGIXzuH14r
   oqqdW27DD2brO//w1WX+ITy7yPov/g/y/oY00xmlI+S7U8o6Ea07H2hee
   5Pv7hcKx60NRgJGycRDrfW0FPRJbvqTVDxi20M1QoxP+EJuVAGF1Z1B+k
   Dp87uUUuBrMcGF4awkNjvZbQR/KPxQpN2BSSPDwk8Pp2WekasXqrxKZM8
   Q==;
X-CSE-ConnectionGUID: JfFkvIMsQk6VYIA6tUtUXA==
X-CSE-MsgGUID: 7f0tbdFCSPazSMTFtC+VPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57654152"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57654152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:55:12 -0700
X-CSE-ConnectionGUID: KCKyg8HgT/uXwHS4RCntBw==
X-CSE-MsgGUID: /PIzlZb0Rqi/CNE4xLrz1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132215448"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:55:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7598011F9FE;
	Wed, 23 Apr 2025 14:55:06 +0300 (EEST)
Date: Wed, 23 Apr 2025 11:55:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 04/11] media: ccs-pll: Correctly the upper limit of
 maximum op_pre_pll_clk_div
Message-ID: <aAjVGi5WUTx3VorO@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-5-sakari.ailus@linux.intel.com>
 <20250421200111.GE17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421200111.GE17813@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 21, 2025 at 11:01:11PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> In the subject line, s/Correctly/Correct/ (or an equivalent change)
> 
> On Thu, Apr 17, 2025 at 09:53:47AM +0300, Sakari Ailus wrote:
> > The PLL calculator does a search of the PLL configuration space for all
> > valid OP pre-PLL clock dividers. The maximum did not take into account CCS
> 
> s/CCS/the CCS/
> 
> > PLL flag CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER in which case also odd PLL
> > dividers (other than 1) are valid. Do that now.
> > 
> > Fixes: 4e1e8d240dff ("media: ccs-pll: Add support for extended input PLL clock divider")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > index 266fcd160da6..d985686b0a36 100644
> > --- a/drivers/media/i2c/ccs-pll.c
> > +++ b/drivers/media/i2c/ccs-pll.c
> > @@ -799,7 +799,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
> >  		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
> >  	max_op_pre_pll_clk_div =
> >  		min_t(u16, op_lim_fr->max_pre_pll_clk_div,
> > -		      clk_div_even(pll->ext_clk_freq_hz /
> > +		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
> >  				   op_lim_fr->min_pll_ip_clk_freq_hz));
> 
> This doesn't take the CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER flag into account.
> If I understand the code right, it's not an issue, as
> max_op_pre_pll_clk_div is only used as an upper bound for the
> pre_pll_clk_div loop, which increments by 2 when
> CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER isn't set.

Correct.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus

