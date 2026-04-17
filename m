Return-Path: <linux-media+bounces-59047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GL5JkOC4mlE6wAAu9opvQ
	(envelope-from <linux-media+bounces-59047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 20:56:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD6241E171
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 20:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA243303DD1B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0136B3C8723;
	Fri, 17 Apr 2026 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWdiac6v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081535AC07;
	Fri, 17 Apr 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452089; cv=none; b=EixOntMXiiMBMWyrs06HccToFOtwDDlzaLFSMhGBZg7gpGO2iJCyT/x4D+PwCqFO9szwXmkXIlXkOGGwE61g3sEOnz/gm+ffAuxYKWnu4Fz217gKlJudOazAIeMp8a1fMLY8tX37V/uoy0CAkBbn7Q4mYS2OOMq1ytjOtcDh6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452089; c=relaxed/simple;
	bh=6aR7apEW/S1lKV2sWOZjVbWKxNbU41SLvM2DzmGLW9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LItpHw9NHb95eCtbmqjmzAlqHTagceAualPlU6GHs78aT55JVsJnIsou5fZbnG0XVFXxAVmrKExHxZ9jlX9HmbYSe2LXolEnynY2MJ22wSiBcT1GhGLIC2j4oNCnCfQexMtolpbHHzvSEFbgwALATdbHjAnAAoNEyte3nKSPEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWdiac6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90942C19425;
	Fri, 17 Apr 2026 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776452088;
	bh=6aR7apEW/S1lKV2sWOZjVbWKxNbU41SLvM2DzmGLW9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NWdiac6vElRNpVk3NgLnLfKz8otB/lnylnUsD1LbtOnmA3zoATVyvH8IjGfuzt7sI
	 Cogzwu133gR6AFGC0nS7F9YWIqgZmDVYBAzjaKE/8j/RT3EaYi4PQMQbq/7XVIRod5
	 3OZo6R8lOq+dEupsQfjHWxsQ72mHGrG9xgNLT7YKdtAqro+flfSfBUKZ5igFaCgsDB
	 OSt0ENuwAJuyDmAyHZTsPGrwjlS2v9tZW1fj5FGnQT2pp2T8BTX6rFn6v+S76AxgP/
	 9pRl2QSYXmWROXVq+cRr2BPK1yST1p9/soFU1fiX9B3RC2bbFhLn6P1nVyq0XhHFqW
	 AVVfEPnbaYsYw==
Message-ID: <5aa199d5-251d-4c98-a6ac-5038301a1644@kernel.org>
Date: Fri, 17 Apr 2026 20:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-4-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417163252.15603-4-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59047-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BD6241E171
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

First of all, since I forget to mention that in my previous 2 reviews
many thanks for your work on this!

On 17-Apr-26 18:32, Thierry Chatard wrote:
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
>   VIO   -> dovdd / INT3477
>   VSIO  -> avdd  / INT3479 and vsio / INT3477 (always_on: keeps S_I2C_CTL
>            non-zero from boot so OV8858 is reachable on I2C2 at any time)
>   AUX1  -> dvdd  / INT3479
>   AUX2  -> dovdd / INT3479

This is wrong, VIO is always on if you look at:

drivers/regulator/tps68470-regulator.c

you will see that enable_reg and enable_mask for that regulator
are both set to 0, because there is no enable reg, as it is always
on at the hardware level.

VIO is used for the PMIC's own I2C upstream connection I believe.

So the right mapping for the ov8858/INT3477 should be:

CORE  -> dvdd  / INT3477
ANA   -> avdd  / INT3477
VSIO  -> dovdd / INT3477

avoiding the need to add new "vsio" regulator support
to the ov8858 driver.

For the OV5670/INT3477 using VSIO for avdd also sounds
wrong. The publicly available 2 page marketing datasheet
of the ov5670 says the following about voltages:

Core:   1.2V nominal
analog: 2.8V nominal
IO:     1.8V nominal

You configure aux1 at 1.2V and aux2 at 1.8V volt and
above you mention that the OV5670 is not behind the I2C
pass through.

So to me that suggests that the mappings for the OV5670/INT3477
should be:

AUX1  -> dvdd  / INT3479
AUX2  -> dovdd / INT3479

as they already were, but the VSIO -> avdd mapping is wrong
since VSIO is 1.8V and avdd should be 2.8V, it does no harm
since it will just enable VSIO / the passthrough. But it seems
that instead there is some fixed 2.8V avdd source for the OV5670
and we don't need to have a regulator at all.

So my suggestion would be to use the following mappings
(combined):

CORE  -> dvdd  / INT3477
ANA   -> avdd  / INT3477
VSIO  -> dovdd / INT3477
AUX1  -> dvdd  / INT3479
AUX2  -> dovdd / INT3479

and drop the double mapping of VSIO.

If that does not work because the OV5670 turns out to be behind
the i2c-passthrough too then indeed it would be best to as a hack
map avdd (which the driver will try to get a regulator for and
enable) from vsio. If that is necessary please add a comment about
this hack.

> Marking VSIO always_on ensures the TPS68470 S_I2C passthrough is active
> from the moment the PMIC driver probes, eliminating a timing dependency
> between TPS68470 and ov8858 probe ordering.

This also seems wrong, vsio should not be marked as always on.

Maybe the ov8865 driver needs a bigger delay after the regulator
enable call there ?

Anyways first please try the suggested updating mapping and assuming
that works then as a separate step maybe try dropping the always-on
from vsio.

> A static clock consumer list is provided for both sensors (INT3477 and
> INT3479) to work around the broken ACPI _DEP on INT3479 described in the
> previous patch.

Ack, this is good.

> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036..c1bf13faf 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -287,6 +287,175 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
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
> +static struct regulator_consumer_supply dell_5285_int3477_vio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
> +};
> +
> +static struct regulator_consumer_supply dell_5285_int3479_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
> +	/* S_I2C_CTL: must be enabled for OV8858 I2C daisy-chain access */
> +	REGULATOR_SUPPLY("vsio", "i2c-INT3477:00"),
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
> +static const struct regulator_init_data dell_5285_tps68470_vio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vio_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3477_vio_consumer_supplies,
> +};


