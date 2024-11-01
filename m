Return-Path: <linux-media+bounces-20695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DE59B91BD
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B351B281F13
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE8A1A01B9;
	Fri,  1 Nov 2024 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0tQntNy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F4175B1
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466966; cv=none; b=jU9MPY19pOg+6IYdJz3aO+agBZhE47tW3eQPuqsIlexI/nfL8xmGmIGhkXnu2xBR9lxcxTjS7qrFlWATEv+wI0c4i7TSs9C+o5fVnXoCPkpKEYvy2TZuBIvJBuyUwsliODIzcObHqf804rjAZCba4uXR3gb9zDXXjoPRbrUt3LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466966; c=relaxed/simple;
	bh=OogZQDOjHrmxDvMTPfmTsdAwlqsnbmt0bs298DQ+URM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShhWJkVlgsoAtzmbJFnMW8JnkXtubGaLIyhZEhS93DQeJbgVcmY7fj5lE7Cra64lFkeHePJeXakzrasNzS4VPMMFRiv8tC3KwVwpzTEOwYevU65KJ778+LeWA1fs9WlXBJgLND+fgVoykmdg98++OJFAcCrouX5Fdi2GWpTYVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0tQntNy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730466965; x=1762002965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OogZQDOjHrmxDvMTPfmTsdAwlqsnbmt0bs298DQ+URM=;
  b=E0tQntNyTqxKlF/DlvViqTPSZM5tRy2ktVkiFnGXhHj4LXTC3r3EoMJ2
   AkQi3fTwamyqWDzPE5SlioH9juoVk4Wof6neY65SjuelmSahWFsWL3NSL
   XS2R/STGzeJhLXSe96akKAnhMaaezdB5QPyaoC+r1xm9nMX62Yg0MKEY2
   Fh7RgqpEzdtUMLqzFCq5L0rw79YNdiYYwlPPe1GDMJ59PpXLRFQTYou3o
   t4FtFLkikXmMoUS3X3uKWgsF+uoIqwFA4Zh/emfAWI1aQWa23vK5OlUhO
   5ylH+KLkXn8K+PoMYyptH5+r4ongEk7bL1276n8AKOhHnBCAQPHovEbf1
   g==;
X-CSE-ConnectionGUID: RargYUPUTl2rE+sPmP2q+w==
X-CSE-MsgGUID: wvGUkJX5Tea4HZqbWsOT/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30088392"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30088392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:16:05 -0700
X-CSE-ConnectionGUID: VV8W7ytBSQugeZ+wsvQf7g==
X-CSE-MsgGUID: Q/mQa8ZnSu2Kp9/n/oJyeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83100555"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:16:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B8A711FA28;
	Fri,  1 Nov 2024 15:16:00 +0200 (EET)
Date: Fri, 1 Nov 2024 13:16:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2 2/3] media: ipu6: optimize the IPU6 MMU mapping flow
Message-ID: <ZyTUkP-Vakj_DsOS@kekkonen.localdomain>
References: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
 <1729835552-14825-2-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729835552-14825-2-git-send-email-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the update.

