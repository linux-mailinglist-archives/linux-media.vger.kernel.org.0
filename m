Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406DE4DC431
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 11:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbiCQKql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 06:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiCQKqk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 06:46:40 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E621DEBAB
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 03:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647513924; x=1679049924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8Xdt9laOGXjV/BWIxbm7uanH5uJAfGkt6kmeoClN/g=;
  b=gct514cEsvWIiZJgrrjjQemLIQ6h6hLAuu6Disfi4rF6l4i4fU0WNCO0
   WQWtbXYLU0U8jA9lWAMV71aQ55Hq8t9ocoxpr14Dk5kJUnUzMSjeVC/k4
   iUVnzVxjMz+BZ/Qwj9NssK8Xc4KsEjB2Lj1EQalwP/LKJgAMiudfKrp47
   D4uSE6Xx+AiABlxCb4zySz1Ynk24uupJEyyrshpLNmeVF1JeXTFV1kibY
   vz/f8rjrR/D2CXDOP+DCRUsWXqajH4hKmhyQlXr5+8rSoHbl2y5LdCA/b
   gkkb5rgM49DqI27r/9oRr8RnemBMpS5ztBcM1p596fbEfc3ygaJ/z3z3U
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="238998969"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="238998969"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 03:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="498785543"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2022 03:45:21 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUndA-000DbR-OZ; Thu, 17 Mar 2022 10:45:20 +0000
Date:   Thu, 17 Mar 2022 18:45:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [linux-next:master 12223/13209] imx-mipi-csis.c:undefined reference
 to `v4l2_async_nf_init'
Message-ID: <202203171840.ZXc3IgpZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: e9e9e70a8b1099615d925e972dce7c7078aec3df [12223/13209] media: Kconfig: cleanup VIDEO_DEV dependencies
config: nios2-buildonly-randconfig-r001-20220317 (https://download.01.org/0day-ci/archive/20220317/202203171840.ZXc3IgpZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e9e9e70a8b1099615d925e972dce7c7078aec3df
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e9e9e70a8b1099615d925e972dce7c7078aec3df
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_async_register':
>> imx-mipi-csis.c:(.text+0x374): undefined reference to `v4l2_async_nf_init'
   imx-mipi-csis.c:(.text+0x374): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_nf_init'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x3a4): undefined reference to `v4l2_fwnode_endpoint_parse'
   imx-mipi-csis.c:(.text+0x3a4): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_fwnode_endpoint_parse'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x434): undefined reference to `__v4l2_async_nf_add_fwnode_remote'
   imx-mipi-csis.c:(.text+0x434): relocation truncated to fit: R_NIOS2_CALL26 against `__v4l2_async_nf_add_fwnode_remote'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x460): undefined reference to `v4l2_async_subdev_nf_register'
   imx-mipi-csis.c:(.text+0x460): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_subdev_nf_register'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x484): undefined reference to `v4l2_async_register_subdev'
   imx-mipi-csis.c:(.text+0x484): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_register_subdev'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_notify_bound':
   imx-mipi-csis.c:(.text+0x510): undefined reference to `v4l2_create_fwnode_links_to_pad'
   imx-mipi-csis.c:(.text+0x510): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_create_fwnode_links_to_pad'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_s_stream':
   imx-mipi-csis.c:(.text+0x6e8): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x6ec): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x720): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x724): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x78c): undefined reference to `v4l2_get_link_freq'
   imx-mipi-csis.c:(.text+0x78c): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_get_link_freq'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x874): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x878): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x900): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x904): undefined reference to `v4l2_subdev_call_wrappers'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_remove':
>> imx-mipi-csis.c:(.text+0xa8c): undefined reference to `v4l2_async_nf_unregister'
   imx-mipi-csis.c:(.text+0xa8c): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_nf_unregister'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0xa94): undefined reference to `v4l2_async_nf_cleanup'
   imx-mipi-csis.c:(.text+0xa94): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_nf_cleanup'
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0xa9c): undefined reference to `v4l2_async_unregister_subdev'
   imx-mipi-csis.c:(.text+0xa9c): relocation truncated to fit: R_NIOS2_CALL26 against `v4l2_async_unregister_subdev'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_probe':
   imx-mipi-csis.c:(.text+0xe30): undefined reference to `v4l2_subdev_init'
   imx-mipi-csis.c:(.text+0xe30): additional relocation overflows omitted from the output
>> nios2-linux-ld: imx-mipi-csis.c:(.text+0x10ec): undefined reference to `v4l2_async_nf_unregister'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x10f4): undefined reference to `v4l2_async_nf_cleanup'
   nios2-linux-ld: imx-mipi-csis.c:(.text+0x10fc): undefined reference to `v4l2_async_unregister_subdev'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o: in function `mipi_csis_set_fmt':
   imx-mipi-csis.c:(.text+0x1580): undefined reference to `v4l_bound_align_image'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o:(.rodata+0x4f0): undefined reference to `v4l2_subdev_get_fwnode_pad_1_to_1'
   nios2-linux-ld: drivers/media/platform/nxp/imx-mipi-csis.o:(.rodata+0x4f8): undefined reference to `v4l2_subdev_link_validate'
   nios2-linux-ld: net/core/sock.o: in function `sk_destruct':
   sock.c:(.text+0x4694): undefined reference to `__sk_defer_free_flush'

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
