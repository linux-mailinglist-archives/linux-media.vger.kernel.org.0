Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9DD64DA383
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 20:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351488AbiCOT4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 15:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbiCOT4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 15:56:22 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF15A4664C
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647374109; x=1678910109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWipP3JrvoAViXDV6kxk86LH0coy/l0xX+PB4S0GySY=;
  b=Epw74s31QWG0nNv/KOk9p2qI24MkEzJpntNEAEcMuwh/DvmivFWw6N4D
   hUNtGYrpvUpG+YVr0aFCFnrza9VcBrm+WEWoibytJVgnHDavWviOhp1jV
   R0ENNAV50Nqh4rYhBRNQlUfBUlUHxOeUBaaf9iMdeO7A9Sbbb6rgOmC8E
   kddUJb4XWmaZSEQNeDUnvqHFHDkNBcU98dgXrAYbodApX7O7X0F1fkvPY
   xByNjGU5mVbgv/ZwR2kLwWlQi6OLS4QbxWOf4Laj+RIk55pnUQvNEtVrI
   7dQzXY9Mk6mGyAk82YCyffDKf5DFhZvZTH4tUPYH4c+QeyDRoKvPpqHiw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256135532"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="256135532"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 12:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="498164486"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 12:55:08 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUDG7-000BRQ-9P; Tue, 15 Mar 2022 19:55:07 +0000
Date:   Wed, 16 Mar 2022 03:54:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org
Subject: [linux-next:master 12079/12845]
 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6: warning: no
 previous prototype for 'fimc_isp_video_device_unregister'
Message-ID: <202203160306.SfWO9QWV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a32cd981a6da2373c093d471ee4405a915e217d5
commit: e94d7863a951d040f0e200b96ae3bcc0b9ab0028 [12079/12845] media: platform: rename exynos4-is/ to samsung/exynos4-is/
config: powerpc64-randconfig-r035-20220314 (https://download.01.org/0day-ci/archive/20220316/202203160306.SfWO9QWV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e94d7863a951d040f0e200b96ae3bcc0b9ab0028
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e94d7863a951d040f0e200b96ae3bcc0b9ab0028
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/samsung/exynos4-is/fimc-isp.c:25:
>> drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6: warning: no previous prototype for 'fimc_isp_video_device_unregister' [-Wmissing-prototypes]
      35 | void fimc_isp_video_device_unregister(struct fimc_isp *isp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fimc_isp_video_device_unregister +35 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h

34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  34  
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20 @35  void fimc_isp_video_device_unregister(struct fimc_isp *isp,
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  36  				enum v4l2_buf_type type)
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  37  {
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  38  }
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  39  #endif /* !CONFIG_VIDEO_EXYNOS4_ISP_DMA_CAPTURE */
34947b8aebe3f2d drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  40  

:::::: The code at line 35 was first introduced by commit
:::::: 34947b8aebe3f2d4eceb65fceafa92bf8dc97d96 [media] exynos4-is: Add the FIMC-IS ISP capture DMA driver

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
