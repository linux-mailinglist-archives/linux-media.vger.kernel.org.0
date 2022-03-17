Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D254DC079
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 08:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiCQHyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 03:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCQHyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 03:54:12 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56113222
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647503576; x=1679039576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/H8tUVaCaa936wwaxZsa2Sb5qnQ04vjlO3rS3W4GPY=;
  b=c47yt0txhsTSX4lsmAseXemztPnfJxsop49rZqjP/NJNDGh+sTBi6pCG
   PsaiO7XidEA/7fYep9+CK424Mhup7DyAVDAVsOsKqECdMmlH+RxvigpuP
   jhy8yg7WV80JgqYRmLvjO+LnAIV/UnW7O3oU84cs2CgqgHO/hvnT2x5Lx
   kD7XPOL9Lef7/Nt9uRLcCfVkCtT7HoEPqo0ef4vCUjoHYtJwrLYWKGfYM
   vC/Nju9ZCayRrK39oORoqC5igFzZaTyZCe0smWsY9Q7WTNA6yu+Ap+ckd
   H8EWv5TOw+qlqogHFgGogz9pC+sShhsBYU4NXzVfJcoiRNxFB++TT1K/+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="281598840"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="281598840"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 00:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="581211989"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 00:52:54 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUkwH-000DSa-Jd; Thu, 17 Mar 2022 07:52:53 +0000
Date:   Thu, 17 Mar 2022 15:52:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 12222/13209] imx-mipi-csis.c:undefined reference
 to `v4l2_create_fwnode_links_to_pad'
Message-ID: <202203171537.sVhYE362-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: 67d841549e43ddcfc8ecc75cf86df1c5b48fe007 [12222/13209] media: platform/*/Kconfig: make manufacturer menus more uniform
config: nios2-buildonly-randconfig-r001-20220317 (https://download.01.org/0day-ci/archive/20220317/202203171537.sVhYE362-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=67d841549e43ddcfc8ecc75cf86df1c5b48fe007
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 67d841549e43ddcfc8ecc75cf86df1c5b48fe007
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/media/v4l2-core/v4l2-async.o: in function `match_i2c':
   v4l2-async.c:(.text+0x2ec): undefined reference to `i2c_verify_client'
   v4l2-async.c:(.text+0x2ec): relocation truncated to fit: R_NIOS2_CALL26 against `i2c_verify_client'
   nios2-linux-ld: drivers/media/v4l2-core/v4l2-async.o: in function `v4l2_async_nf_unbind_all_subdevs':
   v4l2-async.c:(.text+0xb38): undefined reference to `v4l2_device_unregister_subdev'
   v4l2-async.c:(.text+0xb38): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_device_unregister_subdev'
   nios2-linux-ld: drivers/media/v4l2-core/v4l2-async.o: in function `v4l2_async_match_notify':
   v4l2-async.c:(.text+0xccc): undefined reference to `v4l2_device_register_subdev'
   v4l2-async.c:(.text+0xccc): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_device_register_subdev'
   nios2-linux-ld: v4l2-async.c:(.text+0xdec): undefined reference to `v4l2_device_unregister_subdev'
   v4l2-async.c:(.text+0xdec): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_device_unregister_subdev'
   nios2-linux-ld: drivers/media/v4l2-core/v4l2-async.o: in function `v4l2_async_register_subdev':
   v4l2-async.c:(.text+0x1290): undefined reference to `v4l2_device_unregister_subdev'
   v4l2-async.c:(.text+0x1290): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_device_unregister_subdev'
   nios2-linux-ld: drivers/media/v4l2-core/v4l2-async.o: in function `v4l2_async_unregister_subdev':
   v4l2-async.c:(.text+0x147c): undefined reference to `v4l2_device_unregister_subdev'
   v4l2-async.c:(.text+0x147c): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_device_unregister_subdev'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_notify_bound':
>> imx-mipi-csis.c:(.text+0x510): undefined reference to `v4l2_create_fwnode_links_to_pad'
   imx-mipi-csis.c:(.text+0x510): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_create_fwnode_links_to_pad'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_s_stream':
>> imx-mipi-csis.c:(.text+0x6e8): undefined reference to `v4l2_subdev_call_wrappers'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x6ec): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x720): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x724): undefined reference to `v4l2_subdev_call_wrappers'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x78c): undefined reference to `v4l2_get_link_freq'
   imx-mipi-csis.c:(.text+0x78c): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_get_link_freq'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x874): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x878): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x900): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x904): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_probe':
>> imx-mipi-csis.c:(.text+0xe30): undefined reference to `v4l2_subdev_init'
   imx-mipi-csis.c:(.text+0xe30): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_subdev_init'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_set_fmt':
>> imx-mipi-csis.c:(.text+0x1580): undefined reference to `v4l_bound_align_image'
   imx-mipi-csis.c:(.text+0x1580): relocation truncated to fit: R_NIOS2_CALL26 against `v4l_bound_align_image'
>> nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o:(.rodata+0x4f0): undefined reference to `v4l2_subdev_get_fwnode_pad_1_to_1'
>> nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o:(.rodata+0x4f8): undefined reference to `v4l2_subdev_link_validate'
   nios2-linux-ld: net/core/sock.o: in function `sk_destruct':
   sock.c:(.text+0x4694): undefined reference to `__sk_defer_free_flush'
   sock.c:(.text+0x4694): additional relocation overflows omitted from the output

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
