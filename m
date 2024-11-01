Return-Path: <linux-media+bounces-20696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F669B91FD
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0391C22882
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF1B19B3D3;
	Fri,  1 Nov 2024 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEq/yfo/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E2179A7
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730467701; cv=none; b=YG/jYHb6JCw79s/m0F0+NBIzFYZDM6U4wcuwfpV/wYHpz/gYJ7dp45HdC4anCv99rcqGXwo7pvhuiDGEyi8mKziLN4uDz5FMh/e7ebCtdM3AoVvOH14OCdQiYyEdDznmxcDxYKCMi6me702BMqrVHzOoJg/5cxs4UbHjhyXUDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730467701; c=relaxed/simple;
	bh=YeIENEs1rfqoGG08ceCdHeT03yaqCTUGDiWQ+Y1FdSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9+jKlZdi7nIOfb9Ym2/GJ6YUzjoEg0EGmc+PGLPZZWc9JzIeyCdnD7u8XKBSwZ+BYq39ng5SAT/J1Dud1mUP9a5h+ujt3LHw6W44KT9HVZCrL6mSKjOuPL7jzliWgO2ug3VPFZmmr3TKLI4jnpY8NI+Sq8ieb0mS+zgD67h+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEq/yfo/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730467698; x=1762003698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YeIENEs1rfqoGG08ceCdHeT03yaqCTUGDiWQ+Y1FdSY=;
  b=QEq/yfo/7nhiUbZeeC73p7kDX7UJS1abZBDEhGMj+BMVRyCwkh7vr7xM
   B2I1GT8BUV36w43L1CWIf/CGeduvO4lOCMO9Hol1H1jSJtbwkw6c6KALw
   0nl2+3WIoH5eSHlwrbp/UlRH/goPNrRGdIQcaDqEbVJr6+DU3d1J1XJJS
   8IjVgBmOPSQU/w3cZ0RqPy7aK5vAJLu87cPlMFQmc9qH+kzt0266XBcVf
   Jzth+jVVt5yyZdF2ewjR+IZtJM5cdW+2bvqXV7jLp0pQnGh03vGhujKP4
   dEPXrVR4+eDnKfoePJsbiTmu0vT7gmKqhf8jmYOTuK2KKF+KWZwUkPsWT
   A==;
X-CSE-ConnectionGUID: syvzy5aTQniBuiBhFntwWw==
X-CSE-MsgGUID: LWLJY8ZaTVmSv+lQs1Xuyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30118724"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30118724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:28:18 -0700
X-CSE-ConnectionGUID: YkNlbr8hSXy1yxRCX8eEPw==
X-CSE-MsgGUID: JcJ2nOxURfSx5pD/SvJrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87503907"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:28:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 80C9E11FA28;
	Fri,  1 Nov 2024 15:28:14 +0200 (EET)
Date: Fri, 1 Nov 2024 13:28:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2 3/3] media: ipu6: optimize the IPU6 MMU unmapping flow
Message-ID: <ZyTXbvR2vg4TzghA@kekkonen.localdomain>
References: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
 <1729835552-14825-3-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729835552-14825-3-git-send-email-bingbu.cao@intel.com>

Hi Bingbu,

