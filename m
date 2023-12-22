Return-Path: <linux-media+bounces-2896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06481C247
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 01:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D805287A39
	for <lists+linux-media@lfdr.de>; Fri, 22 Dec 2023 00:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA23A394;
	Fri, 22 Dec 2023 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQJuelPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A94375
	for <linux-media@vger.kernel.org>; Fri, 22 Dec 2023 00:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703204738; x=1734740738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XnwDS6GGI6yQyMNydYl0KcuugYHQnje1n9NskVP/PU=;
  b=bQJuelPcFk0LbvKkB/yzydd5h7heaYKCJR84pHPBq6zKaIRTCrlmoM/I
   5tlQENS0d6f+4aGRA5cYKy5RmgK2BX/Nj38rbolAqVO67rcPUOp4u4NWf
   RyLH5taBeBDlTvcedw194Ts/62n9Y/6YhnEfTCnkLiCJsJ5vfYJTMEO96
   X7ZqMxUmUaEJAFPgGdaYiOVM59/3P668r1WKUBHUio8fazOsdBfNJuLJ6
   nGKVLJqKbZUzdeOGf0oqCmo37hsPYhPDt81ryjaEM2DkhW3Po57tTul69
   Ey8Zn9FAHA6uzibD7qYyojYttXqHvjp0chTGf5aNE+jiRBGygWUql4yXo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="381040833"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="381040833"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 16:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="950095568"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="950095568"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2023 16:25:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGTM5-0008ul-11;
	Fri, 22 Dec 2023 00:25:33 +0000
Date: Fri, 22 Dec 2023 08:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 36/40]
 drivers/media/test-drivers/vim2m.c:1321:44: warning: format specifies type
 'unsigned int' but the argument has type 'unsigned long'
Message-ID: <202312220829.0yltDocK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   9587641ab37e563866fb73acc04735eccd59a2d3
commit: b42c2dd3479e60f6dbaefdbdc6b232d925c716e5 [36/40] koe
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231222/202312220829.0yltDocK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220829.0yltDocK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220829.0yltDocK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vim2m.c:1321:44: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
           printk("OBJECT vim2m %p, size %x\n", dev, sizeof(*dev));
                                         ~~          ^~~~~~~~~~~~
                                         %lx
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


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

