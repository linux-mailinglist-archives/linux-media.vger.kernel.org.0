Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182994DE552
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 04:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241862AbiCSDUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 23:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241837AbiCSDUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 23:20:21 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F2F326D7
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 20:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647659940; x=1679195940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/42G2gnZW2qRn/f31Z8PKlng25fnXfMB/1VSbtGjSY=;
  b=dxfOE4UUGpwQJLa6ehybk3tqZPVrILZ/TuXx3l9Q1pYR1p6oZt9lSNIr
   okM9to83yuj8QFrWD+cE9KhsucQliZwodiyNoN/rpCsosQsn8CEQkEU0/
   Z8pz5MNxl3TKTPphAHOy5ZsDm7WmzijOzYE4gAShLqO4A7cUedbXTna5Y
   T4UiuQct5MI654d/Rq/RgQhPBoZCfhSCK04bAurxGLiN5g4nMRQvBac/C
   of0LirYCvQ74Vm2meJX5Aic4iMecyLsqyerysIJX5Mm1JqIFQYdMqgCao
   50MBaYuJ00eUyNVh7kZhVweWDMzCChyk9GNSgFKlTg/sGL+qRqG7axKvA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="256090695"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="256090695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 20:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="517527861"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2022 20:18:58 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nVPcH-000FTD-Qh; Sat, 19 Mar 2022 03:18:57 +0000
Date:   Sat, 19 Mar 2022 11:18:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [linux-next:master 12686/13576] ERROR: modpost:
 "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko]
 undefined!
Message-ID: <202203191117.j8hMzGCd-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 772edc05cfcb96ce78aed17eef951d9e138f50eb [12686/13576] media: platform/*/Kconfig: make manufacturer menus more uniform
config: nios2-randconfig-r031-20220319 (https://download.01.org/0day-ci/archive/20220319/202203191117.j8hMzGCd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=772edc05cfcb96ce78aed17eef951d9e138f50eb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 772edc05cfcb96ce78aed17eef951d9e138f50eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_subdev_link_validate" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_subdev_get_fwnode_pad_1_to_1" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_subdev_call_wrappers" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_get_link_freq" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_nf_cleanup" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_nf_unregister" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_register_subdev" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "v4l2_async_subdev_nf_register" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
>> ERROR: modpost: "__v4l2_async_nf_add_fwnode_remote" [drivers/media/platform/nxp/imx-mipi-csis.ko] undefined!
WARNING: modpost: suppressed 6 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
   Selected by
   - VIDEO_IMX_MIPI_CSIS && MEDIA_SUPPORT && MEDIA_PLATFORM_SUPPORT && MEDIA_PLATFORM_DRIVERS

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
