Return-Path: <linux-media+bounces-17446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417379696F8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1CA285ED6
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B8B20127B;
	Tue,  3 Sep 2024 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kp/Q087u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF5F205E35
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 08:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352017; cv=none; b=q3MqnDiXnjoaGaABcdbkd8ruHB/tG5VUZdUs5gzZNaXFi7xNoQBO2QX1Ys6on8H1JPzQ+linRB2wsVRpS0C7DkWsJWwEGdLqjNrkpCQTtUsExZNXTohCcafT/ChXeGq81+dVEba26j4nvzjfmZbhfCJDHQsPFlHJUEqLom5Ucjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352017; c=relaxed/simple;
	bh=wUfBo90JjH6I0TY3fgJzdwJeazz0C8dhDqm1WRhhECU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sMoRG99DsQ4gS0h+bHye9TkRuSzRJFeWmpQJHUKVEijXywzFKcHlRkUcLfzcDEDo0Zw+paDY2DfPCsX+Ff0UeEaxhmrfozUPOTF/AenyWj2dYaNUgF32ceQmzteWQbKr+WJRNvcTq9PUl4V6F0IzcUrXesJoJVQ4OPARlzqOHIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kp/Q087u; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725352015; x=1756888015;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wUfBo90JjH6I0TY3fgJzdwJeazz0C8dhDqm1WRhhECU=;
  b=kp/Q087uk+lNeR0v/InqQIsQQ6ZXwBOvsArw2qR5+7sg0HBbTtMlxo1s
   sx2iLzDMReeRHBe8CYqFwENR7wleM/0LmszBy+y9+qq9YwsVXa9xamjly
   qSztnveSQuF8Irg/+Sup/Vox698qT/odvAOaHUjIXnA1ay1xJUmZQyUh8
   ut3Eg7bRJ9sQOgavvp+gev+irr6zz84uYxRjwwlNz08RsZ/Khnp+Apvqc
   Nd000qfq+UGN3PR9n7mfrUfptbPJ1hfs32ZuzSS1nc2JTQ0kp7E6z5N2U
   UvNFNxFCDj24tRcrT7WQ6HY3WqoANUVCaavMWrr+u/H+gY399mRqScjvN
   Q==;
X-CSE-ConnectionGUID: uQZRDWusRk6CbR4IESJOQw==
X-CSE-MsgGUID: wE0FqZH/TXe9rt5n1CJU/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27813558"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="27813558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 01:26:52 -0700
X-CSE-ConnectionGUID: N14WMEksTF+rD4rimV2TYw==
X-CSE-MsgGUID: YP/FwPYcQeuNzRep0FvsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64819311"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 01:26:50 -0700
Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com
Cc: jianhui.j.dai@intel.com, tfiga@chromium.org,
 Dongcheng Yan <dongcheng.yan@intel.com>, "Yao, Hao" <hao.yao@intel.com>
References: <20240816033121.3961995-1-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <874b3dc9-e9f2-3aaf-e994-81d296dbbbd0@linux.intel.com>
Date: Tue, 3 Sep 2024 16:28:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240816033121.3961995-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Dongcheng and Hao,

Could you help test this patch?

On 8/16/24 11:31 AM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> ipu6_mmu_map() and ipu6_mmu_unmap() operated on a per-page basis,
> leading to frequent calls to spin_locks/unlocks and
> clflush_cache_range for each page. This will cause inefficiencies,
> especially when handling large dma-bufs with hundreds of pages.
> 
> This change enhances ipu6_mmu_map()/ipu6_mmu_unmap() with batching
> process multiple contiguous pages. This significantly reduces calls
> for spin_lock/unlock and clflush_cache_range() and improve the
> performance.
> 
> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
> v2: fix one build warning found by kernel test robot
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 283 ++++++++++--------------
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h |   4 +-
>  2 files changed, 121 insertions(+), 166 deletions(-)
> ---
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index c3a20507d6db..2d9c6fbd5da2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -252,75 +252,140 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>  	return pt;
>  }
>  
> +static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> +		     phys_addr_t dummy, size_t size)
> +{
> +	unsigned int l2_entries;
> +	unsigned int l2_idx;
> +	unsigned long flags;
> +	u32 l1_idx;
> +	u32 *l2_pt;
> +
> +	spin_lock_irqsave(&mmu_info->lock, flags);
> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> +		dev_dbg(mmu_info->dev,
> +			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
> +			l1_idx, iova);
> +
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
> +	}
> +
> +	WARN_ON_ONCE(size);
> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
> +}
> +
>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		  phys_addr_t paddr, size_t size)
>  {
> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
> -	u32 iova_start = iova;
> +	struct device *dev = mmu_info->dev;
> +	unsigned int l2_entries;
>  	u32 *l2_pt, *l2_virt;
>  	unsigned int l2_idx;
>  	unsigned long flags;
> +	size_t mapped = 0;
>  	dma_addr_t dma;
>  	u32 l1_entry;
> -
> -	dev_dbg(mmu_info->dev,
> -		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> -		l1_idx, (u32)iova);
> +	u32 l1_idx;
> +	int err = 0;
>  
>  	spin_lock_irqsave(&mmu_info->lock, flags);
> -	l1_entry = mmu_info->l1_pt[l1_idx];
> -	if (l1_entry == mmu_info->dummy_l2_pteval) {
> -		l2_virt = mmu_info->l2_pts[l1_idx];
> -		if (likely(!l2_virt)) {
> -			l2_virt = alloc_l2_pt(mmu_info);
> -			if (!l2_virt) {
> -				spin_unlock_irqrestore(&mmu_info->lock, flags);
> -				return -ENOMEM;
> +
> +	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> +		dev_dbg(dev,
> +			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> +			l1_idx, (u32)iova);
> +
> +		l1_entry = mmu_info->l1_pt[l1_idx];
> +		if (l1_entry == mmu_info->dummy_l2_pteval) {
> +			l2_virt = mmu_info->l2_pts[l1_idx];
> +			if (likely(!l2_virt)) {
> +				l2_virt = alloc_l2_pt(mmu_info);
> +				if (!l2_virt) {
> +					err = -ENOMEM;
> +					goto error;
> +				}
>  			}
> -		}
>  
> -		dma = map_single(mmu_info, l2_virt);
> -		if (!dma) {
> -			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
> -			free_page((unsigned long)l2_virt);
> -			spin_unlock_irqrestore(&mmu_info->lock, flags);
> -			return -EINVAL;
> -		}
> +			dma = map_single(mmu_info, l2_virt);
> +			if (!dma) {
> +				dev_err(dev, "Failed to map l2pt page\n");
> +				free_page((unsigned long)l2_virt);
> +				err = -EINVAL;
> +				goto error;
> +			}
>  
> -		l1_entry = dma >> ISP_PADDR_SHIFT;
> +			l1_entry = dma >> ISP_PADDR_SHIFT;
>  
> -		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
> -			l1_idx, l2_virt);
> -		mmu_info->l1_pt[l1_idx] = l1_entry;
> -		mmu_info->l2_pts[l1_idx] = l2_virt;
> -		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
> -				    sizeof(mmu_info->l1_pt[l1_idx]));
> -	}
> +			dev_dbg(dev, "page for l1_idx %u %p allocated\n",
> +				l1_idx, l2_virt);
> +			mmu_info->l1_pt[l1_idx] = l1_entry;
> +			mmu_info->l2_pts[l1_idx] = l2_virt;
>  
> -	l2_pt = mmu_info->l2_pts[l1_idx];
> +			clflush_cache_range(&mmu_info->l1_pt[l1_idx],
> +					    sizeof(mmu_info->l1_pt[l1_idx]));
> +		}
>  
> -	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
> +		l2_pt = mmu_info->l2_pts[l1_idx];
> +		l2_entries = 0;
>  
> -	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
> +		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> +			l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
>  
> -	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> +				l2_pt[l2_idx]);
>  
> -	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
> -		l2_pt[l2_idx]);
> -	if (l2_pt[l2_idx] != mmu_info->dummy_page_pteval) {
> -		spin_unlock_irqrestore(&mmu_info->lock, flags);
> -		return -EINVAL;
> -	}
> +			iova += ISP_PAGE_SIZE;
> +			paddr += ISP_PAGE_SIZE;
> +			mapped += ISP_PAGE_SIZE;
> +			size -= ISP_PAGE_SIZE;
>  
> -	l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
> +			l2_entries++;
> +		}
>  
> -	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
> -	spin_unlock_irqrestore(&mmu_info->lock, flags);
> +		WARN_ON_ONCE(!l2_entries);
> +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
> +				    sizeof(l2_pt[0]) * l2_entries);
> +	}
>  
> -	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> -		l2_pt[l2_idx]);
> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
>  
>  	return 0;
> +
> +error:
> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
> +	/* unroll mapping in case something went wrong */
> +	if (mapped)
> +		l2_unmap(mmu_info, iova - mapped, paddr - mapped, mapped);
> +
> +	return err;
>  }
>  
>  static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> @@ -336,48 +401,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	return l2_map(mmu_info, iova_start, paddr, size);
>  }
>  
> -static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> -		       phys_addr_t dummy, size_t size)
> -{
> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
> -	u32 iova_start = iova;
> -	unsigned int l2_idx;
> -	size_t unmapped = 0;
> -	unsigned long flags;
> -	u32 *l2_pt;
> -
> -	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
> -		l1_idx, iova);
> -
> -	spin_lock_irqsave(&mmu_info->lock, flags);
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
> -		dev_dbg(mmu_info->dev,
> -			"unmap l2 index %u with pteval 0x%10.10llx\n",
> -			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> -		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
> -
> -		clflush_cache_range((void *)&l2_pt[l2_idx],
> -				    sizeof(l2_pt[l2_idx]));
> -		unmapped++;
> -	}
> -	spin_unlock_irqrestore(&mmu_info->lock, flags);
> -
> -	return unmapped << ISP_PAGE_SHIFT;
> -}
> -
> -static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> -			       unsigned long iova, size_t size)
> +static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> +			     unsigned long iova, size_t size)
>  {
>  	return l2_unmap(mmu_info, iova, 0, size);
>  }
> @@ -619,40 +644,13 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  	return phy_addr;
>  }
>  
> -static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
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
> @@ -664,38 +662,16 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	if (!IS_ALIGNED(iova | size, min_pagesz)) {
>  		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
>  			iova, size, min_pagesz);
> -		return -EINVAL;
> -	}
> -
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
> +		return;
>  	}
>  
> -	return unmapped;
> +	return __ipu6_mmu_unmap(mmu_info, iova, size);
>  }
>  
>  int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		 phys_addr_t paddr, size_t size)
>  {
> -	unsigned long orig_iova = iova;
>  	unsigned int min_pagesz;
> -	size_t orig_size = size;
> -	int ret = 0;
>  
>  	if (mmu_info->pgsize_bitmap == 0UL)
>  		return -ENODEV;
> @@ -718,28 +694,7 @@ int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	dev_dbg(mmu_info->dev, "map: iova 0x%lx pa %pa size 0x%zx\n",
>  		iova, &paddr, size);
>  
> -	while (size) {
> -		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
> -						iova | paddr, size);
> -
> -		dev_dbg(mmu_info->dev,
> -			"mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
> -			iova, &paddr, pgsize);
> -
> -		ret = __ipu6_mmu_map(mmu_info, iova, paddr, pgsize);
> -		if (ret)
> -			break;
> -
> -		iova += pgsize;
> -		paddr += pgsize;
> -		size -= pgsize;
> -	}
> -
> -	/* unroll mapping in case something went wrong */
> -	if (ret)
> -		ipu6_mmu_unmap(mmu_info, orig_iova, orig_size - size);
> -
> -	return ret;
> +	return __ipu6_mmu_map(mmu_info, iova, paddr, size);
>  }
>  
>  static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
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
> 

-- 
Best regards,
Bingbu Cao

