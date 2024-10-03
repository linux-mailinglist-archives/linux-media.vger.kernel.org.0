Return-Path: <linux-media+bounces-19057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895098F23F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 17:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3001C211B3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C501A0BD6;
	Thu,  3 Oct 2024 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOIUspi6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2B1A01BC;
	Thu,  3 Oct 2024 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968436; cv=none; b=MEIRz/tQX3fvldXGCUcnoZCS5ubeRHiwURAjj5gQQgM/3fdhltSe7bwaUHt79B1+QQf/OJzN7ZAlwMp6kIrZrLgd4G6YieRRkTrKzE38SBWPs0op3APT86XZdTRR+D78jboxZo/eo4fSCeK75PZ3xOrXrUivMzDAwvoYJJFs9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968436; c=relaxed/simple;
	bh=f/vMsRMQF4DP5vs+pa5InfZpJ0GIZVb4L2/Q82hBRzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UH0/PTnGGS976237lBxSRZ+vCEfFKgjc84y/hYKRDLMasFHBTHhrcYZzXMevZ6YJbsUoB6MIt6o2kTy7x87GjXKdn2hsln65qxLR4Zws0kdg4INJEbo/atYBClBLI32xMAnA5+GTleDz7yvIjLRq2aJJCrTUNcKEcbkyFT8+ps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOIUspi6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727968434; x=1759504434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/vMsRMQF4DP5vs+pa5InfZpJ0GIZVb4L2/Q82hBRzE=;
  b=VOIUspi6ug6jX9/ZHdq1bOKJNuDLxoUgnayqiu6aSJZT5rnPX64Tx+Ee
   AhJk4Hc58rAa4VakI9BwExw2vxaIBYjKMgmfSweZyjoM73BM2J+pVEYkh
   wgESnhbfhWq6SEirN3Bgr5g9gcTt17G/QTnyZv9/4f/y5wLmwcqynxLZu
   bcfpJC9Pxf/YZbuyfYdwa8aTSDc+KKY45hrJ6qks4KUzjYtJxqAJxEDLs
   CxIJOkg47hUo7tviwyXi/Uow/QDNG2qRG2823LrufVWMmn0QKOJQ7DCUV
   HlsOiy/SvuW84dUWtFxkmXBkkuc1hxY5A/7QPBSz9D84ilCOf9yV3U5Co
   w==;
X-CSE-ConnectionGUID: 9RFU3jicTYalhtr2yfTJYw==
X-CSE-MsgGUID: R9KjX12yQrWtl3925/yZmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27297995"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27297995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:13:53 -0700
X-CSE-ConnectionGUID: g1yVx1EeS0yqLvTQckaNTQ==
X-CSE-MsgGUID: ce2dxXTVSruPny3mMWSgcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74488618"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:13:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 80E4411F855;
	Thu,  3 Oct 2024 18:13:48 +0300 (EEST)
Date: Thu, 3 Oct 2024 15:13:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: ds90ub960: Fix missing return check on
 ub960_rxport_read call
Message-ID: <Zv60rJo_ucdxHQk3@kekkonen.localdomain>
References: <20241002165329.957739-1-colin.i.king@gmail.com>
 <Zv40EQSR__JDN_0M@kekkonen.localdomain>
 <f1e973fd-9933-49ed-8f9c-71b8283e6fb8@ideasonboard.com>
 <Zv6Z6P0cjYCkyJh9@kekkonen.localdomain>
 <ea1c37b3-0430-4bce-9228-5d761ff94425@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea1c37b3-0430-4bce-9228-5d761ff94425@ideasonboard.com>

Moi,

On Thu, Oct 03, 2024 at 04:33:54PM +0300, Tomi Valkeinen wrote:
> On 03/10/2024 16:19, Sakari Ailus wrote:
> > Moi,
> > 
> > On Thu, Oct 03, 2024 at 03:52:17PM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 03/10/2024 09:05, Sakari Ailus wrote:
> > > > Hi Colin,
> > > > 
> > > > On Wed, Oct 02, 2024 at 05:53:29PM +0100, Colin Ian King wrote:
> > > > > The function ub960_rxport_read is being called and afterwards ret is
> > > > > being checked for any failures, however ret is not being assigned to
> > > > > the return of the function call. Fix this by assigning ret to the
> > > > > return of the call which appears to be missing.
> > > > > 
> > > > > Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> > > > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > > > ---
> > > > >    drivers/media/i2c/ds90ub960.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > > > index ffe5f25f8647..58424d8f72af 100644
> > > > > --- a/drivers/media/i2c/ds90ub960.c
> > > > > +++ b/drivers/media/i2c/ds90ub960.c
> > > > > @@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
> > > > >    	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
> > > > > -	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> > > > > +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> > > > >    	if (ret)
> > > > >    		return ret;
> > > > 
> > > > There seems to be a similar issues all around the driver. It'd be good to
> > > > fix them at the same time.
> > > 
> > > With similar issues, do you mean the code not checking the return value at
> > > all for i2c reads and writes?
> > > 
> > > In this particular case the code already checks the return value, but
> > > setting the return value was missing. With a quick browse, I didn't see
> > > other like this.
> > 
> > See e.g. ub960_clear_rx_errors(), ub960_log_status(),
> > ub960_rxport_set_strobe_pos() and ub960_rxport_set_strobe_range.
> 
> Right, those don't check the return value. So they're not the same as the
> one fixed in this patch.
> 
> I'm not arguing against adding error checks, but that's a big work and I
> think this patch is a different kind of fix which should be applied whether
> the additional error checks are added or not.

How much of work that is really? It seems trivial, albeit there are a
number of locations that need to be fixed.

I'm fine with applying this but it'd be nice to add at least a FIXME:
comment to the code while at it.

> 
> Also, while still not arguing against adding the checks, it looks quite
> common to not check the returns values. E.g. it's not just a few errors I
> see if I add __must_check to cci functions.

I haven't seen this being as widespread in pretty much any other (upstream)
driver.

-- 
Terveisin,

Sakari Ailus