On Fri, Oct 25, 2024 at 01:52:31PM +0800, Bingbu Cao wrote:
> ipu6_mmu_map() operated on a per-page basis, it leads frequent
> spin_lock/unlock() and clflush_cache_range() for each page, it
> will cause inefficiencies especially when handling dma-bufs
> with large number of pages. However, the pages are likely concentrated
> pages by IOMMU DMA driver, IPU MMU driver can map the concentrated
> pages into less entries in l1 table.
> 
> This change enhances ipu6_mmu_map() with batching process multiple
> contiguous pages. It significantly reduces calls for spin_lock/unlock
> and clflush_cache_range() and improve the performance.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 144 +++++++++++++++-----------------
>  1 file changed, 69 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index 9ea6789bca5e..e957ccb4691d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -295,72 +295,90 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
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
> -			}
> -		}
> -
> -		dma = map_single(mmu_info, l2_virt);
> -		if (!dma) {
> -			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
> -			free_page((unsigned long)l2_virt);
> -			spin_unlock_irqrestore(&mmu_info->lock, flags);
> -			return -EINVAL;
> -		}
> -
> -		l1_entry = dma >> ISP_PADDR_SHIFT;
> -
> -		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
> -			l1_idx, l2_virt);
> -		mmu_info->l1_pt[l1_idx] = l1_entry;
> -		mmu_info->l2_pts[l1_idx] = l2_virt;
> -		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
> -				    sizeof(mmu_info->l1_pt[l1_idx]));
> -	}
> -
> -	l2_pt = mmu_info->l2_pts[l1_idx];
> -
> -	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
>  
>  	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> +		dev_dbg(dev,
> +			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> +			l1_idx, (u32)iova);
>  
> -	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +		l1_entry = mmu_info->l1_pt[l1_idx];
> +		if (l1_entry == mmu_info->dummy_l2_pteval) {
> +			l2_virt = mmu_info->l2_pts[l1_idx];
> +			if (likely(!l2_virt)) {

likely() should only be used if it's really, really uncommon on a hot path.
I don't think that's the case here.

Can it even happen l2_virt is NULL here? l1_entry has been assigned while
the l2 PT page has been mapped so both are either dummy / NULL or valid
values. The l2 pages aren't unmapped in unmap, but only in
ipu6_mmu_destroy(). Same goes for the map_single() if l2_virt was valid
already, the page has been mapped, too.

This seems like a pre-existing problem. If there is no actual bug here but
just inconsistent implementation (so it would seem), I think it's fine to
address this on top.

Can you conform this?

> +				l2_virt = alloc_l2_pt(mmu_info);
> +				if (!l2_virt) {
> +					err = -ENOMEM;
> +					goto error;
> +				}
> +			}
>  
> -	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
> -		l2_pt[l2_idx]);
> -	if (l2_pt[l2_idx] != mmu_info->dummy_page_pteval) {
> -		spin_unlock_irqrestore(&mmu_info->lock, flags);
> -		return -EINVAL;
> +			dma = map_single(mmu_info, l2_virt);
> +			if (!dma) {
> +				dev_err(dev, "Failed to map l2pt page\n");
> +				free_page((unsigned long)l2_virt);
> +				err = -EINVAL;
> +				goto error;
> +			}
> +
> +			l1_entry = dma >> ISP_PADDR_SHIFT;
> +
> +			dev_dbg(dev, "page for l1_idx %u %p allocated\n",
> +				l1_idx, l2_virt);
> +			mmu_info->l1_pt[l1_idx] = l1_entry;
> +			mmu_info->l2_pts[l1_idx] = l2_virt;
> +
> +			clflush_cache_range(&mmu_info->l1_pt[l1_idx],
> +					    sizeof(mmu_info->l1_pt[l1_idx]));
> +		}
> +
> +		l2_pt = mmu_info->l2_pts[l1_idx];
> +		l2_entries = 0;
> +
> +		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> +			l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
> +
> +			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> +				l2_pt[l2_idx]);
> +
> +			iova += ISP_PAGE_SIZE;
> +			paddr += ISP_PAGE_SIZE;
> +			mapped += ISP_PAGE_SIZE;
> +			size -= ISP_PAGE_SIZE;
> +
> +			l2_entries++;
> +		}
> +
> +		WARN_ON_ONCE(!l2_entries);
> +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
> +				    sizeof(l2_pt[0]) * l2_entries);
>  	}
>  
> -	l2_pt[l2_idx] = paddr >> ISP_PADDR_SHIFT;
> -
> -	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
>  	spin_unlock_irqrestore(&mmu_info->lock, flags);
>  
> -	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> -		l2_pt[l2_idx]);
> -
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
> @@ -692,10 +710,7 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
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
> @@ -718,28 +733,7 @@ int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
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

-- 
Kind regards,

Sakari Ailus

