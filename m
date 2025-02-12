Return-Path: <linux-media+bounces-26045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A466A321F6
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 10:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20ECC3A5478
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6390B205E13;
	Wed, 12 Feb 2025 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM24KOIh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C42046A1
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352159; cv=none; b=rTANjcTEEyNolNJm5URZCg9KrAm255svb3fKIGnT7wyhAztTcwSDXBHHV3eYSyA6zTnC5HIrLFWIeYcPjxHiGMKXL1Ih/9bqGE6bD7CK/w/tNyf3Nvvz0q+MfA/ygc3Zv9ZLeJCm/Mp+Yl7EczNOFewNMHwdiu0ErHQGFIQ+0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352159; c=relaxed/simple;
	bh=GIYVgu0zBDekoPX9zGrMXlOXEnfKcboef1gKONjwrrU=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=eBB5T/o/xNVjHQ8Ey99RLA+rJRPWbO2wo6Ns2DhUyidotC3943nFY+KyFKs9iSveOF7iqStmrTN+EBI68Gp13syk9d09QElBDDxk+88bR0l1RZEsBEJp8/4EQBpdWSYLgsa+/KeT/XiNIB4yWiUDHG6ZZ5f98HYSbp5rdS0D/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM24KOIh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739352158; x=1770888158;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GIYVgu0zBDekoPX9zGrMXlOXEnfKcboef1gKONjwrrU=;
  b=nM24KOIhY6zQ/JEfeWKADYTAHLoPd27yMpL9VHE+zfuIw04vLNAoQm4C
   93A/9IEWQPgfuGrZ4gv4TidNMoZesiTvBYk+RD0vdA0wbWYoOmbPccVgp
   3YASUtDLILB2QodgJuTovCQNIKiN8EnBtJX7zqVhmpg13jT3srvK9eEN3
   RVNCc6vIXUVE9sf5iqHeSziiOPtK/VkhbFWJ7k4Zzd4jivOOZ1wraxXh6
   SXI8P35fpQPuJM/qKyPpq/ZNXM7h5IlXd2gie1hVkAtEU11mnuoIHfZAE
   Gt9kfkTZD1W8EHQUKZtAKUBS6JX+y9Wm7SfH9Wfivam4RZpkAjiTMj3tT
   g==;
X-CSE-ConnectionGUID: 5nDpTBF0S7Clbx4+bmZl+w==
X-CSE-MsgGUID: 2doSSS/WTyeL2OMLoehX9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40264026"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="40264026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:22:37 -0800
X-CSE-ConnectionGUID: gehgDt/IStWt1dS+KhZtnQ==
X-CSE-MsgGUID: 7o5beeFeQZGrQu7AshJegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116861842"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:22:36 -0800
Subject: Re: [PATCH] media: intel/ipu6: set the bus_info of the
 v4l2_capability
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hidenorik@chromium.org
References: <20250212075314.2291135-1-bingbu.cao@intel.com>
 <Z6xa5VleQumTgto9@kekkonen.localdomain>
 <6b8939b3-6d21-d8ab-27bd-02b04bab7d05@linux.intel.com>
Message-ID: <4b6a4a24-30ff-143d-be61-457ea36ad9ff@linux.intel.com>
Date: Wed, 12 Feb 2025 17:20:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6b8939b3-6d21-d8ab-27bd-02b04bab7d05@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 2/12/25 5:14 PM, Bingbu Cao wrote:
> 
> 
> On 2/12/25 4:25 PM, Sakari Ailus wrote:
>> Hi Bingbu,
>>
>> Thanks for the patch.
>>
>> On Wed, Feb 12, 2025 at 03:53:14PM +0800, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> IPU6 isys driver missed setting the bus_info of its v4l2_capability.
>>> `v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
>>> from the media device to fill the v4l2_capability.
>>>
>>> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
>>> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> index 387963529adb..3ca3f44da387 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> @@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>>  
>>>  	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
>>>  	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
>>> +	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
>>> +		sizeof(cap->bus_info));
>>
>> Is there a need to do this? The bus_info is set by the framework based on
>> struct video_device dev_parent field and that comes from struct v4l2_device
>> dev field.
>>
> 
> The v4l2_device.dev filed is set to the dev_parent which is auxdev.dev
> instead of pdev. So the bus_info was not set by framework.
>

I remember we made a change in isys_register_devices() :

- 	ret = v4l2_device_register(dev->parent, &isys->v4l2_dev);
+	ret = v4l2_device_register(dev, &isys->v4l2_dev);

>>>  
>>>  	return 0;
>>>  }
>>
> 

-- 
Best regards,
Bingbu Cao

