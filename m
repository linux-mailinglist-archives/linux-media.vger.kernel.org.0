Return-Path: <linux-media+bounces-20784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 018629BB0DC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F29B235F0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 10:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98E31B0F39;
	Mon,  4 Nov 2024 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQiSK7em"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA61B0F27
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730715570; cv=none; b=ZdPZDrjXkIoJIOG4VlqORuBoW+BNE9T1+/zas40vFuKq68LtAgqcteGuu54E9ZBIT3A1CknCv+N3WzmSp/7VsDvBk0xek/WCSIUj9gXv+NelfzfM7BSqxdnd2+E6lrfXBX72cDTcpMYu/6iwf/HUXZodz3LC1UjwUJWR51371Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730715570; c=relaxed/simple;
	bh=TPTs14AXyxx/uCvatNDz9N0O2csn0m+GcPFpSkXe4dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+EcQ9fZo5r5wREUfqIoXidSZeKcHUX2O9HVszxTrO4IzXfwGCm78dZAsyB+BWSjo9OURyXpvdt0SCdDp7Emf+aK2a+a9riqagEiwzMaZTHlf08zHIam11E/JWMOoyb5ycgGkphuF6m9gnKoxV6TZA5KJzZOmDAKJgPOwlAbTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQiSK7em; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730715568; x=1762251568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TPTs14AXyxx/uCvatNDz9N0O2csn0m+GcPFpSkXe4dk=;
  b=LQiSK7emfyUp0ArvJTVk2+hsrn0Fg9CPZGEJERophttNLsRcL600y0Xy
   LqwAuIcOZLa4D+OyXw/cfmBCl4OsoJqA0JomtyOj3I/csKBeTbYijz3Tp
   BEqcvkIXrNbmmvxrnMOqmGwIh21YoTBceSlj53AbeKZF2clim0LNCPsya
   x6MWO5397NxIhd2+VdgsYsVswE/qDoQlA4t6ARjtq0u7QQnoskXfFypD4
   LzniiayGAkoHtw80ngudb1T1lr7cAoXeqX+bAP2PDbqnj8wCHDFBBzsqB
   bGd65QgVE7+8pViZtridqI13iiSev3dHIh276pEvUewLVO7Y0BxqkY/5P
   Q==;
X-CSE-ConnectionGUID: +RxpivspRiil6LyGPV/b4g==
X-CSE-MsgGUID: /OVaM9+wTFO9mogXjMS5Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29820559"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="29820559"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:19:26 -0800
X-CSE-ConnectionGUID: 09DoVe+vQN+hJvtP1RdRqw==
X-CSE-MsgGUID: jZhT4Y2XQ62B9n6lcP2bXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83737735"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:19:25 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BAC6311F984;
	Mon,  4 Nov 2024 12:19:21 +0200 (EET)
Date: Mon, 4 Nov 2024 10:19:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: ipu6: optimize the IPU6 MMU mapping flow
Message-ID: <ZyifqaEAg-LZQVVG@kekkonen.localdomain>
References: <1729835552-14825-1-git-send-email-bingbu.cao@intel.com>
 <1729835552-14825-2-git-send-email-bingbu.cao@intel.com>
 <ZyTUkP-Vakj_DsOS@kekkonen.localdomain>
 <7a148e4e-04b4-d6e3-554b-20569b7fa340@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a148e4e-04b4-d6e3-554b-20569b7fa340@linux.intel.com>

Hi Bingbu,

