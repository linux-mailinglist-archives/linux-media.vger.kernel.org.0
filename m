Return-Path: <linux-media+bounces-29737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C56A82483
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751DD8A67BC
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9E225EF80;
	Wed,  9 Apr 2025 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icHDAu+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C7A25DD15
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201256; cv=none; b=QutdsjTpe9bFybGpM6aTaAYD60UIldSzOEwHA5/hXNd+frJjWuHhsBPHwmkWHSyowoPaz+c4L7FtCVGsAUFlpJY0/xYpF/3T8Wm5CoCikonqHIXZJtLf7HwgjJTHhYwIKOwIdMzXKJNH+CoLX2gOp7bzOcAwkoOtAVLBNM6T4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201256; c=relaxed/simple;
	bh=aZlLWL0Dxl/CJ1OkYJNQtFq8uS4FhTUdHVhx3t5X6cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn2MCNkG3JZwnrLAdz9jIxzODm5+WicIZn16m368/gs7TzFKPgyyMuZX+6uSP8hNoay8ql3x4reW95mE7MOW5+nZuPRWzHyJ9wMEssPcM9NMeCkll3zUag1RB/h42w2/QXFNNJLvkgGvF/Jf2a1QmQ4PzIaZiZAVXuyTyWDM1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icHDAu+v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744201254; x=1775737254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZlLWL0Dxl/CJ1OkYJNQtFq8uS4FhTUdHVhx3t5X6cU=;
  b=icHDAu+vToFmwLfHWwlV2dUgg4EkAD7qEYIId6IGCv/XBvH9Q21qJ2kl
   vOn/9k9e1fHF6AU0nbogi6xS3NgzJ96g+gZwAoYNnHkc2DxzhZnC1Cleg
   X1ho04H4MEVZ+XV/sjyFYqo9uyhmqkL5QBq6YoLFQf8NC8Shcrg0Wzjxg
   AgwDbtfLzz1t9k6GUOfNrpcT1HCLMcGisa/oPUjCRtjHrmDJCnSnfdrrW
   z513y+GtzZhV0HG4Svl7u2gWYuqE9CYcmvLwc+SWSra4CJPQzl0WA1cse
   AHeDNKqpJKUsk9VqYzzIWJmWek3zK/qN/thdw965XW3TpaK12gZWzsUMv
   Q==;
X-CSE-ConnectionGUID: qWERzPPPRymXhsHVWxmbRw==
X-CSE-MsgGUID: /3hmXO8LRX6FZDeRNNLQxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55851374"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="55851374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:20:54 -0700
X-CSE-ConnectionGUID: VfM+BUCHQTe0jvMoQrpUgQ==
X-CSE-MsgGUID: YophaTucSkmuFHBHIk5A0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="159545281"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Apr 2025 05:20:52 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2UQD-0008pT-28;
	Wed, 09 Apr 2025 12:20:49 +0000
Date: Wed, 9 Apr 2025 20:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
Message-ID: <202504092031.rZzXFFce-lkp@intel.com>
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

Hi Stanislaw,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislaw-Gruszka/media-intel-ipu6-Fix-dma-mask-for-non-secure-mode/20250409-180044
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250409095825.1014521-1-stanislaw.gruszka%40linux.intel.com
patch subject: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
config: i386-buildonly-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092031.rZzXFFce-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092031.rZzXFFce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092031.rZzXFFce-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-dma.c: In function 'ipu6_dma_alloc':
>> drivers/media/pci/intel/ipu6/ipu6-dma.c:174:16: error: implicit declaration of function 'ipu6_alloc_iova'; did you mean 'ipu_alloc_iova'? [-Werror=implicit-function-declaration]
     174 |         iova = ipu6_alloc_iova(mmu, count);
         |                ^~~~~~~~~~~~~~~
         |                ipu_alloc_iova
>> drivers/media/pci/intel/ipu6/ipu6-dma.c:174:14: warning: assignment to 'struct iova *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     174 |         iova = ipu6_alloc_iova(mmu, count);
         |              ^
   drivers/media/pci/intel/ipu6/ipu6-dma.c: In function 'ipu6_dma_map_sg':
   drivers/media/pci/intel/ipu6/ipu6-dma.c:399:14: warning: assignment to 'struct iova *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     399 |         iova = ipu6_alloc_iova(mmu, npages);
         |              ^
   cc1: some warnings being treated as errors
--
   drivers/media/pci/intel/ipu6/ipu6-mmu.c: In function 'allocate_trash_buffer':
