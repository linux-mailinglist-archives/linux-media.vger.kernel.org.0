Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B93D4775A2
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 16:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhLPPSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 10:18:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:27706 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232605AbhLPPSL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 10:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639667891; x=1671203891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sj3XHCLBEEWpQ+x2/i2MjFTaTVO1ZOBXBg0AInTZJVc=;
  b=l7ysjpgnN8ehWL7cmHylSF9K1NlvyC4JMDfJxi9oQ9DW/RF0fTys95jV
   WI8+ZsrdMVUoePpM58f2rSY/5tG9eNyIW4ZapVXcQLbj7sVDnRM0+Roza
   VAXGQqyoiGs59BCUZ03jMTkpKwYInQ/JlMQdZ87Qy9kvFTmflQQo+Ho0d
   PK1F73IRueVEq2W9U2/GNIaSZryRv8rtDbQKsQI69tOq6NYS7xTceTbc8
   hfGxfrAmdtMXv+3ki8LgWLTwM+z9+/x0qsYapRI7qHXLmkmEWfiVZxDUg
   ErNMB4CjTAd5UB6yrL/84ARMl9a9sVSVW9Vh1mINNJmJLF1h0wDywaHpL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263681381"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="263681381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 07:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="546012901"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2021 07:18:08 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxsWF-0003NX-TC; Thu, 16 Dec 2021 15:18:07 +0000
Date:   Thu, 16 Dec 2021 23:17:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v16, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
Message-ID: <202112162312.CKVSGb5P-lkp@intel.com>
References: <20211216094552.19104-14-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216094552.19104-14-yunfei.dong@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on next-20211215]
[cannot apply to v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yunfei-Dong/Support-multi-hardware-decode-using-of_platform_populate/20211216-174823
base:   git://linuxtv.org/media_tree.git master
config: alpha-randconfig-r033-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162312.CKVSGb5P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7ce79e6a446bd8e992083b0fb72f0934009ca99d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yunfei-Dong/Support-multi-hardware-decode-using-of_platform_populate/20211216-174823
        git checkout 7ce79e6a446bd8e992083b0fb72f0934009ca99d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/platform/mtk-vcodec/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/freezer.h:8,
                    from drivers/media/platform/mtk-vcodec/vdec_msg_queue.c:7:
   drivers/media/platform/mtk-vcodec/vdec_msg_queue.c: In function 'vdec_msg_queue_core_work':
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:132:17: note: in expansion of macro 'printk'
     132 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:580:9: note: in expansion of macro 'no_printk'
     580 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:580:19: note: in expansion of macro 'KERN_DEBUG'
     580 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:39:45: note: in expansion of macro 'pr_debug'
      39 | #define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##args)
         |                                             ^~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec_msg_queue.c:223:17: note: in expansion of macro 'mtk_v4l2_debug'
     223 |                 mtk_v4l2_debug(3, "re-schedule to decode for core",
         |                 ^~~~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
