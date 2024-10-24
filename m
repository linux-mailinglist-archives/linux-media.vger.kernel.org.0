Return-Path: <linux-media+bounces-20182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D343C9AE2B0
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A691F21847
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CAD1BDAB9;
	Thu, 24 Oct 2024 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMpVKJZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF111A0BD6
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766141; cv=none; b=mmF1vnsRM2afMKLhKCA8aLAIqhTq0y1S0OtDv9zCqfBd4TOMftImgHYgcUzfBsk0CTqJjVnS0r6oGzgJAuldQ0dGmQne3QF852G2eJQBFsgayLjMVIf+Wsm4wfKv/dXuEktI82vsKQBOKw/swHDzz5GAS0bwyO/GJCuzHOnVlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766141; c=relaxed/simple;
	bh=dxtrMUi0GdSiXie5bzYeyoMTMozWLBZuedzaB0oUuuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ9U/tZJITE2m0XSBb0PF89cp0F5gC1vJZTISUBaZbNPU9dEu0BrVzoPLi2AkZp5cgXPXFRqNFJxMdSzdSC+YRJUPwTT06oUp35/nK1v76f+QAlxgI8yDNXax3vsO9VQ10zwxwU5rhB3WzhqnFAMQ5RXUcq6FOLz8TtmUdHv+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMpVKJZn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729766140; x=1761302140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxtrMUi0GdSiXie5bzYeyoMTMozWLBZuedzaB0oUuuk=;
  b=nMpVKJZnZtYnYSHx20m7Imr8PtpKayijR+r1UxBu+/2jjU1LTtn+mnMZ
   91x7giMOo8H5LX70eFiVZ8gm1Ez/5DFnRloNEQIHvTWrR5/0R+9XzX7V6
   DKG1GmxrD6IoPfdQGQNyYhe+et6iNdLGquF9fiPu9931FbTL1gDsOyjxu
   1YZLfCs5i2gMUhGqggOg/wAv7FlbbXseEk3/cJHpVoBjRIFExn3ycbI2I
   O/YyhilmhwWw4ClxX0D1TsTyRaxd/7oNuLDIzK6rc5xBgPce2OFTdPKgm
   X9d3roGLmLSxs7KhTE6pUfBpShT1zHjxJ3laCfVt+QhQXVdZUFPHFMEMX
   Q==;
X-CSE-ConnectionGUID: z1kqi425Q3af1TOT3o8EfQ==
X-CSE-MsgGUID: 8hXSf0HoSoSdeTIDN4ru9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29493375"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29493375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:35:37 -0700
X-CSE-ConnectionGUID: OpEAr28vQGe/8paP6SMUTA==
X-CSE-MsgGUID: Y1aoLpyhSG6CNS4ZrQ1zCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84532997"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:35:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A3A0C11F984;
	Thu, 24 Oct 2024 13:35:33 +0300 (EEST)
Date: Thu, 24 Oct 2024 10:35:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 4/4] media: ipu6: remove unused ipu6_mmu_pgsize()
Message-ID: <Zxoi9dcXC9_ghtpK@kekkonen.localdomain>
References: <1729754679-6402-1-git-send-email-bingbu.cao@intel.com>
 <1729754679-6402-4-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1729754679-6402-4-git-send-email-bingbu.cao@intel.com>

Hi Bingbu,

On Thu, Oct 24, 2024 at 03:24:39PM +0800, Bingbu Cao wrote:
> The ipu6_mmu_pgsize() could be removed as driver unload this to
> the PCI core driver DMA ops instead of handling in IPU6 driver.

This should be squashed to the third patch: an unused static function will
trigger a compiler warning.

> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index d746e42918ae..2d9c6fbd5da2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -644,34 +644,6 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  	return phy_addr;
>  }
>  
> -static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
> -			      unsigned long addr_merge, size_t size)
> -{
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
>  void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		    size_t size)
>  {

-- 
Kind regards,

Sakari Ailus

