Return-Path: <linux-media+bounces-27009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA59A45A20
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C183A889C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CD9224259;
	Wed, 26 Feb 2025 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nltYin4x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643A15573A
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562214; cv=none; b=NLwA7255yJLhX8G7YgKZg2oFgWrLsR3lt5yeM9QOO9XOgztxPmwti5dII20K5E53s9lGpU4d2aNIxgZ0syNNfyOyNfq39NaMWZun6i8cZQjJZ8mZ9McZ6G7dKgU1QlMZnwETGLrORG0p+DOXp0UzaN4gZnuyGjGqZ9dGFYMTRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562214; c=relaxed/simple;
	bh=iGUqg88e+DcLU5AKkZOQzrGnUyjxDhmWJQ8sP2bebVY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mX8YlYMbb00lAzMIQ+8UklRffWaKGKlqrdj9iGULQZOsBJvaYWsjTkCeayLdaBO1JwYsqRL0gaVNvu4wG4Du19HbpLGicFmWRZQPqNrTRv558j1e9p3Yoj1kD4+SQosllrzOLKe9Nz+jA7lcRgjBRLggxHGnYFRJjNzaGvWvqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nltYin4x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740562212; x=1772098212;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iGUqg88e+DcLU5AKkZOQzrGnUyjxDhmWJQ8sP2bebVY=;
  b=nltYin4x0ICd1XfkpyNLcHCCqDEggDTMv0irEw5pjL4MJxFPJ9zSnH8d
   4NREsxOtrkr6ozPdejWRGsaOYxGl76/+CScu0HxhSHbjrdkbUh0CUBivD
   9Dc/MREAWQY3LtLjs/KvrAnP9L5TwW0xUuYfiFMroM3S+LecCk/VZarlC
   y63vH0ZnIgCic+i5ckJR+cixwHD2HXhZIcoLCoMWQ/sHQTY+WVt7PPD1u
   cHn56+gPQKIlJd3+ICzRk+x9/XkNsDmmbI1XGOEAaYrkn5TsSLArh/yTj
   tGgAaSE3bxs7FSwtBuYYpE8Kkfjo6saMadrhIFSCDEY0oRmX908wb8zWO
   Q==;
X-CSE-ConnectionGUID: +WES4fR3Q1OKxAXlaRjOBQ==
X-CSE-MsgGUID: pYvEmkkPS0mjVF0vGz+d/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41528278"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41528278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:30:12 -0800
X-CSE-ConnectionGUID: ZjqHiyZESGSUQdB1iymZTA==
X-CSE-MsgGUID: jS7u9r/XTH2iXuPKfG9hRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121897322"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:30:11 -0800
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 bingbu.cao@intel.com, Hans de Goede <hdegoede@redhat.com>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
 <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
 <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
 <305da783-fffd-76b4-5154-c9b2692fd2ac@linux.intel.com>
 <Z77TNQm5mxPa__FA@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2b51451f-5450-bc68-835a-e91a792dedf9@linux.intel.com>
Date: Wed, 26 Feb 2025 17:25:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z77TNQm5mxPa__FA@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 2/26/25 4:39 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Feb 26, 2025 at 04:01:16PM +0800, Bingbu Cao wrote:
>>
>> On 2/26/25 3:58 PM, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Wed, Feb 26, 2025 at 10:38:25AM +0800, Bingbu Cao wrote:
>>>> Sakari,
>>>>
>>>> On 2/25/25 5:45 PM, Sakari Ailus wrote:
>>>>> ipu6_dma_get_sgtable() is now unused. Drop it.
>>>>>
>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>> ---
>>>>>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
>>>>>  drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
>>>>>  2 files changed, 36 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>>>> index 44e24da33907..052e396a28af 100644
>>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
>>>>> @@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>>>  	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
>>>>>  }
>>>>>  EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
>>>>> -
>>>>> -/*
>>>>> - * Create scatter-list for the already allocated DMA buffer
>>>>> - */
>>>>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
>>>>> -			 unsigned long attrs)
>>>>> -{
>>>>> -	struct device *dev = &sys->auxdev.dev;
>>>>> -	struct ipu6_mmu *mmu = sys->mmu;
>>>>> -	struct vm_info *info;
>>>>> -	int n_pages;
>>>>> -	int ret = 0;
>>>>> -
>>>>> -	info = get_vm_info(mmu, handle);
>>>>> -	if (!info)
>>>>> -		return -EFAULT;
>>>>> -
>>>>> -	if (!info->vaddr)
>>>>> -		return -EFAULT;
>>>>> -
>>>>> -	if (WARN_ON(!info->pages))
>>>>> -		return -ENOMEM;
>>>>> -
>>>>> -	n_pages = PFN_UP(size);
>>>>> -
>>>>> -	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
>>>>> -					GFP_KERNEL);
>>>>> -	if (ret)
>>>>> -		dev_warn(dev, "get sgt table failed\n");
>>>>> -
>>>>> -	return ret;
>>>>> -}
>>>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>>>> index b51244add9e6..2882850d9366 100644
>>>>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
>>>>> @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>>>  			 enum dma_data_direction dir, unsigned long attrs);
>>>>>  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>>>  			    enum dma_data_direction dir, unsigned long attrs);
>>>>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>>>>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
>>>>> -			 unsigned long attrs);
>>>>
>>>> ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
>>>> is necessary to remove it as it will be hard to integrate with downstream PS
>>>> driver.
>>>
>>> When will there be an upstream PSYS driver?
>>>
>>> I suppose you can just as well apply a revert of this patch to your
>>> downstream tree?
>>>
>>
>> Sakari,
>>
>> I don't think all the OS vendors like this way, it make the downstream
>> development harder. It's a trade-off, I cannot see removing offer any
>> benefits that its side-effect.
> 
> I don't think the Linux distro maintainers like downstream drivers at all,
> independently of how many patches they consist of.
> 
> You could as well move the function to the PSYS driver and use
> find_vm_area(cpu_addr) instead to find the area.

My fault, I forgot I already removed the ipu6_dma_get_sgtable() from
downstream driver months ago, so,

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

;)

> 

-- 
Best regards,
Bingbu Cao

