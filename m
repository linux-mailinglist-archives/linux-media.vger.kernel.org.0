Return-Path: <linux-media+bounces-31020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE20A9C2DE
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E8A1BC050B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5695623A9BE;
	Fri, 25 Apr 2025 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atYsYoGS"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68A23A564
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572003; cv=none; b=M+0q6nBIhKHoEPT/1l2VJvTSPowhJvB3kxmj9Lxt+RSkWuasLDgGaRdE2AHz8E8eJN6atpy7ALYUuBRopdYlIIUoeTRG8lO0K9G1EhUjFvonZ/FrCUrt82RfguZH5V0xDXAab/uAqExanZlMlKzo+JfC5RKtTCvV6NXKbyyWKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572003; c=relaxed/simple;
	bh=qXwqZO7iXuLExXZP5h5E9JU/fSPWN15AGwchjFkcE9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nohJSNtzyk17DDqKO5uvQDyhpyXtwBVEZUwsKxdRwJu6hmYLuxhjUnan8DvRCNvqCra7Q9OR+daMwjjF6aOrv0FSNtg8KxSonE7Ty7rJqLrDzCO8TR1KGXfCWuWIqWpipXEWAUWrFA5LZUl5johCN3jao/+21PGaIErLt+uF4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atYsYoGS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745572000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3JygN5w0NRyNqKtFl4fxhFdkm9X9GcLXmTdGsxzhj8=;
	b=atYsYoGS75AYr3vXR8UG/3dts5p/bg4gpCfgv+ZXdaM6g++nhdYyM91TIxRHEphR+tpZxs
	oEaKv5/n8eEySh+K2BDB3q5OjhhitAz4OeXbUreTQgu8W3+i9ZI7ThCtxzPHiqNcXpX8M4
	1/s/j1Ml6Gf5HYQ6g933pRXwjOk36ho=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-8gFYAEFvPFa7MHNnqWaeVg-1; Fri, 25 Apr 2025 05:06:38 -0400
X-MC-Unique: 8gFYAEFvPFa7MHNnqWaeVg-1
X-Mimecast-MFC-AGG-ID: 8gFYAEFvPFa7MHNnqWaeVg_1745571998
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5f4d2b91f1eso2031729a12.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 02:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571998; x=1746176798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3JygN5w0NRyNqKtFl4fxhFdkm9X9GcLXmTdGsxzhj8=;
        b=Aroa3kRoIoZnLGWgWR0Dvx50Saop8Dyrgw3cpyhj7S4jz746ROpWuqTACjgPAlwGEk
         5W8MED6FCXUDZ17gUhTPeVraOBusI0kxdrbif/j1Dj1tmV2hd436bajKvr6+/0KUvQn1
         CEJ0HJs3e/zhK5/Vky0oe9COwYyBcwRWphqnsPU60FBlaPIb6TsREjVzKb3zH1Xapt/F
         APLr0JL9xaeYx0s9rE++o6fKKQ46fdvH6m07shxreZOhMxiM+Go4MUQPwEhkOeorG7Ai
         UnE46Ts4LbYTysNqSy6AyQo2ZX4wxEGQuuij9sVgRbPYFnJt/72NXd8Cjst6fToTD5A8
         aQMw==
X-Forwarded-Encrypted: i=1; AJvYcCXQrAOB/8AIjaFGRpOrxLhJWcvY2pZCHAvc/EtzuLEl9Bq0tc9MdTHfB0Gnltk32jRoaawCNBAaCwZ8eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykc4ErMJPe447oXEjhC8Ugfair1TE50ozQyUFfOn128FPo2YYM
	+Y8VGtZ0ECMXXMqsYaUtfrXevo68HJaqO2iVOtRPYDR8ZdOe0M0OxoU/FYqmygc3aWbUODB4Dii
	8uekbvx2pBRSr8GAkB4cAOmmAAKSsvSYg4jmtxMAgeBLruarky031428p80m9
