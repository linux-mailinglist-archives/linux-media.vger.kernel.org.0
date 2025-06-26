Return-Path: <linux-media+bounces-35923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF9AE947E
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 05:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6401725FD
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 03:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75C519B5B1;
	Thu, 26 Jun 2025 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXUmfQAm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3763711713
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750907346; cv=none; b=NZHUUmvst+bu2xoiDGIvjQwuHvuQgBSjf1ADkBv64YBiNvOapKzWw7ew4kbspqilTzW0Dp+VT28nh2C1AoMYjkdIoMjXRE9YYC/15xW9D3fGIKAhNVWvtbL5MiQistLW5ZxT2tY8BWqk/SSQ82DvVyxxNNnOUEmOP2ATWrbPYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750907346; c=relaxed/simple;
	bh=NNlcK+ALoq4TBH+8sw6kCjc2xII8Ttj+tDGJwPW270s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjOma7xAY6CH8OdhIH8fzkjiIonnS2BB2VsVo5GsMYL6lbiFICDc2DEKGJ0GjFKzV2lIa+FSzkvgar07X6sJm4k82yU/OW8EpuYrz7dgeRkl0Uu2MkUPK8SfRkwVV35V/nLWgcgkPKB0pAV/xpDgMS2OsoVRg0gNieHSoqJVfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXUmfQAm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750907344; x=1782443344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNlcK+ALoq4TBH+8sw6kCjc2xII8Ttj+tDGJwPW270s=;
  b=EXUmfQAmLVXS2gb6A4utb138zK4BNxdxkOrhHAqdFu6mVvBOcs0Twc7I
   tQX24SaSrGGhOUkfqRDeKttn4EPrFQXozVmDx+1b5EkTH6OMOpfZ94gPj
   nUZKu1LUqor+gjxxYGYzXIhusDxwm19oIQWatZ7YoxiB8MvZDOWF3WU+u
   /DRGUfB30vqrr7cixUaT3f5ygUCg6WQfEghfp99fGFMmQDkRKJgbtyEKT
   huWKrn6cRzP8o68wzqC39SuqgJif0GFd5tG4Cdx8cSLcrH/wM53TrXG1C
   QuCEEhYyIjS/z9n/A0idh7jGq2OWFNyVlYyYWaegifJHwqF6wvXwRJBAU
   A==;
X-CSE-ConnectionGUID: rqzgEhjjRmGW7EZKCBtn9g==
X-CSE-MsgGUID: nOA3X56SSNqPGRgt5S6+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53336602"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53336602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:09:02 -0700
X-CSE-ConnectionGUID: 1CkbqfaKSO6Bm7CfaUROQQ==
X-CSE-MsgGUID: 4+luV0VoSK27Y0y3XCV+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152565259"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jun 2025 20:09:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUcyw-000Tew-0Q;
	Thu, 26 Jun 2025 03:08:58 +0000
Date: Thu, 26 Jun 2025 11:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:ipu7 7/7]
 drivers/staging/media/ipu7/ipu7-boot.c:212:6: warning: variable
 'total_queue_size' set but not used
Message-ID: <202506261100.HLBItoq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bingbu,

First bad commit (maybe != root cause):

tree:   git://linuxtv.org/sailus/media_tree.git ipu7
head:   0542d88a01679ac03a980f7d53daefe8caebe345
commit: 0542d88a01679ac03a980f7d53daefe8caebe345 [7/7] media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250626/202506261100.HLBItoq7-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261100.HLBItoq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261100.HLBItoq7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7-boot.c:212:6: warning: variable 'total_queue_size' set but not used [-Wunused-but-set-variable]
     212 |         u32 total_queue_size = 0, total_queue_size_aligned = 0;
         |             ^
   1 warning generated.


vim +/total_queue_size +212 drivers/staging/media/ipu7/ipu7-boot.c