when I2C passthrough is used vio and vsio MUST have the exact same voltage,
which you do correctly here. Also this regulator is always in the hardware
and as such does not support REGULATOR_CHANGE_STATUS.

And VIO should never have direct consumers, these all go through VSIO.

Basically this should look identical to this:

/* Ensure the always-on VIO regulator has the same voltage as VSIO */
static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
        .constraints = {
                .min_uV = 1800600,
                .max_uV = 1800600,
                .apply_uV = true,
                .always_on = true,
        },
};

I think it would be best to start with an extra renaming the existing
surface_go_tps68470_vio_reg_init_data to generic_tps68470_vio_reg_init_data
and move it to the top of the file since it now no longer is surface
specific.

And then just use the new generic_tps68470_vio_reg_init_data for the Dell
5285 too.

And maybe a follow-up patch replacing the somewhat wrong vio_reg_init_data
for the Dell 7212 with the new generic_tps68470_vio_reg_init_data too.

> +

Add a comment here that since I2C pass-through is used the vsio voltage must
be the exact same voltage as the one from generic_tps68470_vio_reg_init_data.

> +static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +		/*
> +		 * Keep S_I2C_CTL enabled from boot so OV8858 I2C daisy-chain
> +		 * is accessible before ov8858 driver probes.
> +		 */
> +		.always_on = 1,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_vsio_consumer_supplies),
> +	.consumer_supplies = dell_5285_int3479_vsio_consumer_supplies,
> +};
> +> +static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
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
> +		[TPS68470_VIO]  = &dell_5285_tps68470_vio_reg_init_data,
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
> @@ -316,6 +485,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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

Regards,

Hans



p.s.

I would expect the OV8858 to have a variavble-focus lens with some VCM driver,
bit we can add support for that later.


