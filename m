Return-Path: <linux-media+bounces-66410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioGTEau3RmrKcAsAu9opvQ
	(envelope-from <linux-media+bounces-66410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 21:10:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34D6FC6A2
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 21:10:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LyDxPZ7c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66410-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66410-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20146301FB01
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 19:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D939384CF5;
	Thu,  2 Jul 2026 19:10:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3989C3845CD;
	Thu,  2 Jul 2026 19:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019427; cv=none; b=Fgl7TjmSYE5U6n2GrBTKgINeqeaSORGxRWRSSd/AxhKydZLOHP3NBj6dfhM0vHDYuth9KubbZivSlZpX7JpdUdW1nc3pddQZfsONwykJj7GevEgv4284Mc4bD55u7tJRRDfCVMGeWC1LLpAIaoX1w9rqIczTS8f584tNSRnzaA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019427; c=relaxed/simple;
	bh=GQEBaXCyfmpFR9KLGlcLtWJUKzAGCBbk9jw5UYhvIaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu8Qt/b26lroBpDKcmj7upTfuwHUXtwiA4MAzNMs8vBCFreOjPpoLX7fUW0Fhnwd8RGZDOZKswXetzJ2dzzN/wt5oXZGR3lBwaNkct8eumj00cxV86Cqk+t2HfCTkxnI+dnHTGkmJgAAremw0E+IKJsHUmxTrwHVmefXiUVyk9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyDxPZ7c; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783019423; x=1814555423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQEBaXCyfmpFR9KLGlcLtWJUKzAGCBbk9jw5UYhvIaI=;
  b=LyDxPZ7cKKPsYKTk0JznQ3jpNoAdWnopNqqe5yNl07lEY5Cmr5ss9el4
   vXY6Z8mwBlqdK6PwLZlptcSVDXbaw7ng/WQiJeO8FuWKnyYMGK2hlkhdL
   nEnkGPgkCQFjGHBA59NXjab/X8hHukSuroXFEAbC9Uk4Emv53ldbDDweY
   dno05DHuDqGgML/sUTwXhq7eJu3+kMY/Dz5hnEMbHvDDkRQpJE58HR1Kh
   j+fchl566K4oReeD9P8teUxqrX9GJNnRn6BW9+V4+DL3p8sjYIEnqmzZA
   UYeEVCV3KlT7IGbsJbElZy8L/3zA/vyWDZVpL7c+VdIucDp8KZ/sI2ZEx
   A==;
X-CSE-ConnectionGUID: kunwAQtKQR+ms9EGn1Syag==
X-CSE-MsgGUID: 0VlrDbBCRc6Q0E11UyuDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94934693"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="94934693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:10:22 -0700
X-CSE-ConnectionGUID: N8BYN1owSoWotUrfYoXafw==
X-CSE-MsgGUID: 5qO6JVo9TEOyjM/zxKsAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="276136950"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:10:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E564D11F8D1;
	Thu, 02 Jul 2026 22:10:15 +0300 (EEST)
Date: Thu, 2 Jul 2026 22:10:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ryan Thomas Cragun <ryantcragun@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov02c10: tolerate a sensor clock other than
 19.2 MHz
Message-ID: <aka3l1dykdZGZs9M@kekkonen.localdomain>
References: <20260702161022.5658-1-ryantcragun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702161022.5658-1-ryantcragun@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ryantcragun@gmail.com,m:hansg@kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66410-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A34D6FC6A2

Hi Ryan,

Thanks for the patch.

On Thu, Jul 02, 2026 at 12:10:22PM -0400, Ryan Thomas Cragun wrote:
> The driver requires the sensor's external clock to be exactly 19.2 MHz
> (OV02C10_MCLK) and aborts probe with -EINVAL otherwise. This leaves the
> camera completely unusable on platforms that clock the sensor
> differently.
> 
> For example, the Microsoft Surface Laptop 7 (Intel) drives the OV02C10
> from a fixed 12 MHz clock (provided by an INT3472 "discrete" clock that
> cannot be reprogrammed). The sensor's register/PLL tables assume 19.2
> MHz, so at 12 MHz all timings scale by 12/19.2 (the nominal 30 fps mode
> runs at ~18.75 fps), but the sensor is otherwise fully functional and
> produces a correct image.
> 
> Rather than failing probe:
> 
>  - Attempt clk_set_rate(OV02C10_MCLK). On platforms whose sensor clock is
>    programmable (e.g. a TPS68470 PMIC) this yields the expected 19.2 MHz
>    and the native frame rate.
>  - If the rate still differs (fixed clock), warn and continue instead of
>    aborting, so the camera works.
> 
> Platforms that already provide 19.2 MHz are unaffected (no warning, no
> rate change). The reduced frame rate on a lower clock can be restored by
> shrinking the sensor's vertical blanking (VTS); that can be addressed
> separately.
> 
> Signed-off-by: Ryan Thomas Cragun <ryantcragun@gmail.com>
> ---
>  drivers/media/i2c/ov02c10.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cf93d3603..01cbaedfc 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -892,10 +892,19 @@ static int ov02c10_probe(struct i2c_client *client)
>  				     "failed to get imaging clock\n");
>  
>  	freq = clk_get_rate(ov02c10->img_clk);
> +	if (freq != OV02C10_MCLK) {
> +		/*
> +		 * Some platforms provide the sensor clock via a programmable
> +		 * PMIC. Ask for OV02C10_MCLK; if that is not possible (e.g. a
> +		 * fixed 12 MHz clock on the Surface Laptop 7) proceed anyway.
> +		 */
> +		if (clk_set_rate(ov02c10->img_clk, OV02C10_MCLK) == 0)
> +			freq = clk_get_rate(ov02c10->img_clk);

No need to try to set the rate -- in general, the frequency isn't supposed
to be changed by the driver here.

> +	}
>  	if (freq != OV02C10_MCLK)
> -		return dev_err_probe(ov02c10->dev, -EINVAL,
> -				     "external clock %lu is not supported",
> -				     freq);
> +		dev_warn(ov02c10->dev,
> +			 "external clock %lu differs from expected %u; proceeding anyway\n",
> +			 freq, OV02C10_MCLK);

I'd use dev_info().

The driver should have PLL configuration for 12 MHz external clock. The
driver should also calculate its pixel rate from the external clock. Both
are obviously out of scope of this patch.

>  
>  	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
>  

-- 
Regards,

Sakari Ailus

