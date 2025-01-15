Return-Path: <linux-media+bounces-24787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7043A125F1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2411889055
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699F878F2E;
	Wed, 15 Jan 2025 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhXHqFJk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962B70821;
	Wed, 15 Jan 2025 14:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951041; cv=none; b=QpLFpjlvZvSY0ggclg67jA8lEMfXw9/h4j93blyfJ0fjc4f3IsVsLtMleOa6vVzyGR3mXXxvx+65qCgmCYQqJfyvSC9ZxNq5T1F/g8SIFNEZC/f58Mws1qIMvhV6FG1cW7lPI79nU9DFP4cYAXb7SeIygWSsNZz0wSugXvEwN0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951041; c=relaxed/simple;
	bh=OjIcTOLTDFl0wgUKS+7r6V/v2ikRnt7CCIOHbDO/lCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1OqGlR1EjgHrATPq/GaDCusP5zDi2NkgWXJ3997UfqD88qY52hdQzCnsKKbfuVp28sL9kLEkgwMOsaqbasyimJ6U+W/tsHdUMImAPAyuqQNmH4Y1fsm2JaotyDweLrKFh0VC1uwEi6H2wNsw2feXBNDi3iNuB6l11fmE4rtTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhXHqFJk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951040; x=1768487040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjIcTOLTDFl0wgUKS+7r6V/v2ikRnt7CCIOHbDO/lCA=;
  b=PhXHqFJkoBRXQD+FGtUgZSgufw/wd6yXok823Ai8urvx9eA8JW1ausGW
   g5up8Ob6VRSkUbHod6oYrPuTy4Y3peDhUb9ouXznOqDlf3H1eY6l43Btf
   Kg22quI9AV+sG1Av5VhGHAJSGlpHAUWYOQ6O4TM0975kFfvuqrU5Qso7x
   NkeRLLgAS7XEqrKwl71maGmFam9/SJfdyKzCQRP+yAdGLRqosgIpZGCyG
   tc2qlh+vizP3waO05gwMO69DNKrtYMnnlItKB7/QrltOYDf2QVBngdLLD
   mEaSFUOcAybrQShvvGU66Y1CBKGlq47kcs9ZqIDibUSopGMgld+dnDcUS
   Q==;
X-CSE-ConnectionGUID: exr+Is/7SuuFaugx1Fm7/g==
X-CSE-MsgGUID: OuRUToOfR5+ApqkYcDL9Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36568132"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="36568132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:23:58 -0800
X-CSE-ConnectionGUID: yDlKQIiaT2CSsg680cS6uQ==
X-CSE-MsgGUID: 5eFay0YzRo2q5th4DRKvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109189852"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:23:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A82E11F8B3;
	Wed, 15 Jan 2025 16:23:54 +0200 (EET)
Date: Wed, 15 Jan 2025 14:23:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 12/19] media: i2c: ds90ub960: Add RX port iteration
 support
Message-ID: <Z4fE-qD7QvNiwOeH@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-12-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-12-e0b9a1f644da@ideasonboard.com>

Moi,

On Fri, Jan 10, 2025 at 11:14:12AM +0200, Tomi Valkeinen wrote:
> The driver does a lot of iteration over the RX ports with for loops. In
> most cases the driver will skip unused RX ports. Also, in the future
> patches the FPD-Link IV support will be refreshed with TI's latest init
> sequences which involves a lot of additional iterations over the RX
> ports, often only for FPD-Link IV ports.
> 
> To make the iteration simpler and to make it clearer what we're
> iterating over (all or only-active, all or only-fpd4), add macros and
> support functions for iterating the RX ports. Use the macros in the
> driver, replacing the for loops.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 260 ++++++++++++++++++++++--------------------
>  1 file changed, 135 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index bca858172942..02e22ae813fa 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -649,6 +649,63 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
>  	return NULL;
>  }
>  
> +struct ub960_rxport_iter {
> +	unsigned int nport;
> +	struct ub960_rxport *rxport;
> +};
> +
> +enum ub960_iter_flags {
> +	UB960_ITER_ACTIVE_ONLY = BIT(0),
> +	UB960_ITER_FPD4_ONLY = BIT(1),
> +};
> +
> +static struct ub960_rxport_iter ub960_iter_rxport(struct ub960_data *priv,
> +						  struct ub960_rxport_iter it,
> +						  enum ub960_iter_flags flags)
> +{
> +	for (; it.nport < priv->hw_data->num_rxports; it.nport++) {
> +		it.rxport = priv->rxports[it.nport];
> +
> +		if ((flags & UB960_ITER_ACTIVE_ONLY) && !it.rxport)
> +			continue;
> +
> +		if ((flags & UB960_ITER_FPD4_ONLY) &&
> +		    it.rxport->cdr_mode != RXPORT_CDR_FPD4)
> +			continue;
> +
> +		return it;
> +	}
> +
> +	it.rxport = NULL;
> +
> +	return it;
> +}
> +
> +#define for_each_rxport(priv)                                                 \

it should be also an argument to the macro as it's visible outside it.

And wouldn't it be reasonable to use a pointer instead for the purpsoe?

> +	for (struct ub960_rxport_iter it =                                    \
> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> +				       0);                                    \
> +	     it.nport < (priv)->hw_data->num_rxports;                         \
> +	     it.nport++, it = ub960_iter_rxport(priv, it, 0))
> +
> +#define for_each_active_rxport(priv)                                          \
> +	for (struct ub960_rxport_iter it =                                    \
> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> +				       UB960_ITER_ACTIVE_ONLY);               \
> +	     it.nport < (priv)->hw_data->num_rxports;                         \
> +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
> +						UB960_ITER_ACTIVE_ONLY))
> +
> +#define for_each_active_rxport_fpd4(priv)                                     \
> +	for (struct ub960_rxport_iter it =                                    \
> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
> +				       UB960_ITER_ACTIVE_ONLY |               \
> +					       UB960_ITER_FPD4_ONLY);         \
> +	     it.nport < (priv)->hw_data->num_rxports;                         \
> +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
> +						UB960_ITER_ACTIVE_ONLY |      \
> +							UB960_ITER_FPD4_ONLY))

-- 
Terveisin,

Sakari Ailus

