Return-Path: <linux-media+bounces-20757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D49BABAA
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 05:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E69281322
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 04:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365B1178CEC;
	Mon,  4 Nov 2024 04:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+JAKJqD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913094C6C
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 04:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693255; cv=none; b=GlhG0TuF/VPkHPGLNl2EgfeG4BOFs9sloK5ND7gSDU//k0ZsVi2SxTRcey2GkWjwXvZPcZ3S5pwYexmoFi/rU1omir259A7Fp8iMl9qltU3ACBWuNhbC7snAwmaozt4B1w/26DFA/XCCXRM/GFVAOZbmZLUl6y0E15oqhXe5vQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693255; c=relaxed/simple;
	bh=KVXWVDaMqR5wyKOgT6bLFxo6vMpgcB8Cmxmo9oZzzFM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=e//B1D4jrxEuvaZDhkfSZZaQtvUCLr6UKqaB7UcqTUBy3CVFc+OAh10hO4jFgWsI+lRimXIBkRM6VuR8qRUhpdsqoYsPjD2yTc++R8lOW/DLiDBnTm2GxvvBVtUTg6wLdXSzbJiFk4fFuDbEJXmlApfiPkOimWM3hQpnzGJwY3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+JAKJqD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730693253; x=1762229253;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=KVXWVDaMqR5wyKOgT6bLFxo6vMpgcB8Cmxmo9oZzzFM=;
  b=k+JAKJqDafBWWMHXcyh7fd6ksUEER3et0Hdzt22FKzTalenKpDvGdwHN
   w9TxWeHjVCgKQwUMf/IQbhi+YOMFXiZtiQWBcE3XLrDFIc5MENuNgj8q4
   rjFpnZizTE71TVNbI8VgmQceuVWGyq7DbW15jP0EOo0I72BzPHkpYcSVR
   tu5ELEOm7v/rxdRPCdymD6XUKJfMam/7oFpPS5WsXl0XjVzXisHMnhnRK
   Js/KrBHHhc/SwN1YYvTnpcOXHo6iIK7qIdT71v4udDto6ty6eTxI9T22l
   5hrqfEdHkGF/Asn4ouAmIRwGrbFQcu50y49pCBQXcmYJI630q5DvaRQ+k
   w==;
X-CSE-ConnectionGUID: KstfxCMzSkCtwGG2DUd8wA==
X-CSE-MsgGUID: JNph0j/TStC++EDry9ATvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41010212"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="41010212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 20:07:33 -0800
X-CSE-ConnectionGUID: vHdTr4m+TIO02pmYGR205A==
X-CSE-MsgGUID: ZBJy8iTyT3iWuCnNaKzBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="84344365"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 20:07:32 -0800
Subject: Re: [PATCH v2 2/3] media: ipu6: optimize the IPU6 MMU mapping flow
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org
References: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
 <1729835552-14825-2-git-send-email-bingbu.cao@intel.com>
 <ZyTUkP-Vakj_DsOS@kekkonen.localdomain>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7a148e4e-04b4-d6e3-554b-20569b7fa340@linux.intel.com>
