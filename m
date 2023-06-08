Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B1B7276E9
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 07:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbjFHFvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 01:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbjFHFvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 01:51:36 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE0F2697
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686203495; x=1717739495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0PXm6K5WVCzQzKcVJxB+IU3Xhy65QKUkSLQtitAwMY=;
  b=EAbY1tLgUAotQlr8prQw4azr9+9E079mBAob1WP0c90IIFNSJ9uG6qZ8
   WEZA0pZVQcN/BITPITfZHkBkPBcqgwD8zNDmjAq4M1I8+WNc7HbC3Nt9k
   LGLzwKTcuUgi7O92Jh8j2w3jL++fX9dcvWIwxzoeVZwceL3iOanmeWZ15
   NCi/D4zhfJXqkjQ94XuYy5MxF3x0QK1yjpg606mbHw6KCQiQn7iJXwDqO
   PCnxgihxKv96laClmPDSki0CkHa+Tc6QPfvTOY9PUGnMnPEKeZhksbX27
   fxOVsh49wB6xdX5mHAJycd5gDI/M56PP7ZbJxkxK8oUswQBa/q6Kq7TAf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357221202"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="357221202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 22:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="884057440"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="884057440"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 22:51:32 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q78YV-0007N1-2O;
        Thu, 08 Jun 2023 05:51:31 +0000
Date:   Thu, 8 Jun 2023 13:51:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [stable:linux-5.4.y 3701/8640]
 drivers/media/platform/vim2m.c:1384:1: warning: label 'error_v4l2' defined
 but not used
Message-ID: <202306081346.VwNOhjhl-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   cf0b1e5482eaeb4db15c9e703267483dba88b575
commit: b7248281afb165ebd2f64dfd5ef4de3c5cc2a81f [3701/8640] media: vim2m: Register video device after setting up internals
config: i386-buildonly-randconfig-r003-20230608 (https://download.01.org/0day-ci/archive/20230608/202306081346.VwNOhjhl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b7248281afb165ebd2f64dfd5ef4de3c5cc2a81f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout b7248281afb165ebd2f64dfd5ef4de3c5cc2a81f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/platform/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081346.VwNOhjhl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/vim2m.c: In function 'vim2m_probe':
>> drivers/media/platform/vim2m.c:1384:1: warning: label 'error_v4l2' defined but not used [-Wunused-label]
    1384 | error_v4l2:
         | ^~~~~~~~~~
   drivers/media/platform/vim2m.c: At top level:
   drivers/media/platform/vim2m.c:1309:38: warning: 'm2m_media_ops' defined but not used [-Wunused-const-variable=]
    1309 | static const struct media_device_ops m2m_media_ops = {
         |                                      ^~~~~~~~~~~~~


vim +/error_v4l2 +1384 drivers/media/platform/vim2m.c

  1313	
  1314	static int vim2m_probe(struct platform_device *pdev)
  1315	{
  1316		struct vim2m_dev *dev;
  1317		struct video_device *vfd;
  1318		int ret;
  1319	
  1320		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  1321		if (!dev)
  1322			return -ENOMEM;
  1323	
  1324		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
  1325		if (ret)
  1326			goto error_free;
  1327	
  1328		atomic_set(&dev->num_inst, 0);
  1329		mutex_init(&dev->dev_mutex);
  1330	
  1331		dev->vfd = vim2m_videodev;
  1332		vfd = &dev->vfd;
  1333		vfd->lock = &dev->dev_mutex;
  1334		vfd->v4l2_dev = &dev->v4l2_dev;
  1335	
  1336		video_set_drvdata(vfd, dev);
  1337		v4l2_info(&dev->v4l2_dev,
  1338			  "Device registered as /dev/video%d\n", vfd->num);
  1339	
  1340		platform_set_drvdata(pdev, dev);
  1341	
  1342		dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
  1343		if (IS_ERR(dev->m2m_dev)) {
  1344			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
  1345			ret = PTR_ERR(dev->m2m_dev);
  1346			dev->m2m_dev = NULL;
  1347			goto error_dev;
  1348		}
  1349	
  1350		ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
  1351		if (ret) {
  1352			v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
  1353			goto error_m2m;
  1354		}
  1355	
  1356	#ifdef CONFIG_MEDIA_CONTROLLER
  1357		dev->mdev.dev = &pdev->dev;
  1358		strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
  1359		strscpy(dev->mdev.bus_info, "platform:vim2m",
  1360			sizeof(dev->mdev.bus_info));
  1361		media_device_init(&dev->mdev);
  1362		dev->mdev.ops = &m2m_media_ops;
  1363		dev->v4l2_dev.mdev = &dev->mdev;
  1364	
  1365		ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
  1366							 MEDIA_ENT_F_PROC_VIDEO_SCALER);
  1367		if (ret) {
  1368			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
  1369			goto error_v4l2;
  1370		}
  1371	
  1372		ret = media_device_register(&dev->mdev);
  1373		if (ret) {
  1374			v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
  1375			goto error_m2m_mc;
  1376		}
  1377	#endif
  1378		return 0;
  1379	
  1380	#ifdef CONFIG_MEDIA_CONTROLLER
  1381	error_m2m_mc:
  1382		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
  1383	#endif
> 1384	error_v4l2:
  1385		video_unregister_device(&dev->vfd);
  1386		/* vim2m_device_release called by video_unregister_device to release various objects */
  1387		return ret;
  1388	error_m2m:
  1389		v4l2_m2m_release(dev->m2m_dev);
  1390	error_dev:
  1391		v4l2_device_unregister(&dev->v4l2_dev);
  1392	error_free:
  1393		kfree(dev);
  1394	
  1395		return ret;
  1396	}
  1397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
