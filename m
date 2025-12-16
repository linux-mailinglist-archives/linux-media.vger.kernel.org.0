Return-Path: <linux-media+bounces-48913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD89CC3F09
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31D0E3016CFE
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A383D368266;
	Tue, 16 Dec 2025 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Av8pPVjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE034E277;
	Tue, 16 Dec 2025 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898896; cv=none; b=XS29F2rKv6EaYQf0IJ2kMJW8IfSt2T15GBuTG0v9DY+h/YZGopH9/Akl/LN3MRVLq6sXu4NltODS65M0yOiWEA4we7zOAUvO/x+qAcUyI6jqZ0vxCVx8NxekYpZVJ2njEyXR+rk4FRTGcwHLC8VuI+3s6/cBXyiVR2VTNbgxaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898896; c=relaxed/simple;
	bh=OiPjy41smsg2vZ8lV6j2pL67N3Pwufmjdt5efQFRXv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPlR2wttrKBdzl6H0mfuCOlqQThz5hwOFaKAijIJ3P5dM6G4c6wsXcyRKaL9y/kU/KmaZ0YkYtGAZszkkECmvofzELOVmNXMymjE3u1Qamn+al7GJHIGSoPQ1c+XN+vj1EgfCVQ7yO0wTA5TmydJo0w5S6Cv8hXWME9kwTBufng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Av8pPVjQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898894; x=1797434894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OiPjy41smsg2vZ8lV6j2pL67N3Pwufmjdt5efQFRXv8=;
  b=Av8pPVjQA+jMfiCoOfL38J5fggqs5D5TvHJMMt27w/dBzIEvEgvRopAa
   YIEZtA/I/TbfslqLvtMr/70xG144fAGF03zw91gSlve5FCFMJ9jb6im/5
   C8ut9ZDxYh1G0TJfI/rdS5Ac/g/IlAB/IBMvtJFq7rljpAEnB/Kyudt7X
   +B9mguXbu5xQfuGJr2LRMY17M4t1tUPozXveSRz2WPNyAL4VNo6W49cIf
   C2lmQCrwMTFNkufP7wBxELOlBb/TTutQZGhQPKebkE95RZR8CYTjQ5Ubq
   r8dHkqoC4DwY1fYvVVIHYeSgpXpyCFadcHXn0RQ2fCIh2jSqKpv0Wwn8R
   g==;
X-CSE-ConnectionGUID: d+gI8TFnRty9zfeeLovGeQ==
X-CSE-MsgGUID: cr39dE+uQ7K1D9k2t4pwqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79187669"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="79187669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:28:13 -0800
X-CSE-ConnectionGUID: oLa368tfS0qHbQBAEqnyDQ==
X-CSE-MsgGUID: +Bg9VXJkTNq1ucbZThjCCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202458914"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 07:28:08 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWy6-000000003RE-30Ow;
	Tue, 16 Dec 2025 15:28:06 +0000
Date: Tue, 16 Dec 2025 23:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <202512162315.lcRwm6Mr-lkp@intel.com>
References: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215085349.10155-6-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc1 next-20251216]
[cannot apply to robh/for-next rockchip/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20251215-165740
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215085349.10155-6-benjamin.gaignard%40collabora.com
patch subject: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
config: arm-randconfig-r063-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162315.lcRwm6Mr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162315.lcRwm6Mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162315.lcRwm6Mr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/vsi-iommu.c:231:3: error: call to undeclared function 'report_iommu_fault'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |                 report_iommu_fault(iommu->domain, iommu->dev, iova, status);
         |                 ^
>> drivers/iommu/vsi-iommu.c:245:21: error: no member named 'iommu_fwnode' in 'struct iommu_fwspec'
     245 |                                                              fwspec->iommu_fwnode);
         |                                                              ~~~~~~  ^
>> drivers/iommu/vsi-iommu.c:254:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     254 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                                   ^
   drivers/iommu/vsi-iommu.c:254:28: note: did you mean 'dev_iommu_fwspec_get'?
   include/linux/iommu.h:1457:36: note: 'dev_iommu_fwspec_get' declared here
    1457 | static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
         |                                    ^
