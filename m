Return-Path: <linux-media+bounces-20181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DA9AE2AB
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D13E6B218F9
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4151C0DE2;
	Thu, 24 Oct 2024 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Giw/5Qzp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4621B392A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766061; cv=none; b=gVqVnm7uMaoIO57JvyAI9qi2WxHzy7a2sDPTtzKfL9aAxnp0URQPEtzmg0uMG5BqPlEZ/gbs6BLeQz7GxqSinW5/rMU2y7D55ynjW4dB10WIO1INFj/4BppW/HUPjsmuanlHZ7E5bY0/BigjJEXJtUYlCv4YqlgvWLkKR1Dle7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766061; c=relaxed/simple;
	bh=ATbKobopjjEMVaZ99CvH6oIVhXtUaarxvKLKDsebyZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAzfTuL0FBkZarDOT1SgGUfCDWbsBmEz4lzx2Zt9teHsnYPO/dE7imumskJynncX1hhHAhze+WFdzftVEy7UaWZ6LoRsCJfKc6dKfKy+muNOuOZZnBqr45vKfTXbSSBZoV5Ulx2OIERZlfi3+BreNQwzZfPsa04DOqEtockvcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Giw/5Qzp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729766056; x=1761302056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATbKobopjjEMVaZ99CvH6oIVhXtUaarxvKLKDsebyZA=;
  b=Giw/5QzpBAGzWv8OIMN6dJqbvYHLzP50bFJ0XJGRB4aCOthFNrqhrWPA
   nfcflWHkDCvwsIQPPi21CKdaGpcpOzWQOLZmdYcQzbGWq7UB8ALuT8NRD
   AojgUujd1EbWHYToV7o71xn9DFXO4Ssur7auxKh9jTkXranlTzBJQtsRB
   wti7voN8/LafEw9nojtlMnMtdnNLlHI4OmOTlCW7jyK8+N9ZriwlfHt68
   DjVPfMU0DpzkEndS4FQFgsEeIAxeTYyKCU3WF+GUCT89+bAGIfradvYWx
   74oUrkZ+WvZJhbU6LOygFPmOdfUPJfKLN3GmJ4N5uy/g+jC5UYEUutkX3
   w==;
X-CSE-ConnectionGUID: 6ON1M4KtS/ePX5iGEI0QEg==
X-CSE-MsgGUID: xKLtjHx/S+eadBagWCl86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29493295"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="29493295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:34:11 -0700
X-CSE-ConnectionGUID: 11m6325DRKO6TZCBSmrTDw==
X-CSE-MsgGUID: 6JIAlW9OTXWV7ZO2Y4IfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80137965"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:34:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A273111F984;
	Thu, 24 Oct 2024 13:34:06 +0300 (EEST)
Date: Thu, 24 Oct 2024 10:34:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 1/4] media: ipu6: move the l2_unmap() up before l2_map()
Message-ID: <ZxoinlZK_hJcJwcF@kekkonen.localdomain>
References: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>

Hi Bingbu,

Thank you for the update.

On Thu, Oct 24, 2024 at 03:24:36PM +0800, Bingbu Cao wrote:
> l2_map() and l2_unmap() are better to be grouped together, and
> l2_unmap() could also be called in l2_map() for error handling.

Can you confirm there are no changes to the function itself? This should be
part of the commit message.

I'd also add that l2_unmap() will soon be called from l2_map(), rather than
being something that could be done.

> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 80 ++++++++++++++++-----------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index c3a20507d6db..9ea6789bca5e 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -252,6 +252,46 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>  	return pt;
>  }
>  
> +static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> +		       phys_addr_t dummy, size_t size)
> +{
> +	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
> +	u32 iova_start = iova;
> +	unsigned int l2_idx;
> +	size_t unmapped = 0;
> +	unsigned long flags;
> +	u32 *l2_pt;
> +
> +	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova 0x%8.8lx)\n",
> +		l1_idx, iova);
> +
> +	spin_lock_irqsave(&mmu_info->lock, flags);
> +	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
> +		spin_unlock_irqrestore(&mmu_info->lock, flags);
> +		dev_err(mmu_info->dev,
> +			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
> +			iova, l1_idx);
> +		return 0;
> +	}
> +
> +	for (l2_idx = (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> +	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
> +		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> +		l2_pt = mmu_info->l2_pts[l1_idx];
> +		dev_dbg(mmu_info->dev,
> +			"unmap l2 index %u with pteval 0x%10.10llx\n",
> +			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> +		l2_pt[l2_idx] = mmu_info->dummy_page_pteval;
> +
> +		clflush_cache_range((void *)&l2_pt[l2_idx],
> +				    sizeof(l2_pt[l2_idx]));
> +		unmapped++;
> +	}
> +	spin_unlock_irqrestore(&mmu_info->lock, flags);
> +
> +	return unmapped << ISP_PAGE_SHIFT;
> +}
> +
>  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		  phys_addr_t paddr, size_t size)
>  {
> @@ -336,46 +376,6 @@ static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
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
>  static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
>  			       unsigned long iova, size_t size)
>  {
> -- 
> 2.7.4
> 

-- 
Kind regards,

Sakari Ailus

