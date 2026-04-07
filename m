Return-Path: <linux-media+bounces-58175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALK8Nhfb1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:23:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 575283ACC15
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4744A3025E75
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9842133EAE6;
	Tue,  7 Apr 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYHi924F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5CC7262B;
	Tue,  7 Apr 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557380; cv=none; b=H9PbUW+fi3/aK7nxlDyopY7IaciMESHmYHsjcE5Hw+Em2oqoC4ISa5KM5BvYrbBHozp7yM4wXqj/X97fOoFqR7OVZtvuLdpJXBuhL0UyLBuGq/MXf1jOIzaW6SdxVCkQse/ZjpbWLge3WEtBw9QT0vml8TOEYkzvYjErkEsAnHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557380; c=relaxed/simple;
	bh=q+oiP2iDmQatdYOQooC4ZTWV9ghp6LXvksJZSfc+WU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV9hY7DZqMSfuqRcV5JFNP05wMJe/f8lZn8RVT/+Qq3FRU+bROGqtoWMiConfTLbUjQfsD7h2LDIa/9DDgw0ISs5q9mEWX4quejZk0Fdn7KJ59oWH9uqbB8hngkqhoB957LRA6U0FyFVDNFV1oYbM4VVmF6Do3z7ta7os0plRdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYHi924F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775557378; x=1807093378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q+oiP2iDmQatdYOQooC4ZTWV9ghp6LXvksJZSfc+WU0=;
  b=hYHi924F3WXQ+eoBRD0ehLBAu4ceikNFJcNpzar8AAX7mlqdD7j9Ql4S
   btdFiXE66u5Mzjouv5hMMpMkQ2p6BwJEtfn0nOuapa97JhvhpAzrJT6wH
   kgMt8CK8J0H29XcimTSgg+QebwJu4kSjmr11o2YiUYEYRnLPJpaGaKrQa
   ka3QtlGrE/Kxp4lQ2xBeaIivzecrQ2qqsC9pKk96IdT/8/PRmn+VwVLyG
   9M2wSatCjQZmuZqN0M6qciB4wSortM90QxlT3AL2u8pNpnFl2rRnFQ1l0
   h38EPAEolOjbn2MfIEJmPIsEyIz3BUuppewXE3EgtAz+ZmtptYJB50e5M
   A==;
X-CSE-ConnectionGUID: mRTJTqRQR6WZ9mqwvSxk8Q==
X-CSE-MsgGUID: jMm1HQ/mSY+g3NoaaA868Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76588964"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76588964"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:22:58 -0700
X-CSE-ConnectionGUID: pQcEnVm2Ttq+uNpGQXyzVA==
X-CSE-MsgGUID: msxm52CSRlOh4QHkWcm5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232171156"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.123])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:22:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9CE91121CEE;
	Tue, 07 Apr 2026 13:23:08 +0300 (EEST)
Date: Tue, 7 Apr 2026 13:23:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v9 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Message-ID: <adTbDBbxsOWxh-TC@kekkonen.localdomain>
References: <20260403004044.4093501-1-arun.t@intel.com>
 <20260403004044.4093501-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403004044.4093501-2-arun.t@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58175-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,ideasonboard.com:email,qualcomm.com:email,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 575283ACC15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun,

On Fri, Apr 03, 2026 at 06:10:42AM +0530, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.

Can you still check what does checkpatch.pl say about this?

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 6bec5a910396..49cfd0255b11 100644
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
> @@ -221,6 +239,60 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
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

I missed this earlier... Is this needed for I²C daisy chain? If so, don't
you need to set the related GPIOs, too? There's an example in Antti's
patches.

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
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -297,6 +369,16 @@ static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pda
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
> @@ -340,6 +422,14 @@ static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
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
> @@ -379,6 +469,15 @@ static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_da
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
> @@ -415,6 +514,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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
>  	{ }
>  };
>  

-- 
Regards,

Sakari Ailus