>> drivers/iommu/vsi-iommu.c:254:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
     254 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/vsi-iommu.c:496:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                                   ^
   drivers/iommu/vsi-iommu.c:496:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
     496 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/vsi-iommu.c:519:38: error: variable has incomplete type 'const struct iommu_domain_ops'
     519 | static const struct iommu_domain_ops vsi_identity_ops = {
         |                                      ^
   include/linux/iommu.h:40:8: note: forward declaration of 'struct iommu_domain_ops'
      40 | struct iommu_domain_ops;
         |        ^
   drivers/iommu/vsi-iommu.c:571:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     571 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                                   ^
   drivers/iommu/vsi-iommu.c:571:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
     571 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/vsi-iommu.c:644:2: error: call to undeclared function 'dev_iommu_priv_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     644 |         dev_iommu_priv_set(dev, iommu);
         |         ^
   drivers/iommu/vsi-iommu.c:650:28: error: call to undeclared function 'dev_iommu_priv_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     650 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                                   ^
   drivers/iommu/vsi-iommu.c:650:20: error: incompatible integer to pointer conversion initializing 'struct vsi_iommu *' with an expression of type 'int' [-Wint-conversion]
     650 |         struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
         |                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/vsi-iommu.c:657:35: error: passing 'const uint32_t[16]' (aka 'const unsigned int[16]') to parameter of type 'u32 *' (aka 'unsigned int *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     657 |         return iommu_fwspec_add_ids(dev, args->args, 1);
         |                                          ^~~~~~~~~~
   include/linux/iommu.h:1451:65: note: passing argument to parameter 'ids' here
    1451 | static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
         |                                                                 ^
>> drivers/iommu/vsi-iommu.c:667:18: error: use of undeclared identifier 'generic_single_device_group'
     667 |         .device_group = generic_single_device_group,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/vsi-iommu.c:669:25: error: variable has incomplete type 'const struct iommu_domain_ops'
     669 |         .default_domain_ops = &(const struct iommu_domain_ops) {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     670 |                 .attach_dev             = vsi_iommu_attach_device,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     671 |                 .map_pages              = vsi_iommu_map,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     672 |                 .unmap_pages            = vsi_iommu_unmap,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     673 |                 .flush_iotlb_all        = vsi_iommu_flush_tlb_all,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     674 |                 .iova_to_phys           = vsi_iommu_iova_to_phys,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     675 |                 .free                   = vsi_iommu_domain_free,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     676 |         }
         |         ~
   include/linux/iommu.h:40:8: note: forward declaration of 'struct iommu_domain_ops'
      40 | struct iommu_domain_ops;
         |        ^
   15 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VSI_IOMMU
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARCH_ROCKCHIP [=n] && ARM64 || COMPILE_TEST [=y])
   Selected by [m]:
   - VIDEO_HANTRO_ROCKCHIP [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_HANTRO [=m] && (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y])


vim +/report_iommu_fault +231 drivers/iommu/vsi-iommu.c

b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  214  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  215  static irqreturn_t vsi_iommu_irq(int irq, void *dev_id)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  216  {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  217  	struct vsi_iommu *iommu = dev_id;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  218  	unsigned long flags;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  219  	dma_addr_t iova;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  220  	u32 status;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  221  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  222  	if (pm_runtime_resume_and_get(iommu->dev) < 0)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  223  		return IRQ_NONE;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  224  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  225  	spin_lock_irqsave(&iommu->lock, flags);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  226  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  227  	status = readl(iommu->regs + VSI_MMU_STATUS_BASE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  228  	if (status & VSI_MMU_IRQ_MASK) {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  229  		dev_err(iommu->dev, "unexpected int_status=%08x\n", status);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  230  		iova = readl(iommu->regs + VSI_MMU_PAGE_FAULT_ADDR);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @231  		report_iommu_fault(iommu->domain, iommu->dev, iova, status);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  232  	}
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  233  	writel(0, iommu->regs + VSI_MMU_STATUS_BASE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  234  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  235  	spin_unlock_irqrestore(&iommu->lock, flags);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  236  	pm_runtime_put_autosuspend(iommu->dev);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  237  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  238  	return IRQ_HANDLED;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  239  }
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  240  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  241  static struct vsi_iommu *vsi_iommu_get_from_dev(struct device *dev)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  242  {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  243  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  244  	struct device *iommu_dev = bus_find_device_by_fwnode(&platform_bus_type,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @245  							     fwspec->iommu_fwnode);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  246  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  247  	put_device(iommu_dev);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  248  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  249  	return iommu_dev ? dev_get_drvdata(iommu_dev) : NULL;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  250  }
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  251  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  252  static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  253  {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @254  	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  255  	struct vsi_iommu_domain *vsi_domain;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  256  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  257  	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  258  	if (!vsi_domain)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  259  		return NULL;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  260  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  261  	vsi_domain->dev = iommu->dev;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  262  	spin_lock_init(&vsi_domain->lock);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  263  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  264  	/*
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  265  	 * iommu use a 2 level pagetable.
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  266  	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  267  	 * Allocate one 4 KiB page for each table.
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  268  	 */
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  269  	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  270  					      SPAGE_SIZE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  271  	if (!vsi_domain->dt)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  272  		goto err_free_domain;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  273  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  274  	vsi_domain->dt_dma = dma_map_single(vsi_domain->dev, vsi_domain->dt,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  275  					    SPAGE_SIZE, DMA_TO_DEVICE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  276  	if (dma_mapping_error(vsi_domain->dev, vsi_domain->dt_dma)) {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  277  		dev_err(dev, "DMA map error for DT\n");
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  278  		goto err_free_dt;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  279  	}
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  280  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  281  	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  282  					       SPAGE_SIZE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  283  	if (!vsi_domain->pta)
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  284  		goto err_unmap_dt;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  285  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  286  	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  287  	vsi_domain->pta_dma = dma_map_single(vsi_domain->dev, vsi_domain->pta,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  288  					     SPAGE_SIZE, DMA_TO_DEVICE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  289  	if (dma_mapping_error(vsi_domain->dev, vsi_domain->pta_dma)) {
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  290  		dev_err(dev, "DMA map error for PTA\n");
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  291  		goto err_free_pta;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  292  	}
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  293  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  294  	INIT_LIST_HEAD(&vsi_domain->iommus);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  295  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  296  	vsi_domain->domain.geometry.aperture_start = 0;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  297  	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  298  	vsi_domain->domain.geometry.force_aperture = true;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  299  	vsi_domain->domain.pgsize_bitmap	   = SZ_4K;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  300  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  301  	return &vsi_domain->domain;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  302  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  303  err_free_pta:
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  304  	iommu_free_pages(vsi_domain->pta);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  305  err_unmap_dt:
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  306  	dma_unmap_single(vsi_domain->dev, vsi_domain->dt_dma,
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  307  			 SPAGE_SIZE, DMA_TO_DEVICE);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  308  err_free_dt:
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  309  	iommu_free_pages(vsi_domain->dt);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  310  err_free_domain:
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  311  	kfree(vsi_domain);
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  312  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  313  	return NULL;
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  314  }
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

