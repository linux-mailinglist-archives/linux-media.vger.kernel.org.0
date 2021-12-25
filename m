Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C24847F4B8
	for <lists+linux-media@lfdr.de>; Sun, 26 Dec 2021 00:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhLYXh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Dec 2021 18:37:28 -0500
Received: from mga05.intel.com ([192.55.52.43]:26629 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233040AbhLYXh1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Dec 2021 18:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640475447; x=1672011447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUdSUE0hhrB5yOykddcawPLKHy7YhwYpFORVcpSAisw=;
  b=jhmKlU3ja3A9zXnj6ulBq3cNP7h0MyytpOVtDwII0tcHLPrIADQGTM1N
   OYiKTiJK+rOoBQyiodr5ys27u7VNGflHB6xpeCpG6xSDRbaVjWQLRb99o
   xqJr714ucX+kUyPi6TJJ8gXKNw5AmLOmJjqoKhN5tLYzmIpwk/WxMqH3/
   rnZdXQEGx8S60jJ3bGOQJ5YUPkdtPT5v427HQoWmA1N15ca0WzCjqq+Xd
   UbZBJVaS1FqEiZ3ofwlWBZTTTrzHm8SHaUH3u0hWSIGLNpOTINn7w/OBM
   bAQrYHsUwFS4BZzILLqrxwuovV+DnSruNcOyBmoj6Sy9QMG9kfCAR7eWL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="327398338"
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="327398338"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 15:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="467520897"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Dec 2021 15:37:25 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n1GbM-0004qo-Bz; Sat, 25 Dec 2021 23:37:24 +0000
Date:   Sun, 26 Dec 2021 07:36:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 838/9897] ERROR: modpost:
 "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko]
 undefined!
Message-ID: <202112260753.8orwHSlb-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [838/9897] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
config: i386-randconfig-a012-20211226 (https://download.01.org/0day-ci/archive/20211226/202112260753.8orwHSlb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5814f32fef137e34577c4f053272c53e7ca33cd9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD ea586a076e8aa606c59b66d86660590f18354b11 builds fine.
      It may have been fixed somewhere.

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
