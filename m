Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973424D87E5
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 16:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242486AbiCNPRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 11:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236465AbiCNPRp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 11:17:45 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7C663C4
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647270995; x=1678806995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EAZLpteSVdAgFymsLWi6aEs+rPuAd1xAx06FYCb1418=;
  b=ntIbBs/vi9USrDOTW58vwIIpEjz+DVKFT0g+Ugmrf0QlKzXHx9d1NTP0
   Vwsw1H+cCJfETR/dOwF3byE6oSVAuwyQ9PUN/IqNucwS/y6rVNZqMwpQD
   wfuuIlVfofztRLx0nw0veVfsHYuvtMjrvs2ha1UbC9mGHotR6QS9X6Nz5
   maBdT8om6i4+7E9PO4krl8MVNMuAJ67H3tTU86a508/cbcEogjor87p2U
   5GOQkczP6Zjg226ZEDZ+oJZTxHzo/Aq/T9fQRdpa28xYUAfUo846wE5wA
   YgfaZumf9CebV0we6DmUitBaC6D6qKBsROXzkLGWeSvNFrHfR7iL7n3ZO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="238224031"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="238224031"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 08:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="497647813"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 08:15:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTmQA-0009xZ-NK; Mon, 14 Mar 2022 15:15:42 +0000
Date:   Mon, 14 Mar 2022 23:15:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 50/64] media: platform: rename exynos4-is/ to
 samsung/exynos4-is/
Message-ID: <202203142353.sWQlIAes-lkp@intel.com>
References: <ddc78c2e90b9ae2ae23e2eb98f38a0b707318c21.1647242579.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc78c2e90b9ae2ae23e2eb98f38a0b707318c21.1647242579.git.mchehab@kernel.org>
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

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220310]
[cannot apply to media-tree/master sunxi/sunxi/for-next shawnguo/for-next rockchip/for-next linus/master v5.17-rc8 v5.17-rc7 v5.17-rc6 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/media-Kconfig-Makefile-reorg/20220314-155919
base:    71941773e143369a73c9c4a3b62fbb60736a1182
config: mips-randconfig-r026-20220313 (https://download.01.org/0day-ci/archive/20220314/202203142353.sWQlIAes-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/fa6ebae6655d5f8551a875661f9acc3dc88a6b02
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/media-Kconfig-Makefile-reorg/20220314-155919
        git checkout fa6ebae6655d5f8551a875661f9acc3dc88a6b02
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/samsung/exynos4-is/fimc-isp.c:25:
>> drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:6: warning: no previous prototype for function 'fimc_isp_video_device_unregister' [-Wmissing-prototypes]
   void fimc_isp_video_device_unregister(struct fimc_isp *isp,
        ^
   drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fimc_isp_video_device_unregister(struct fimc_isp *isp,
   ^
   static 
   1 warning generated.


vim +/fimc_isp_video_device_unregister +35 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.h

34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  34  
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20 @35  void fimc_isp_video_device_unregister(struct fimc_isp *isp,
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  36  				enum v4l2_buf_type type)
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  37  {
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  38  }
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  39  #endif /* !CONFIG_VIDEO_EXYNOS4_ISP_DMA_CAPTURE */
34947b8aebe3f2 drivers/media/platform/exynos4-is/fimc-isp-video.h Sylwester Nawrocki 2013-12-20  40  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
