Return-Path: <linux-media+bounces-30952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A1A9B01F
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 16:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177554A0DC8
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 14:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82F818FC89;
	Thu, 24 Apr 2025 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJJ03C7M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23415E5DC;
	Thu, 24 Apr 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503613; cv=none; b=ZTryFFtQ1GKorXzxQOiWmZfNsnBB+U2cKIUdwASl0Kx3WVMgP6K0rrenuIg7ugecu9g2XMR/+IdDPnAjog2W2iBw57/ardPMFH7tz1x34bCrb4xrwmD4dVmPPJmmzil0UiR78JgplkrZnBdNeB6kbjblwmDk6M7wwO65ETFjiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503613; c=relaxed/simple;
	bh=3Rew3i5TnOrgZRSVl8kgk3cY/UQEmvClQFPxpqj8EYE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PhSDVYEG9/jxrOyK06dwktGP7VlyzKJK9VO0ueq2GAJZdyVPfB6/81nTA+G9sasJcJ1Br/wVy8jeKtqhqgqSmFvERFvt6Al19fV3Ysn+1G6QkDPxTQdUHTzdtnJILlyl/uYybc4sIfyc/O38NKZBmtFmwLZ7Xf4XX+yays12IyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJJ03C7M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745503611; x=1777039611;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3Rew3i5TnOrgZRSVl8kgk3cY/UQEmvClQFPxpqj8EYE=;
  b=fJJ03C7MnEeXYcuc/DVb0n/kP6yn6ZF9sdY/c0ki5io1q+QD9eDha/l+
   ML8u5tWq27LCyIKAfVl83tbYtdU94/AJ8qv38qqjVuKEiO4m3VJLbMPt4
   j+rn+PSBhaG9qBx7doOXJLLupo5rT7Hw2wW8VvANfcBidvZJR+icv4Lfe
   W0+rqlqY7jxN7P0kQ5jc4eawanNVGO5DT3DeXE6pDHifPizMoqJpICRmb
   GCuM/n/+2wiITOZFPbOeqKMJvCeZV4qh9tvHFnMz27NKAh/Uf0R6v5+TU
   rsMWKncO5wKW2P5yPZ46qHEOjvlQbYDS6zmRmQRoTNMWDkHcFZaEb7B6x
   w==;
X-CSE-ConnectionGUID: 9wM4ryGDT2y1zvhazUWg4Q==
X-CSE-MsgGUID: tpeQ+BthTeOV9PyRoFGp5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34760527"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="34760527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:06:50 -0700
X-CSE-ConnectionGUID: 6DWbJzUkRom0n9x9jKgYOw==
X-CSE-MsgGUID: tpEJgpWFRwSmX01md+us6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132518345"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:06:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 24 Apr 2025 17:06:43 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>, 
    Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
    platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name
 configurable
In-Reply-To: <20250417111337.38142-6-hdegoede@redhat.com>
Message-ID: <dfe0cbe6-c268-2fca-4b06-1013151633c9@linux.intel.com>
References: <20250417111337.38142-1-hdegoede@redhat.com> <20250417111337.38142-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Hans de Goede wrote:

