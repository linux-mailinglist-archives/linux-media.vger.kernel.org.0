Return-Path: <linux-media+bounces-31053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB10A9C618
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E85F9A16A8
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB8F242D62;
	Fri, 25 Apr 2025 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivGehmys"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0382236A9C;
	Fri, 25 Apr 2025 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577934; cv=none; b=qS2I+3tEjnx+cmRfsT7wnbji9LBUvojhh3nsybpQBKoM8GbttgiAINm82LDNzITo4ZoONU/EBbhTPXVjoZ/B4YauneyRrUR/cqio2YjYGRsd7CctN0f5lZER3mkK/kjbWElYuUHeOAKFsn82riB5cAp19pelAk0Gsz+/GTcQwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577934; c=relaxed/simple;
	bh=OsFo66nKu376W/IaFttcQZJxIS26KTTytErf8y9DxeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8Q1/KVVnYcZGtNybBRR1AYDC/etxdvdqFCsQxKNjwYIKsD+cr8Qr8F22EgU1/vTQyMgB5gM50mP4jdLawSPDcmKZjtFHnKV+Gn9VAxZ6GG07X4orR1bwfXkYdZcHZ/5lUWrjPV05iEDbzWoWEWQQ2Yaxf1KEhlfi7omAH38Ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivGehmys; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745577932; x=1777113932;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OsFo66nKu376W/IaFttcQZJxIS26KTTytErf8y9DxeA=;
  b=ivGehmys1hDAck+GPPIQahjLHwDzlVSUgvtUAf9hAS2eVgvamv4Tx2vJ
   ODnsdnB0D/V+NghhPxzSS91v7SkZ85hBoBE0LJmJ3DMhHvUKz80gQRtta
   l8mGQEAXHuwol/cWZ+0+oXfHxQKDO4XZEWcgpmQ+qNDn94+JSa2zFQpt1
   j4XNc3UqgaQA0nBbwaXcqCPtC1vQRcaeIkbq9GA6zT5JeWOsAtgR1yKGi
   Z4TLI/NWvj5cfR72xmGGxDnAMipI+9ScdXFIXhOFGjZwckdXAAqcBgiYs
   SQVPqnR4OQUojj+euS/visJB0J7mZ/LCZ5KEPJ5wNFMA+Z2/GmBwJABYC
   A==;
X-CSE-ConnectionGUID: CkL4qQR+TPq7HZdEL4KlYQ==
X-CSE-MsgGUID: P4oNPcd2R1KUpTmPc5jmTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49893000"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="49893000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:45:31 -0700
X-CSE-ConnectionGUID: oO3LEnSeTw+G9hUEab841w==
X-CSE-MsgGUID: Bgr7DqGGQAquTFkcOI/KPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163839373"
Received: from reyongqi-mobl.ccr.corp.intel.com (HELO [10.238.225.6]) ([10.238.225.6])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:45:27 -0700
Message-ID: <5bdda33f-be94-480c-8b2b-6afd3036f9ee@linux.intel.com>
Date: Fri, 25 Apr 2025 18:45:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: add hpd pin support
To: Hans de Goede <hdegoede@redhat.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, hao.yao@intel.com,
 "Zou, Xiaohong" <xiaohong.zou@intel.com>
References: <20250425100739.3099535-1-dongcheng.yan@intel.com>
 <0db6de06-9d74-47d5-8625-7875bc376ecd@redhat.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <0db6de06-9d74-47d5-8625-7875bc376ecd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi hans,

thanks for your review, I have updated v3 within rebasing to
review-ilpo-next.

On 4/25/2025 6:13 PM, Hans de Goede wrote:
> Hi Doncheng,
> 
> On 25-Apr-25 12:07 PM, Dongcheng Yan wrote:
>> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
>> being received. On the host side this is wired to a GPIO for polling or
>> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
>> lt6911uxe and lt6911uxc.
>>
>> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
>> here as well.
>>
>> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Note my handshake control series has just landed / is on its
> way to next, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-ilpo-next
> 
> Please send a v3 rebased on top of this to resolve the conflict
> we now have.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>> ---
>>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 145dec66df64..db4cd3720e24 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -22,6 +22,7 @@
>>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>>  
>>  #define INT3472_PDEV_MAX_NAME_LEN				23
>>  #define INT3472_MAX_SENSOR_GPIOS				3
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 30ff8f3ea1f5..26215d1b63a2 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>>  		*con_id = "privacy-led";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>>  		break;
>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>> +		*con_id = "hpd";
>> +		*gpio_flags = GPIO_ACTIVE_HIGH;
>> +		break;
>>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>>  		*con_id = "power-enable";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>> @@ -212,6 +216,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>>   * 0x0b Power enable
>>   * 0x0c Clock enable
>>   * 0x0d Privacy LED
>> + * 0x13 Hotplug detect
>>   *
>>   * There are some known platform specific quirks where that does not quite
>>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
>> @@ -281,6 +286,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  	switch (type) {
>>  	case INT3472_GPIO_TYPE_RESET:
>>  	case INT3472_GPIO_TYPE_POWERDOWN:
>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>>  		if (ret)
>>  			err_msg = "Failed to map GPIO pin to sensor\n";
>>
>> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
> 


