Return-Path: <linux-media+bounces-26995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711B3A45794
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A204E17168F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 08:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45885258CCE;
	Wed, 26 Feb 2025 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Psil6Imw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CF258CC2
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556687; cv=none; b=BujjDkIHeS6BK/pm5+9W5QZ9pe/IcryQ1fXSkzUnw4Mretjzf9JrENZ+sbKs7Vn/hHYAEwtgEoUHv4r24z742DAWAssIEx9/M9cE0MJTHaBfVA6t1OyOvWY8oc2JyG2GX5Dut0VJbvrs4doWgEsozxNFFNeFhITzW5xc0rJ4+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556687; c=relaxed/simple;
	bh=NPC3+CnmcV/JjbqPjgu5EFEfbSAjUL7hd7ixZRdQnZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqKNsBU4oug4faxCkCSeRDzX83PpxvsyGX2YD/GuqBMQ13MjGZ8mk7XaGA5JOCYAWs0NxLk3AmykGXKL6Gr+gsCI/yxxOUKo4J2KyiYeOWv3jiK99iEJS99D61/P+MfmzJj1gFXmhb+l+9FJOvkhjsYV0KD66ExMXIysMRtaslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Psil6Imw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740556686; x=1772092686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NPC3+CnmcV/JjbqPjgu5EFEfbSAjUL7hd7ixZRdQnZI=;
  b=Psil6ImwPY7xKE3NMOURiOTdoBcqg93Z9BiNAkY8FvCsao7gZ0b0sAqu
   CIP2WQ7rifNtxfIf83T6ZxaPWkve+UP/USjO7Y2W92DyBFP8LhpPQxJWp
   I6RLPCXEqMBfg6krrvZg7mr+U7XGES5SCiZ0UPdjKp9DQAmW6DqP1tBy5
   Uhd/eyRcyEPrEKR62cFucy6ENG4UMxQLIebN42hEg37pibvaJbUT3beEV
   KfWTxy4hZ/bYnOdEo0fCfWt+u5pf0TymC+78KA9ZFRl6Ued2nD3Oyx7Lh
   3Q6hkPpzdhXMy5I2cqNiqvpuaqyd7JwbdCO/a10Z0+7xYXxbPMPbhmDrA
   A==;
X-CSE-ConnectionGUID: ge6qkPPrREmVgwzt+j9ogg==
X-CSE-MsgGUID: 6rtJPMDjS+eo3IgKcPCQvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305916"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45305916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:58:06 -0800
X-CSE-ConnectionGUID: cIuCCMCYQHaP9LQVCvdQDw==
X-CSE-MsgGUID: yjY8eFuvTX+okPOR9BUauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120744132"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:58:04 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F372811F99F;
	Wed, 26 Feb 2025 09:58:01 +0200 (EET)
Date: Wed, 26 Feb 2025 07:58:01 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
	bingbu.cao@intel.com
Subject: Re: [PATCH 1/1] media: ipu6: Drop unused ipu6_dma_get_sgtable()
Message-ID: <Z77JiXJ2kyLSOuPi@kekkonen.localdomain>
References: <20250225094532.40678-1-sakari.ailus@linux.intel.com>
 <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76556647-505b-1cea-7ae8-5f17873cf161@linux.intel.com>

Hi Bingbu,

On Wed, Feb 26, 2025 at 10:38:25AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 2/25/25 5:45 PM, Sakari Ailus wrote:
> > ipu6_dma_get_sgtable() is now unused. Drop it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-dma.c | 33 -------------------------
> >  drivers/media/pci/intel/ipu6/ipu6-dma.h |  3 ---
> >  2 files changed, 36 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > index 44e24da33907..052e396a28af 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > @@ -455,36 +455,3 @@ void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >  	ipu6_dma_unmap_sg(sys, sgt->sgl, sgt->nents, dir, attrs);
> >  }
> >  EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sgtable, "INTEL_IPU6");
> > -
> > -/*
> > - * Create scatter-list for the already allocated DMA buffer
> > - */
> > -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> > -			 void *cpu_addr, dma_addr_t handle, size_t size,
> > -			 unsigned long attrs)
> > -{
> > -	struct device *dev = &sys->auxdev.dev;
> > -	struct ipu6_mmu *mmu = sys->mmu;
> > -	struct vm_info *info;
> > -	int n_pages;
> > -	int ret = 0;
> > -
> > -	info = get_vm_info(mmu, handle);
> > -	if (!info)
> > -		return -EFAULT;
> > -
> > -	if (!info->vaddr)
> > -		return -EFAULT;
> > -
> > -	if (WARN_ON(!info->pages))
> > -		return -ENOMEM;
> > -
> > -	n_pages = PFN_UP(size);
> > -
> > -	ret = sg_alloc_table_from_pages(sgt, info->pages, n_pages, 0, size,
> > -					GFP_KERNEL);
> > -	if (ret)
> > -		dev_warn(dev, "get sgt table failed\n");
> > -
> > -	return ret;
> > -}
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> > index b51244add9e6..2882850d9366 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
> > @@ -43,7 +43,4 @@ int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >  			 enum dma_data_direction dir, unsigned long attrs);
> >  void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> >  			    enum dma_data_direction dir, unsigned long attrs);
> > -int ipu6_dma_get_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
> > -			 void *cpu_addr, dma_addr_t handle, size_t size,
> > -			 unsigned long attrs);
> 
> ipu6_dma_get_sgtable() is used in downstream PS driver, I don't think it
> is necessary to remove it as it will be hard to integrate with downstream PS
> driver.

When will there be an upstream PSYS driver?

I suppose you can just as well apply a revert of this patch to your
downstream tree?

-- 
Kind regards,

Sakari Ailus

