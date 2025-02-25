Return-Path: <linux-media+bounces-26969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56758A44736
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6D517ABDD6
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 16:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F421FC0F4;
	Tue, 25 Feb 2025 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXwvGaXh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1F1A0BF1
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502064; cv=none; b=LB7d4tfviHK5UnHpUKVqzOlWnB4Iwa6zOKzjxnVNh9vMvLd9pgiE+PJ6oHJCa2nuBNg2n7RWNStMiTOAfwlK1w6LeMmvoWZJfWIVNPdXPEkzCYAw1D6FK5uO8tLtocaaYZXdnCRkZNCqyGmjhvQZWr8b/gnQYQWwbYGtKqtx6SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502064; c=relaxed/simple;
	bh=IRrODdi9kFmvIsZIrTV7CZc/wMotBrt7Sq5gdM8cNEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QP2oQarxYzWJOWtioqEc48vOVn+bRpRAnCh5KFf+3nk9IUKw7IOE4qKFBysy8QxHLaeiXTh0I5/cT+Jnvjf0vSQCfN/3SaVo35oNk6MQ/X7zH/dhFCLuQMBJctVrctb6V5eeKkEfBtKtTiECcxXnBjcCOm70MoLnjBPgmEW13+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXwvGaXh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740502063; x=1772038063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IRrODdi9kFmvIsZIrTV7CZc/wMotBrt7Sq5gdM8cNEA=;
  b=FXwvGaXhBRvM3vL7+/l2bQrZbRYuAs5TgY5akaFJ6pKRRN870WBcYIBv
   s27dijzZIHFG3dmefc5xmt4Xq2oak1/lAOM58x/ojCJs8conNVlHtxKcx
   EmmatsVUkBJMNfe46JpYy6WqAsK9kY8WKE+0N5HYnN4mKmqdYb4ahO6J5
   8WBmklXYdV2w50w1y+89pjoXEilFPc7fr/dQLILXz+mMiCYXPUqmOhev3
   f/HPODY6Qh3VGWjhyTM30TrrbXWbobQMDMLl7P79k7euMpH7tcBCKXgXX
   QYggk5IRGnRywYVE8BdnG9SSVaS/q5xFovTUad57/hwTk4ojZ4/vqnEri
   w==;
X-CSE-ConnectionGUID: eP1TX82mSO6vkl2xIapSPg==
X-CSE-MsgGUID: zkaOCdzYQyOpBPgcFVor9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45229285"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="45229285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 08:47:37 -0800
X-CSE-ConnectionGUID: 0QWzvKEKSmu01jxyRFch7A==
X-CSE-MsgGUID: qlr3lh2hR+6F30ndApH7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121410150"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.115.185])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 08:47:35 -0800
Date: Tue, 25 Feb 2025 17:47:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
Message-ID: <Z730JB21pP9vgFin@linux.intel.com>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225094532.40678-1-sakari.ailus@linux.intel.com>

On Tue, Feb 25, 2025 at 11:45:32AM +0200, Sakari Ailus wrote:
> ipu6_dma_get_sgtable() is now unused. Drop it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw

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
>  #endif /* IPU6_DMA_H */
> -- 
> 2.39.5
> 

