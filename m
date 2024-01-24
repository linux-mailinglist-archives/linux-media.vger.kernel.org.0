Return-Path: <linux-media+bounces-4127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A054C83A064
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 05:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A5B1F2A82F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 04:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2503DBE45;
	Wed, 24 Jan 2024 04:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFVFcoSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC418838
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706070115; cv=none; b=dOEx7E0zv+z+49kuLrP6ylKHf9LMSkSdFASjaU1diA3M9fUyGFekvkxV5KPWFfK/Vx49uIXrAoe3vMALMmWrsr/ef85wpxlPCi0OUBNOjJxUJa2flMMygeS2mU2/9GTeTeOVwg1c8Ms05tbv8WZXZKh5xlXqFP9Q7sG9VOQJob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706070115; c=relaxed/simple;
	bh=PpDkTA2OF6y0hR8VZk3wnTQb/ElAhPx7ECUoZ6LspOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJy0AiLXlRz8MdAdoBf7V6yud8z+gZ+WNevubyRFu1yqti+b1UY12keuc83+PJ29LTq9gdVxaDdZQj/Lvy4J1HBeKF28WMZKyIOg5bQQkOwnezmokGnGFNFpp+PIsZTxGTtaGrPaCsL4SdwRDgqvJU96SNyQnDDdM6C/Sp0souM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFVFcoSX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706070114; x=1737606114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpDkTA2OF6y0hR8VZk3wnTQb/ElAhPx7ECUoZ6LspOA=;
  b=fFVFcoSXi8oqYs9j8HL+w59Prf3sv8W2XWxY1v21Ht1NVriiUBNAO49x
   DZlq5Qdn8TMSksM7pqoyIfrAtFEHuhl36M2Kj+aq640xnSEGBJi7xzYMn
   i+7pYyylov1GegDSyQfgoQ+ApwYYCT0SEHQPGxoMwllBA7Io9YayKHxaI
   uL1g34clssVCuCCy2cqheBgTD0p4UhuGTyH4CN2Asa2vXjI/2vracQnIu
   34vp4CdhexotQZIwdhggAxbQCTQfLMisN7s/WaQKn7McoBIrGW66E6Mpv
   vswpLWK4U4075Jz5W5A2sOBUVUEjfWko5YLfYiZGvV7UQzouLS3FUlXC9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8851076"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8851076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 20:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1776043"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2024 20:21:52 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSUlp-0007sL-0d;
	Wed, 24 Jan 2024 04:21:49 +0000
Date: Wed, 24 Jan 2024 12:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 35/39]
 drivers/media/test-drivers/vim2m.c:1321:16: warning: format '%x' expects
 argument of type 'unsigned int', but argument 3 has type 'long unsigned int'
Message-ID: <202401241232.3sHqxkyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   a31f71a73822ffd82d3595f199a57894097bc98e
commit: fd2866ddf223912813d12c6887730d2192bb3434 [35/39] koe
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240124/202401241232.3sHqxkyA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241232.3sHqxkyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241232.3sHqxkyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/media/test-drivers/vim2m.c:16:
   drivers/media/test-drivers/vim2m.c: In function 'vim2m_probe':
>> drivers/media/test-drivers/vim2m.c:1321:16: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
    1321 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~
         |                                                   |
         |                                                   long unsigned int
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/media/test-drivers/vim2m.c:1321:9: note: in expansion of macro 'printk'
    1321 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |         ^~~~~~
   drivers/media/test-drivers/vim2m.c:1321:40: note: format string is defined here
    1321 |         printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
         |                                       ~^
         |                                        |
         |                                        unsigned int
         |                                       %lx


vim +1321 drivers/media/test-drivers/vim2m.c

  1310	
  1311	static int vim2m_probe(struct platform_device *pdev)
  1312	{
  1313		struct vim2m_dev *dev;
  1314		struct video_device *vfd;
  1315		int ret;
  1316	
  1317		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  1318		if (!dev)
  1319			return -ENOMEM;
  1320	
> 1321		printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
  1322	
  1323		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
  1324		if (ret)
  1325			goto error_free;
  1326	
  1327		atomic_set(&dev->num_inst, 0);
  1328		mutex_init(&dev->dev_mutex);
  1329	
  1330		dev->vfd = vim2m_videodev;
  1331		vfd = &dev->vfd;
  1332		vfd->lock = &dev->dev_mutex;
  1333		vfd->v4l2_dev = &dev->v4l2_dev;
  1334	
  1335		video_set_drvdata(vfd, dev);
  1336		v4l2_info(&dev->v4l2_dev,
  1337			  "Device registered as /dev/video%d\n", vfd->num);
  1338	
  1339		platform_set_drvdata(pdev, dev);
  1340	
  1341		dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
  1342		if (IS_ERR(dev->m2m_dev)) {
  1343			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
  1344			ret = PTR_ERR(dev->m2m_dev);
  1345			dev->m2m_dev = NULL;
  1346			goto error_dev;
  1347		}
  1348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

