Return-Path: <linux-media+bounces-26992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD78A45356
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 03:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4B191890B49
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 02:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D8E21CC5D;
	Wed, 26 Feb 2025 02:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEoVw7Ue"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D15121C9EE
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537813; cv=none; b=NlKn9eeN+0DHjDdnULEtnTPDcbzzLiPJpbdBpA9u4y6CpoZrfsVz24Hm9KTlyxgUtc3BlmAn39nuLr6VZ3x/GQJczm6BWm9FYqnC9TIJydc3XVXhZXaVMrjxpMRdNVDFKgiU+VEVwZKjSZfR7Nt8YYN1eJoCWR9Pr3aeo3lh6b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537813; c=relaxed/simple;
	bh=lDYmDU+ckOtrOcZH3WpfJfHHLV/byQaeqR4QumCxm3U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bgkcfYwR70DATenbwQZY8C/1N938qex7aMc8/tAOOQVLDYp/4k7FE/Vp6AgVhxegQpOxiyMZ4NSEvTMDJ8hk0BCpo+hRsW7chdq8Evz3itknbZBoIaNz6uXrcGnIZ1mAihmbHn6H7hYtmu1mVFes4p81P3nCY1mAPx/wUcE/3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEoVw7Ue; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740537811; x=1772073811;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lDYmDU+ckOtrOcZH3WpfJfHHLV/byQaeqR4QumCxm3U=;
  b=ZEoVw7UeEzkWzqUiYyjgec0wwHn1ti2Dj+vViLvbj8BrMi+2R53HiHFH
   e5DpT6yJHzbVGd7lj8s/bU9STj/LDU0NmCmBjNNSAq7mifioKQQ5c/d63
   5OG64IhdzV9taYjMqZ44Jgl2xeHVkq5z/MwdrNVrjdh/7U04pwk3jdCOk
   VOFen7u8ZlGX1zgFXrx17vqHdN2hljeZx2aETXW3F1cDakj8w59SfbVpb
   5RBlLB7gvO/GGu+mmWloFOaVuscIlkjcACi0WH89WZEXaVwuzv1Bo2kNQ
   J3dZK0CiSJ2uTH2r66/m/XIVfYAJUQOKWs5TWIfqBvkpOe/yGO7hTxi6G
   A==;
X-CSE-ConnectionGUID: OQ2/bD/nSb2vbAsMhq38dg==
X-CSE-MsgGUID: RhcHVATlSBirdNAwvUTDKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63835703"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="63835703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 18:43:31 -0800
X-CSE-ConnectionGUID: g+H+9gRuRZGqaE7kgP0Dtg==
X-CSE-MsgGUID: L1CPIq5LTbKsZ55txJRdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116379780"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 18:43:30 -0800
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: stanislaw.gruszka@linux.intel.com, bingbu.cao@intel.com
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
Date: Wed, 26 Feb 2025 10:38:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 2/25/25 5:45 PM, Sakari Ailus wrote:
> ipu6_dma_get_sgtable() is now unused. Drop it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
>  drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
>  2 files changed, 36 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> index 44e24da33907..052e396a28af 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>  	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
> -
> -/*
> - * Create scatter-list for the already allocated DMA buffer
> - */
> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> -			 void *cpu_addr, dma_addr_t handle, size_t size,
> -			 unsigned long attrs)
> -{
> -	struct device *dev = &sys->auxdev.dev;
> -	struct ipu6_mmu *mmu = sys->mmu;
> -	struct vm_info *info;
> -	int n_pages;
> -	int ret = 0;
> -
> -	info = get_vm_info(mmu, handle);
> -	if (!info)
> -		return -EFAULT;
> -
> -	if (!info->vaddr)
> -		return -EFAULT;
> -
> -	if (WARN_ON(!info->pages))
> -		return -ENOMEM;
> -
> -	n_pages = PFN_UP(size);
> -
> -	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
> -					GFP_KERNEL);
> -	if (ret)
> -		dev_warn(dev, "get sgt table failed\n");
> -
> -	return ret;
> -}
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> index b51244add9e6..2882850d9366 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>  			 enum dma_data_direction dir, unsigned long attrs);
>  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
>  			    enum dma_data_direction dir, unsigned long attrs);
> -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> -			 void *cpu_addr, dma_addr_t handle, size_t size,
> -			 unsigned long attrs);

ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
is necessary to remove it as it will be hard to integrate with downstream PS
driver.

>  #endif /* IPU6_DMA_H */
> 

-- 
Best regards,
Bingbu Cao

