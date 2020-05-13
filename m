Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070A81D1568
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 15:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgEMNdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 09:33:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:62556 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgEMNdk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 09:33:40 -0400
IronPort-SDR: oqf18iehytlVk6mixGC0I6/lTo1o5SywtV8HZIBew4968c+unohmE5uVqPB9Xxhf/ZWlIZ4yDv
 BzLGBZZ8pYWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 06:33:40 -0700
IronPort-SDR: L9V7dP53qffJqIfm7ZxGF1oNS5g6rZJQJ120HQbZze18eA0gJh9zShVOFc2kRTDDuv3pzjxfO9
 jRAuAdsfvQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; 
   d="scan'208";a="251768174"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2020 06:33:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYrVy-0006n4-BX; Wed, 13 May 2020 21:33:38 +0800
Date:   Wed, 13 May 2020 21:32:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 43c4dc3f59e75f3a8b726c4c90cb894c3780e91c
Message-ID: <5ebbf6fc.5TA8AxVXGbRPJcny%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 43c4dc3f59e75f3a8b726c4c90cb894c3780e91c  media: dvb-frontends: remove redundant initialization of variable status

elapsed time: 1291m

configs tested: 134
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
arm                  colibri_pxa300_defconfig
c6x                        evmc6457_defconfig
powerpc                     powernv_defconfig
mips                 decstation_r4k_defconfig
h8300                            allyesconfig
arm                       aspeed_g4_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
openrisc                    or1ksim_defconfig
arm                       aspeed_g5_defconfig
powerpc                  storcenter_defconfig
xtensa                           alldefconfig
h8300                     edosk2674_defconfig
sh                           se7751_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
i386                                defconfig
powerpc                      ep88xc_defconfig
microblaze                          defconfig
sh                     magicpanelr2_defconfig
arm64                            alldefconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
xtensa                         virt_defconfig
arm                         axm55xx_defconfig
arm                          prima2_defconfig
sh                             sh03_defconfig
arm                         lpc32xx_defconfig
powerpc                     pq2fads_defconfig
m68k                        mvme16x_defconfig
mips                           ip32_defconfig
arm                            mps2_defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20200512
x86_64               randconfig-a012-20200512
x86_64               randconfig-a015-20200512
x86_64               randconfig-a013-20200512
x86_64               randconfig-a014-20200512
x86_64               randconfig-a011-20200512
i386                 randconfig-a012-20200513
i386                 randconfig-a016-20200513
i386                 randconfig-a014-20200513
i386                 randconfig-a011-20200513
i386                 randconfig-a013-20200513
i386                 randconfig-a015-20200513
i386                 randconfig-a012-20200512
i386                 randconfig-a016-20200512
i386                 randconfig-a014-20200512
i386                 randconfig-a011-20200512
i386                 randconfig-a013-20200512
i386                 randconfig-a015-20200512
x86_64               randconfig-a005-20200513
x86_64               randconfig-a003-20200513
x86_64               randconfig-a006-20200513
x86_64               randconfig-a004-20200513
x86_64               randconfig-a001-20200513
x86_64               randconfig-a002-20200513
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
