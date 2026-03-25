Return-Path: <linux-media+bounces-56973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HPAGba5w2nUtgQAu9opvQ
	(envelope-from <linux-media+bounces-56973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:32:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF09323080
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D16430506E7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4381D3ACA7B;
	Wed, 25 Mar 2026 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R1+oTHDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141763A9DAF;
	Wed, 25 Mar 2026 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434550; cv=none; b=gU6VendUNv727I+TU6RGbrlbbViQcjbq3O9Q+m61N3+Rs+8AsSsm2K0jpYAfjXB3hy6y2SoD67/MPX52ev+8L3/dy0Id4POniQCw9SdlZOunfQqBMcr56ytWExoyaI1zKOPazT131l7RoRnYLd9d9c3tW17SsGZ2KJ8kMaGP3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434550; c=relaxed/simple;
	bh=oQtoehjaaRwqZ85YJQzKQGcvinRzEditWMGiVD1C71c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHWbhIY+ysNn11bIgvl62YRjnfyrl08OiZ0/MpD6dFrgiBzJGbTdmzr4TJ4g93r6Sn3EeySoArDdBrVGAQ83ZyClIj2IFfdkoTBE4pQvMmV49/V//lQoNS5dHpApJfIEz5feNOqD/9OmwzJMJ48hXqjcYJC2NzKoOfgajP1u8u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R1+oTHDJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C8E310BE;
	Wed, 25 Mar 2026 11:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774434469;
	bh=oQtoehjaaRwqZ85YJQzKQGcvinRzEditWMGiVD1C71c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R1+oTHDJoyXgTytHwm1c8H8vB3LDbwtAmcV+XceQcOESF61Ho+CYJrlowF8o7kYso
	 smS4Dyhji8ad/XsWCvkS5FtRXifPvjx5chplFXIPeo7mQdpKGLUVVbpIfQKrPmUqFg
	 WdUqqJ+Iwb0JD9gWEuYIqz7vhgKhtzWXdtGdfMjI=
Message-ID: <a9435e69-4d04-41fa-a360-595be76c2339@ideasonboard.com>
Date: Wed, 25 Mar 2026 10:29:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: int3472: Add more MSI AI evo laptops
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, sakari.ailus@linux.intel.com,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com
References: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
 <20260319155031.1989179-2-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260319155031.1989179-2-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56973-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EF09323080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antti

On 19/03/2026 15:50, Antti Laakso wrote:
> The MSI prestige AI EVO 13 and 16 have the same camera configuration
> as model 14. Use the same platform data for all.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../x86/intel/int3472/tps68470_board_data.c   | 52 ++++++++++++-------
>   1 file changed, 34 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index e65067358301..cef241f1bf09 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -238,7 +238,7 @@ static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
>   	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
>   };
>   
> -static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
> +static const struct regulator_init_data msi_prestige_ai_evo_tps68470_core_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 1200000,
>   		.max_uV = 1200000,
> @@ -249,7 +249,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_da
>   	.consumer_supplies = ovti5675_dvdd_consumer_supplies,
>   };
>   
> -static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
> +static const struct regulator_init_data msi_prestige_ai_evo_tps68470_ana_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 2815200,
>   		.max_uV = 2815200,
> @@ -260,7 +260,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_dat
>   	.consumer_supplies = ovti5675_avdd_consumer_supplies,
>   };
>   
> -static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
> +static const struct regulator_init_data msi_prestige_ai_evo_tps68470_vio_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 1800600,
>   		.max_uV = 1800600,
> @@ -269,7 +269,7 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_dat
>   	},
>   };
>   
> -static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
> +static const struct regulator_init_data msi_prestige_ai_evo_tps68470_vsio_reg_init_data = {
>   	.constraints = {
>   		.min_uV = 1800600,
>   		.max_uV = 1800600,
> @@ -280,12 +280,12 @@ static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_da
>   	.consumer_supplies = ovti5675_dovdd_consumer_supplies,
>   };
>   
> -static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
> +static const struct tps68470_regulator_platform_data msi_prestige_ai_evo_tps68470_pdata = {
>   	.reg_init_data = {
> -		[TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
> -		[TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
> -		[TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
> -		[TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
> +		[TPS68470_CORE] = &msi_prestige_ai_evo_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &msi_prestige_ai_evo_tps68470_ana_reg_init_data,
> +		[TPS68470_VIO]  = &msi_prestige_ai_evo_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &msi_prestige_ai_evo_tps68470_vsio_reg_init_data,
>   	},
>   };
>   
> @@ -315,7 +315,7 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>   	}
>   };
>   
> -static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> +static struct gpiod_lookup_table msi_prestige_ai_evo_ovti5675_gpios = {
>   	.dev_id = "i2c-OVTI5675:00",
>   	.table = {
>   		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> @@ -323,13 +323,13 @@ static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
>   	}
>   };
>   
> -static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
> +static const struct property_entry msi_prestige_ai_evo_gpio_props[] = {
>   	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
>   	{ }
>   };
>   
> -static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
> -	.properties = msi_p14_ai_evo_gpio_props,
> +static const struct software_node msi_prestige_ai_evo_tps68470_gpio_swnode = {
> +	.properties = msi_prestige_ai_evo_gpio_props,
>   };
>   
>   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
> @@ -361,13 +361,13 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>   	},
>   };
>   
> -static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
> +static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
>   	.dev_name = "i2c-INT3472:06",
> -	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
> -	.tps68470_gpio_swnode = &msi_p14_ai_evo_tps68470_gpio_swnode,
> +	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
> +	.tps68470_gpio_swnode = &msi_prestige_ai_evo_tps68470_gpio_swnode,
>   	.n_gpiod_lookups = 1,
>   	.tps68470_gpio_lookup_tables = {
> -		&msi_p14_ai_evo_ovti5675_gpios,
> +		&msi_prestige_ai_evo_ovti5675_gpios,
>   	},
>   };
>   
> @@ -400,13 +400,29 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   		},
>   		.driver_data = (void *)&dell_7212_tps68470_board_data,
>   	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
> +		},
> +		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
> +	},
>   	{
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-14N3"),
>   		},
> -		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
> +		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 16 AI+ Evo B2VMG"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-B2VMG"),
> +		},
> +		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
>   	},
>   	{ }
>   };


