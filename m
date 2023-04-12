Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2A26DFCCD
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 19:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjDLRf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 13:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDLRf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 13:35:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B8619A
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681320923; x=1712856923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dna8GvTJPEiAW1iZuy/MM8UtsPMCLVQRzDmOYqSLUEc=;
  b=joluwVJHMe3QgYClER94KVvPlJhQqK16tV7xmzfOTfgNjeqRR5+8Yh9a
   EPhyaynZw60eobhJJ3ojpPn3NmxqTQHp55G8cRQqDl4MRkhE0rihiZ9Cj
   byPNZEgo7Qi3DxmEVJY3k8eWfHDWw0IHgfvpKWqJK41rGM/sJC/EVZ8gX
   u1zJCGBnyrZM3m04SZAGSSOaBtqg5h9PaIhF5m8x2ZQSTTC05+wxgvh69
   uEIL6TbqGJpqET4pdzJrX4cXTVs30DvPBptUBY2Vx7BNqvcu+yZpwImYN
   r2GFcsx6tMHqRI0OmLAU01AanqaQ44uC7Ii26zwjZ1vRdetyuJzyVxbBV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409109873"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409109873"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800423953"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="800423953"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 10:35:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmeNL-000Xwx-1q;
        Wed, 12 Apr 2023 17:35:19 +0000
Date:   Thu, 13 Apr 2023 01:35:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [xilinx-xlnx:master 12090/14520] drivers/fpga/zynq-afi.c:27:
 warning: expecting prototype for struct afi_fpga. Prototype was for struct
 zynq_afi_fpga instead
Message-ID: <202304130139.lWZSndko-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 57f1706d9ac1a75fd4e037ce7f7907020c5efe8c [12090/14520] scripts: kernel-doc: validate kernel-doc markup with the actual names
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304130139.lWZSndko-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/57f1706d9ac1a75fd4e037ce7f7907020c5efe8c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 57f1706d9ac1a75fd4e037ce7f7907020c5efe8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/xilinx/ drivers/fpga/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130139.lWZSndko-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/zynq-afi.c:27: warning: expecting prototype for struct afi_fpga. Prototype was for struct zynq_afi_fpga instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
   Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
   Selected by [y]:
   - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM_MEDIATEK [=y]
   WARNING: unmet direct dependencies detected for MXC_CLK_SCU
   Depends on [n]: COMMON_CLK [=y] && ARCH_MXC [=n] && IMX_SCU [=y] && HAVE_ARM_SMCCC [=y]
   Selected by [y]:
   - CLK_IMX8QXP [=y] && COMMON_CLK [=y] && (ARCH_MXC [=n] && ARM64 || COMPILE_TEST [=y]) && IMX_SCU [=y] && HAVE_ARM_SMCCC [=y]


vim +27 drivers/fpga/zynq-afi.c

503049b870e6b7 Nava kishore Manne 2018-07-31  18  
503049b870e6b7 Nava kishore Manne 2018-07-31  19  /**
503049b870e6b7 Nava kishore Manne 2018-07-31  20   * struct afi_fpga - AFI register description
503049b870e6b7 Nava kishore Manne 2018-07-31  21   * @membase:	pointer to register struct
503049b870e6b7 Nava kishore Manne 2018-07-31  22   * @afi_width:	AFI bus width to be written
503049b870e6b7 Nava kishore Manne 2018-07-31  23   */
503049b870e6b7 Nava kishore Manne 2018-07-31  24  struct zynq_afi_fpga {
503049b870e6b7 Nava kishore Manne 2018-07-31  25  	void __iomem	*membase;
503049b870e6b7 Nava kishore Manne 2018-07-31  26  	u32		afi_width;
503049b870e6b7 Nava kishore Manne 2018-07-31 @27  };
503049b870e6b7 Nava kishore Manne 2018-07-31  28  

:::::: The code at line 27 was first introduced by commit
:::::: 503049b870e6b79cff0512dd0cd8456d7bde7afa fpga: zynq: Add AFI config driver

:::::: TO: Nava kishore Manne <nava.manne@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