On Fri, Oct 25, 2024 at 01:52:32PM +0800, Bingbu Cao wrote:
> The MMU mapping flow is optimized for improve the performance, the
> unmapping flow could also be optimized to follow same flow.
> 
> This patch changes the ipu6_mmu_unmap() as a void function and also
> remove ipu6_mmu_pgsize() as driver unload this to the PCI core
> driver DMA ops instead of handling in driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
> v2: squash the ipu6_mmu_pgsize() removal into this patchset
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 125 +++++++++++---------------------
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h |   4 +-
>  2 files changed, 45 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index e957ccb4691d..2d9c6fbd5da2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -252,44 +252,51 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>  	return pt;
>  }
>  
> -static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> -		       phys_addr_t dummy, size_t size)
> +static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> +		     phys_addr_t dummy, size_t size)
>  {
> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
> -	u32 iova_start = iova;
> +	unsigned int l2_entries;
>  	unsigned int l2_idx;
> -	size_t unmapped = 0;
>  	unsigned long flags;
> +	u32 l1_idx;
>  	u32 *l2_pt;
>  
> -	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
> -		l1_idx, iova);
> -
>  	spin_lock_irqsave(&mmu_info->lock, flags);
> -	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
> -		spin_unlock_irqrestore(&mmu_info->lock, flags);
> -		dev_err(mmu_info->dev,
> -			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
> -			iova, l1_idx);
> -		return 0;
> -	}
> -
> -	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> -	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
> -		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> -		l2_pt = mmu_info->l2_pts[l1_idx];
> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
>  		dev_dbg(mmu_info->dev,
> -			"unmap l2 index %u with pteval 0x%10.10llx\n",
> -			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> -		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
> +			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
> +			l1_idx, iova);
>  
> -		clflush_cache_range((void *)&l2_pt[l2_idx],
> -				    sizeof(l2_pt[l2_idx]));
> -		unmapped++;
> +		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
> +			dev_err(mmu_info->dev,
> +				"unmap not mapped iova 0x%8.8lx l1 index %u\n",
> +				iova, l1_idx);
> +			continue;
> +		}
> +		l2_pt = mmu_info->l2_pts[l1_idx];
> +
> +		l2_entries = 0;
> +		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> +			dev_dbg(mmu_info->dev,
> +				"unmap l2 index %u with pteval 0x%10.10llx\n",
> +				l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> +			l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
> +
> +			iova += ISP_PAGE_SIZE;
> +			size -= ISP_PAGE_SIZE;
> +
> +			l2_entries++;
> +		}
> +
> +		WARN_ON_ONCE(!l2_entries);
> +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
> +				    sizeof(l2_pt[0]) * l2_entries);
>  	}
> +
> +	WARN_ON_ONCE(size);
>  	spin_unlock_irqrestore(&mmu_info->lock, flags);
> -
> -	return unmapped << ISP_PAGE_SHIFT;
>  }
>  
>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> @@ -394,8 +401,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	return l2_map(mmu_info, iova_start, paddr, size);
>  }
>  
> -static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> -			       unsigned long iova, size_t size)
> +static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> +			     unsigned long iova, size_t size)
>  {
>  	return l2_unmap(mmu_info, iova, 0, size);
>  }
> @@ -637,40 +644,13 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  	return phy_addr;
>  }
>  
> -static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,

This changes the API visible to the rest of the driver. It'd be nice to
have it as a separate patch.

> -			      unsigned long addr_merge, size_t size)
> +void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> +		    size_t size)
>  {
> -	unsigned int pgsize_idx;
> -	size_t pgsize;
> -
> -	/* Max page size that still fits into 'size' */
> -	pgsize_idx = __fls(size);
> -
> -	if (likely(addr_merge)) {
> -		/* Max page size allowed by address */
> -		unsigned int align_pgsize_idx = __ffs(addr_merge);
> -
> -		pgsize_idx = min(pgsize_idx, align_pgsize_idx);
> -	}
> -
> -	pgsize = (1UL << (pgsize_idx + 1)) - 1;
> -	pgsize &= pgsize_bitmap;
> -
> -	WARN_ON(!pgsize);
> -
> -	/* pick the biggest page */
> -	pgsize_idx = __fls(pgsize);
> -	pgsize = 1UL << pgsize_idx;
> -
> -	return pgsize;
> -}
> -
> -size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> -		      size_t size)
> -{
> -	size_t unmapped_page, unmapped = 0;
>  	unsigned int min_pagesz;
>  
> +	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova, size);
> +
>  	/* find out the minimum page size supported */
>  	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
>  
> @@ -682,29 +662,10 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	if (!IS_ALIGNED(iova | size, min_pagesz)) {
>  		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
>  			iova, size, min_pagesz);
> -		return -EINVAL;
> +		return;
>  	}
>  
> -	/*
> -	 * Keep iterating until we either unmap 'size' bytes (or more)
> -	 * or we hit an area that isn't mapped.
> -	 */
> -	while (unmapped < size) {
> -		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
> -						iova, size - unmapped);
> -
> -		unmapped_page = __ipu6_mmu_unmap(mmu_info, iova, pgsize);
> -		if (!unmapped_page)
> -			break;
> -
> -		dev_dbg(mmu_info->dev, "unmapped: iova 0x%lx size 0x%zx\n",
> -			iova, unmapped_page);
> -
> -		iova += unmapped_page;
> -		unmapped += unmapped_page;
> -	}
> -
> -	return unmapped;
> +	return __ipu6_mmu_unmap(mmu_info, iova, size);
>  }
>  
>  int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> index 21cdb0f146eb..8e40b4a66d7d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> @@ -66,8 +66,8 @@ int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
>  void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);
>  int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		 phys_addr_t paddr, size_t size);
> -size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> -		      size_t size);
> +void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> +		    size_t size);
>  phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  				  dma_addr_t iova);
>  #endif

-- 
Kind regards,

Sakari Ailus

