Return-Path: <linux-media+bounces-19050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085498F040
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 15:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD091F2209C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218E819CC35;
	Thu,  3 Oct 2024 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hh4OLd8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A16199936;
	Thu,  3 Oct 2024 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961695; cv=none; b=CN3aXATlJzx2sJzXWwHLllPuEE/Yvq3o/B/03OgZoSp6M9NEyGnLyqD17p3+mJrNt4OQNJ0yOqXJsB8xeCci+pbZ02oqlEiuTYl/OfUnB5iLRre2WSMQhePwlDZR1+pZ9+k1oVU4ZUQdyLfGaEDTylSziQxn9QkI1mtiY+Qpt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961695; c=relaxed/simple;
	bh=wxzlc8tH2y82ezT+lSIa+Ep17+X79OK9lJ2BKoclhVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5oCz0y1Nb+DMLm24ePyYSPeGzLujqgIkuuKnubAoxtqXIEcDdGJeutnTSexrNhnygNyBY0m7fSF5n9lvUpYRgq8mirTu7O2yfU06PAMSoPdgnLoF98KrZy0+krY+5FQWIr622HMcRPNfU8bOymUEsaxvJn9ZYH9GcINMothhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hh4OLd8s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727961694; x=1759497694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxzlc8tH2y82ezT+lSIa+Ep17+X79OK9lJ2BKoclhVI=;
  b=hh4OLd8st6PaNiXR2KUH0zZXrtTa6dKbSz8kIZYbj+Qh30Y7NkAfPQL1
   vZZKReKUlFB7jgxpH5lTgVj9jbpKvsqSBtPFGIwYWXycj5j7Uc1mKcUf7
   99Voj9GNYTAKDTxuaVHYzGepkFiupZAuDZzQh0XL3wD7N0SebSLha4o3A
   7pdjoS1Aat3Yn3JiiESgZd+odeHwxoyZf5lNAqOi/L0WMo30c1qCrahk9
   st6Ci5+HKs5M+O7vCvZC9c5uxHX8p8Zvw0WVoMqlcbTOZPf3YHaUBVPSP
   csNrJc7FT4KtCnaPYiOu+Nmou2HzxcbViD1a3XyeBdct6ySUEVAuz0LbR
   Q==;
X-CSE-ConnectionGUID: /W2jdpRbR7efA1pvSLmD2A==
X-CSE-MsgGUID: YfPuAURJREy6tZS/SpF9Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52560536"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="52560536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:19:41 -0700
X-CSE-ConnectionGUID: K7ZRDaHxTYC1GRHJBF376Q==
X-CSE-MsgGUID: JUxNKnwaSyi0Weki1fLJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74337936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:19:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DC86411F855;
	Thu,  3 Oct 2024 16:19:36 +0300 (EEST)
Date: Thu, 3 Oct 2024 13:19:36 +0000
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
Message-ID: <Zv6Z6P0cjYCkyJh9@kekkonen.localdomain>
References: <20241002165329.957739-1-colin.i.king@gmail.com>
 <Zv40EQSR__JDN_0M@kekkonen.localdomain>
 <f1e973fd-9933-49ed-8f9c-71b8283e6fb8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e973fd-9933-49ed-8f9c-71b8283e6fb8@ideasonboard.com>

Moi,

On Thu, Oct 03, 2024 at 03:52:17PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 03/10/2024 09:05, Sakari Ailus wrote:
> > Hi Colin,
> > 
> > On Wed, Oct 02, 2024 at 05:53:29PM +0100, Colin Ian King wrote:
> > > The function ub960_rxport_read is being called and afterwards ret is
> > > being checked for any failures, however ret is not being assigned to
> > > the return of the function call. Fix this by assigning ret to the
> > > return of the call which appears to be missing.
> > > 
> > > Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > ---
> > >   drivers/media/i2c/ds90ub960.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > index ffe5f25f8647..58424d8f72af 100644
> > > --- a/drivers/media/i2c/ds90ub960.c
> > > +++ b/drivers/media/i2c/ds90ub960.c
> > > @@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
> > >   	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
> > > -	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> > > +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> > >   	if (ret)
> > >   		return ret;
> > 
> > There seems to be a similar issues all around the driver. It'd be good to
> > fix them at the same time.
> 
> With similar issues, do you mean the code not checking the return value at
> all for i2c reads and writes?
> 
> In this particular case the code already checks the return value, but
> setting the return value was missing. With a quick browse, I didn't see
> other like this.

See e.g. ub960_clear_rx_errors(), ub960_log_status(),
ub960_rxport_set_strobe_pos() and ub960_rxport_set_strobe_range.

-- 
Terveisin,

Sakari Ailus

