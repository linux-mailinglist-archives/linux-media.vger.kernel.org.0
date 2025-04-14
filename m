Return-Path: <linux-media+bounces-30131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DEA87CAE
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41E1173174
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D3C25E830;
	Mon, 14 Apr 2025 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaOtvsB9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0716C850;
	Mon, 14 Apr 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624882; cv=none; b=c+2syjpC43IHdd6lkYTvugcO2nQ2QCJfS4ETVQUh6E5jga8njwC0Te337OdPod8q3WCgJ/XeaOoVAWsnlbXvQR6cSZ3Hddt01D8DKOXvCCtEnlianMP6iDb9pj8MFoEa2PGiceMyGtwsHU19zYxxs8OpzgcV+blXtm31AGbpC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624882; c=relaxed/simple;
	bh=jux3qh2GmNwXCJRtchNaSFUh7cQ4ghf/chRvqcmgcEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDpXTjvspFHiI5FQsLlA1FpQyjf9KS2rc7v1qSUGs3P1j7ktfOjWA90WWgbBQIrJEt0M8/hlzOMIeo21drV/ewB0O9/Hon15YYsQTnu26jpQ1fX4deVdUuxXYLw0Gvkvfkbb/LjSTWU4Wv6TYzPKWVY3IaYiKYgjpPb6JherbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaOtvsB9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624881; x=1776160881;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jux3qh2GmNwXCJRtchNaSFUh7cQ4ghf/chRvqcmgcEQ=;
  b=kaOtvsB9zJhq2B5BB73n0U4EZkhX9yaK6sFOeLSHTBk5VeBf4KSkpLvd
   fT8UXnmAS2+tM7y0hwHwlT9FaeF+uponX3gmKDcZy+FLt3qQQrElEyyDY
   qQkPefRuTNshlk91cvD/qspfWPnK72AsBbR5hozJppRDi8IMd9tiOwM72
   KYuKEQ76vzG0VuBiDe8FiSTsYs31shXijfPIKlns7mUvcoOFNyFwjgdBa
   LgvMDNKkhH3Z4IIRSFmHW3PoWDqNw7Ps5YTNhpMZeQxwLxG6cq1qQ6A1o
   TNseSqh3xKncSVzIsInEoxdfxRLkZNGAz4lH1K81Q2n68qMuDte7Taqn5
   w==;
X-CSE-ConnectionGUID: rwgaNBSlQnmMHfF6ZDzrRw==
X-CSE-MsgGUID: g2rqRZHATlKCjO1vT+xtwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56746860"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56746860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:01:19 -0700
X-CSE-ConnectionGUID: V9ygt8CeTuGuNerDO5gynA==
X-CSE-MsgGUID: gdIvElpQT2yZzkgiyFSVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134746732"
Received: from unknown (HELO [10.238.224.239]) ([10.238.224.239])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:01:16 -0700
Message-ID: <750048e9-292a-4960-9fb2-76ce21db1811@intel.com>
Date: Mon, 14 Apr 2025 18:01:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, hverkuil@xs4all.nl,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMyodMQoH6EtSR@kekkonen.localdomain>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
In-Reply-To: <Z_zMyodMQoH6EtSR@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 4/14/2025 4:52 PM, Sakari Ailus wrote:
> Hi Dongcheng,
> 
> On Mon, Apr 14, 2025 at 04:40:26PM +0800, Yan, Dongcheng wrote:
>> Hi Andy,
>>
>> On 4/14/2025 4:11 PM, Andy Shevchenko wrote:
>>> On Mon, Apr 14, 2025 at 03:52:50PM +0800, Yan, Dongcheng wrote:
>>>> On 4/11/2025 4:33 PM, Hans de Goede wrote:
>>>>> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
>>>
>>> ...
>>>
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
> include/linux/gpio/machine.h:
> 
> 	GPIO_PERSISTENT                 = (0 << 3),
> ...
> 	GPIO_LOOKUP_FLAGS_DEFAULT       = GPIO_ACTIVE_HIGH | GPIO_PERSISTENT,
> 
> I.e. you effectively have GPIO_ACTIVE_HIGH there.
> 
> Btw. no need to cc this set to stable@vger.kernel.org, I've dropped it from
> the cc list. See Documentation/process/submitting-patches.rst .
> 

Thanks, I will remove it in a subsequent email.

Thanks,
Dongcheng