Date: Mon, 4 Nov 2024 12:04:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZyTUkP-Vakj_DsOS@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 11/1/24 9:16 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the update.
> 
> On Fri, Oct 25, 2024 at 01:52:31PM +0800, Bingbu Cao wrote:
>> ipu6_mmu_map() operated on a per-page basis, it leads frequent
>> spin_lock/unlock() and clflush_cache_range() for each page, it
>> will cause inefficiencies especially when handling dma-bufs
>> with large number of pages. However, the pages are likely concentrated
>> pages by IOMMU DMA driver, IPU MMU driver can map the concentrated
>> pages into less entries in l1 table.
>>
>> This change enhances ipu6_mmu_map() with batching process multiple
>> contiguous pages. It significantly reduces calls for spin_lock/unlock
>> and clflush_cache_range() and improve the performance.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 144 +++++++++++++++-----------------
>>  1 file changed, 69 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> index 9ea6789bca5e..e957ccb4691d 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
>> @@ -295,72 +295,90 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  		  phys_addr_t paddr, size_t size)
>>  {
>> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
>> -	u32 iova_start = iova;
>> +	struct device *dev = mmu_info->dev;
>> +	unsigned int l2_entries;
>>  	u32 *l2_pt, *l2_virt;
>>  	unsigned int l2_idx;
>>  	unsigned long flags;
>> +	size_t mapped = 0;
>>  	dma_addr_t dma;
>>  	u32 l1_entry;
>> -
>> -	dev_dbg(mmu_info->dev,
>> -		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
>> -		l1_idx, (u32)iova);
>> +	u32 l1_idx;
>> +	int err = 0;
>>  
>>  	spin_lock_irqsave(&mmu_info->lock, flags);
>> -	l1_entry = mmu_info->l1_pt[l1_idx];
>> -	if (l1_entry == mmu_info->dummy_l2_pteval) {
>> -		l2_virt = mmu_info->l2_pts[l1_idx];
>> -		if (likely(!l2_virt)) {
>> -			l2_virt = alloc_l2_pt(mmu_info);
>> -			if (!l2_virt) {
>> -				spin_unlock_irqrestore(&mmu_info->lock, flags);
>> -				return -ENOMEM;
>> -			}
>> -		}
>> -
>> -		dma = map_single(mmu_info, l2_virt);
>> -		if (!dma) {
>> -			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
>> -			free_page((unsigned long)l2_virt);
>> -			spin_unlock_irqrestore(&mmu_info->lock, flags);
>> -			return -EINVAL;
>> -		}
>> -
>> -		l1_entry = dma >> ISP_PADDR_SHIFT;
>> -
>> -		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
>> -			l1_idx, l2_virt);
>> -		mmu_info->l1_pt[l1_idx] = l1_entry;
>> -		mmu_info->l2_pts[l1_idx] = l2_virt;
>> -		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
>> -				    sizeof(mmu_info->l1_pt[l1_idx]));
>> -	}
>> -
>> -	l2_pt = mmu_info->l2_pts[l1_idx];
>> -
>> -	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
>>  
>>  	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
>> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
>> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
>> +		dev_dbg(dev,
>> +			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
>> +			l1_idx, (u32)iova);
>>  
>> -	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
>> +		l1_entry = mmu_info->l1_pt[l1_idx];
>> +		if (l1_entry == mmu_info->dummy_l2_pteval) {
>> +			l2_virt = mmu_info->l2_pts[l1_idx];
>> +			if (likely(!l2_virt)) {
> 
> likely() should only be used if it's really, really uncommon on a hot path.
> I don't think that's the case here.
> 
> Can it even happen l2_virt is NULL here? l1_entry has been assigned while
> the l2 PT page has been mapped so both are either dummy / NULL or valid
> values. The l2 pages aren't unmapped in unmap, but only in
> ipu6_mmu_destroy(). Same goes for the map_single() if l2_virt was valid
> already, the page has been mapped, too.
> 
> This seems like a pre-existing problem. If there is no actual bug here but
> just inconsistent implementation (so it would seem), I think it's fine to
> address this on top.
> 
> Can you conform this?

I would like to address this in another patch instead of this series.
What do you think?

> 
>> +				l2_virt = alloc_l2_pt(mmu_info);
>> +				if (!l2_virt) {
>> +					err = -ENOMEM;
>> +					goto error;
>> +				}
>> +			}
>>  
>> -	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
>> -		l2_pt[l2_idx]);
>> -	if (l2_pt[l2_idx] != mmu_info->dummy_page_pteval) {
>> -		spin_unlock_irqrestore(&mmu_info->lock, flags);
>> -		return -EINVAL;
>> +			dma = map_single(mmu_info, l2_virt);
>> +			if (!dma) {
>> +				dev_err(dev, "Failed to map l2pt page\n");
>> +				free_page((unsigned long)l2_virt);
>> +				err = -EINVAL;
>> +				goto error;
>> +			}
>> +
>> +			l1_entry = dma >> ISP_PADDR_SHIFT;
>> +
>> +			dev_dbg(dev, "page for l1_idx %u %p allocated\n",
>> +				l1_idx, l2_virt);
>> +			mmu_info->l1_pt[l1_idx] = l1_entry;
>> +			mmu_info->l2_pts[l1_idx] = l2_virt;
>> +
>> +			clflush_cache_range(&mmu_info->l1_pt[l1_idx],
>> +					    sizeof(mmu_info->l1_pt[l1_idx]));
>> +		}
>> +
>> +		l2_pt = mmu_info->l2_pts[l1_idx];
>> +		l2_entries = 0;
>> +
>> +		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
>> +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
>> +			l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
>> +
>> +			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
>> +				l2_pt[l2_idx]);
>> +
>> +			iova += ISP_PAGE_SIZE;
>> +			paddr += ISP_PAGE_SIZE;
>> +			mapped += ISP_PAGE_SIZE;
>> +			size -= ISP_PAGE_SIZE;
>> +
>> +			l2_entries++;
>> +		}
>> +
>> +		WARN_ON_ONCE(!l2_entries);
>> +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
>> +				    sizeof(l2_pt[0]) * l2_entries);
>>  	}
>>  
>> -	l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
>> -
>> -	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
>>  	spin_unlock_irqrestore(&mmu_info->lock, flags);
>>  
>> -	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
>> -		l2_pt[l2_idx]);
>> -
>>  	return 0;
>> +
>> +error:
>> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
>> +	/* unroll mapping in case something went wrong */
>> +	if (mapped)
>> +		l2_unmap(mmu_info, iova - mapped, paddr - mapped, mapped);
>> +
>> +	return err;
>>  }
>>  
>>  static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>> @@ -692,10 +710,7 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  		 phys_addr_t paddr, size_t size)
>>  {
>> -	unsigned long orig_iova = iova;
>>  	unsigned int min_pagesz;
>> -	size_t orig_size = size;
>> -	int ret = 0;
>>  
>>  	if (mmu_info->pgsize_bitmap == 0UL)
>>  		return -ENODEV;
>> @@ -718,28 +733,7 @@ int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>>  	dev_dbg(mmu_info->dev, "map: iova 0x%lx pa %pa size 0x%zx\n",
>>  		iova, &paddr, size);
>>  
>> -	while (size) {
>> -		size_t pgsize = ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
>> -						iova | paddr, size);
>> -
>> -		dev_dbg(mmu_info->dev,
>> -			"mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
>> -			iova, &paddr, pgsize);
>> -
>> -		ret = __ipu6_mmu_map(mmu_info, iova, paddr, pgsize);
>> -		if (ret)
>> -			break;
>> -
>> -		iova += pgsize;
>> -		paddr += pgsize;
>> -		size -= pgsize;
>> -	}
>> -
>> -	/* unroll mapping in case something went wrong */
>> -	if (ret)
>> -		ipu6_mmu_unmap(mmu_info, orig_iova, orig_size - size);
>> -
>> -	return ret;
>> +	return __ipu6_mmu_map(mmu_info, iova, paddr, size);
>>  }
>>  
>>  static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
> 

-- 
Best regards,
Bingbu Cao

