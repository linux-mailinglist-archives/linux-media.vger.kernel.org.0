Return-Path: <linux-media+bounces-29744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFDA8261E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 15:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B488C74B8
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E43626738A;
	Wed,  9 Apr 2025 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm6YPMsb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C595266590
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204503; cv=none; b=kAufE+yNFVwz2LlgrpNyYGbb5OXbs8pq4jA5fZ/+t56Fg1XMQKip2r0GzYx+O7ypjoQ7mfI1JrVtjpz2Qg1it0K5vifQ8MHUXtWP4/18KGb+AMpGCokizeEl2vMr1jkOjbIoRIe4qXeb+4fd5DOMQLR+3zo2LC87+TJ5YFgVV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204503; c=relaxed/simple;
	bh=FhmVc71x2nRmYuVjQNQlp3cMGtbL1AwTcJ2b8yeVnSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/WpIwqkEXMQAb2pA+yX20BnmDiufwi15sWs08UyqNwITW4gal0eiybK6Lh3e0CyKlF9i0wZsxOMGuB5NvToja7epSoMT7lPmB4olNymwPNBArBkMvlpc8IWGA0W2AmY1d//shnUpgEK+6vBcDMETCYLxuxk65k3HMOxOXiZOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm6YPMsb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744204501; x=1775740501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FhmVc71x2nRmYuVjQNQlp3cMGtbL1AwTcJ2b8yeVnSg=;
  b=Tm6YPMsbMBnlz4ydN8vafQDZHSMjenBfwWiL/r72rjEWRG0RedSqDKom
   8Q9ErRg+TK9WxqY6g0xvlRN3MicdO+ykEoPUmvcs/AhH3t5hJvyc9ApF7
   qXbbsA5MbUYM7xoC6wBKxD5RhE6yEfNkCpvgdpoR5TerKj7BUNODcYUvC
   1sibB/wRwlFI6nTjkrCJDA7y+jFiOGrE/yWxAlZ7XVxUtgNOfN7LBi2J6
   urXkC2Kf2kKlGyPOO7vTrerbU3yM8ZXLE1KEYkod4mUSV4tMOyz1A1QjG
   iz+aZgY2KNN8FvMVfCFdnOikXBDHC4C/n+HGgK3JffZYsNAnkRWH5y1xL
   w==;
X-CSE-ConnectionGUID: uo/nW9VETUOvJwEg198dSg==
X-CSE-MsgGUID: 9d+WUGYAR2O1M6gXnCC6qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45810810"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45810810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:15:00 -0700
X-CSE-ConnectionGUID: ZDv5teUUQmGjOY1UfE1e3w==
X-CSE-MsgGUID: uyidne2PSY2qAA2t0P3LgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133721939"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2025 06:14:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2VGZ-0008sL-2R;
	Wed, 09 Apr 2025 13:14:55 +0000
Date: Wed, 9 Apr 2025 21:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH] media: intel/ipu6: Fix dma mask for non-secure mode
Message-ID: <202504092006.r3kxuxvV-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092006.r3kxuxvV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092006.r3kxuxvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092006.r3kxuxvV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-dma.c:174:9: error: call to undeclared function 'ipu6_alloc_iova'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     174 |         iova = ipu6_alloc_iova(mmu, count);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-dma.c:174:9: note: did you mean 'ipu_alloc_iova'?
   drivers/media/pci/intel/ipu6/ipu6-mmu.h:80:28: note: 'ipu_alloc_iova' declared here
      80 | static inline struct iova *ipu_alloc_iova(struct ipu6_mmu *mmu,
         |                            ^
>> drivers/media/pci/intel/ipu6/ipu6-dma.c:174:7: error: incompatible integer to pointer conversion assigning to 'struct iova *' from 'int' [-Wint-conversion]
     174 |         iova = ipu6_alloc_iova(mmu, count);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/ipu6-dma.c:399:9: error: call to undeclared function 'ipu6_alloc_iova'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |         iova = ipu6_alloc_iova(mmu, npages);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-dma.c:399:7: error: incompatible integer to pointer conversion assigning to 'struct iova *' from 'int' [-Wint-conversion]
     399 |         iova = ipu6_alloc_iova(mmu, npages);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:424:9: error: call to undeclared function 'ipu6_alloc_iova'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     424 |         iova = ipu6_alloc_iova(mmu, n_pages);
         |                ^
   drivers/media/pci/intel/ipu6/ipu6-mmu.c:424:9: note: did you mean 'ipu_alloc_iova'?
   drivers/media/pci/intel/ipu6/ipu6-mmu.h:80:28: note: 'ipu_alloc_iova' declared here
      80 | static inline struct iova *ipu_alloc_iova(struct ipu6_mmu *mmu,
         |                            ^
>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:424:7: error: incompatible integer to pointer conversion assigning to 'struct iova *' from 'int' [-Wint-conversion]
     424 |         iova = ipu6_alloc_iova(mmu, n_pages);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/ipu6_alloc_iova +174 drivers/media/pci/intel/ipu6/ipu6-dma.c

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

