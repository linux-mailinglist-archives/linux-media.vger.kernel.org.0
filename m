Return-Path: <linux-media+bounces-59286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d76gEs106GmVKgIAu9opvQ
	(envelope-from <linux-media+bounces-59286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:12:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AA442CC0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B69AF3028003
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D43836BCF5;
	Wed, 22 Apr 2026 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjCWRR9O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52D36AB72;
	Wed, 22 Apr 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841866; cv=none; b=LKBcGU4z3yZbfpn39RhOO+eqHPfLQ00H9VNsnR+fVzZLG6N5XbQiTRj9pA4o1vc5w82lZAmjk2a6Wgcrrljp3zirbMEadCxp18wdQ/hmfDxpgfgv7OYfo5N5/VswwgD4Nh/xRGQlEj+g0Qg42kBZLWdyAiWJs2gT54OSC/ilaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841866; c=relaxed/simple;
	bh=Oltp+Vb3N8qstKmIA8Bo7G+pJICWJrQQelLJnZEWHyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDyjWOf2JmnVmo1ElNsjtlCMEUBbBE+iH8h8wOpmErUeRIW/BuhYi1OgXWvchc0oN7yZ7io+eSZJvN0zwvGIAXpwlErAKImFDFA5CXQ7BjOHMjYSboZTExD7ZNsK3nCfSr9FyRShUk0iEGnIoDHjsKf+uCoAeip66ub5+3FNYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjCWRR9O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776841865; x=1808377865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oltp+Vb3N8qstKmIA8Bo7G+pJICWJrQQelLJnZEWHyE=;
  b=VjCWRR9O1LrAcc4FIsNFBPo9LUPbCBXb3W1EkWpD4XWd+xgj0ao8URc3
   G0sQXCMOo40+iMzrWsRsvJhFrZUwTB3AqkYFfArWfdl1w1NY9ADKX9QaC
   Nj0o2ArFhZm9oSGAF1Jfwcy/A98boYLxnAgVBVsMkZyzbI0VJ6b0Gpvj3
   BkZrn9eU5hJ8Iw5jtezoNEsy7Ww6ILWSz2KbC/kbvdeIoD3KbWWH0ZpE6
   XqH9b9kJy7QTiK99HtdIojTM3L2BTCDqUe8D583TCvBw1p6lo5GWMtBSM
   3HMfDmplE7lLIp/JM77LfwuP7Lb0d4YPKnyOQldtPSmVOea6MATI/WN8u
   Q==;
X-CSE-ConnectionGUID: 6MgIXuXyQAiCwTxpZd755w==
X-CSE-MsgGUID: J/1qQwl0SZGTswTZXHIghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88090252"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88090252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:11:04 -0700
X-CSE-ConnectionGUID: 9kLUeYaAQu+N1hDuHiIl3A==
X-CSE-MsgGUID: B9OHudTCT1qNRokpw8u+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232570268"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:11:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 762C51201FC;
	Wed, 22 Apr 2026 10:11:00 +0300 (EEST)
Date: Wed, 22 Apr 2026 10:11:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v4 3/5] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
Message-ID: <aeh0hAqjwJXq2c3M@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
 <20260421225217.12472-4-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421225217.12472-4-tchatard@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59286-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: EA9AA442CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

On Tue, Apr 21, 2026 at 03:52:15PM -0700, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
> PMIC/clock/GPIO hub:
> 
>   Front: OV5670 (ACPI INT3479) on I2C4
>   Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind TPS68470
>          S_I2C port (controlled by reg 0x43 S_I2C_CTL)
> 
> GPIO mapping (TPS68470):
>   INT3479 (OV5670): GPIO3 = reset, GPIO4 = powerdown (both active-low)
>   INT3477 (OV8858): GPIO9 = s_resetn, GPIO7 = s_enable (both active-low)
>     GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
>     bits 2 and 0), not regular GPDO outputs.
> 
> Regulator mapping:
>   CORE  -> dvdd  / INT3477
>   ANA   -> avdd  / INT3477
>   VIO   -> generic (hardware always-on, no enable register, no consumers)

That is not what the datasheet says.

