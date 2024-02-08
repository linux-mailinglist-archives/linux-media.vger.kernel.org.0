Return-Path: <linux-media+bounces-4859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C784E203
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 14:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52172906B6
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 13:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72325763F7;
	Thu,  8 Feb 2024 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggyadpt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688E763FF
	for <linux-media@vger.kernel.org>; Thu,  8 Feb 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399116; cv=none; b=glHv1VCyQhSzcks1Qbk4J1dnV19Z7v9++ZIUK7sRA48el7bbD+miN3nqN4/VC6mYsYMtJOX67RarDqIQgkFCOesb18gc3hNxf3j1Z9VKFM4/Lu4dsvetUaH0i6/ziQQElU5ftry1vgKkBgBBrM8XkPR1+pry6eU8fyNiA0DdjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399116; c=relaxed/simple;
	bh=Wl5FkmFzgsXXflrnteBiGWhJ12DGOqK+tyMOhgKuiOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+csh/B2RLd8j7DimCxcdvqvZbZMTbOSJ0ZJbjsBg3gzSN5cRWnDxufwrOZXKVBDjT8XiRQ7m9RWcwbaFQGL+2LQvii/WUFGWEXneEv+SzRw8llOB8xRzRxm+FjTcIYO2UuY3LhsmhITtWIrRTMGWbArlZnsauon5DAUw1/j3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggyadpt9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707399115; x=1738935115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wl5FkmFzgsXXflrnteBiGWhJ12DGOqK+tyMOhgKuiOM=;
  b=ggyadpt9uiAJ7VdPFwa+7po/o3WNEricegWfVldd1tzq9MNP7UYGyihv
   6Hhcr7M8MhYKnmuIKXUk1wTUYfrAHlzgJl121iVRqz8cNCh4kyU3pIUCK
   thiQPw97QBYYlBzyfmCNkN/+zOoaiWazYOi9DaWPLYL4UR9BaWLNZz4BE
   qBQhIYji51DIkZGxWydIaaCLhoLp0QL861KZbOiLSvI2UxDufwsCkxVox
   TIgaLlvM3w6xydz/PEVw5oxzeB/nxAoD56th2bjL7AiLk/CjuDGfxqJPC
   GbSyowp6zmVH3Eg3yw+Qc27BK/OgVwzlzImzwOgZcXLR/AzHo1qbCnAV5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1363000"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1363000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1953448"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 05:31:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY4V9-0003mK-2V;
	Thu, 08 Feb 2024 13:31:39 +0000
Date: Thu, 8 Feb 2024 21:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 37/39]
 drivers/media/pci/intel/ipu3/ipu3-cio2.c:1698:1-6: WARNING: invalid free of
 devm_ allocated data
Message-ID: <202402082104.K7l4QATL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   f94611d22fa335b7dabf2e7356b4486e5a1f8907
commit: fe3ba53caaf90a9499ff44949efc31f6cb34d7e0 [37/39] unref test
config: x86_64-randconfig-r053-20240208 (https://download.01.org/0day-ci/archive/20240208/202402082104.K7l4QATL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402082104.K7l4QATL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu3/ipu3-cio2.c:1698:1-6: WARNING: invalid free of devm_ allocated data
   drivers/media/pci/intel/ipu3/ipu3-cio2.c:1742:1-6: WARNING: invalid free of devm_ allocated data

vim +1698 drivers/media/pci/intel/ipu3/ipu3-cio2.c

803abec64ef9d3 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally 2021-01-07  1685  
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1686  static void cio2_media_release(struct media_device *mdev)
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1687  {
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1688  	struct cio2_device *cio2 =
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1689  		container_of(mdev, struct cio2_device, media_dev);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1690  
c24173726c0e70 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2023-10-05  1691  	printk("cio2 media release\n");
c24173726c0e70 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2023-10-05  1692  
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1693  	v4l2_async_nf_cleanup(&cio2->notifier);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1694  	cio2_queues_exit(cio2);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1695  	cio2_fbpt_exit_dummy(cio2);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1696  	mutex_destroy(&cio2->lock);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1697  
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20 @1698  	kfree(cio2);
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1699  }
1812a9376b1c6b drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1700  

:::::: The code at line 1698 was first introduced by commit
:::::: 1812a9376b1c6b78744fd6af0a05c2077977f6a9 media: ipu3-cio2: Release the cio2 device context by media device callback

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

