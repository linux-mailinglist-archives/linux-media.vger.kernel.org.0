Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AD3477DB4
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 21:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbhLPUf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 15:35:57 -0500
Received: from mga01.intel.com ([192.55.52.88]:60519 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233856AbhLPUf5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 15:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639686957; x=1671222957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HkLqYqoAJejYMr+qSRR9rijcvyAAOsKWxTYdB5aI3w8=;
  b=dx8WoNL36/Mlsl53Bwf+qfZG572w/7jWACVXyqFQFfs2iWRkIhsA2DM5
   hmWGxZT8Hj2y9Kc34RHH9fNQIVBdqvXEozw8fupVf2LrANSBwz1RBBiqS
   nHecpUFthYFR2xC4Kd8ljpUKT0AtcnoYS42JCbPdwjj7R8SDZve1IPjLc
   DKmgiGpiCWLFj0dhsmKtX8w5JOL2nZrFUEOVhw9ti5S+adAZes/t7ejfa
   5P0D+2kM91mnTOd6lxVnW2Ag9sN2i2eLAc1bTmt5g6GOoTXFOF5plHK4d
   HL+U39Y8CDCVKhhBCAhzTZWYfj0yFCa6OcFBEVWALNtUrAUcbuk2VA4NR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="263761890"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="263761890"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 12:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="466208217"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 12:35:22 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxxTF-0003mx-Fe; Thu, 16 Dec 2021 20:35:21 +0000
Date:   Fri, 17 Dec 2021 04:34:59 +0800
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
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v16, 13/19] media: mtk-vcodec: Add work queue for core
 hardware decode
Message-ID: <202112170440.wTkVV1Cz-lkp@intel.com>
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
config: arm64-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20211217/202112170440.wTkVV1Cz-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7ce79e6a446bd8e992083b0fb72f0934009ca99d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yunfei-Dong/Support-multi-hardware-decode-using-of_platform_populate/20211216-174823
        git checkout 7ce79e6a446bd8e992083b0fb72f0934009ca99d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/ mm//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-vcodec/vdec_msg_queue.c:224:4: warning: data argument not used by format string [-Wformat-extra-args]
                           dev->msg_queue_core_ctx.ready_num);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h:39:61: note: expanded from macro 'mtk_v4l2_debug'
   #define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##args)
                                               ~~~~~~~~~~~~~~~~^~~~~
   include/linux/printk.h:574:26: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:163:22: note: expanded from macro 'dynamic_pr_debug'
                              pr_fmt(fmt), ##__VA_ARGS__)
                              ~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   1 warning generated.


vim +224 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c

   200	
   201	static void vdec_msg_queue_core_work(struct work_struct *work)
   202	{
   203		struct vdec_msg_queue *msg_queue =
   204			container_of(work, struct vdec_msg_queue, core_work);
   205		struct mtk_vcodec_ctx *ctx =
   206			container_of(msg_queue, struct mtk_vcodec_ctx, msg_queue);
   207		struct mtk_vcodec_dev *dev = ctx->dev;
   208		struct vdec_lat_buf *lat_buf;
   209	
   210		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
   211		if (!lat_buf)
   212			return;
   213	
   214		ctx = lat_buf->ctx;
   215		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
   216	
   217		lat_buf->core_decode(lat_buf);
   218	
   219		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
   220		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
   221	
   222		if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
   223			mtk_v4l2_debug(3, "re-schedule to decode for core",
 > 224				dev->msg_queue_core_ctx.ready_num);
   225			queue_work(dev->core_workqueue, &msg_queue->core_work);
   226		}
   227	}
   228	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
