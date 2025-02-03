Return-Path: <linux-media+bounces-25556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED9A255CC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD3D165B57
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4971FF1D8;
	Mon,  3 Feb 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="af1xjMeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493BC2BB04;
	Mon,  3 Feb 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574872; cv=none; b=d6nVshk3/zHK/xl7P3FAPpVipJwnzeU+AXJ6RIOLDdCC4XtTTZL6BPLoPvQeidDBJKJXDuRe2hzPiuyOu11MzqjF+HhqsjY9si3wFSkuLD7OIddPWPuiwyl+wO8x81NGU62Vrv/P+WpPlVgEWbr14upeUjo/BIMI0JlLZg4xKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574872; c=relaxed/simple;
	bh=UoLyRftOTV/0DOSKoGx6OYjooGJd/mdHPKHSqp6jPQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNy7oZ6UHdJj6b3DvToKCnqGTypXbvk41S+LOzw7zCn14Fb6GQlfU4JCkqd8b+znDerh5gmFb5/UUUsGyz2EhQL9yp9CmcNVlplPowmRg4fdkfk7ESfvvYQNjwRCRDmheRmnW7C0bn8+UAWtYqapyL8mX4bWVf+0FthGonCHjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=af1xjMeQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574871; x=1770110871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UoLyRftOTV/0DOSKoGx6OYjooGJd/mdHPKHSqp6jPQo=;
  b=af1xjMeQzJlHbejOt1/nUkgIJQvCUbPxV+Bnn4uIxcJ1rYe/UWj4YLPG
   x8UWBGx5DqLbSrPEmjLY0JFwO8ECXZSFBDu41PfzVONs840gZNIQXoVpS
   S2Nzkwnb7ana2H+LFA5mwW2PdkYB+ttr1OpGHPNn2t1tplm+dLsNfk/ed
   C5+aXQJdOjGecOIlEUAYGFljPr9A9cgeN73ag4Ky28KRFH5n5dlHG7kfL
   eAZoYtdq9MO8Cy/p9gBqzbFbusLi8W2N0hKw7KK1sda+8rUQMNPN5bstr
   KIFIC1ryyum+CKtB+Zs1yP+yoBGOKFaKJCSz+9kBhPE6Jo31xDOw4ur4y
   A==;
X-CSE-ConnectionGUID: agwfT9eGRY2Y4k3gc9cPYQ==
X-CSE-MsgGUID: 0BPkYmnhRWy4pDpbs+/kpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39088842"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39088842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:27:51 -0800
X-CSE-ConnectionGUID: 9G1wxD0LSNWB+2r+5i/mvQ==
X-CSE-MsgGUID: PiNCnsMWRn2bh20LUbdAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111091570"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:27:49 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6BF7B11F9C3;
	Mon,  3 Feb 2025 11:27:46 +0200 (EET)
Date: Mon, 3 Feb 2025 09:27:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 12/19] media: i2c: ds90ub960: Add RX port iteration
 support
Message-ID: <Z6CMEkD5YLhJqQiI@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-12-e0b9a1f644da@ideasonboard.com>
 <Z4fE-qD7QvNiwOeH@kekkonen.localdomain>
 <92c7ee5b-3495-4398-99dd-881c704c64c1@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92c7ee5b-3495-4398-99dd-881c704c64c1@ideasonboard.com>

Moi,

On Fri, Jan 24, 2025 at 03:34:44PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/01/2025 16:23, Sakari Ailus wrote:
> > Moi,
> > 
> > On Fri, Jan 10, 2025 at 11:14:12AM +0200, Tomi Valkeinen wrote:
> > > The driver does a lot of iteration over the RX ports with for loops. In
> > > most cases the driver will skip unused RX ports. Also, in the future
> > > patches the FPD-Link IV support will be refreshed with TI's latest init
> > > sequences which involves a lot of additional iterations over the RX
> > > ports, often only for FPD-Link IV ports.
> > > 
> > > To make the iteration simpler and to make it clearer what we're
> > > iterating over (all or only-active, all or only-fpd4), add macros and
> > > support functions for iterating the RX ports. Use the macros in the
> > > driver, replacing the for loops.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/ds90ub960.c | 260 ++++++++++++++++++++++--------------------
> > >   1 file changed, 135 insertions(+), 125 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > index bca858172942..02e22ae813fa 100644
> > > --- a/drivers/media/i2c/ds90ub960.c
> > > +++ b/drivers/media/i2c/ds90ub960.c
> > > @@ -649,6 +649,63 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
> > >   	return NULL;
> > >   }
> > > +struct ub960_rxport_iter {
> > > +	unsigned int nport;
> > > +	struct ub960_rxport *rxport;
> > > +};
> > > +
> > > +enum ub960_iter_flags {
> > > +	UB960_ITER_ACTIVE_ONLY = BIT(0),
> > > +	UB960_ITER_FPD4_ONLY = BIT(1),
> > > +};
> > > +
> > > +static struct ub960_rxport_iter ub960_iter_rxport(struct ub960_data *priv,
> > > +						  struct ub960_rxport_iter it,
> > > +						  enum ub960_iter_flags flags)
> > > +{
> > > +	for (; it.nport < priv->hw_data->num_rxports; it.nport++) {
> > > +		it.rxport = priv->rxports[it.nport];
> > > +
> > > +		if ((flags & UB960_ITER_ACTIVE_ONLY) && !it.rxport)
> > > +			continue;
> > > +
> > > +		if ((flags & UB960_ITER_FPD4_ONLY) &&
> > > +		    it.rxport->cdr_mode != RXPORT_CDR_FPD4)
> > > +			continue;
> > > +
> > > +		return it;
> > > +	}
> > > +
> > > +	it.rxport = NULL;
> > > +
> > > +	return it;
> > > +}
> > > +
> > > +#define for_each_rxport(priv)                                                 \
> > 
> > it should be also an argument to the macro as it's visible outside it.
> > 
> > And wouldn't it be reasonable to use a pointer instead for the purpsoe?
> 
> You mean something like:
> 
>   struct ub960_rxport_iter it = { 0 };
> 
>   for_each_rxport(priv, &it) { }
> 
> Then we leak the iterator, and I really hate it. I've fixed numerous bugs
> caused by such cases.

You can still define it for the loop only, just give it a name instead of
using a pre-determined name.

Could you also pass the iterator by reference instead of the value?

> 
>  Tomi
> 
> > 
> > > +	for (struct ub960_rxport_iter it =                                    \
> > > +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> > > +				       0);                                    \
> > > +	     it.nport < (priv)->hw_data->num_rxports;                         \
> > > +	     it.nport++, it = ub960_iter_rxport(priv, it, 0))
> > > +
> > > +#define for_each_active_rxport(priv)                                          \
> > > +	for (struct ub960_rxport_iter it =                                    \
> > > +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> > > +				       UB960_ITER_ACTIVE_ONLY);               \
> > > +	     it.nport < (priv)->hw_data->num_rxports;                         \
> > > +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
> > > +						UB960_ITER_ACTIVE_ONLY))
> > > +
> > > +#define for_each_active_rxport_fpd4(priv)                                     \
> > > +	for (struct ub960_rxport_iter it =                                    \
> > > +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> > > +				       UB960_ITER_ACTIVE_ONLY |               \
> > > +					       UB960_ITER_FPD4_ONLY);         \
> > > +	     it.nport < (priv)->hw_data->num_rxports;                         \
> > > +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
> > > +						UB960_ITER_ACTIVE_ONLY |      \
> > > +							UB960_ITER_FPD4_ONLY))
> > 
> 

-- 
Terveisin,

Sakari Ailus