On Mon, Nov 04, 2024 at 12:04:29PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 11/1/24 9:16 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > Thanks for the update.
> > 
> > On Fri, Oct 25, 2024 at 01:52:31PM +0800, Bingbu Cao wrote:
> >> ipu6_mmu_map() operated on a per-page basis, it leads frequent
> >> spin_lock/unlock() and clflush_cache_range() for each page, it
> >> will cause inefficiencies especially when handling dma-bufs
> >> with large number of pages. However, the pages are likely concentrated
> >> pages by IOMMU DMA driver, IPU MMU driver can map the concentrated
> >> pages into less entries in l1 table.
> >>
> >> This change enhances ipu6_mmu_map() with batching process multiple
> >> contiguous pages. It significantly reduces calls for spin_lock/unlock
> >> and clflush_cache_range() and improve the performance.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> >> ---
> >>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 144 +++++++++++++++-----------------
> >>  1 file changed, 69 insertions(+), 75 deletions(-)
> >>
> >> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> >> index 9ea6789bca5e..e957ccb4691d 100644
> >> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> >> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> >> @@ -295,72 +295,90 @@ static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> >>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> >>  		  phys_addr_t paddr, size_t size)
> >>  {
> >> -	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
> >> -	u32 iova_start = iova;
> >> +	struct device *dev = mmu_info->dev;
> >> +	unsigned int l2_entries;
> >>  	u32 *l2_pt, *l2_virt;
> >>  	unsigned int l2_idx;
> >>  	unsigned long flags;
> >> +	size_t mapped = 0;
> >>  	dma_addr_t dma;
> >>  	u32 l1_entry;
> >> -
> >> -	dev_dbg(mmu_info->dev,
> >> -		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> >> -		l1_idx, (u32)iova);
> >> +	u32 l1_idx;
> >> +	int err = 0;
> >>  
> >>  	spin_lock_irqsave(&mmu_info->lock, flags);
> >> -	l1_entry = mmu_info->l1_pt[l1_idx];
> >> -	if (l1_entry == mmu_info->dummy_l2_pteval) {
> >> -		l2_virt = mmu_info->l2_pts[l1_idx];
> >> -		if (likely(!l2_virt)) {
> >> -			l2_virt = alloc_l2_pt(mmu_info);
> >> -			if (!l2_virt) {
> >> -				spin_unlock_irqrestore(&mmu_info->lock, flags);
> >> -				return -ENOMEM;
> >> -			}
> >> -		}
> >> -
> >> -		dma = map_single(mmu_info, l2_virt);
> >> -		if (!dma) {
> >> -			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
> >> -			free_page((unsigned long)l2_virt);
> >> -			spin_unlock_irqrestore(&mmu_info->lock, flags);
> >> -			return -EINVAL;
> >> -		}
> >> -
> >> -		l1_entry = dma >> ISP_PADDR_SHIFT;
> >> -
> >> -		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
> >> -			l1_idx, l2_virt);
> >> -		mmu_info->l1_pt[l1_idx] = l1_entry;
> >> -		mmu_info->l2_pts[l1_idx] = l2_virt;
> >> -		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
> >> -				    sizeof(mmu_info->l1_pt[l1_idx]));
> >> -	}
> >> -
> >> -	l2_pt = mmu_info->l2_pts[l1_idx];
> >> -
> >> -	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt, l1_entry);
> >>  
> >>  	paddr = ALIGN(paddr, ISP_PAGE_SIZE);
> >> +	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> >> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> >> +		dev_dbg(dev,
> >> +			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> >> +			l1_idx, (u32)iova);
> >>  
> >> -	l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> >> +		l1_entry = mmu_info->l1_pt[l1_idx];
> >> +		if (l1_entry == mmu_info->dummy_l2_pteval) {
> >> +			l2_virt = mmu_info->l2_pts[l1_idx];
> >> +			if (likely(!l2_virt)) {
> > 
> > likely() should only be used if it's really, really uncommon on a hot path.
> > I don't think that's the case here.
> > 
> > Can it even happen l2_virt is NULL here? l1_entry has been assigned while
> > the l2 PT page has been mapped so both are either dummy / NULL or valid
> > values. The l2 pages aren't unmapped in unmap, but only in
> > ipu6_mmu_destroy(). Same goes for the map_single() if l2_virt was valid
> > already, the page has been mapped, too.
> > 
> > This seems like a pre-existing problem. If there is no actual bug here but
> > just inconsistent implementation (so it would seem), I think it's fine to
> > address this on top.
> > 
> > Can you conform this?
> 
> I would like to address this in another patch instead of this series.
> What do you think?

Works for me.

-- 
Sakari Ailus

