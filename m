Return-Path: <linux-media+bounces-30109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB2A87972
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EBB8188E0CB
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80693258CE7;
	Mon, 14 Apr 2025 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxmGkhpS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA411258CC3;
	Mon, 14 Apr 2025 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617178; cv=none; b=tZF2V+7RrO8JH5ihHYI/wC+Ns27Xqx0XSDBfwFIPgzUfALk1CpRgWZewKxs99GucRhWtfGta0Y8mVPW4jE5lHiK85nVotqc173dVLRCRN3pQ7QfkK86RQ5d6Vw1nqk7Oo66nPwd/7B3hxBsG5LDN0VnRVej5OV1fWmixQtIm5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617178; c=relaxed/simple;
	bh=bkxSTtdDFyviSpupmhNaBQ6cbugxxLS+/kDSWvSJ76Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZtC/WY0RWSv1eN+tY4UhsvRs8ZNW3sPJzve3n0o7xQ8K+hJ+ckYUBvsJb8/lEJ7lMk4RIexU6ZSaLrUrhooGYPPOu+MZGeA4k14pzdV+ycuQclnQCtfOHrzTq9l+jq30nwyDnCbezEEw6jp8F7vSBEHqDG5K3xstyS5HzTN6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxmGkhpS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744617177; x=1776153177;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bkxSTtdDFyviSpupmhNaBQ6cbugxxLS+/kDSWvSJ76Q=;
  b=QxmGkhpSr861b0QkSyyNmzST0HfhE2m0Na45tlYBHEyNTOq+PV14vXSY
   T76xwsbIoIeuwEt9wN+6+4LhanPCtqgWP6lsEAmmPHPgmyDm3OAhFPEpB
   REWvycVtpyQ1EgvBaEBQwu2cmbybwX79qJDdbNOflVSrWkl9vhs4L3fmd
   MnT6krmism3nZPHzr9cXc085Ev1yBtApkELJQAXulwWWDW8DVSMsuUi6U
   jvXRhPTL1o6xofP5/GK5I4EGNBLCVKksUa6FYDfuMJaXxoTMqfw1PESWS
   BW/19pyh5PvwZd3JRMlQvUxHD0xxgVsG/4HZHMEm9ZN/9qxU9qkNneW6f
   w==;
X-CSE-ConnectionGUID: qVULuznmQR+NTgVjHz4VAg==
X-CSE-MsgGUID: nErD2bQZTY6MC2IEgZhe1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56719738"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56719738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 00:52:56 -0700
X-CSE-ConnectionGUID: Suur3q4vQw+2nfVCvxYgvw==
X-CSE-MsgGUID: xK+m8O66QHi0jOcG9OUxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130294561"
Received: from unknown (HELO [10.238.224.239]) ([10.238.224.239])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 00:52:52 -0700
Message-ID: <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
Date: Mon, 14 Apr 2025 15:52:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Hans de Goede <hdegoede@redhat.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi hans,

On 4/11/2025 4:33 PM, Hans de Goede wrote:
> Hi,
> 
> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
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
>> index 30ff8f3ea1f5..28d41b1b3809 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>>  		*con_id = "privacy-led";
>>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>>  		break;
>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>> +		*con_id = "hpd";
>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
> 
> This looks wrong, we really need to clearly provide a polarity
> here since the ACPI GPIO resources do not provide one.
> 
I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
driver can pass the test and work normally. Is this the rule of int3472
driver?
In addition, GPIO_LOOKUP_FLAGS_DEFAULT	= GPIO_ACTIVE_HIGH |
GPIO_PERSISTENT as defined, maybe it provides a polarity also.
I can change to GPIO_ACTIVE_LOW, but I want to understand the reason.

Best Regard,
Dongcheng> Regards,
> 
> Hans
> 
> 
> 
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
> 


