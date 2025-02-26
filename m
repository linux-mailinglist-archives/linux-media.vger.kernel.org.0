Return-Path: <linux-media+bounces-26998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B409A4588B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C682C1739BA
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 08:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EF91E1DF3;
	Wed, 26 Feb 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQbvmHo/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99531E1E05
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559165; cv=none; b=dcOtMzw/jPsx2MTnDIRcHvHXwudpGhDcX8boUlZnmnDTuEsqvIFygByZ9HI+s9rCyNsEJgdaMxTY10mPO6XzgJ5F7PdIQVvGri6A8sQKTo0WDcKQmYtd5uUsW6CuntYcVPqv7CZ99APwH6bDOkxtv//DC37Ubeqic3LthNqddT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559165; c=relaxed/simple;
	bh=ckIMAkd1mdrkKdpy8pa4iE8VAlRLqejCbk7dhqSNWr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYWgRRTn0Y3fNI9YlLiXMCuFEEDgEWSgw4QUvPlQhR8MveDjEc5AV2D7oxAqK6SR8CFLQRJ2J9XXeA9I4T7ITzImC1gqKjgoIyFQGhyA9Y7vFcnhC7J8ra3zZrUwvnw6ma8vSIJ4FW5W40oiGRY8c0SPZNW8UcQITUNVswRQyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQbvmHo/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740559163; x=1772095163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ckIMAkd1mdrkKdpy8pa4iE8VAlRLqejCbk7dhqSNWr4=;
  b=fQbvmHo/U5A2QwWxcUkCBeoNR6UZlMNcyGcmknrZIqxO+JQxLpxUxxr4
   QkuMwtdr64J3fA/LRLYUtI5z8+jl4Zns/Da1ENRqRduiT3C1WgjKgA0gF
   7+JESj3AH6hgb1uSz2e9ruCLNsKeU55p6uGuYokJ1KStnbq+Bv+M6Nqow
   ADaer3YBiZeSqNVwKGbSQuq1L23I6ZFV2hOOCric4jJbICtGLELPzcEsG
   WKgDRra+Wh1xAjZNzIrRbNQRFoaHeE8eXVKsENSsY2ZTIYe1VjG7Dg3YU
   YTtTTJxTHv7FAW3qoWa4Pd6uLvPlWOI30h68i0GyNYGlyU5DfXZR7BEwu
   Q==;
X-CSE-ConnectionGUID: 4+wkhUEGTS6eddgeFR8J9g==
X-CSE-MsgGUID: YXL+6egURmyhKZGO87IBnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40575530"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="40575530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:39:22 -0800
X-CSE-ConnectionGUID: hFC06OuUSHmh92C1OuwlJg==
X-CSE-MsgGUID: +/TB2GptTlCLwK0F0iXCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121639392"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:39:19 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C489611F944;
	Wed, 26 Feb 2025 10:39:17 +0200 (EET)
Date: Wed, 26 Feb 2025 08:39:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
	bingbu.cao@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
Message-ID: <Z77TNQm5mxPa__FA@kekkonen.localdomain>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
 <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
 <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
 <305da783-fffd-76b4-5154-c9b2692fd2ac@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305da783-fffd-76b4-5154-c9b2692fd2ac@linux.intel.com>

Hi Bingbu,

On Wed, Feb 26, 2025 at 04:01:16PM +0800, Bingbu Cao wrote:
> 
> On 2/26/25 3:58 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Wed, Feb 26, 2025 at 10:38:25AM +0800, Bingbu Cao wrote:
> >> Sakari,
> >>
> >> On 2/25/25 5:45 PM, Sakari Ailus wrote:
> >>> ipu6_dma_get_sgtable() is now unused. Drop it.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
> >>>  drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
> >>>  2 files changed, 36 deletions(-)
> >>>
> >>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> >>> index 44e24da33907..052e396a28af 100644
> >>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> >>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> >>> @@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>  	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
> >>>  }
> >>>  EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
> >>> -
> >>> -/*
> >>> - * Create scatter-list for the already allocated DMA buffer
> >>> - */
> >>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
> >>> -			 unsigned long attrs)
> >>> -{
> >>> -	struct device *dev = &sys->auxdev.dev;
> >>> -	struct ipu6_mmu *mmu = sys->mmu;
> >>> -	struct vm_info *info;
> >>> -	int n_pages;
> >>> -	int ret = 0;
> >>> -
> >>> -	info = get_vm_info(mmu, handle);
> >>> -	if (!info)
> >>> -		return -EFAULT;
> >>> -
> >>> -	if (!info->vaddr)
> >>> -		return -EFAULT;
> >>> -
> >>> -	if (WARN_ON(!info->pages))
> >>> -		return -ENOMEM;
> >>> -
> >>> -	n_pages = PFN_UP(size);
> >>> -
> >>> -	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
> >>> -					GFP_KERNEL);
> >>> -	if (ret)
> >>> -		dev_warn(dev, "get sgt table failed\n");
> >>> -
> >>> -	return ret;
> >>> -}
> >>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>> index b51244add9e6..2882850d9366 100644
> >>> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> >>> @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>  			 enum dma_data_direction dir, unsigned long attrs);
> >>>  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>>  			    enum dma_data_direction dir, unsigned long attrs);
> >>> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >>> -			 void *cpu_addr, dma_addr_t handle, size_t size,
> >>> -			 unsigned long attrs);
> >>
> >> ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
> >> is necessary to remove it as it will be hard to integrate with downstream PS
> >> driver.
> > 
> > When will there be an upstream PSYS driver?
> > 
> > I suppose you can just as well apply a revert of this patch to your
> > downstream tree?
> >
> 
> Sakari,
> 
> I don't think all the OS vendors like this way, it make the downstream
> development harder. It's a trade-off, I cannot see removing offer any
> benefits that its side-effect.

I don't think the Linux distro maintainers like downstream drivers at all,
independently of how many patches they consist of.

You could as well move the function to the PSYS driver and use
find_vm_area(cpu_addr) instead to find the area.

-- 
Regards,

Sakari Ailus

