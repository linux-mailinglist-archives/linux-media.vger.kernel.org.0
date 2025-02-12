Return-Path: <linux-media+bounces-26056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309AA324A0
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 12:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3CE8168FB1
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 11:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4209720A5DD;
	Wed, 12 Feb 2025 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3GHAQmL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A85201260
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358976; cv=none; b=q0GNr+KLB7VWbTJQtDIm280pal3Y20cgwx+etdUOYPPJ2sY9ZSIxFXgu7dZCiiYDm15UNWBaG2CxoLEgfxAOZEuIE0sGUBHGYzvCWmg2HvcgFyJHryC8bmBaGMbRgIvaU8HLI5HmtW1oZc4NL75kLX3lV4maUPPUrEY5SpRdNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358976; c=relaxed/simple;
	bh=xWtS+pef9e0jTPc6Scfygj3zQiK6O7RuryZJJ63mI2w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YQU3Oy6higCL4f0Ne9yz7eEMP3CHZ4StQ4aeQJ26Vf5ffwMZkVwbntkX8bHO92u7N6dFQrTXYEB5EtRZEjnA5Lr5LtP8C0+epC75m8pKp1hN+xGBoyc/VpTIQ8y+fFuYJP0leQ/OXuZLpnnclNlZyhxOYH7pKvtkwwNM38oRA9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3GHAQmL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739358976; x=1770894976;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xWtS+pef9e0jTPc6Scfygj3zQiK6O7RuryZJJ63mI2w=;
  b=R3GHAQmLdPpi4QedRfCHZ7cjne5k5UDB1Nk759oXz8f4F4uUXuAETV23
   S/SKyR3j3/5WionkQLjxJgJQTqyQHPaEH+jpuUxw9a1wUbR3hqi/kzDVa
   EXDXjOmMQN30Oide7e+4d+Fq7/ghQ1ahurQJ9y7DBEQqumDgBgre0ybSq
   bd4+gkYAqKY6X6UZuTmxpWo6qD3lcPegFTV/J6fDny45sYhKHDHfK6BeG
   EC6GmRtPr9QFGRB8CDkpe1iyxSHrNYTUsRsmr+/371VOxpFCAbwEYFNKX
   /z+zwb/CQpY0l1Y8il1U89sefVskHWlWQVWN3ZKP5FlpdplxU82Uzkyri
   Q==;
X-CSE-ConnectionGUID: /zzpamOdSTuaj5JgQKuu7Q==
X-CSE-MsgGUID: ndMC3nt4ShKamepRq2cMIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50232047"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50232047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:16:15 -0800
X-CSE-ConnectionGUID: O+B6M4DATbK2LFiPcmUVsw==
X-CSE-MsgGUID: RF6FYq09TYysOT2hogQCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="113450500"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:16:13 -0800
Subject: Re: [PATCH] media: intel/ipu6: set the bus_info of the
 v4l2_capability
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, hidenorik@chromium.org
References: <20250212075314.2291135-1-bingbu.cao@intel.com>
 <Z6xa5VleQumTgto9@kekkonen.localdomain>
 <6b8939b3-6d21-d8ab-27bd-02b04bab7d05@linux.intel.com>
 <4b6a4a24-30ff-143d-be61-457ea36ad9ff@linux.intel.com>
 <Z6xsO1hU3_wQQoqT@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <013c28c6-256f-9357-9ed2-44428351692c@linux.intel.com>
Date: Wed, 12 Feb 2025 19:14:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z6xsO1hU3_wQQoqT@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 2/12/25 5:39 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Feb 12, 2025 at 05:20:54PM +0800, Bingbu Cao wrote:
>>
>> On 2/12/25 5:14 PM, Bingbu Cao wrote:
>>>
>>>
>>> On 2/12/25 4:25 PM, Sakari Ailus wrote:
>>>> Hi Bingbu,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> On Wed, Feb 12, 2025 at 03:53:14PM +0800, bingbu.cao@intel.com wrote:
>>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>>
>>>>> IPU6 isys driver missed setting the bus_info of its v4l2_capability.
>>>>> `v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
>>>>> from the media device to fill the v4l2_capability.
>>>>>
>>>>> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
>>>>> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
>>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>>> ---
>>>>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> index 387963529adb..3ca3f44da387 100644
>>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>>>> @@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>>>>  
>>>>>  	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
>>>>>  	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
>>>>> +	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
>>>>> +		sizeof(cap->bus_info));
>>>>
>>>> Is there a need to do this? The bus_info is set by the framework based on
>>>> struct video_device dev_parent field and that comes from struct v4l2_device
>>>> dev field.
>>>>
>>>
>>> The v4l2_device.dev filed is set to the dev_parent which is auxdev.dev
>>> instead of pdev. So the bus_info was not set by framework.
>>>
>>
>> I remember we made a change in isys_register_devices() :
>>
>> - 	ret = v4l2_device_register(dev->parent, &isys->v4l2_dev);
>> +	ret = v4l2_device_register(dev, &isys->v4l2_dev);
> 
> Right. I vaguely recall there were changes in device assignments over the
> course of upstreaming, due to the sub-device driver module refcounting. So
> I think this needs to stay as-is.
> 
> Instead, would assigning the dev_parent field in struct video_device
> achieve this or would there be side effects? The other alternative is to
> use media_set_bus_info().
>

I prefer assigning the dev_parent. I did some simple test and did not
observe side effects. Let me do more tests and then send v2.

-- 
Best regards,
Bingbu Cao

