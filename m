Return-Path: <linux-media+bounces-30113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBAA87A9D
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C693AFC40
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 08:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8689B25D538;
	Mon, 14 Apr 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqbq3J4k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8A15DBB3;
	Mon, 14 Apr 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620034; cv=none; b=Q03drq3RuZqIto9z9Rj49JIcRi1KZzOF0h7oq7fSui/eb3cQvfcso55SOCH6G5JvNfoiB/ZyoHeUEO9vmxFo5KNi0MBmHsJn+aJFQ+44tUsuwO5LOP+iff65gY0u6oP4Dv/NZc5P49o+rpPwDvb9azxhYpvOcTO5YiRO9o2KMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620034; c=relaxed/simple;
	bh=Qi7BkYrPqYiT7gOVCbd48fLoGzlj1PlhmMxJBqQEbMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLd1ns1A9ocXQ5Bug0RU4skJYIP5NKGnEYeD/JN+V8SwWD2B4apuJDz+YS3fJxS4r0XKrmospyVw3zN/b7ovKGIHH6aObGIOtaAY2tnePVQJdZWxs049Hg1Zdx65gWUXmdR4pl3J1me7bw8Zp7a/Vx7diJbT6WATKUMys8IkyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqbq3J4k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744620032; x=1776156032;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qi7BkYrPqYiT7gOVCbd48fLoGzlj1PlhmMxJBqQEbMs=;
  b=iqbq3J4kKuTvYPP9fhi2jTHSxRgbHRG6XBEUi9e1prfxvXlEm219ELuF
   SdjfneVibtt/nlOmF1U2QyMY84Ceky6ywXWaUGZIV7/NLyOEVjP7YEzUr
   UlgHx5hSIwIFRbZ2Qh/BNSE5eNEKAEXBKNQPVqBLk6DHUSOte5Gct3Ix8
   S1hzcae3eeBTKrC5WKylxlqOhLF77hy/BKxcSxDWrlLFnBEGUyQM0z5CT
   MKpZ8p3BpjwhkF9xFGosNnA0HCSEHI2HJvxzqzp6JXWrz3drmij5dkEyN
   UOk6Wcsp92vkDutZ9KQjrd9LHGcWRErQ/GYu2+EYn5elCDHDxhTg+Pcf8
   A==;
X-CSE-ConnectionGUID: O0eq5HYHS/2azmJIBonIUw==
X-CSE-MsgGUID: yjgFSqSrRCWsumygpjblcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49884291"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49884291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:40:31 -0700
X-CSE-ConnectionGUID: atjLFG0dQv2zpX9U5KqH/g==
X-CSE-MsgGUID: BEHY/GH3QvWzdzuh7HSxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130084667"
Received: from unknown (HELO [10.238.224.239]) ([10.238.224.239])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:40:28 -0700
Message-ID: <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
Date: Mon, 14 Apr 2025 16:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, stable@vger.kernel.org, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
> On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
>> On 4/11/2025 4:33 PM, Hans de Goede wrote:
>>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> 
> ...
> 
>>>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>>>> +		*con_id = "hpd";
>>>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
>>>
>>> This looks wrong, we really need to clearly provide a polarity
>>> here since the ACPI GPIO resources do not provide one.
>>>
>> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
>> driver can pass the test and work normally.
> 
> I doubt you tested that correctly. It's impossible to have level triggered
> event to work with either polarity. It might be also a bug in the code lurking
> somewhere, but it would be unlikely (taking into account amount of systems
> relying on this).
> 
> Is it edge triggered event?
> 

It is an edge triggered event in lt6911uxe. In order to better adapt to
other uses, "hpd" is meaningful to specify a polarity here.

In lt6911uxe, GPIO "hpd" is used as irq, and set irq-flag to
IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT. So no matter
rising or falling, driver can work normally.
"
ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio),	NULL,
lt6911uxe_threaded_irq_fn, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
IRQF_ONESHOT, NULL, lt6911uxe);
"

Thanks,
Dongcheng


