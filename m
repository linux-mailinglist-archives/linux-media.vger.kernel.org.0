Return-Path: <linux-media+bounces-29729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3CA821E8
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3605A1B871D4
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA2E25D52E;
	Wed,  9 Apr 2025 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+KeTSGK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAEA2B9CD
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194034; cv=none; b=FYV69TTy8SvW4uRWLytCprnc8trq0oLktlPCKbJGWp/sIsWWEFAwm6BJKoKkpWw32aT+C4gj/1GJZXlVfaNyzMv/cAwxUQRf4v0+PszMpu3AzFsret0/69zZxN1onJa2+HP533O9qRR7EcyCk8D+mzBsIFM2gVnn5D0wOuHLBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194034; c=relaxed/simple;
	bh=twGizWziTSGhIf/u7VfetwMjqczV5pVoGog4EQNK78k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFHM517aDmmmRJ+iCi0e0nh0YIyUQyIdVxsutvKdXu/P/1ei2mLgj1kJE1qNVANfgprq5Cr1FhkRecWzZF9zrWtwOuLQX7xf7Os+4Tgg0246lUu3mexdc0EIQsA5zEF8G6NMjdFqJ5TM9GCHWCxDHLP4585l2As3zPGIe9VfXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+KeTSGK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744194032; x=1775730032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twGizWziTSGhIf/u7VfetwMjqczV5pVoGog4EQNK78k=;
  b=X+KeTSGKZawLL7TE/fADmmlMffq1MLWofw1aCL/ox0NrbXSTKylG1NRc
   dYFWJJjKeQQFR2yEXfU1y+GePx2Sai4GZGEP0OvR6V3epm8+bJzv7Jt0A
   GaOJWagfBskdUYXic7bh8V50l931eVzzveBV0P8lobA6OiRDX0KPjHZix
   hxLIAVHpWb0kduJUHbonCQUCPZqXEIm3dIuVX2MObkLG6aNnL0VhAu8MC
   yr0XfI3heP88W8f/VhWPwufBC8yS9hXgIDb7OT8YGcT9xdYgmoupSR13d
   v6kZxhSzlV1ykdyerZM5SWdjU3FkTcn6SpnuZ59mV9iOYxdAk/I0775zE
   Q==;
X-CSE-ConnectionGUID: fnNazsQvRYW+A/a3GxY83Q==
X-CSE-MsgGUID: hGxGpEhIQpyBqvJPYUU/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49505366"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49505366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:20:31 -0700
X-CSE-ConnectionGUID: XeW8oCNOR1iiZk5e7jAYkw==
X-CSE-MsgGUID: 0BFYwd9OT5yjYPlqoaNGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128453920"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:20:31 -0700
Date: Wed, 9 Apr 2025 12:20:27 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
Message-ID: <Z/ZJ670pMe1f1gTB@linux.intel.com>
References: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409095825.1014521-1-stanislaw.gruszka@linux.intel.com>

On Wed, Apr 09, 2025 at 11:58:25AM +0200, Stanislaw Gruszka wrote:
> We use dma_get_mask() of auxdev device for calculate iova pfn limit.
> This is always 32 bit mask as we do not initialize the mask (and we can
> not do so, since dev->dev_mask is NULL anyways for auxdev).
> 
> Since we need 31 bit mask for non-secure mode create wrapper of
> alloc_iova() which use mmu_info->aperture_end. This give us always
> the correct mask.
> 
> Fixes: daabc5c64703 ("media: ipu6: not override the dma_ops of device in driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
<snip>
>  			       void __iomem *base, int mmid,
>  			       const struct ipu6_hw_variants *hw);
> @@ -70,4 +76,11 @@ void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long iova,
>  		    size_t size);
>  phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
>  				  dma_addr_t iova);
> +
> +static inline struct iova *ipu_alloc_iova(struct ipu6_mmu *mmu,
> +					  unsigned long n_pages)
Before posing one of my vim macro accidentally mangled this patch.
Will send v2.

Regards
Stanislaw

