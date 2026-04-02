Return-Path: <linux-media+bounces-57980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKoXE1OhzmlZpAYAu9opvQ
	(envelope-from <linux-media+bounces-57980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 19:03:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC838C4F8
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 19:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE327305C8E5
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 16:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB853F7AA4;
	Thu,  2 Apr 2026 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idhSXM26"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4245C36403A;
	Thu,  2 Apr 2026 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148289; cv=none; b=hTaqbIS8J2eIx70hnA3aqtOTfmLUNt52QfEyn7MMcDKaE9KV7t7/j/1Crjm/lFV6xd+rTfKJB5EPZxLI5NVNbtNFhXarqrJOWtZtLHQQzNquIWOBQW1txZlcXPGkFLz29l88yHhcA3mGMIOJR69YjqRBOkSEeYdjIg77qyoZfx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148289; c=relaxed/simple;
	bh=qCo+/6apm7GWgITOzfOIQfT7lZ2u3h3yYvC5VnAGOIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krWgW0BLRVG0MWRnk9Ufv7K6geQmnZDm7Bb6i0vFePCDZUCXhxqzIAQ7axG+DG9bNe50E5anHolH6joIkB4AsV9GAqDuf4TbognpqNhXNgDt46f7KjZKOkJkxcd4I3Kp8xir0dCcCZjf8bBDQMF8JkQdhxVwSq+Whx3uOLBCaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idhSXM26; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775148281; x=1806684281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qCo+/6apm7GWgITOzfOIQfT7lZ2u3h3yYvC5VnAGOIs=;
  b=idhSXM26Dyp0H9BQ96SWHkZSgZHrLOLdiYiUszpoq7FffYByEju2md9O
   Hhaah8FDOqnR0Sj4LByHQQhHanpSK6fHR0V2AMFgc8E8HZfzfkPItdHsm
   cgy1UAgBPX5ScMyU+HkmRZ1Y4VoYDrnMrftAjEz9J6pCrOiq89kHAYe1p
   17KBv2h6TQgUgpu47oV8MGN1cE1mm7syvXJFNdKu3782XR63sZYPzR6Rd
   feIaPq5GGBHw39roYTLoB5HyPKDyMBC6xjkqOIDwAak3oVb6xBSgkKwpI
   ++XPCvPC+0R4AVy28izhsxgnsfkVu6le6H5D0H54OWeGjPk3j1YgYdpoo
   A==;
X-CSE-ConnectionGUID: hiXoej01SPq9e3dCtLEZWQ==
X-CSE-MsgGUID: oP0BJwTCRkedcnNJlz55lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87667656"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87667656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:44:39 -0700
X-CSE-ConnectionGUID: GCQbV5aeRn64ftRHMTt9uA==
X-CSE-MsgGUID: dz1P2E9bSne5Qvm4SG1fQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="220375303"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:44:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1990411FBE3;
	Thu, 02 Apr 2026 19:44:46 +0300 (EEST)
Date: Thu, 2 Apr 2026 19:44:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v8 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Message-ID: <ac6c_mGE368bCHVg@kekkonen.localdomain>
References: <20260402104045.4040328-1-arun.t@intel.com>
 <20260402104045.4040328-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402104045.4040328-2-arun.t@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57980-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 45FC838C4F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun,

On Thu, Apr 02, 2026 at 04:10:37PM +0530, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 6bec5a910396..bfec0f1af065 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -144,6 +144,24 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply ovti13b1_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vcc", "i2c-OVTI13B1:01-VCM"),
> +};
> +
> +static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +};
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -221,6 +239,61 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_core_consumer_supplies),
> +	.consumer_supplies = ovti13b1_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
> +	.consumer_supplies = ovti13b1_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vcm_consumer_supplies),
> +	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
> +	.consumer_supplies = ovti13b1_vsio_consumer_supplies,
> +};
> +

Extra newline.

> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -297,6 +370,16 @@ static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pda
>  	},
>  };
>  
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -340,6 +423,14 @@ static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
>  	.properties = msi_p14_ai_evo_gpio_props,
>  };
>  
> +static struct gpiod_lookup_table intel_nvl_tps68470_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -379,6 +470,15 @@ static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_da
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_tps68470_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -415,6 +515,14 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +		.driver_data = (void *)&intel_nvl_tps68470_board_data,
> +	},
> +

Ditto.

>  	{ }
>  };
>  

-- 
Sakari Ailus

