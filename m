Return-Path: <linux-media+bounces-29871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2FA83A07
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C67A5462581
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CCC20469B;
	Thu, 10 Apr 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJY3isjF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BFB2040A8
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 06:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268301; cv=none; b=VTdi22yePTK6+NWM1V+HQKAcPXXPcnuYoIrftWn6FQ7H3E8bdA+FAyGkNp/rWQqu+HUBVwodg/mjtYs8Hlf9zU9ekE98Dg/05xbZWM1DJm+jYmr469WH+BPKIILXYyllwJA/8Np8k+QxcHcSLCJ7qP4xk8qWylGexNOthesPnk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268301; c=relaxed/simple;
	bh=2KoSXSkuK9MMuaiJdsmJ2eYgrVzk0/HXIBFogpd5olY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pmm4ARZyyOMtA6JIiUhgwvELqEZZyzOws9w8XJNd9WbDKwsdfxsZVUumZjbq5Dtm9yVytukMRh5ywJFegFaComJbJaJKdUFSjRVzPIREzecsNontWn7GHjXbYOSb6dHwBUDCKiGleHw7OWLWc9yU6rM9rwOntaoTzcVlaprGpVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJY3isjF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268299; x=1775804299;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2KoSXSkuK9MMuaiJdsmJ2eYgrVzk0/HXIBFogpd5olY=;
  b=DJY3isjF5WwsLu3H+8pN4LHpfKSYP8aJ0a65KplE1q2zQXpgUZZ7w726
   5/JbrvqmOhAQzXDvJcfXSADi56a6XpzDym74zgA5KcUGG+LBDY+CINsZy
   4A9Pj6ETApRCQqcq/nz79bi1QKR9TlXfgvzKVuovWj2DKm6LLU36BDojd
   nbPRR3TBaYDG3Iq32W2pgP8WvlUqdVu0STmbXTODTK7Sdbby36ptCsoRg
   AxNGy7rSPb8kWBshqPx/lPYXmTtFq3PkzcznK2NP8/Fgvj9UpXvUvTWZ9
   uCphPrcZMA4WnKWxlQDdKlWnlt6D5DNrZ0LczIzmEccAFmS6Ljk0q4+or
   A==;
X-CSE-ConnectionGUID: NZqsiLG9Q9GrlsWVszFL6Q==
X-CSE-MsgGUID: Ms00tiN8RSmZwa2Cb1x4MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44909633"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="44909633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 23:58:18 -0700
X-CSE-ConnectionGUID: ue4uxoMTTiik+zFz2Qk/vg==
X-CSE-MsgGUID: iwufJATPREOAvzo29LGdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="166024980"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 23:58:17 -0700
Subject: Re: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <57590fee-9f62-8776-1597-6e125daafe58@linux.intel.com>
Date: Thu, 10 Apr 2025 14:53:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Stanislaw,

Thanks for the patch.

On 4/9/25 5:58 PM, Stanislaw Gruszka wrote:
> We use dma_get_mask() of auxdev device for calculate iova pfn limit.
> This is always 32 bit mask as we do not initialize the mask (and we can
> not do so, since dev->dev_mask is NULL anyways for auxdev).

Indeed.

> 
> Since we need 31 bit mask for non-secure mode create wrapper of
> alloc_iova() which use mmu_info->aperture_end. This give us always
> the correct mask.
> 
> Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.c |  6 ++----
>  drivers/media/pci/intel/ipu6/ipu6-dma.h |  7 -------
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c |  3 +--
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h | 13 +++++++++++++
>  4 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> index b34022bad83b..a1d4ec35f802 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -171,8 +171,7 @@ void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
>  	size = PAGE_ALIGN(size);
>  	count = PHYS_PFN(size);
>  
> -	iova = alloc_iova(&mmu->dmap->iovad, count,
> -			  PHYS_PFN(dma_get_mask(dev)), 0);

How about directly call?
	iova = alloc_iova(&mmu->dmap->iovad, count,
			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);

Less change, better.

> +	iova = ipu6_alloc_iova(mmu, count);
>  	if (!iova)
>  		goto out_kfree;
>  
> @@ -397,8 +396,7 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
>  	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
>  		nents, npages);
>  
> -	iova = alloc_iova(&mmu->dmap->iovad, npages,
> -			  PHYS_PFN(dma_get_mask(dev)), 0);
> +	iova = ipu6_alloc_iova(mmu, npages);
>  	if (!iova)
>  		return 0;
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> index b51244add9e6..0dd7c0556bd2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> @@ -6,8 +6,6 @@
>  
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
> -#include <linux/iova.h>
> -#include <linux/iova.h>
>  #include <linux/scatterlist.h>
>  #include <linux/types.h>
>  
> @@ -15,11 +13,6 @@
>  
>  struct ipu6_mmu_info;
>  
> -struct ipu6_dma_mapping {
> -	struct ipu6_mmu_info *mmu_info;
> -	struct iova_domain iovad;
> -};
> -
>  void ipu6_dma_sync_single(struct ipu6_bus_device *sys, dma_addr_t dma_handle,
>  			  size_t size);
>  void ipu6_dma_sync_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index 6d1c0b90169d..95eb17855847 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -421,8 +421,7 @@ static int allocate_trash_buffer(struct ipu6_mmu *mmu)
>  	int ret;
>  
>  	/* Allocate 8MB in iova range */
> -	iova = alloc_iova(&mmu->dmap->iovad, n_pages,
> -			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
> +	iova = ipu6_alloc_iova(mmu, n_pages);
>  	if (!iova) {
>  		dev_err(mmu->dev, "cannot allocate iova range for trash\n");
>  		return -ENOMEM;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> index 8e40b4a66d7d..7f3860796762 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> @@ -7,6 +7,7 @@
>  #define ISYS_MMID 1
>  #define PSYS_MMID 0
>  
> +#include <linux/iova.h>
>  #include <linux/list.h>
>  #include <linux/spinlock_types.h>
>  #include <linux/types.h>
> @@ -58,6 +59,11 @@ struct ipu6_mmu {
>  	void (*tlb_invalidate)(struct ipu6_mmu *mmu);
>  };
>  
> +struct ipu6_dma_mapping {
> +	struct ipu6_mmu_info *mmu_info;
> +	struct iova_domain iovad;
> +};
> +
>  struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
>  			       void __iomem *base, int mmid,
>  			       const struct ipu6_hw_variants *hw);
> @@ -70,4 +76,11 @@ void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		    size_t size);
>  phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  				  dma_addr_t iova);
> +
> +static inline struct iova *ipu_alloc_iova(struct ipu6_mmu *mmu,
> +					  unsigned long n_pages)
> +{
> +	return alloc_iova(&mmu->dmap->iovad, n_pages,
> +			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
> +}
>  #endif
> 

-- 
Best regards,
Bingbu Cao

