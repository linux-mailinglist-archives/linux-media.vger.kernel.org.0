Return-Path: <linux-media+bounces-59640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHjILk0V72kQ6AAAu9opvQ
	(envelope-from <linux-media+bounces-59640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 09:50:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A746E99A
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 09:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6384E300E15B
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 07:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ACD39A050;
	Mon, 27 Apr 2026 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/ECi+0t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189C399349;
	Mon, 27 Apr 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276113; cv=none; b=Mmbp1f1YXDUNTEKn5Q/ZdvQ9X1L9wXHPXLwSZjg6xGkV7Ozoe6LjQS9TvRMDCEB7HwKp6U3jV6PwYIAl8w0pk0+itgN6Gk16z99QxXL8xibqF0lop2oys2agu7rNPSBEM0VHNVi2KgFkZ8k78Xe7Ouw25esBxCnzceBH83SWuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276113; c=relaxed/simple;
	bh=dJUMIKc9BRHWTs+Fhk4cLDLfEJKMLqKo9QAUlnImYsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJCuW8/II73q0gLgXxVL5oWZCOksecvtNC094Ofj4iDmGjdLdVFFYfCqJghvTEVBYqutTLHmhdqX0J8Bm9ay1oJSJ0ie+Wj0JnsgXTuO+2bjSe3/rD59n0fXLB6T0pfUzHVlv3cUzSkDqZGfHKlsothBFqkE7GIR7TbL/HMFBbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/ECi+0t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777276112; x=1808812112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dJUMIKc9BRHWTs+Fhk4cLDLfEJKMLqKo9QAUlnImYsA=;
  b=D/ECi+0tKphIOyWfuU3Y8nIXzOQyI99zUsXXX/qvxTmfYzViRPbjNpid
   iBT3/nV/MqHOBg5xnMuGBjnhNME04jV+/JuVTuyhoQzU2oloSEE76mf97
   WDN0ek1swE+gXEnEaKF3HcyFIhdWzNxWhGNJ0CXYvfajtWQVb73TGEa54
   6V/2ZzKwfSJ7X5RxniQFS35r8pKaIu2CFis4lQn9bM35gLY9pZww0sgUi
   drC3MIKaghCMcG8i5mITfcJajqMP9clYtmw+ypghmswr0buvDk51zcX4R
   Y8jMU7fYX/9PKnT40F0/EwENkq7lHkvYOjNTuFQ/Qr+fCRptCJOvgH6+D
   Q==;
X-CSE-ConnectionGUID: 5Qv5pI1YQJiNrsTmOBthJA==
X-CSE-MsgGUID: e43DeW1ARiiGMpKka9f/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="89621272"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="89621272"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:48:31 -0700
X-CSE-ConnectionGUID: 6hNHDnNXQ4ihSWvqpvbEcg==
X-CSE-MsgGUID: /rzgExqJTWGVUsc1TKW1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237887422"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:48:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54D8B11FA44;
	Mon, 27 Apr 2026 10:48:32 +0300 (EEST)
Date: Mon, 27 Apr 2026 10:48:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v6 2/5] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
 <20260425163145.8474-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425163145.8474-3-tchatard@gmail.com>
X-Rspamd-Queue-Id: 351A746E99A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59640-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Thierry,

Thanks for the update.

One question regarding the set: is
Documentation/process/coding-assistants.rst relevant for this?

On Sat, Apr 25, 2026 at 09:31:42AM -0700, Thierry Chatard wrote:
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
>  drivers/platform/x86/intel/int3472/tps68470.c | 113 +++++++++++-------
>  drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
>  2 files changed, 79 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0..92da2ba80 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -147,17 +147,41 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	struct tps68470_clk_platform_data *clk_pdata;
>  	struct mfd_cell *cells;
>  	struct regmap *regmap;
> +	struct gpiod_lookup_table * const *tables;
>  	int n_consumers;
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
> +			return n_consumers;
> +	}

board_data is only relevant for the Windows case and is tested after the
switch anyway. Please move this chunk after the switch.

>  
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> @@ -176,52 +200,53 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	device_type = skl_int3472_tps68470_calc_type(adev);
>  	switch (device_type) {
>  	case DESIGNED_FOR_WINDOWS:
> -		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> -		if (!board_data)
> -			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
> -
> -		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
> -		if (!cells)
> -			return -ENOMEM;
> -
> -		/*
> -		 * The order of the cells matters here! The clk must be first
> -		 * because the regulator depends on it. The gpios must be last,
> -		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
> -		 * the clk + regulators must be ready when this happens.
> -		 */
> -		cells[0].name = "tps68470-clk";
> -		cells[0].platform_data = clk_pdata;
> -		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
> -		cells[1].name = "tps68470-regulator";
> -		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> -		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> -		cells[2].name = "tps68470-gpio";
> -
> -		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> -			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> -
> -		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> -					   cells, TPS68470_WIN_MFD_CELL_COUNT,
> -					   NULL, 0, NULL);
> -		kfree(cells);
> -
> -		if (ret) {
> -			for (i = 0; i < board_data->n_gpiod_lookups; i++)
> -				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> -		}
> -
>  		break;
>  	case DESIGNED_FOR_CHROMEOS:
> -		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> -					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
> -					   NULL, 0, NULL);
> -		break;
> +		return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					    tps68470_cros,
> +					    ARRAY_SIZE(tps68470_cros),
> +					    NULL, 0, NULL);
>  	default:
>  		dev_err(&client->dev, "Failed to add MFD devices\n");
>  		return device_type;
>  	}
>  
> +	if (!board_data)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "No board-data found for this model\n");
> +
> +	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
> +	if (!cells)
> +		return -ENOMEM;
> +
> +	/*
> +	 * The order of the cells matters here! The clk must be first
> +	 * because the regulator depends on it. The gpios must be last,
> +	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
> +	 * the clk + regulators must be ready when this happens.
> +	 */
> +	cells[0].name = "tps68470-clk";
> +	cells[0].platform_data = clk_pdata;
> +	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
> +	cells[1].name = "tps68470-regulator";
> +	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> +	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> +	cells[2].name = "tps68470-gpio";
> +
> +	tables = board_data->tps68470_gpio_lookup_tables;
> +	for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +		gpiod_add_lookup_table(tables[i]);
> +
> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				   cells, TPS68470_WIN_MFD_CELL_COUNT,
> +				   NULL, 0, NULL);
> +	kfree(cells);
> +
> +	if (ret) {
> +		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> +			gpiod_remove_lookup_table(tables[i]);
> +	}
> +
>  	/*
>  	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
>  	 * for the GPIO cell already does this.
> @@ -233,7 +258,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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
Regards,

Sakari Ailus

