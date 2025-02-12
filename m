Return-Path: <linux-media+bounces-26044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8EA321E0
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 10:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A106D3A1D72
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A389205E02;
	Wed, 12 Feb 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIR93zE6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB272054EC
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351783; cv=none; b=o8Z0c442jvyPrP6t2xKTT9KLIozabjV6KvD9/xwgsBOv03KT9FnPlzHszVLcUs0A6Zh5W44MHVK/ZQaKIPZoTK2edxGmwjIoRsI/NNUnWuqs2BTeu2tBfgRRHImPAPNQGhnYxk1iz41aG4S7PZC4tR4EYjdECUgJQIDYJy7bxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351783; c=relaxed/simple;
	bh=4EgjZOhEPgLu3fMz0le1qMsWL9V00CJmpksmle+4BEg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aqk2N9q6v2vyYEDz0o04+HpNH22UvMVFKjeIHp/y1pbMGIUAixLJ0jtSoGMNzs9Dft08/6NUpnDfrWwlETYO4sUtavh00ly3tLm8bBv5halgkgBbHn6t95dS8tjQZZ2dHmNO7Ejobg6kpIkFyK/iAa+LBEPNLWZxw1g4WfU+T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIR93zE6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739351782; x=1770887782;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4EgjZOhEPgLu3fMz0le1qMsWL9V00CJmpksmle+4BEg=;
  b=NIR93zE6J3UcKRbE96BCCXk/eBTT3kn8lC+HGof4zHr3Tb13wLC7MH4s
   9yL7963GVWDEF1cU0h/nqXk3O4IqCX1a9J0LX7yT+hmTvCU9+7/WU2zuE
   28GUfdhBz0/8rTUg6bbBPDdwYaHaTAaY120MWTMMdndj2yV18C7qBjidX
   nWySRSxHsLqU1U4OJ8wUx03prpckLCAUZhJYuA5wDwYhHRvntmWC6hpyk
   HcD5bzJv8ENSbGlgmUReqOWmOgSVtznyb8X3BHM/ZAG+8sdzsrA10yNdZ
   sG80xIGoiqRnh6fkENws0xqV66CRB2ePKIECRGKL+i+h4J6KntA9xW4Im
   w==;
X-CSE-ConnectionGUID: 4njNyRVDQvqnO5WDFy+JFQ==
X-CSE-MsgGUID: jF1BkWHURY+XwTewDBqm9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57533583"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="57533583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:16:21 -0800
X-CSE-ConnectionGUID: qsGxbc42RwOfx0gJhObB2g==
X-CSE-MsgGUID: KMPEFnCITJmXFlOYO+e+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112523220"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:16:10 -0800
Subject: Re: [PATCH] media: intel/ipu6: set the bus_info of the
 v4l2_capability
To: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hidenorik@chromium.org
References: <20250212075314.2291135-1-bingbu.cao@intel.com>
 <Z6xa5VleQumTgto9@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6b8939b3-6d21-d8ab-27bd-02b04bab7d05@linux.intel.com>
Date: Wed, 12 Feb 2025 17:14:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z6xa5VleQumTgto9@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/12/25 4:25 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the patch.
> 
> On Wed, Feb 12, 2025 at 03:53:14PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> IPU6 isys driver missed setting the bus_info of its v4l2_capability.
>> `v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
>> from the media device to fill the v4l2_capability.
>>
>> Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
>> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> index 387963529adb..3ca3f44da387 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> @@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>  
>>  	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
>>  	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
>> +	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
>> +		sizeof(cap->bus_info));
> 
> Is there a need to do this? The bus_info is set by the framework based on
> struct video_device dev_parent field and that comes from struct v4l2_device
> dev field.
>

The v4l2_device.dev filed is set to the dev_parent which is auxdev.dev
instead of pdev. So the bus_info was not set by framework.

>>  
>>  	return 0;
>>  }
> 

-- 
Best regards,
Bingbu Cao

