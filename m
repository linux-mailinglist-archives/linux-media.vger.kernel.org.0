Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB594671CF
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 07:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbhLCGWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 01:22:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:25649 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232133AbhLCGWY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 01:22:24 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="323172201"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="323172201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 22:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="610282287"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Dec 2021 22:18:58 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mt1uM-000HA2-1J; Fri, 03 Dec 2021 06:18:58 +0000
Date:   Fri, 3 Dec 2021 14:18:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 925/4921] ERROR: modpost:
 "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko]
 undefined!
Message-ID: <202112031447.GpyZHoNB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9606f9efb1cec7f8f5912326f182fbfbcad34382
commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [925/4921] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
config: arc-randconfig-r023-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031447.GpyZHoNB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5814f32fef137e34577c4f053272c53e7ca33cd9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_handler_free" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_new_std_menu_items" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_new_std" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_ctrl_handler_init_class" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/staging/media/max96712/max96712.ko] undefined!
>> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_MAX96712 && STAGING && STAGING_MEDIA && MEDIA_SUPPORT && I2C && OF_GPIO

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
