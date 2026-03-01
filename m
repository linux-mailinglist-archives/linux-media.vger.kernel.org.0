Return-Path: <linux-media+bounces-54010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOJ4A0pPpGkPdQUAu9opvQ
	(envelope-from <linux-media+bounces-54010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 15:38:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5A1D03C3
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 15:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A7543013738
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210CE325726;
	Sun,  1 Mar 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uLWFp/V4"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66E30DD10;
	Sun,  1 Mar 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375871; cv=pass; b=HbOQnXbVwGWjWA8nEAJQtmFZP4C5NTkFwk4xNz/xEs3QWoA3Ntgek5McA+Mn13xASc9Y81pOr28lckD7KKyMNgJ3aLiiQ3A4J9QvIlj1YUs21cZgnks4u/pMtjMoLNMrwo38xhhwk70n7rJ76yOG2Nky5B8fCqRfI1doxEg4jiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375871; c=relaxed/simple;
	bh=7ggBVFZMyEdQlACfZSDLUkt3ex7vHdCPn0n8TdfYmcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+AWIDcVT+ACAYxsUf8iYPiiolCPHzGA/ECu/tr/qpLZpTbSiy2czwCe/xezCZH4Nz/poa78IDCbsQMht1036325+10TuIuV1zRIX/FN4JsNuuBCq8FUnc+IuPfBWqjP4wiljKxqWmG8YKZAE9N9/HnsbmAYD97oga8Ps0USxlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uLWFp/V4; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fP4R755K1z49Psn;
	Sun, 01 Mar 2026 16:37:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1772375860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2YL/V6dhd+iDfaB69Puuy56OgTioCxnWTRPN3FOrElk=;
	b=uLWFp/V4mWxURSPRpNRtcp5id262KQSlX5dFFgCD6ayDwov8iQEso/H42igcbhnzXwHiaQ
	sbSunrubZzWTcj3yQYMDUwldsrAm6NCnLvjKi8lou3CDsElv8wZpVaBIOD7y5RzcGxJIfn
	NNl14xxlVkh763h119nJwjTAg5t7H0GSeQsLe20mGsr+G5IvVHr5JV8jrdKKqWjsJ1VrKn
	EmlPa8/S6ZVg3EkNNAtNC2hAeB2t8XT4RIStfgOv9x7m+G6GdGwJ4C+68xyDhVps23ZN0V
	MIpC6+P5VvJ+jOUxdBz53uCSi6P3gpfG1YS1Zf+GFeRRx6cTb3IgQD2K5GwTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1772375860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2YL/V6dhd+iDfaB69Puuy56OgTioCxnWTRPN3FOrElk=;
	b=DV5Y5Yushb23o/fgfhLVRjl3HmUTHenkzsEjR2dqCZjDHdx6H0Hhl6brMBPm78tlP56UZv
	aQXcsB2jmdZAI9QXV/Xj1FkOop4nSOxvdAPRFi2hpeKtIUO1/q8MWp0QKkbuxC3oXzJH5U
	OSJ9MLMEgOzm8lpqeJBZoDhgb4B94v7op3x5uTLYkqLRvAjD+3tmN9rKpLdznaRC2NatPG
	56EC74SsM3qKWip0PAT2TBDpB77LHvgbeXdR7MjkDl0F9XOkQjxCJuZW9fLZBW1Fut1VKR
	ZZQXnkUFFMvF7x6OI4IQMSfQiGrkW9xs0ca/+VXz0W9RAEMj2NXDAYU/zX2jrg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1772375860;
	b=XUNEwc/puVyYZ1YoMan7Kdet0holICZCiTdvXasPXkG0Z8USxGTxMXZoiEoKYW7e5oosPd
	QhS5brTjo4JOQIsh7U+/Dl6lODU0JdfLzGJTd3BEtt4l8P2pAOQBnyOlKTcGnJAXytuuhk
	g+Sekv/4tFGn7iVQa0GtD5REHscTPEbs2WEuKD5q7/9NWF4JVPrKw+K+L0xqDS2E/BM5iT
	Ne5g5qskryNAmCt7NrhNXgDp+/c1DYQGtpD7Cd06gEuJ/q/JXJadix292BV9agFKfUq27y
	sSJLEhhfa/F+L2ifolSLQ2vw6gb86Mk1odwv82/Jg37KmPidbiqnyGGCJU4mfg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 64600634C50;
	Sun, 01 Mar 2026 16:37:38 +0200 (EET)
Date: Sun, 1 Mar 2026 16:37:38 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Arun T <arun.t@intel.com>
Cc: mehdi.djait@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Message-ID: <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227133542.970820-2-arun.t@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	TAGGED_FROM(0.00)[bounces-54010-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,iki.fi:dkim,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: 79D5A1D03C3
X-Rspamd-Action: no action

Hi Arun,

Thanks for the update. Please avoid using --in-reply-to argument for git
send-email when sending a new version of the patchset on the next time.

Could you cc me to my @linux.intel.com address on the next time?

Also cc other maintainers, see what

	$ scripts/get_maintainer.pl drivers/platform/x86/intel/int3472/

prints.

On Fri, Feb 27, 2026 at 07:05:41PM +0530, Arun T wrote:
> The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
> The sensor is powered by a TPS68470 PMIC, and so we
> need some board data to describe how to configure the GPIOs and
> regulators to run the sensor.

This can be rewrapped and fits to three lines; also see
Documentation/process/submitting-patches.rst . Most editors can do that
without too much manual work.

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..71dc0940a94b 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
> +};

That's a lot of regulators. The sensor driver appears to use only three,
even after the second patch.

Is there a VCM there, for instance?

> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.always_on = true,

Setting always_on to true shouldn't be necessary here.

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
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
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
Kind regards,

Sakari Ailus

