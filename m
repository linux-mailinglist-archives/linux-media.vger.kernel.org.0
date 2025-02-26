Return-Path: <linux-media+bounces-26996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9625A457A8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D0F1885606
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 08:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BE61624EA;
	Wed, 26 Feb 2025 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9kpXRkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84C29D0E
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557184; cv=none; b=f7m7cRNeJ2GlM6fKzfl3a8ciYYKPWBcwCm7P0H97cjo5xVIu2jraWsgG6pcryrKnBJDDYR6VLNCeXxk7aYF6Ibahe45uZHFn2rV3prEMbS70RVit10ob0Z9RbivZDlTCOp10kInyKr8lVjHB1cIUto8Vh2V5T1xrjlGoE4GfqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557184; c=relaxed/simple;
	bh=3l1Q1kOHNUbEnbId7TUHKFPS2sJS7Lw7XeyWLRjoMgI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ET2TxxZDsF6RUIOua0O9Ska5NY9il+EqDTUGaOLamTzzq2zs8CFdsvDqQn/6Fr8nN9Qtls1oR2s1Th2Lh3qhjShwQ3GU3+Uno+/ay5ZLMt6hIG3xKu27yNKFPuPWS2k3HRbeV+ikPn6LSmcAUu7HphjUUL4AbF7EVyFsqhqmJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9kpXRkz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740557182; x=1772093182;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3l1Q1kOHNUbEnbId7TUHKFPS2sJS7Lw7XeyWLRjoMgI=;
  b=D9kpXRkzdo0Dv0SE7PtxAa9XgbdDnArldec8OrfE40F/AHcv0Ielbhv/
   ldvNkRucJfgRk6ZODTOw/WIvDo61eX0capIGK+gRYKuahA/2xUJbrA7ZQ
   LeZjWt92PMH8PsrFiCSgdV6mWhDgJrPGtYBwc8nRMwMrDOG5S7M+fHy7p
   BHM6Y9TBNWhmygRCwh1lhR5/jbD1hIYSdgqdbx2UlSYv+X2d86TVzCrJa
   K4l2B2PVbxXMKADRsHFl2DGDb8MrWlROvW58HXuNvuR8skhBOKSMoaSuB
   T2/saJYJc4gG+lR5CuKbOjUcYOfluNexx70jW4d33tq4SQ92CT/nbwx5l
   w==;
X-CSE-ConnectionGUID: oCrJhDYxSGCnFsKtOudYFw==
X-CSE-MsgGUID: BLpubnzITCabwV6ueoyFDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52028001"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52028001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:06:22 -0800
X-CSE-ConnectionGUID: 3Q21NnjeTTGb75U7X1+A7g==
X-CSE-MsgGUID: sas8fRmhRoKtMyiit2kkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147544221"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:06:20 -0800
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 bingbu.cao@intel.com, Hans de Goede <hdegoede@redhat.com>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
 <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
 <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <305da783-fffd-76b4-5154-c9b2692fd2ac@linux.intel.com>
Date: Wed, 26 Feb 2025 16:01:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 2/26/25 3:58 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Feb 26, 2025 at 10:38:25AM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> On 2/25/25 5:45 PM, Sakari Ailus wrote:
>>> ipu6_dma_get_sgtable() is now unused. Drop it.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
>>>  drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
>>>  2 files changed, 36 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>> index 44e24da33907..052e396a28af 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>> @@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>  	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
>>>  }
>>>  EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
>>> -
>>> -/*
>>> - * Create scatter-list for the already allocated DMA buffer
>>> - */
>>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
>>> -			 unsigned long attrs)
>>> -{
>>> -	struct device *dev = &sys->auxdev.dev;
>>> -	struct ipu6_mmu *mmu = sys->mmu;
>>> -	struct vm_info *info;
>>> -	int n_pages;
>>> -	int ret = 0;
>>> -
>>> -	info = get_vm_info(mmu, handle);
>>> -	if (!info)
>>> -		return -EFAULT;
>>> -
>>> -	if (!info->vaddr)
>>> -		return -EFAULT;
>>> -
>>> -	if (WARN_ON(!info->pages))
>>> -		return -ENOMEM;
>>> -
>>> -	n_pages = PFN_UP(size);
>>> -
>>> -	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
>>> -					GFP_KERNEL);
>>> -	if (ret)
>>> -		dev_warn(dev, "get sgt table failed\n");
>>> -
>>> -	return ret;
>>> -}
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>> index b51244add9e6..2882850d9366 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>> @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>  			 enum dma_data_direction dir, unsigned long attrs);
>>>  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>  			    enum dma_data_direction dir, unsigned long attrs);
>>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
>>> -			 unsigned long attrs);
>>
>> ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
>> is necessary to remove it as it will be hard to integrate with downstream PS
>> driver.
> 
> When will there be an upstream PSYS driver?
> 
> I suppose you can just as well apply a revert of this patch to your
> downstream tree?
>

Sakari,

I don't think all the OS vendors like this way, it make the downstream
development harder. It's a trade-off, I cannot see removing offer any
benefits that its side-effect.


-- 
Best regards,
Bingbu Cao

