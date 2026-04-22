Return-Path: <linux-media+bounces-59284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKNBHeBz6GlCKgIAu9opvQ
	(envelope-from <linux-media+bounces-59284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:08:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACA442C3E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23C0F30151DA
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7790436A03A;
	Wed, 22 Apr 2026 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWy284Rs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A21361647;
	Wed, 22 Apr 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841637; cv=none; b=AyEp33UJHkdx0FVQNP4wk/4MfJxqPQCeUlTnnJgVqMJcR3WaIOT5viao0c9t/MDwXc90jdL+K1O1FybNLzSU8id4NrXK6NQoeYWrb0Qaki3kdM41dNXqdu5UQgxVziLwUbu9QKHfErbjxU0dHOmrwCZO2sRWW3TPbeey96yUYyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841637; c=relaxed/simple;
	bh=KZ+28b2UslR3HSmfO26y8ijC8Hwa4N5jICfd5wha1sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luR2YJtfF00dU+OoAV8AhzkFfmMIsxC4SaavqYENPmoohcbi9HS0YQtOw5qi6y4m1yz7RVMpVZnqJk3N7JMdHTQ74StccAohVbcXrXolqGRS+d1hn5Bq1wSOaX0dSbMOA8hB9IAQIqXihI/tM1tPrm2q0eKFnzEjElpqZHYgqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWy284Rs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776841636; x=1808377636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZ+28b2UslR3HSmfO26y8ijC8Hwa4N5jICfd5wha1sE=;
  b=YWy284RsqmSq38rE0fW6GIDV9R5vtvaNLnMDx4DVCwj7Fo6zzj6xPSVx
   pxVoYGEOVN82ZSXC1dr6/EF0KjDc84azxQiIBU1HvkMOgDltuiqoIO81E
   leYOfS4pL5J6421Y9Jwh/I1CfETxs3Hn9Y1Q7vrJJmZRxSZkqNZH5+jx0
   0tn8shABUYVNpBVKoJBo4q/ikQebizVLpp1p8tg5gmWFJRciLaniAZvfx
   ny5i8pw35h6vHDR9C9a/8hJH5S1YxbvUsVhR0FztZWZEE1Rl6wJfKaar5
   MfInnDHb9ehofWToR71QMbmf3I3L6z5Q0dY1jGGR4xuItZbRCXIwN3vPR
   w==;
X-CSE-ConnectionGUID: HH0goUxmS5S34hjYSH6SPw==
X-CSE-MsgGUID: S7MIbhXuQtWNIRGyT9t1/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77770190"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77770190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:07:16 -0700
X-CSE-ConnectionGUID: zRNn8JYmS12ku1CD1+GUOg==
X-CSE-MsgGUID: QSm++9cOTdC9YGXVNsQ+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="237311202"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:07:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E70231201FC;
	Wed, 22 Apr 2026 10:07:11 +0300 (EEST)
Date: Wed, 22 Apr 2026 10:07:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v4 2/5] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <aehzn85IsUI-bcKW@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
 <20260421225217.12472-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421225217.12472-3-tchatard@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59284-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BACA442C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

On Tue, Apr 21, 2026 at 03:52:14PM -0700, Thierry Chatard wrote:
> The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
> With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
> resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.
> 
> Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
> INT3479 is invisible to it: the clock consumer lookup entry for the
> front camera is never registered with the tps68470-clk driver, and
> the OV5670 sensor driver cannot acquire its MCLK.
> 
> Fix this without touching ACPI tables by adding optional static clock
> consumer fields to struct int3472_tps68470_board_data:
> 
>   unsigned int n_clk_consumers;
>   const struct tps68470_clk_consumer *clk_consumers;
> 
> When board data is present and n_clk_consumers is non-zero, probe uses
> the static list instead of for_each_acpi_consumer_dev() to populate
> tps68470-clk platform data.  Platforms that do not set these fields
> continue to use the existing ACPI traversal path unchanged.
> 
> The board_data lookup is moved before the clock-pdata allocation so
> that it is available for both the static and dynamic paths.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 36 +++++++++++++++----
>  drivers/platform/x86/intel/int3472/tps68470.h | 10 ++++++
>  2 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0..e121eb24a 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -147,17 +147,40 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	struct tps68470_clk_platform_data *clk_pdata;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
> -	int n_consumers;
> +	unsigned int n_consumers;
>  	int device_type;
>  	int ret;
> -	int i;
> +	unsigned int i;
>  
>  	if (!adev)
>  		return -ENODEV;
>  
> -	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> -	if (n_consumers < 0)
> -		return n_consumers;
> +	/*
> +	 * Look up board data before building clock platform data.  On
> +	 * platforms where a sensor's ACPI _DEP does not list the INT3472
> +	 * device, for_each_acpi_consumer_dev() misses that sensor and its
> +	 * clock consumer entry is never registered.  Board data can supply
> +	 * a static consumer list to use instead, bypassing the broken _DEP
> +	 * traversal.
> +	 */
> +	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> +
> +	if (board_data && board_data->n_clk_consumers) {
> +		clk_pdata = devm_kzalloc(&client->dev,
> +					 struct_size(clk_pdata, consumers,
> +						     board_data->n_clk_consumers),
> +					 GFP_KERNEL);
> +		if (!clk_pdata)
> +			return -ENOMEM;
> +		clk_pdata->n_consumers = board_data->n_clk_consumers;
> +		for (i = 0; i < board_data->n_clk_consumers; i++)
> +			clk_pdata->consumers[i] = board_data->clk_consumers[i];
> +		n_consumers = board_data->n_clk_consumers;
> +	} else {
> +		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> +		if (n_consumers < 0)

n_consumers is now unsigned int so this check will always be false. I'd
ust make it int again.

Also, the code above is specific to systems shipped with Windows and is now
even more outsized compared to simply creating the MFD devices for ChromeOS
systems. Can you return from the ChromeOS and device type error checks in
the switch() below and move the Windows case out of the switch()?

> +			return n_consumers;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> @@ -176,7 +199,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	device_type = skl_int3472_tps68470_calc_type(adev);
>  	switch (device_type) {
>  	case DESIGNED_FOR_WINDOWS:
> -		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>  		if (!board_data)
>  			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
>  
> @@ -233,7 +255,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  static void skl_int3472_tps68470_remove(struct i2c_client *client)
>  {
>  	const struct int3472_tps68470_board_data *board_data;
> -	int i;
> +	unsigned int i;
>  
>  	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>  	if (board_data) {
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701..1d3d67459 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -12,11 +12,21 @@
>  #define _INTEL_SKL_INT3472_TPS68470_H
>  
>  struct gpiod_lookup_table;
> +struct tps68470_clk_consumer;
>  struct tps68470_regulator_platform_data;
>  
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	/*
> +	 * Static clock consumers.  When n_clk_consumers is non-zero these
> +	 * are used in place of for_each_acpi_consumer_dev() to build the
> +	 * tps68470-clk platform data.  Needed on platforms where a sensor's
> +	 * ACPI _DEP does not list the INT3472 device, causing that sensor
> +	 * to be missed by the ACPI dependency traversal.
> +	 */
> +	unsigned int n_clk_consumers;
> +	const struct tps68470_clk_consumer *clk_consumers;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };

-- 
Kind regards,

Sakari Ailus