>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:424:16: error: implicit declaration of function 'ipu6_alloc_iova'; did you mean 'ipu_alloc_iova'? [-Werror=implicit-function-declaration]
     424 |         iova = ipu6_alloc_iova(mmu, n_pages);
         |                ^~~~~~~~~~~~~~~
         |                ipu_alloc_iova
>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:424:14: warning: assignment to 'struct iova *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     424 |         iova = ipu6_alloc_iova(mmu, n_pages);
         |              ^
   cc1: some warnings being treated as errors


vim +174 drivers/media/pci/intel/ipu6/ipu6-dma.c

   151	
   152	void *ipu6_dma_alloc(struct ipu6_bus_device *sys, size_t size,
   153			     dma_addr_t *dma_handle, gfp_t gfp,
   154			     unsigned long attrs)
   155	{
   156		struct device *dev = &sys->auxdev.dev;
   157		struct pci_dev *pdev = sys->isp->pdev;
   158		dma_addr_t pci_dma_addr, ipu6_iova;
   159		struct ipu6_mmu *mmu = sys->mmu;
   160		struct vm_info *info;
   161		unsigned long count;
   162		struct page **pages;
   163		struct iova *iova;
   164		unsigned int i;
   165		int ret;
   166	
   167		info = kzalloc(sizeof(*info), GFP_KERNEL);
   168		if (!info)
   169			return NULL;
   170	
   171		size = PAGE_ALIGN(size);
   172		count = PHYS_PFN(size);
   173	
 > 174		iova = ipu6_alloc_iova(mmu, count);
   175		if (!iova)
   176			goto out_kfree;
   177	
   178		pages = __alloc_buffer(size, gfp, attrs);
   179		if (!pages)
   180			goto out_free_iova;
   181	
   182		dev_dbg(dev, "dma_alloc: size %zu iova low pfn %lu, high pfn %lu\n",
   183			size, iova->pfn_lo, iova->pfn_hi);
   184		for (i = 0; iova->pfn_lo + i <= iova->pfn_hi; i++) {
   185			pci_dma_addr = dma_map_page_attrs(&pdev->dev, pages[i], 0,
   186							  PAGE_SIZE, DMA_BIDIRECTIONAL,
   187							  attrs);
   188			dev_dbg(dev, "dma_alloc: mapped pci_dma_addr %pad\n",
   189				&pci_dma_addr);
   190			if (dma_mapping_error(&pdev->dev, pci_dma_addr)) {
   191				dev_err(dev, "pci_dma_mapping for page[%d] failed", i);
   192				goto out_unmap;
   193			}
   194	
   195			ret = ipu6_mmu_map(mmu->dmap->mmu_info,
   196					   PFN_PHYS(iova->pfn_lo + i), pci_dma_addr,
   197					   PAGE_SIZE);
   198			if (ret) {
   199				dev_err(dev, "ipu6_mmu_map for pci_dma[%d] %pad failed",
   200					i, &pci_dma_addr);
   201				dma_unmap_page_attrs(&pdev->dev, pci_dma_addr,
   202						     PAGE_SIZE, DMA_BIDIRECTIONAL,
   203						     attrs);
   204				goto out_unmap;
   205			}
   206		}
   207	
   208		info->vaddr = vmap(pages, count, VM_USERMAP, PAGE_KERNEL);
   209		if (!info->vaddr)
   210			goto out_unmap;
   211	
   212		*dma_handle = PFN_PHYS(iova->pfn_lo);
   213	
   214		info->pages = pages;
   215		info->ipu6_iova = *dma_handle;
   216		info->size = size;
   217		list_add(&info->list, &mmu->vma_list);
   218	
   219		return info->vaddr;
   220	
   221	out_unmap:
   222		while (i--) {
   223			ipu6_iova = PFN_PHYS(iova->pfn_lo + i);
   224			pci_dma_addr = ipu6_mmu_iova_to_phys(mmu->dmap->mmu_info,
   225							     ipu6_iova);
   226			dma_unmap_page_attrs(&pdev->dev, pci_dma_addr, PAGE_SIZE,
   227					     DMA_BIDIRECTIONAL, attrs);
   228	
   229			ipu6_mmu_unmap(mmu->dmap->mmu_info, ipu6_iova, PAGE_SIZE);
   230		}
   231	
   232		__free_buffer(pages, size, attrs);
   233	
   234	out_free_iova:
   235		__free_iova(&mmu->dmap->iovad, iova);
   236	out_kfree:
   237		kfree(info);
   238	
   239		return NULL;
   240	}
   241	EXPORT_SYMBOL_NS_GPL(ipu6_dma_alloc, "INTEL_IPU6");
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

