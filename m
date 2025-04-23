Return-Path: <linux-media+bounces-30811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F33A98A21
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C531A178C27
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4129763CF;
	Wed, 23 Apr 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJwZ/VcK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E49461
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412669; cv=none; b=Wlzs2tkj3ebF5r8lPyZkqV0FOubhttiX1FXbG6MrLPNWXepe0pj+HBbo1ZexZ4/+Sg482f5RJIHXt1McBzXmDcQHjHxqops2jlqLNRyz75MH4/f9CURdDO2fUy7P8w5XCMCrwOfqpTInh/lvxRRHFhC4i/WqTl2gUAJDoIz55tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412669; c=relaxed/simple;
	bh=iopzg4fUwXtyiUn3/PBjVEGTDEKksnHtrHhCQu5aYNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFhvsvc3T4ae6xR2d4ePPxtdZtLplnCo3qBe72MIClwVKn9RGwxGV9+gcn94lO/97XnG09VqU34XizJmM0J6wAp7+1OQ1hSoWQ9AI17YQtOS/PEsYPvyugcyfM94CYiQnlWZSxCI2mXqU0cA6n6VKF6eb/q9no8FNpp4NLNiOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJwZ/VcK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745412668; x=1776948668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iopzg4fUwXtyiUn3/PBjVEGTDEKksnHtrHhCQu5aYNw=;
  b=TJwZ/VcKqirPDLlSUBmWabVYAeii7Eh1r+VeexDQrMczoNuN2PyhQvrb
   QtIKyzjOtIMCfdBP48Vx6bdkRdlSb0J5J2lZJTRLMaKLzuZ8Gx1lgdXKW
   KmHAUvfLy7M6Y+ejJNsbYEoB6Z2LAwNIDKwzMw4lq24jwZoN/LNRS7rIC
   /eur6daEh+9jc8zT6PYqJ1DURb58lVk+fB22dyk6F8lzLjifZ+bVLIStJ
   GRaP0JG6C7bX/l9fXCK6f4MIITTqTSLQ2K+tSpj3P4Bq4i61XDDhcsr13
   smO7wm8ti94KN2fd/JZkMNMgf6GdjdeuIdQfFT8xwL31FFrUSv5nlmmnp
   g==;
X-CSE-ConnectionGUID: nQInyvpOT8yDiMfIxz+P/Q==
X-CSE-MsgGUID: ynVcooILT1KtSVOESktrFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47103497"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47103497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:51:07 -0700
X-CSE-ConnectionGUID: Khlk09FYQsGczTAs9HwR7w==
X-CSE-MsgGUID: uyjlntIvSsu0aC0BOEycvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132840586"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:51:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 204DF11F9FE;
	Wed, 23 Apr 2025 15:51:03 +0300 (EEST)
Date: Wed, 23 Apr 2025 12:51:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v3 11/11] media: ccs-pll: Document the CCS PLL flags
Message-ID: <aAjiN_oNmEPo7FaA@kekkonen.localdomain>
References: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
 <20250423123359.1800904-12-sakari.ailus@linux.intel.com>
 <20250423124322.GG17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423124322.GG17813@pendragon.ideasonboard.com>

On Wed, Apr 23, 2025 at 03:43:22PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Apr 23, 2025 at 03:33:59PM +0300, Sakari Ailus wrote:
> > Document the CCS PLL flags with short comments. The CCS spec has more
> > information on them while the added documentation helps finding the
> > relevant information in the CCS spec.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.c |  2 +-
> >  drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
> >  2 files changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > index 87798616b76d..8f9a695bd9e5 100644
> > --- a/drivers/media/i2c/ccs-pll.c
> > +++ b/drivers/media/i2c/ccs-pll.c
> > @@ -129,8 +129,8 @@ static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
> >  {
> >  	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
> >  		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
> > -		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
> >  		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
> > +		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
> >  		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
> >  		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
> >  		" ext-ip-pll-divider" : "",
> > diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> > index 754eb5f52cc4..c668ee4d4493 100644
> > --- a/drivers/media/i2c/ccs-pll.h
> > +++ b/drivers/media/i2c/ccs-pll.h
> > @@ -18,19 +18,40 @@
> >  #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
> >  #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
> >  
> > -/* Old SMIA and implementation specific flags */
> > -/* op pix clock is for all lanes in total normally */
> > +/* Old SMIA and implementation specific flags. */
> > +/* OP PIX clock is for all lanes in total normally. */
> >  #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
> > -#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> > +/* If set, the PLL multipliers are required to be even. */
> >  #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(3)
> > +
> >  /* CCS PLL flags */
> > +
> > +/* The sensor doesn't have OP clocks at all. */
> > +#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> > +/* System speed model if this flag is unset. */
> >  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
> > +/* If set, the pre-PLL divider may have odd values, too. */
> >  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
> > +/*
> > + * If set, the OP PIX clock doesn't have to exactly match with data rate, it may
> > + * be higher. See "OP Domain Formulas" in MIPI CCS 1.1 spec.
> > + */
> >  #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
> > +/* If set, the VT domain may run faster than the OP domain. */
> >  #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
> > +/* If set, the VT domain may run slower than the OP domain. */
> >  #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
> > +/* If set, the PLL tree has two PLLs instead of one. */
> >  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
> > +/*
> > + * If set, the OP SYS clock is a dual data rate clock, transferring two bits per
> > + * cycle instead of one.
> > + */
> >  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
> > +/*
> > + * If set, the OP PIX clock is a dual data rate clock, transferring two bits per
> 
> Same comment as for v2.

Oh, this one I forgot. I'll post v4 in a moment.

> 
> > + * cycle instead of one.
> > + */
> >  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
> >  
> >  /**
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus

