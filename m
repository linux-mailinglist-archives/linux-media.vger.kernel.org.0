Return-Path: <linux-media+bounces-20963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C689BDBB0
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 02:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E252C1F23F87
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 01:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9548718C937;
	Wed,  6 Nov 2024 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8qYh/AK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F58C11
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858310; cv=none; b=FhPLvRRk0FwcV48nXkIQMbjp7BYfdMPBDN95e3cljecIwJiBcAxrZ/51EKcGSStB6jVlHFCSf8ABA7L8/asi4ylBIbA6o3TO/i9IroLfVMCj0m6xaad09K4G8OhcsDn/5iN1lED3ye8YVQc0KXAmOBqhvWYxEqHORydfz547iPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858310; c=relaxed/simple;
	bh=cv1H5kClePXj2j3p1q9TJYWN/nLikgDywqLPthfYXKQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=T8d0Df8zDVkSTaTvtlEub4FDLVR2AIDUxlR2eBH8lfFNq5UHB7S6HysX6HbHnUZyNv04vs9uQZra0oSwRDxA9wqozvUGVwdvrMNXuYy8+vhzf5p7g/0PWwtZqY10w+UerqmtMKgFX2WEZdbF8CaPPFbrYo1czn1IgcKcPvlaPCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8qYh/AK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730858309; x=1762394309;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cv1H5kClePXj2j3p1q9TJYWN/nLikgDywqLPthfYXKQ=;
  b=R8qYh/AKU6nvz5YF8QpG3ue/R1medrhRfosUDsqyBGdv8BqwfdTdd88u
   HppYIG3NB8Vk5uprUejhluK6cQ6+917YOIT5+zO2FHqo2qH1NkROomkUo
   PSaai/XuaDXkQrDdHUQykjUy3U6VGBH8HT76bvPUVm6azxBdJj4ZxN2H3
   eL9WU67FaJRGZo1AHUpztzleQp20/B5YgJ7yw3vAHSV2BM2LkufkA9WqW
   wir2QLcf5JTMdksU/Py6b92kubkvcbjZwNWa1HP/EdULBTTU1C8fzmfZ2
   16gECWDoG726YVWppZ8ZyN/O5iN2bcTWrgkqnhiLeIe2RrXDSHHLHsB3y
   w==;
X-CSE-ConnectionGUID: 0B+qT8ibQWuvLzTagPmPSw==
X-CSE-MsgGUID: VpIRLbFQSZqq7xaf4iloLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30753352"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30753352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 17:58:28 -0800
X-CSE-ConnectionGUID: LU0cpD3ASwWqJSQpbKGR6w==
X-CSE-MsgGUID: okso4LTZS06/66utTCwDtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84378054"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 17:58:27 -0800
Subject: Re: [PATCH 1/1] media: ipu6: Fix DMA and physical address debugging
 messages for 32-bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: stanislaw.gruszka@linux.intel.com, bingbu.cao@intel.com
References: <20241105080317.500735-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <ee8939e2-bbd8-bbab-52eb-b078ada66ff0@linux.intel.com>
Date: Wed, 6 Nov 2024 09:55:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241105080317.500735-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.

On 11/5/24 4:03 PM, Sakari Ailus wrote:
> Fix printing DMA and physical address printing on 32-bit platforms, by
> using correct types. Also cast DMA_BIT_MASK() result to dma_addr_t to make
> Clang happy.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-dma.c |  7 ++++---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 25 ++++++++++++++-----------
>  2 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> index 92530a1cc90f..801f6bd00a89 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> @@ -428,11 +428,12 @@ static int ipu6_dma_map_sg(struct device *dev, struct scatterlist *sglist,
>  
>  	iova_addr = iova->pfn_lo;
>  	for_each_sg(sglist, sg, count, i) {
> +		phys_addr_t iova_pa;
>  		int ret;
>  
> -		dev_dbg(dev, "mapping entry %d: iova 0x%llx phy %pad size %d\n",
> -			i, PFN_PHYS(iova_addr), &sg_dma_address(sg),
> -			sg_dma_len(sg));
> +		iova_pa = PFN_PHYS(iova_addr);
> +		dev_dbg(dev, "mapping entry %d: iova %pap phy %pap size %d\n",
> +			i, &iova_pa, &sg_dma_address(sg), sg_dma_len(sg));
>  
>  		ret = ipu6_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
>  				   sg_dma_address(sg),
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index c3a20507d6db..873029eb7e92 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -97,13 +97,15 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
>  	for (l1_idx = 0; l1_idx < ISP_L1PT_PTES; l1_idx++) {
>  		u32 l2_idx;
>  		u32 iova = (phys_addr_t)l1_idx << ISP_L1PT_SHIFT;
> +		phys_addr_t l2_phys;
>  
>  		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
>  			continue;
> +
> +		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
>  		dev_dbg(mmu_info->dev,
> -			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pa\n",
> -			l1_idx, iova, iova + ISP_PAGE_SIZE,
> -			TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]));
> +			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
> +			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
>  
>  		for (l2_idx = 0; l2_idx < ISP_L2PT_PTES; l2_idx++) {
>  			u32 *l2_pt = mmu_info->l2_pts[l1_idx];
> @@ -227,7 +229,7 @@ static u32 *alloc_l1_pt(struct ipu6_mmu_info *mmu_info)
>  	}
>  
>  	mmu_info->l1_pt_dma = dma >> ISP_PADDR_SHIFT;
> -	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %llx\n", pt, dma);
> +	dev_dbg(mmu_info->dev, "l1 pt %p mapped at %pad\n", pt, &dma);
>  
>  	return pt;
>  
> @@ -330,8 +332,8 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  	u32 iova_end = ALIGN(iova + size, ISP_PAGE_SIZE);
>  
>  	dev_dbg(mmu_info->dev,
> -		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr 0x%10.10llx\n",
> -		iova_start, iova_end, size, paddr);
> +		"mapping iova 0x%8.8x--0x%8.8x, size %zu at paddr %pap\n",
> +		iova_start, iova_end, size, &paddr);
>  
>  	return l2_map(mmu_info, iova_start, paddr, size);
>  }
> @@ -363,8 +365,8 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
>  		l2_pt = mmu_info->l2_pts[l1_idx];
>  		dev_dbg(mmu_info->dev,
> -			"unmap l2 index %u with pteval 0x%10.10llx\n",
> -			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> +			"unmap l2 index %u with pteval 0x%p\n",
> +			l2_idx, &l2_pt[l2_idx]);
>  		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
>  
>  		clflush_cache_range((void *)&l2_pt[l2_idx],
> @@ -525,9 +527,10 @@ static struct ipu6_mmu_info *ipu6_mmu_alloc(struct ipu6_device *isp)
>  		return NULL;
>  
>  	mmu_info->aperture_start = 0;
> -	mmu_info->aperture_end = DMA_BIT_MASK(isp->secure_mode ?
> -					      IPU6_MMU_ADDR_BITS :
> -					      IPU6_MMU_ADDR_BITS_NON_SECURE);
> +	mmu_info->aperture_end =
> +		(dma_addr_t)DMA_BIT_MASK(isp->secure_mode ?
> +					 IPU6_MMU_ADDR_BITS :
> +					 IPU6_MMU_ADDR_BITS_NON_SECURE);
>  	mmu_info->pgsize_bitmap = SZ_4K;
>  	mmu_info->dev = &isp->pdev->dev;
>  
>

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

