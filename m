Return-Path: <linux-media+bounces-36524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DAAF11BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DB2D1C26E51
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0241254B18;
	Wed,  2 Jul 2025 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huMpaUmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F62512C6;
	Wed,  2 Jul 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451806; cv=none; b=QIDpZWFsLuXqVfiIz6GaIoXX3JvCtaBEEVCQXXqVJ3cAsc089M5oo4Ui7xR38JEgQpWlZdr9iGUy/Nx+iFsxuuBqbT3VizgZdNeKai0ngDyt7QPu6tX695s7da03jGQ38YP113fRxrTFkkwy6EN25yKz1RewE52+t6kXA4xQ69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451806; c=relaxed/simple;
	bh=5l0STjhS+Ewa7qZ2YzJ7JzJuAr3mhaNFoItK0ZwOzbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFnvBtcRpjkINbSTIqEU75aGfYCPLkr5StbMv53iSnBCuXG3BMPvJkgQZj/JgeIRdtHBft7SeoKhP/SHYmXQDwnyQ0fsigm8rmdGSc43bvqBd6jWOkXg01YaqIqJsg/O+9HeCrrRaozZhHw7ZdK9SZW6+hzMO3FzvBv1WteyceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huMpaUmb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751451805; x=1782987805;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5l0STjhS+Ewa7qZ2YzJ7JzJuAr3mhaNFoItK0ZwOzbQ=;
  b=huMpaUmbKLkGHEKYckS0kkSR7Dp2kKyJpEXAk8Wgf1PyoGZoX1tTw6zm
   3950e6MXwBsjVtiTmGiD/7UGq7/mtGNybjcXZ//1PcraHZjdAV7grH/Sf
   0OauX5cgQ3tg26JSlcClBFLHdFEJG1CXQ1NW9n/sbA0N187AYH6kOVwG/
   zQjUmsu0dTyU3YJYjkzUEGjSBvCHiIEar/1HsBW+kNO+bWMLWieBSnJXW
   KoL41uVQXZypQZnlCZykKRwI/VxwctMIA+4PLz/9E6HEpn9YiCnQgCQcj
   TVxj5UPnQC7NNbmgs/o6LNmEOymPt5djpIAnIM8gYyoovJxPguRkViBva
   A==;
X-CSE-ConnectionGUID: wO0uR//TSu+cQZanmSGiPw==
X-CSE-MsgGUID: 3x23BNkQRGyFnixHWPXIYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57518370"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57518370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:23:25 -0700
X-CSE-ConnectionGUID: Cn8NkYV1Qx6lxf5fOWfO/Q==
X-CSE-MsgGUID: AN8RcvltTcaZlibe9v3eVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154769101"
Received: from unknown (HELO [10.238.224.237]) ([10.238.224.237])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:23:21 -0700
Message-ID: <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>
Date: Wed, 2 Jul 2025 18:23:19 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, u.kleine-koenig@baylibre.com,
 ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
 stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
 <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 7/2/2025 6:19 PM, Ilpo Järvinen wrote:
> On Fri, 25 Apr 2025, Dongcheng Yan wrote:
> 
>> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
>> being received. On the host side this is wired to a GPIO for polling or
>> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
>> lt6911uxe and lt6911uxc.
>>
>> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
>> here as well.
>>
>> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
>> ---
>>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 51b818e62a25..4593d567caf4 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -23,6 +23,7 @@
>>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>>  
>>  #define INT3472_PDEV_MAX_NAME_LEN				23
>>  #define INT3472_MAX_SENSOR_GPIOS				3
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 394975f55d64..efa3bc7af193 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>>  		*con_id = "privacy-led";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>>  		break;
>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>> +		*con_id = "hpd";
>> +		*gpio_flags = GPIO_ACTIVE_HIGH;
>> +		break;
>>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>>  		*con_id = "avdd";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>>   * 0x0b Power enable
>>   * 0x0c Clock enable
>>   * 0x0d Privacy LED
>> + * 0x13 Hotplug detect
>>   *
>>   * There are some known platform specific quirks where that does not quite
>>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
>> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  	switch (type) {
>>  	case INT3472_GPIO_TYPE_RESET:
>>  	case INT3472_GPIO_TYPE_POWERDOWN:
>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>>  		if (ret)
>>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
> I was informed about existance of this patch through an off-band channel 
> (as I was not among receipients). In future, please include all relevant 
> maintainers and MLs as receipients as indicated by 
> scripts/get_maintainers.pl.
> 
> This may go through a media tree,
> 
> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> 

Thanks a lot and sorry for the trouble caused by me.

Thanks,
Dongcheng

