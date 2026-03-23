Return-Path: <linux-media+bounces-56693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJCqAPkYwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:42:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7A2F05FD
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 991C7300B18A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DB1390228;
	Mon, 23 Mar 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ae0OO9YP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27232D7C7;
	Mon, 23 Mar 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262510; cv=none; b=pvNF76Bb5bXVzI1b5uN5i6N7X9IS0MdGR7eCGftxIsOn8xKXS0g+BjZ9pdz/AfAdEO77ey4QfNws6uuB//NPHWD7vYIcX5irmqps06DN1CzRLJBblbxPYXddExPBb+hhk0fN5p/lQ8/n/cE4SJsMXiKPQ+yo/H8a9BljTMWCebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262510; c=relaxed/simple;
	bh=S7snxdf2VC1hDQ0u8eK1jw3LmX1kVt+HDFNpCm8/tYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAHPz5pGpaeoNx6iqy3Fa0nCNhCyvk8BU3V2U34yWDCKqgHopHOEFoId4iRJsSgFTH86WB9qiU6fv4rcPH1M62H5A73AoNz/qJxg6Wbbp9nkp5dmyBvQ/EGgF+lzrU3lfIrdmj87fk4bjBJMDzvaye456hRsxjRrmA+j98e0J38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ae0OO9YP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262508; x=1805798508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7snxdf2VC1hDQ0u8eK1jw3LmX1kVt+HDFNpCm8/tYY=;
  b=Ae0OO9YPxs7xcHWg2TKnlZ4uA0Z1m5YNvoJnYUK4sHlPQzqKlvihH3cB
   SYonmwsw6T+MhWMFFhtck1QkR5XtHKo7zN9Q/GRc2XbPcTYtTHse2UJx0
   vygR0AAn/pmKlXZIyOohm4AZJVSJrPbBd0Kbb33VmvsNqtDWjW+rzId5h
   dnkYD1CwQnaPTHR26XS8ZJzTdgPdVVVce958zactr6wueO71YG6nb+ax4
   M2e4dV95gt7Lj2Jz1ONEVTkNG4o4fe31BJ6goosxrnZBVxur1WrdTBUIL
   iXMk7MsNhOTt/eDlT+GlonJfVchc3UzLXJ8GE7VZfZV/kQcySK8grTQ7o
   g==;
X-CSE-ConnectionGUID: yjN8jAhITFCyTQP7SkvEfA==
X-CSE-MsgGUID: LKh1kwiYSWqyVTLyGNfbsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75226261"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75226261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:41:48 -0700
X-CSE-ConnectionGUID: totED6I+T3mhgOBfh4FqYA==
X-CSE-MsgGUID: cLLgQdgZRSSYIGuBeitYtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="261900753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:41:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D8BC7120832;
	Mon, 23 Mar 2026 12:41:47 +0200 (EET)
Date: Mon, 23 Mar 2026 12:41:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: "T, Arun" <arun.t@intel.com>
Cc: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	"Kao, Arec" <arec.kao@intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Djait, Mehdi" <mehdi.djait@intel.com>
Subject: Re: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Message-ID: <acEY6_sFAnb3aHY6@kekkonen.localdomain>
References: <20260306163019.1619490-1-arun.t@intel.com>
 <20260306163019.1619490-2-arun.t@intel.com>
 <SA3PR11MB80229E0FF7B1E8B32EB35E689D4BA@SA3PR11MB8022.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA3PR11MB80229E0FF7B1E8B32EB35E689D4BA@SA3PR11MB8022.namprd11.prod.outlook.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56693-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 09D7A2F05FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun,

On Mon, Mar 23, 2026 at 06:12:29AM +0000, T, Arun wrote:
> Hi All, 
> 
> There has been no reply to these below patches for quite some time. Could you please provide any feedback, comments, or suggestions on these below patches
> 
> https://lore.kernel.org/linux-media/20260306163019.1619490-2-arun.t@intel.com/
> https://lore.kernel.org/all/20260306163019.1619490-3-arun.t@intel.com/

Could you reply to my earlier reviews?

First and foremost, we still have eight regulators configured for a device
that uses three. Some of them have been declared as always_on, too, for no
apparent reason.

> 
> -
> Regards,
> Arun T
> 
> -----Original Message-----
> From: T, Arun <arun.t@intel.com> 
> Sent: 06 March 2026 10:00 PM
> To: T, Arun <arun.t@intel.com>; johannes.goede@oss.qualcomm.com
> Cc: sakari.ailus@linux.intel.com; Kao, Arec <arec.kao@intel.com>; ilpo.jarvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@vger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Djait, Mehdi <mehdi.djait@intel.com>
> Subject: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for Intel nvl
> 
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..8ae5e01f6660 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:01"), };
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
> +	.consumer_supplies = int3472_core_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
> +	.consumer_supplies = int3472_ana_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
> +	.consumer_supplies = int3472_vcm_consumer_supplies, };
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
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
> +	.consumer_supplies = int3472_vsio_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
> +	.consumer_supplies = int3472_aux1_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
> +	.consumer_supplies = int3472_aux2_consumer_supplies, };
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
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
> +		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata, @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 2,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_int347a_gpios,
> +		&intel_nvl_int347e_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
>  

-- 
Regards,

Sakari Ailus

