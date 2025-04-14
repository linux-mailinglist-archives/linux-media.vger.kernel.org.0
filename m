Return-Path: <linux-media+bounces-30130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503EA87CA4
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7463E172E28
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1058267F7F;
	Mon, 14 Apr 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUbKnkWQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F8267AE5;
	Mon, 14 Apr 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624761; cv=none; b=kDSB9l0IM1dbPUADDO9o1q1gUrPGE9hiCOgY9CLNX1TXCIyLHQvYR6vFH2Z74joqfwccOyMcHYQVjVtEcM9Sx1KfiGwRIGsgb0WzgwFoad2RwYSuzG7LuHw+Pq9IafpHuz6IPhe9y/2W5l0Y3J9hYHJxacF45VTSFn8IDMAGYdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624761; c=relaxed/simple;
	bh=x2MDu58h9JoknfphytpLlAqXi9FcUSFB38RkSqXHjWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpTqEq38ZLUI4JMVOnaOsgYiCl+6gdTfGJuV+oe2c1TURSeelsWg3bW4FuxiEi1mUvBzUQEagh2M4IZAOgBTKroS/ZerqiouBN/1njEamC24KteZq9RJZywL6SoQlckWl6sBm3irZifWx/5JopYK3tHYoTt4YUC/uIRshn6PI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUbKnkWQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624759; x=1776160759;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x2MDu58h9JoknfphytpLlAqXi9FcUSFB38RkSqXHjWA=;
  b=JUbKnkWQMOnTxZGVwiEG4G0nj0FgDo0q6BvkI9vlNiLVD/Iz43SLsZDR
   xYy1d6A09gY4Khl6AlMO14Q9o/I9RxRLKULzvm5U7jtMvPplWJ0RyLDc6
   P/Sz7sTIys9H6AaVrtSNg6ye6YkIQlBSSPVBhAhV6/dOy2Pp6yN8kPjPq
   RtahNApdxesKQhHPm9iFZVP76iB0hhMzbTNhsoaPQ7MsS9agx/qM5Cb9H
   kWfGOyJUi4Fnb7mUPV85qst3Wk48MLKxbw9sTkFICuSYIYnXMeBRJ/XFe
   sSK+F725lbkOTCpgfj/WYBoirQPJxrUQwlnpq5esn/tE2wuNxJk0EJFpD
   Q==;
X-CSE-ConnectionGUID: 9qGKcDlRTiikupEzx2hfvA==
X-CSE-MsgGUID: 0tHzrsySSh2rSv82kBPwIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71472237"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="71472237"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:59:18 -0700
X-CSE-ConnectionGUID: +nNSrTNoRui/IPBJmwCdgQ==
X-CSE-MsgGUID: tg7BsxTMTjKQqkUBWcyipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129756657"
Received: from unknown (HELO [10.238.224.239]) ([10.238.224.239])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:59:16 -0700
Message-ID: <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
Date: Mon, 14 Apr 2025 17:59:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, stable@vger.kernel.org, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy and Hans,

I found the description of lt6911uxe's GPIO in the spec:
GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
start reading registers from 6911UXE;

So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
We used RISING and FALLING in irq(not GPIO) to ensure that HDMI events
will not be lost to the greatest extent possible.

Thanks,
Dongcheng

On 4/14/2025 4:49 PM, Andy Shevchenko wrote:
> On Mon, Apr 14, 2025 at 04:40:26PM +0800, Yan, Dongcheng wrote:
>> On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
>>> On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
>>>> On 4/11/2025 4:33 PM, Hans de Goede wrote:
>>>>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> 
> ...
> 
>>>>>> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>>>>>> +		*con_id = "hpd";
>>>>>> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;
>>>>>
>>>>> This looks wrong, we really need to clearly provide a polarity
>>>>> here since the ACPI GPIO resources do not provide one.
>>>>>
>>>> I tested gpio_flags=GPIO_LOOKUP_FLAGS_DEFAULT/HIGH/LOW, the lt6911uxe
>>>> driver can pass the test and work normally.
>>>
>>> I doubt you tested that correctly. It's impossible to have level triggered
>>> event to work with either polarity. It might be also a bug in the code lurking
>>> somewhere, but it would be unlikely (taking into account amount of systems
>>> relying on this).
>>>
>>> Is it edge triggered event?
>>>
>>
>> It is an edge triggered event in lt6911uxe. In order to better adapt to
>> other uses, "hpd" is meaningful to specify a polarity here.
>>
>> In lt6911uxe, GPIO "hpd" is used as irq, and set irq-flag to
>> IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT. So no matter
>> rising or falling, driver can work normally.
>> "
>> ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio),	NULL,
>> lt6911uxe_threaded_irq_fn, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
>> IRQF_ONESHOT, NULL, lt6911uxe);
>> "
> 
> So, the driver must not override the firmware, if there is no bugs.
> So, why do you even use those flags there? It seems like a bad code
> in the driver that doesn't look correct to me.
> 


