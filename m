Return-Path: <linux-media+bounces-19756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF749A08E8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 13:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05165B281B8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 11:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE7207A23;
	Wed, 16 Oct 2024 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF8He/ZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB64206979;
	Wed, 16 Oct 2024 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729079920; cv=none; b=hHkTl4odaFEJu3VibZIhp2M97zLi5h81xh3Crdd+0LIjbqp1YjY2GobeDYkkbIKi0q7QP3FABjiSwH9Q9jFL0SSEElw9Q4ugB3URlP2+GhsFJauSzhEn4DMasLdPDqqIVV6T8vfgF8UaKyoh09LQKWlvyuN6PQpDzeRnltqJepc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729079920; c=relaxed/simple;
	bh=29ovtOc0RitatdpSSFjl1CzXXX5nOX9JNLZZTNBkXSw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=daM1pq2m37mVRnSECqL9CLKnGabAfeh2GZjgPmArxBFfxQZBVxIKQKYe3jHwA8h6Up6DNFJPqP8v2408XIxIZrHYFh15MhYton9vSZd8XEwL/7zfNrxhAJY8Jqc1oC1F1C3bMkhZ3t1qf8T+eI2b+tSv/C9SWiFvwJceMsUdYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF8He/ZI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729079918; x=1760615918;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=29ovtOc0RitatdpSSFjl1CzXXX5nOX9JNLZZTNBkXSw=;
  b=eF8He/ZI9s9YAzaF1JajQLIsNXamdhCUuPBpeP1izXXjQR2KgS37J1GF
   1YwhYfZeRQfoy/MlT4nVqkNEl5YuVVdGhQ0m2ei1qBfkiG6k9ygaRkt5q
   wSyAWMZKaWoeIHDW3wqPsAPhyN7r6NrKCX0NEWPdLUVnm6uJxn2STify+
   HzF2ggpNDU4jVBdqWGooGq+YV8tWGBX+K4YGsM3QDeHL5pfzaxeFDxcw2
   fIVR42z6fLPIfFc/Cc+Tsa2hyQFq5fN2RX42KR6AMygFHAB54SDU/YwuS
   cLd9i+qbkght/zt0yTPrMwqpKAmSiD5amY2YZW9FfScFZSDcwnBPDpGhk
   A==;
X-CSE-ConnectionGUID: lM6sbtZvQ1qWm7m/soYCKA==
X-CSE-MsgGUID: hCv0BajFQ2iF9mEn9s8/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="53936865"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="53936865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:58:31 -0700
X-CSE-ConnectionGUID: HCbvZrMMQcOLFHbda+4DaA==
X-CSE-MsgGUID: hyltfGc8RTOIvO/V/sJ4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82168928"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:58:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Oct 2024 14:58:25 +0300 (EEST)
To: Daniel Scally <dan.scally@ideasonboard.com>
cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    anders.ruke@gmail.com, sakari.ailus@linux.intel.com, 
    Hans de Goede <hdegoede@redhat.com>, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 2/3] platform/x86: int3472: Add board data for Dell
 7212
In-Reply-To: <20241015211958.1465909-3-dan.scally@ideasonboard.com>
Message-ID: <fcb92c2d-f422-ef97-721e-f59b5e026474@linux.intel.com>
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com> <20241015211958.1465909-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Oct 2024, Daniel Scally wrote:

> The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
> Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
> need some board data to describe how to configure the GPIOs and
> regulators to run the sensor.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 322237e056f3..d28053733bd2 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -129,6 +129,109 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
>  	},
>  };
>  
> +/* Settings for Dell 7212 Tablet */
> +
> +static struct regulator_consumer_supply int3479_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
> +};
> +
> +static struct regulator_consumer_supply int3479_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
> +};
> +
> +static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
> +};
> +
> +static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL

Add comma to any non-terminator entry.

> +};
> +
> +static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL
> +};
> +
> +static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL
> +};

This looks exactly identical to dell_7212_tps68470_ana_reg_init_data.

> +static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
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
> +static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3479_vsio_consumer_supplies),
> +	.consumer_supplies = int3479_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_7212_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1213200,
> +		.max_uV = 1213200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3479_aux1_consumer_supplies),
> +	.consumer_supplies = int3479_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3479_aux2_consumer_supplies),
> +	.consumer_supplies = int3479_aux2_consumer_supplies,
> +};
> +
> +static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &dell_7212_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  = &dell_7212_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] = &dell_7212_tps68470_vio_reg_init_data,

Inconsistent spaces.

-- 
 i.

> +		[TPS68470_VSIO] = &dell_7212_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &dell_7212_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &dell_7212_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -146,6 +249,15 @@ static struct gpiod_lookup_table surface_go_int347e_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table dell_7212_int3479_gpios = {
> +	.dev_id = "i2c-INT3479:00",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -166,6 +278,15 @@ static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:05",
> +	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&dell_7212_int3479_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -188,6 +309,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&surface_go3_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7212 Rugged Extreme Tablet"),
> +		},
> +		.driver_data = (void *)&dell_7212_tps68470_board_data,
> +	},
>  	{ }
>  };
>  
> 

