Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC1945B291
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 04:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhKXDWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 22:22:40 -0500
Received: from mga11.intel.com ([192.55.52.93]:10060 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhKXDWk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 22:22:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="232686108"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="232686108"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 19:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="497515987"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Nov 2021 19:19:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpioh-0004Ex-Hu; Wed, 24 Nov 2021 03:19:27 +0000
Date:   Wed, 24 Nov 2021 11:18:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [ragnatech:media-tree 36/155] ld.lld: error: undefined symbol:
 v4l2_async_unregister_subdev
Message-ID: <202111241108.IyiZnpgG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://git.ragnatech.se/linux media-tree
head:   999ed03518cb01aa9ef55c025db79567eec6268c
commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [36/155] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
config: arm64-randconfig-r011-20211123 (https://download.01.org/0day-ci/archive/20211124/202111241108.IyiZnpgG-lkp@intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add ragnatech git://git.ragnatech.se/linux
        git fetch --no-tags ragnatech media-tree
        git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_async_unregister_subdev
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_remove) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_fwnode_endpoint_parse
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_handler_init_class
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_new_std
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_new_std_menu_items
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_ctrl_handler_free
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: v4l2_async_register_subdev
   >>> referenced by max96712.c
   >>> staging/media/max96712/max96712.o:(max96712_probe) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_MAX96712 && STAGING && STAGING_MEDIA && MEDIA_SUPPORT && I2C && OF_GPIO

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
