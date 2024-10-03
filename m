Return-Path: <linux-media+bounces-19015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294298E9A3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2391C21DB1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 06:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A2F7406D;
	Thu,  3 Oct 2024 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHVLG1IL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B57768FC;
	Thu,  3 Oct 2024 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935512; cv=none; b=qSPvHjPlhzH7GUCgyg4fgzrMqtjAp+6VzbfbGceOwA4SwY9pAYKNWY/fyhkHj2JtQzYQDuE7E5g0pWmfjnciqesxTkhX+ZAAbvWoDmf3i5lf7iFqsLyXp+NWNylh0MkljgNyknrsrTachtVR+f8/b4ArBd6iFcI8b4V4SuXOaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935512; c=relaxed/simple;
	bh=A4MgTpd7BHufFHrNoLzkm1cCXgqd9RIEqBU+JMd3LO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1kDxr0lq7Nd8jEhEmVJU2r1lp5oeml7HoQUeU3uuQolw5Pbm7aa3us4YC8F/meIyWJj3hbRLJVVVbmwdkUMvptW26KTTGU+n6hkjkx5wyBtxTXU9Al49MDSzDIhammdSwfixasC4+0n6l3xnlqiklqbKS8J5+9U+V9ckFihPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHVLG1IL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727935511; x=1759471511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A4MgTpd7BHufFHrNoLzkm1cCXgqd9RIEqBU+JMd3LO8=;
  b=RHVLG1IL7mPPQbneENT7Z+opE/fC1BYxgrOT+YmYGAxAdrztiyNYoh4e
   nC3cuqKRycxVR+5fQDd999eomIMr4gDV5AVDfJ5wcQiw85ZYT0kUkCD5O
   0qeUZJnPFiv/4DbrUUmAt/gfLh9Pb6aAcpnRdnn3k7yK1svjxEJuFV3Ai
   lRslGaGXcGfc1hPuH1dkP74Ql02B0Wt2MsYu3GMcSrEhcbu9kNKfLQqe6
   rqvX7MZziNAXYKi2UMSvbHswH9wAfX5mcHSxtuhCfJMfgR9sVU2jXpY52
   UT0kMHIClZJy5FAhxEAU1h3J5hkCdiVdN51jsEzrmD3K73940OQpZ5Ya6
   Q==;
X-CSE-ConnectionGUID: ZtoKUV8TRhe0PYp31gjyqg==
X-CSE-MsgGUID: 8iLyNbhiS4K7sqBdZxFArQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27211317"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27211317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:05:11 -0700
X-CSE-ConnectionGUID: j3MMLejqTHK8N27VqYMwqA==
X-CSE-MsgGUID: vQYNgOl3TXG/20Mk3GK9mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74488587"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:05:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 631F711F83B;
	Thu,  3 Oct 2024 09:05:05 +0300 (EEST)
Date: Thu, 3 Oct 2024 06:05:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: ds90ub960: Fix missing return check on
 ub960_rxport_read call
Message-ID: <Zv40EQSR__JDN_0M@kekkonen.localdomain>
References: <20241002165329.957739-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002165329.957739-1-colin.i.king@gmail.com>

Hi Colin,

On Wed, Oct 02, 2024 at 05:53:29PM +0100, Colin Ian King wrote:
> The function ub960_rxport_read is being called and afterwards ret is
> being checked for any failures, however ret is not being assigned to
> the return of the function call. Fix this by assigning ret to the
> return of the call which appears to be missing.
> 
> Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index ffe5f25f8647..58424d8f72af 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>  
>  	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
>  
> -	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
> +	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
>  	if (ret)
>  		return ret;
>  

There seems to be a similar issues all around the driver. It'd be good to
fix them at the same time.

-- 
Kind regards,

Sakari Ailus