X-Gm-Gg: ASbGnctAZfonI0370CN1ANwXEWU4lSDZfh1lDzp1y3dNCN6wNOiVDMZ4IhFHXSEcZkM
	6/VG60WAFtoVqvPPAMsA6XtOgWcshSKSEF8RlPwYm0miydpE2xGA6+x7c3MlVZoDesSrSz4f4cx
	20Mu71grYq2GB3fi/HmgBzQvOgf8SZtkDW+luzstFcSjc/corj/Hl00y0T3tc9IZdRklxMMWBvt
	2x9uHswBQhFun6xHyMnZs241bQNarNIncVBhZ8cGyy5xk4tdn4OvJrlpS0E3b9T4uuP4jr3wsy1
	N4xw6agtHD3RIO4Da3JwJctY3M3+YaRbZBKnMsVhxgPREvNGZdUvUxhR0emYSNYtU7AlpRZSZmf
	c9uQEz3pA1YJnRM+tuCjNeXqK3pvz+N/i0+q/48IRfCASxM8ohCgwTDGEp5cbMQ==
X-Received: by 2002:a05:6402:13d2:b0:5e4:b874:3df7 with SMTP id 4fb4d7f45d1cf-5f723639b3emr1251992a12.25.1745571997593;
        Fri, 25 Apr 2025 02:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUK6I3lvAm20D1H4HmGgLbFF87jVyJ0+5yk6FdGYj2RV/1Ij+Y4N7ZMHE4WZh3AlMehB1PmQ==
X-Received: by 2002:a05:6402:13d2:b0:5e4:b874:3df7 with SMTP id 4fb4d7f45d1cf-5f723639b3emr1251975a12.25.1745571997187;
        Fri, 25 Apr 2025 02:06:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm988113a12.19.2025.04.25.02.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:06:36 -0700 (PDT)
Message-ID: <81dfad68-6ce6-4eea-a1a6-fa1a5c03d92d@redhat.com>
Date: Fri, 25 Apr 2025 11:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name
 configurable
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250417111337.38142-1-hdegoede@redhat.com>
 <20250417111337.38142-6-hdegoede@redhat.com>
 <dfe0cbe6-c268-2fca-4b06-1013151633c9@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dfe0cbe6-c268-2fca-4b06-1013151633c9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 24-Apr-25 4:06 PM, Ilpo Järvinen wrote:
