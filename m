Return-Path: <linux-media+bounces-59057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJubGPok42naCQEAu9opvQ
	(envelope-from <linux-media+bounces-59057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:30:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D14202D3
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F32B5300C38A
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 06:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7108B3537CD;
	Sat, 18 Apr 2026 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKOarh+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4973491C4;
	Sat, 18 Apr 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776493806; cv=none; b=MHnvUMAw15OY/Y+1P7L1dhxIRMVoaIc6jnunvTE5C1EmfS8MoKEYVRapakxLia7jeOvg9qnt0/Zj0eMJHbWIc7zFZMyLlQ+biLWo1wBCXX995hG+VRq+Rt6kYzfFabeot7mcy6KBWluSXqsSSXWEWvlnepgWnTsV9gWE5muBX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776493806; c=relaxed/simple;
	bh=HeAK1DpVxrbx8UpYi479tPTCELd8qJjKCkMljrNX8dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDMV8OcVPT6dTNT9lu3Q22nyf4710S0ZPlzYnl8w4+xqQtKFZqd3GgRXomjcjo5+GL1wqTz1ftTnhJGLAFRvStfvd0r9PnW0ipngWAdZikOA1ouXT+vDJMTeT+Xp/XRATgBzKXYnDt3JFe3DEKhf/Ir3PFIkC1bfIbO+cVQpVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKOarh+x; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776493804; x=1808029804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HeAK1DpVxrbx8UpYi479tPTCELd8qJjKCkMljrNX8dM=;
  b=NKOarh+xIKvX4bbCvS6mcPWrSvVpVK6Gd/BpalZNivKnvDDP22ukp1w9
   A6u8LKagC0fzJn7al7kI3I8vpaWvmOkbsDDMPcOXscGCCVfwudH5Z+EWz
   2dizvuFxlxwT4ULO0Fz0T+zxZ3qBVzR8jGu8bdSMDV5gtNCFqQugk8O/r
   LwpfAnzkks3nAp92+8yZ/Tn8p1/6T0S7+aqQ1D8gF2Eb1qnd+d73MIqbq
   ib85mWWLDETbv82xKdtpWFHX4zILNaSsgd/47VLm/KQcbWYosfpeZa1fk
   DMwG4Z/plwFY5iU5/K/dkOFlzCzx68v0g1qOBKPFhKBL9nIMc+sfORUt2
   g==;
X-CSE-ConnectionGUID: +I77wMLiQsiRhjskT4zbBg==
X-CSE-MsgGUID: fQTs1kE3Q/CPmNpLnz+c8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65035195"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="65035195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 23:30:03 -0700
X-CSE-ConnectionGUID: 6KsNLANmTUyeNxay6xlfCQ==
X-CSE-MsgGUID: 4SvRY4QNQ8KAoRC7PUvfjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="226548966"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 23:30:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 80DCC121CD9;
	Sat, 18 Apr 2026 09:29:58 +0300 (EEST)
Date: Sat, 18 Apr 2026 09:29:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v3 2/5] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
Message-ID: <aeMk5s8u9DFJtqac@kekkonen.localdomain>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417163252.15603-3-tchatard@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59057-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 666D14202D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

Thanks for the set.

On Fri, Apr 17, 2026 at 09:32:49AM -0700, Thierry Chatard wrote:
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
>  drivers/platform/x86/intel/int3472/tps68470.c | 29 ++++++++++++++++---
>  drivers/platform/x86/intel/int3472/tps68470.h | 10 +++++++
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0..3364ef428 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -155,9 +155,31 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	if (!adev)
>  		return -ENODEV;
>  
> -	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> -	if (n_consumers < 0)
> -		return n_consumers;
> +	/*
> +	 * Look up board data before building clock platform data.  On platforms
> +	 * where a sensor's ACPI _DEP does not list the INT3472 device,
> +	 * for_each_acpi_consumer_dev() misses that sensor and its clock consumer
> +	 * entry is never registered.  Board data can supply a static consumer
> +	 * list to use instead, bypassing the broken _DEP traversal.

Please wrap to 80 characters.

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
> +		for (i = 0; i < (int)board_data->n_clk_consumers; i++)

No need to cast -- instead declare i as unsigned int.

> +			clk_pdata->consumers[i] = board_data->clk_consumers[i];
> +		n_consumers = board_data->n_clk_consumers;
> +	} else {
> +		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> +		if (n_consumers < 0)
> +			return n_consumers;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> @@ -176,7 +198,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	device_type = skl_int3472_tps68470_calc_type(adev);
>  	switch (device_type) {
>  	case DESIGNED_FOR_WINDOWS:
> -		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>  		if (!board_data)
>  			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
>  
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701..4aefb728e 100644
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
> +	 * Static clock consumers.  When n_clk_consumers is non-zero these are
> +	 * used in place of for_each_acpi_consumer_dev() to build the tps68470-clk
> +	 * platform data.  Needed on platforms where a sensor's ACPI _DEP does not
> +	 * list the INT3472 device, causing that sensor to be missed by the ACPI
> +	 * dependency traversal.

Please wrap this, too, to 80 characters.

> +	 */
> +	unsigned int n_clk_consumers;
> +	const struct tps68470_clk_consumer *clk_consumers;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };

-- 
Regards,

Sakari Ailus