> This is a preparation patch for registering multiple regulators, which
> requires a different supply-name for each regulator. Make supply-name
> a parameter to skl_int3472_register_regulator() and use con-id to set it
> so that the existing int3472_gpio_map remapping can be used with it.
> 
> Since supply-name is a parameter now, drop the fixed
> skl_int3472_regulator_map_supplies[] array and instead add lower- and
> upper-case mappings of the passed-in supply-name to the regulator.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
>   assumes that
> 
> Changes in v3:
> - Add comment explaining value of 12 in GPIO_REGULATOR_NAME_LENGTH
> - Some other comment / commitmsg tweaks
> 
> Changes in v2:
> - Use E2BIG instead of EOVERFLOW for too long supply-names
> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 50 ++++++++-----------
>  drivers/platform/x86/intel/int3472/common.h   |  8 ++-
>  drivers/platform/x86/intel/int3472/discrete.c |  4 +-
>  3 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 374a99dea7d1..b7a1abc2919c 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -185,42 +185,37 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
>  	clk_unregister(int3472->clock.clk);
>  }
>  
> -/*
> - * The INT3472 device is going to be the only supplier of a regulator for
> - * the sensor device. But unlike the clk framework the regulator framework
> - * does not allow matching by consumer-device-name only.
> - *
> - * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
> - * where this cannot be changed because another supply-id is already used in
> - * e.g. DeviceTree files an alias for the other supply-id can be added here.
> - *
> - * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
> - */
> -static const char * const skl_int3472_regulator_map_supplies[] = {
> -	"avdd",
> -	"AVDD",
> -};
> -
> -static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
> -	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
> -
>  int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  				   struct gpio_desc *gpio,
> +				   const char *supply_name,
>  				   const char *second_sensor)
>  {
>  	struct regulator_init_data init_data = { };
> +	struct int3472_gpio_regulator *regulator;
>  	struct regulator_config cfg = { };
>  	int i, j;
>  
> -	for (i = 0, j = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
> -		int3472->regulator.supply_map[j].supply = skl_int3472_regulator_map_supplies[i];
> -		int3472->regulator.supply_map[j].dev_name = int3472->sensor_name;
> +	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
> +		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
> +		return -E2BIG;
> +	}
> +
> +	regulator = &int3472->regulator;
> +	string_upper(regulator->supply_name_upper, supply_name);
> +
> +	/* The below code assume that map-count is 2 (upper- and lower-case) */
> +	static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2);
> +
> +	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
> +		const char *supply = i ? regulator->supply_name_upper : supply_name;
> +
> +		regulator->supply_map[j].supply = supply;
> +		regulator->supply_map[j].dev_name = int3472->sensor_name;
>  		j++;
>  
>  		if (second_sensor) {
> -			int3472->regulator.supply_map[j].supply =
> -				skl_int3472_regulator_map_supplies[i];
> -			int3472->regulator.supply_map[j].dev_name = second_sensor;
> +			regulator->supply_map[j].supply = supply;
> +			regulator->supply_map[j].dev_name = second_sensor;
>  			j++;
>  		}
>  	}
> @@ -229,9 +224,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  	init_data.consumer_supplies = int3472->regulator.supply_map;
>  	init_data.num_consumer_supplies = j;
>  
> -	snprintf(int3472->regulator.regulator_name,
> -		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
> -		 acpi_dev_name(int3472->adev));
> +	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
> +		 acpi_dev_name(int3472->adev), supply_name);
>  
>  	int3472->regulator.rdesc = INT3472_REGULATOR(
>  						int3472->regulator.regulator_name,
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 3728f3864a84..b750a309ee16 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -26,7 +26,11 @@
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
>  
> -#define GPIO_REGULATOR_NAME_LENGTH				21
> +/* E.g. "avdd\0" */
> +#define GPIO_SUPPPLY_NAME_LENGTH				5

FYI, I've fixed this typo for you while applying to the review-ilpo-next 
branch.

--
 i.


> +/* 12 chars for acpi_dev_name() + "-", e.g. "ABCD1234:00-" */
> +#define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
> +/* lower- and upper-case mapping */
>  #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
>  
>  #define INT3472_LED_MAX_NAME_LEN				32
> @@ -85,6 +89,7 @@ struct int3472_discrete_device {
>  	struct int3472_gpio_regulator {
>  		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
>  		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
> +		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
>  		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
>  		struct regulator_dev *rdev;
>  		struct regulator_desc rdesc;
> @@ -129,6 +134,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
>  
>  int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  				   struct gpio_desc *gpio,
> +				   const char *supply_name,
>  				   const char *second_sensor);
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index cbf39459bdf0..f6dae82739e5 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -188,7 +188,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> -		*con_id = "power-enable";
> +		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
>  	default:
> @@ -311,7 +311,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
> -			ret = skl_int3472_register_regulator(int3472, gpio,
> +			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
>  							     int3472->quirks.avdd_second_sensor);
>  			if (ret)
>  				err_msg = "Failed to map regulator to sensor\n";
> 

