Return-Path: <linux-media+bounces-57265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAgLJWicxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:04:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C78346719
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C2D330209F9
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7662C3268;
	Fri, 27 Mar 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YCOPOzPr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3674246BA7;
	Fri, 27 Mar 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623818; cv=none; b=ixjOi/c2oNwns/QC1i0a3qnYJL9qOyUNhFSv99tgyFHLPpKcjISE/xmKPi4JHUMyWe5bqBsa677B4lNFX/6V4Axye1Xko541N2TOnRM03MVGj5qcF5lA9Fl9tLCb6H86ThsKLS2sr5UrgY59Kijs6Zt5k4slauCXyTxCSt39GBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623818; c=relaxed/simple;
	bh=c2hLlYvCrduL2EsNMVYUTk0N+fX575Q16Fncu6AT/jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ER4XMXriLeV5E4RtKRR0otknJ0Ar/AXwVRFOyqHtv1jd63nE9JvAtUY+eRcR85pjhX41zhi2hiX89Lkrwdc/csJ57QyReTJ2PNUfpd/2RegomypjoiUK39RQT60HWw5PmiAUNI0F7PGRVJAQVKck7+6F6h8Dt5Pt7/3QMaus5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YCOPOzPr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46A64201C;
	Fri, 27 Mar 2026 16:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774623735;
	bh=c2hLlYvCrduL2EsNMVYUTk0N+fX575Q16Fncu6AT/jE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YCOPOzPrsTAS61SAeKAxSV9DobSyXpm0IxkXjNP1W63dLi6RXkB2NY+stvnwHNAO5
	 dGyie9Rf8y+SdREZyhg8KqOxaEKpVgYTEmzkhpN7XLBPvjHCerSQ93BUhuvLSdwHWI
	 b2wtyEVwz5AZg/JhvIe283nUQNYZBZ5cWVy/GvKQ=
Message-ID: <1a3aedf5-6698-4912-b8d4-a5de97a34992@ideasonboard.com>
Date: Fri, 27 Mar 2026 15:03:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] platform/x86: int3472: Add TPS68470 board data for
 intel nvl
To: Arun T <arun.t@intel.com>, johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com, arec.kao@intel.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehdi.djait@intel.com
References: <20260327133905.3509868-1-arun.t@intel.com>
 <20260327133905.3509868-2-arun.t@intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327133905.3509868-2-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-57265-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: E0C78346719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun, thanks for the revision

On 27/03/2026 13:39, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>   .../x86/intel/int3472/tps68470_board_data.c   | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..a1c32a988bcd 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,20 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>   	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>   };
>   
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {

The name of the struct needs to be different really; INT3472 is the HID for the PMIC which will be 
the same for all sensors across these platforms. So far we've been naming them after the sensor 
_HID; so in this case this would be something like ovti13b1_core_consumer_supplies. Similar notes 
for the next two structs. Sorry, didn't notice that on the last version.

> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +};
> +
>   static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 1200000,
> @@ -220,6 +234,83 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>   	.consumer_supplies = int3479_aux2_consumer_supplies,
>   };
>   
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
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
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
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
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL,

These discrete initialisations to 0 and NULL can be dropped; Sakari has a patch removing them across 
the rest of the file too.

With those two changes made you can add my R-b on the next version:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> +
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
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL,
> +};
> +
>   static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>   	.reg_init_data = {
>   		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +323,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
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
> @@ -258,6 +361,14 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>   	}
>   };
>   
> +static struct gpiod_lookup_table intel_nvl_ovti13b1_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>   	.dev_name = "i2c-INT3472:05",
>   	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +398,15 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>   	},
>   };
>   
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_ovti13b1_gpios,
> +	},
> +};
> +
>   static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   	{
>   		.matches = {
> @@ -316,6 +436,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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