d9b3da4f62a7a18 Bingbu Cao 2025-05-29  206  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  207  int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  208  			       struct syscom_queue_config *qconfigs,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  209  			       int num_queues, u32 uc_freq,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  210  			       dma_addr_t subsys_config, u8 major)
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  211  {
d9b3da4f62a7a18 Bingbu Cao 2025-05-29 @212  	u32 total_queue_size = 0, total_queue_size_aligned = 0;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  213  	struct ipu7_syscom_context *syscom = adev->syscom;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  214  	struct ia_gofo_boot_config *boot_config;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  215  	struct syscom_queue_params_config *cfgs;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  216  	struct device *dev = &adev->auxdev.dev;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  217  	struct syscom_config_s *syscfg;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  218  	dma_addr_t queue_mem_dma_ptr;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  219  	void *queue_mem_ptr;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  220  	unsigned int i;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  221  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  222  	dev_dbg(dev, "boot config queues_nr: %d freq: %u sys_conf: 0x%pad\n",
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  223  		num_queues, uc_freq, &subsys_config);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  224  	/* Allocate boot config. */
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  225  	adev->boot_config_size =
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  226  		sizeof(*cfgs) * num_queues + sizeof(*boot_config);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  227  	adev->boot_config = ipu7_dma_alloc(adev, adev->boot_config_size,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  228  					   &adev->boot_config_dma_addr,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  229  					   GFP_KERNEL, 0);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  230  	if (!adev->boot_config) {
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  231  		dev_err(dev, "Failed to allocate boot config.\n");
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  232  		return -ENOMEM;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  233  	}
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  234  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  235  	boot_config = adev->boot_config;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  236  	memset(boot_config, 0, sizeof(struct ia_gofo_boot_config));
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  237  	init_boot_config(boot_config, adev->boot_config_size, major);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  238  	boot_config->subsys_config = subsys_config;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  239  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  240  	boot_config->uc_tile_frequency = uc_freq;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  241  	boot_config->uc_tile_frequency_units =
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  242  		IA_GOFO_FW_BOOT_UC_FREQUENCY_UNITS_MHZ;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  243  	boot_config->syscom_context_config.max_output_queues =
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  244  		syscom->num_output_queues;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  245  	boot_config->syscom_context_config.max_input_queues =
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  246  		syscom->num_input_queues;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  247  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  248  	ipu7_dma_sync_single(adev, adev->boot_config_dma_addr,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  249  			     adev->boot_config_size);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  250  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  251  	for (i = 0; i < num_queues; i++) {
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  252  		u32 queue_size = qconfigs[i].max_capacity *
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  253  			qconfigs[i].token_size_in_bytes;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  254  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  255  		total_queue_size += queue_size;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  256  		queue_size = ALIGN(queue_size, 64U);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  257  		total_queue_size_aligned += queue_size;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  258  		qconfigs[i].queue_size = queue_size;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  259  	}
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  260  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  261  	/* Allocate queue memory */
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  262  	syscom->queue_mem = ipu7_dma_alloc(adev, total_queue_size_aligned,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  263  					   &syscom->queue_mem_dma_addr,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  264  					   GFP_KERNEL, 0);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  265  	if (!syscom->queue_mem) {
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  266  		dev_err(dev, "Failed to allocate queue memory.\n");
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  267  		return -ENOMEM;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  268  	}
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  269  	syscom->queue_mem_size = total_queue_size_aligned;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  270  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  271  	syscfg = &boot_config->syscom_context_config;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  272  	cfgs = ipu7_syscom_get_queue_config(syscfg);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  273  	queue_mem_ptr = syscom->queue_mem;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  274  	queue_mem_dma_ptr = syscom->queue_mem_dma_addr;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  275  	for (i = 0; i < num_queues; i++) {
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  276  		cfgs[i].token_array_mem = queue_mem_dma_ptr;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  277  		cfgs[i].max_capacity = qconfigs[i].max_capacity;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  278  		cfgs[i].token_size_in_bytes = qconfigs[i].token_size_in_bytes;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  279  		qconfigs[i].token_array_mem = queue_mem_ptr;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  280  		queue_mem_dma_ptr += qconfigs[i].queue_size;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  281  		queue_mem_ptr += qconfigs[i].queue_size;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  282  	}
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  283  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  284  	ipu7_dma_sync_single(adev, syscom->queue_mem_dma_addr,
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  285  			     total_queue_size_aligned);
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  286  
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  287  	return 0;
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  288  }
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  289  EXPORT_SYMBOL_NS_GPL(ipu7_boot_init_boot_config, "INTEL_IPU7");
d9b3da4f62a7a18 Bingbu Cao 2025-05-29  290  

:::::: The code at line 212 was first introduced by commit
:::::: d9b3da4f62a7a182b5689c5b822c43c5b4053fd4 media: staging/ipu7: add firmware parse, syscom interface and boot

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