>   VSIO  -> dovdd / INT3477: enabling VSIO sets S_I2C_CTL (reg 0x43),
>            opening the I2C passthrough to OV8858; the ov8858 driver
>            enables dovdd at probe time, which naturally activates the
>            passthrough before any I2C transaction to the sensor.
>   AUX1  -> dvdd  / INT3479
>   AUX2  -> dovdd / INT3479
> 
> A static clock consumer list is provided for both sensors (INT3477 and
> INT3479) to work around the broken ACPI _DEP on INT3479 described in the
> previous patch.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 169 +++++++++++++++++-
>  1 file changed, 166 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036..b40ac4fc5 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -74,8 +74,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
>  	.consumer_supplies = int347a_vcm_consumer_supplies,
>  };
>  
> -/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> -static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
> +/*
> + * VIO has no enable register (always on at hardware level) and must never
> + * have direct consumers -- all outputs go through VSIO.  Its voltage must
> + * exactly match VSIO on any board using the I2C pass-through.
> + */
> +static const struct regulator_init_data generic_tps68470_vio_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1800600,
>  		.max_uV = 1800600,
> @@ -122,7 +126,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
>  		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
>  		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
>  		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
> -		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
> +		[TPS68470_VIO] = &generic_tps68470_vio_reg_init_data,
>  		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
>  		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
>  		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
> @@ -287,6 +291,158 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +/* Settings for Dell Latitude 5285 2-in-1 */
> +
> +/*
> + * The BIOS leaves GNVS field C0TP at zero, which causes INT3479's _DEP to
> + * resolve to PCI0 instead of the INT3472 device.  Provide a static clock
> + * consumer list so probe registers MCLK lookups for both sensors regardless
> + * of the broken _DEP traversal.
> + */
> +static const struct tps68470_clk_consumer dell_5285_clk_consumers[] = {
> +	{ .consumer_dev_name = "i2c-INT3477:00" },	/* OV8858 rear camera  */
> +	{ .consumer_dev_name = "i2c-INT3479:00" },	/* OV5670 front camera */
> +};
> +
> +static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
> +};
> +
> +/*
> + * VSIO controls the S_I2C_CTL passthrough.  Its voltage must match VIO
> + * exactly (both 1800600 uV).  Mapping VSIO to dovdd/INT3477 means the
> + * passthrough is enabled when the ov8858 driver enables its dovdd supply.
> + */
> +static struct regulator_consumer_supply dell_5285_int3477_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_5285_int3479_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_5285_int3479_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_core_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3477_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_ana_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3477_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL,
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vsio_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3477_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1213200,
> +		.max_uV = 1213200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux1_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3479_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_5285_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux2_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3479_aux2_consumer_supplies,
> +};
> +
> +static const struct tps68470_regulator_platform_data dell_5285_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &dell_5285_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &dell_5285_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  = &dell_5285_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO]  = &generic_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &dell_5285_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &dell_5285_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &dell_5285_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
> +static struct gpiod_lookup_table dell_5285_int3477_gpios = {
> +	.dev_id = "i2c-INT3477:00",
> +	.table = {
> +		/*
> +		 * TPS68470 GPIO9 = s_resetn (secondary camera reset, active-low)
> +		 * TPS68470 GPIO7 = s_enable (secondary camera enable/powerdown)
> +		 * These logic outputs are specifically designed for secondary
> +		 * camera control on the TPS68470. Matches Surface Go pattern.
> +		 */
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static struct gpiod_lookup_table dell_5285_int3479_gpios = {
> +	.dev_id = "i2c-INT3479:00",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static const struct int3472_tps68470_board_data dell_5285_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:05",
> +	.tps68470_regulator_pdata = &dell_5285_tps68470_pdata,
> +	.n_clk_consumers = ARRAY_SIZE(dell_5285_clk_consumers),
> +	.clk_consumers = dell_5285_clk_consumers,
> +	.n_gpiod_lookups = 2,
> +	.tps68470_gpio_lookup_tables = {
> +		&dell_5285_int3477_gpios,
> +		&dell_5285_int3479_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +472,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR,   "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +		.driver_data = (void *)&dell_5285_tps68470_board_data,
> +	},
>  	{ }
>  };
>  

-- 
Regards,

Sakari Ailus

