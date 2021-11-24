Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C47B45B311
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 05:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbhKXEXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 23:23:48 -0500
Received: from mga18.intel.com ([134.134.136.126]:45766 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238004AbhKXEXn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 23:23:43 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222075447"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="222075447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 20:20:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="607057783"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Nov 2021 20:20:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpjll-0004IT-BN; Wed, 24 Nov 2021 04:20:29 +0000
Date:   Wed, 24 Nov 2021 12:19:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/media/cec/platform/tegra/tegra_cec.c:455:34: warning: unused
 variable 'tegra_cec_of_match'
Message-ID: <202111241201.cGFgCj9J-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: df823a8208c434eee6e4e9aa016c956d0968e2e2 media: cec: rename CEC platform drivers config options
date:   1 year, 7 months ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archive/20211124/202111241201.cGFgCj9J-lkp@intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e3838145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df823a8208c434eee6e4e9aa016c956d0968e2e2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout df823a8208c434eee6e4e9aa016c956d0968e2e2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/cec/platform/tegra/tegra_cec.c:455:34: warning: unused variable 'tegra_cec_of_match' [-Wunused-const-variable]
   static const struct of_device_id tegra_cec_of_match[] = {
                                    ^
   1 warning generated.


vim +/tegra_cec_of_match +455 drivers/media/cec/platform/tegra/tegra_cec.c

9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  454  
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15 @455  static const struct of_device_id tegra_cec_of_match[] = {
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  456  	{ .compatible = "nvidia,tegra114-cec", },
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  457  	{ .compatible = "nvidia,tegra124-cec", },
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  458  	{ .compatible = "nvidia,tegra210-cec", },
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  459  	{},
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  460  };
9d2d60687c9a062 drivers/media/platform/tegra-cec/tegra_cec.c Hans Verkuil 2017-07-15  461  

:::::: The code at line 455 was first introduced by commit
:::::: 9d2d60687c9a0621e0da40338be4cbd7e3783be2 media: tegra-cec: add Tegra HDMI CEC driver

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