> On Thu, 17 Apr 2025, Hans de Goede wrote:
> 
>> This is a preparation patch for registering multiple regulators, which
>> requires a different supply-name for each regulator. Make supply-name
>> a parameter to skl_int3472_register_regulator() and use con-id to set it
>> so that the existing int3472_gpio_map remapping can be used with it.
>>
>> Since supply-name is a parameter now, drop the fixed
>> skl_int3472_regulator_map_supplies[] array and instead add lower- and
>> upper-case mappings of the passed-in supply-name to the regulator.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v4:
>> - At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
>>   assumes that
>>
>> Changes in v3:
>> - Add comment explaining value of 12 in GPIO_REGULATOR_NAME_LENGTH
>> - Some other comment / commitmsg tweaks
>>
>> Changes in v2:
>> - Use E2BIG instead of EOVERFLOW for too long supply-names
>> ---
>>  .../x86/intel/int3472/clk_and_regulator.c     | 50 ++++++++-----------
>>  drivers/platform/x86/intel/int3472/common.h   |  8 ++-
>>  drivers/platform/x86/intel/int3472/discrete.c |  4 +-
>>  3 files changed, 31 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index 374a99dea7d1..b7a1abc2919c 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -185,42 +185,37 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
>>  	clk_unregister(int3472->clock.clk);
>>  }
>>  
>> -/*
>> - * The INT3472 device is going to be the only supplier of a regulator for
>> - * the sensor device. But unlike the clk framework the regulator framework
>> - * does not allow matching by consumer-device-name only.
>> - *
>> - * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
>> - * where this cannot be changed because another supply-id is already used in
>> - * e.g. DeviceTree files an alias for the other supply-id can be added here.
>> - *
>> - * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
>> - */
>> -static const char * const skl_int3472_regulator_map_supplies[] = {
>> -	"avdd",
>> -	"AVDD",
>> -};
>> -
>> -static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
>> -	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
>> -
>>  int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>>  				   struct gpio_desc *gpio,
>> +				   const char *supply_name,
>>  				   const char *second_sensor)
>>  {
>>  	struct regulator_init_data init_data = { };
>> +	struct int3472_gpio_regulator *regulator;
>>  	struct regulator_config cfg = { };
>>  	int i, j;
>>  
>> -	for (i = 0, j = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
>> -		int3472->regulator.supply_map[j].supply = skl_int3472_regulator_map_supplies[i];
>> -		int3472->regulator.supply_map[j].dev_name = int3472->sensor_name;
>> +	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
>> +		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
>> +		return -E2BIG;
>> +	}
>> +
>> +	regulator = &int3472->regulator;
>> +	string_upper(regulator->supply_name_upper, supply_name);
>> +
>> +	/* The below code assume that map-count is 2 (upper- and lower-case) */
>> +	static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2);
>> +
>> +	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
>> +		const char *supply = i ? regulator->supply_name_upper : supply_name;
>> +
>> +		regulator->supply_map[j].supply = supply;
>> +		regulator->supply_map[j].dev_name = int3472->sensor_name;
>>  		j++;
>>  
>>  		if (second_sensor) {
>> -			int3472->regulator.supply_map[j].supply =
>> -				skl_int3472_regulator_map_supplies[i];
>> -			int3472->regulator.supply_map[j].dev_name = second_sensor;
>> +			regulator->supply_map[j].supply = supply;
>> +			regulator->supply_map[j].dev_name = second_sensor;
>>  			j++;
>>  		}
>>  	}
>> @@ -229,9 +224,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>>  	init_data.consumer_supplies = int3472->regulator.supply_map;
>>  	init_data.num_consumer_supplies = j;
>>  
>> -	snprintf(int3472->regulator.regulator_name,
>> -		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
>> -		 acpi_dev_name(int3472->adev));
>> +	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
>> +		 acpi_dev_name(int3472->adev), supply_name);
>>  
>>  	int3472->regulator.rdesc = INT3472_REGULATOR(
>>  						int3472->regulator.regulator_name,
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 3728f3864a84..b750a309ee16 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -26,7 +26,11 @@
>>  #define INT3472_PDEV_MAX_NAME_LEN				23
>>  #define INT3472_MAX_SENSOR_GPIOS				3
>>  
>> -#define GPIO_REGULATOR_NAME_LENGTH				21
>> +/* E.g. "avdd\0" */
>> +#define GPIO_SUPPPLY_NAME_LENGTH				5
> 
> FYI, I've fixed this typo for you while applying to the review-ilpo-next 
> branch.

Thank you, I completely missed the triple PPP in there until you pointed
it out. I just copy pasted the same mistake everywhere :)

Regards,

Hans




>> +/* 12 chars for acpi_dev_name() + "-", e.g. "ABCD1234:00-" */
>> +#define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
>> +/* lower- and upper-case mapping */
>>  #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
>>  
>>  #define INT3472_LED_MAX_NAME_LEN				32
>> @@ -85,6 +89,7 @@ struct int3472_discrete_device {
>>  	struct int3472_gpio_regulator {
>>  		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
>>  		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
>> +		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
>>  		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
>>  		struct regulator_dev *rdev;
>>  		struct regulator_desc rdesc;
>> @@ -129,6 +134,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
>>  
>>  int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>>  				   struct gpio_desc *gpio,
>> +				   const char *supply_name,
>>  				   const char *second_sensor);
>>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>>  
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index cbf39459bdf0..f6dae82739e5 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -188,7 +188,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>>  		break;
>>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>> -		*con_id = "power-enable";
>> +		*con_id = "avdd";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>>  		break;
>>  	default:
>> @@ -311,7 +311,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  
>>  			break;
>>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
>> -			ret = skl_int3472_register_regulator(int3472, gpio,
>> +			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
>>  							     int3472->quirks.avdd_second_sensor);
>>  			if (ret)
>>  				err_msg = "Failed to map regulator to sensor\n";
>>
> 


