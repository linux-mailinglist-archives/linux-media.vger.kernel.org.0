Return-Path: <linux-media+bounces-56966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDQHMmi2w2litgQAu9opvQ
	(envelope-from <linux-media+bounces-56966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:18:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 744FA322BFE
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46F1A3025D0F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7362919E7F7;
	Wed, 25 Mar 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mDlIeKN6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129453A9603;
	Wed, 25 Mar 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433356; cv=none; b=bJ1inF6n7IErna3cm/hZEeAAE6/cME4gbPQgjfaUSZ1Jo69fcrnED2frQKsWeql1UARHHKRz3SFhxt/0qbTv5kTVCpJKKVsgJE5+2Lw7ZNA4DnpFuF93L40kO2RQl6isN2wOcH4jk3pysDJZCnUZC4n3yonAxR5eCcpoYwJ/u/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433356; c=relaxed/simple;
	bh=uk3HnX517Y1eyituBoygn+6rY+vBVjmMla2actSc4t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIgelrRhCyEarhUNfyvcmhXouMMoZv1wv1TH9S6Y+jlVyq/muVY/lU0OdKWc/ySwYQ7Xt5YILzBzMwCjKTfAbtQEHfyIx0fxqhn8NVmg9mJPLR1e5gbK0R8U76Ay0TtsAUafNkdqVUp6hwcLmFo1ckqcz2asDaDLbM7y4MaRnLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mDlIeKN6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC79E1023;
	Wed, 25 Mar 2026 11:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774433267;
	bh=uk3HnX517Y1eyituBoygn+6rY+vBVjmMla2actSc4t0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mDlIeKN6DHnsHkSKQeBZeisVW6NuwH6E194bBn/S62pPKYluwT/udpr+U/yvgf8da
	 /ld1Ib3mX429wVACHk+8miktYzTDG2wCr1+LTBlyulBPITqSKgB5vMcxW9vzBpsg+7
	 94kLh9OqPBwxfZFE0sGSrI8ql7FGP69zT7XG637c=
Message-ID: <d7abde5d-0945-45f2-a1a4-b4d3a1d7e4f8@ideasonboard.com>
Date: Wed, 25 Mar 2026 10:09:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
To: Arun T <arun.t@intel.com>, johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com, arec.kao@intel.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehdi.djait@intel.com
References: <20260306163019.1619490-1-arun.t@intel.com>
 <20260306163019.1619490-2-arun.t@intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260306163019.1619490-2-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56966-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 744FA322BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun - sorry for the delay looking at these for you

On 06/03/2026 16:30, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>   .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>   1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..8ae5e01f6660 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>   	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>   };
>   
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:01"),
> +};

These settings will assign all 6 regulators to the i2c-OVTI13B1:01 device, in the vsio case with 3 
different names. The patch for the sensor driver itself is only looking for dovdd, avdd and dvdd - 
something is not quite right here.

> +
>   static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>   	.consumer_supplies = int3479_aux2_consumer_supplies,
>   };
>   
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.always_on = true,

I would not expect the regulators to need to be always_on - with the exception of the VSIO one which 
is a bit special.

> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
> +	.consumer_supplies = int3472_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
> +	.consumer_supplies = int3472_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
> +	.consumer_supplies = int3472_vcm_consumer_supplies,
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
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
> +	.consumer_supplies = int3472_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
> +	.consumer_supplies = int3472_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
> +	.consumer_supplies = int3472_aux2_consumer_supplies,
> +};
> +
>   static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>   	.reg_init_data = {
>   		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>   	},
>   };
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
>   static struct gpiod_lookup_table surface_go_int347a_gpios = {
>   	.dev_id = "i2c-INT347A:00",
>   	.table = {
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>   	}
>   };
>   
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios = {

I would call it "intel_nvl_ovti13b1_gpios" to match the _HID.

> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),

Although the sensor driver does look for a reset GPIO, it doesn't currently try to handle one called 
s_idle, nor does patch 2 add that...so that entry might be unnecessary too.
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

The dev_id is the same here; you shouldn't need a second lookup table for the same device, and 
s_enable isn't handled by the sensor driver.

Thanks
Dan

> +
>   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>   	.dev_name = "i2c-INT3472:05",
>   	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>   	},
>   };
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
>   static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   	{
>   		.matches = {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   		},
>   		.driver_data = (void *)&dell_7212_tps68470_board_data,
>   	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
> +	},
>   	{ }
>   };
>   


