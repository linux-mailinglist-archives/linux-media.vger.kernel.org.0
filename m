Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E5A3E06D0
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 19:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhHDRfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 13:35:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:36141 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229869AbhHDRfM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 13:35:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="277730888"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; 
   d="scan'208";a="277730888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 10:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; 
   d="scan'208";a="671036509"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2021 10:34:50 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mBKn4-000F4U-1K; Wed, 04 Aug 2021 17:34:50 +0000
Date:   Thu, 05 Aug 2021 01:34:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 a7a48b40c7990749b933250aca5030b3a0bad193
Message-ID: <610acf91.xljku128T0bS1e0L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: a7a48b40c7990749b933250aca5030b3a0bad193  Merge commit 'c3cdc019a6bf' into media_tree

elapsed time: 1587m

configs tested: 194
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
i386                 randconfig-c001-20210804
arm                         hackkit_defconfig
powerpc                      obs600_defconfig
m68k                          atari_defconfig
mips                           rs90_defconfig
mips                        jmr3927_defconfig
mips                           ip32_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
powerpc                 linkstation_defconfig
powerpc                     sequoia_defconfig
powerpc                     tqm8540_defconfig
powerpc                           allnoconfig
arc                      axs103_smp_defconfig
riscv                            alldefconfig
ia64                         bigsur_defconfig
sh                           sh2007_defconfig
arm                      integrator_defconfig
sh                        edosk7705_defconfig
sh                           se7724_defconfig
sh                         microdev_defconfig
m68k                           sun3_defconfig
mips                          ath79_defconfig
openrisc                 simple_smp_defconfig
arm                        spear3xx_defconfig
mips                           gcw0_defconfig
mips                  decstation_64_defconfig
powerpc                        icon_defconfig
m68k                          multi_defconfig
powerpc                 mpc836x_mds_defconfig
nios2                               defconfig
arm                     davinci_all_defconfig
powerpc                    amigaone_defconfig
mips                      bmips_stb_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      pistachio_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
sh                           se7619_defconfig
powerpc                      pasemi_defconfig
arm                           h3600_defconfig
mips                             allyesconfig
powerpc                      acadia_defconfig
arm                         orion5x_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        qi_lb60_defconfig
arm                           u8500_defconfig
arm                     am200epdkit_defconfig
mips                        nlm_xlr_defconfig
m68k                                defconfig
x86_64                           alldefconfig
sparc                       sparc32_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ppa8548_defconfig
powerpc                      ppc64e_defconfig
s390                             alldefconfig
sh                           se7343_defconfig
h8300                    h8300h-sim_defconfig
ia64                      gensparse_defconfig
sh                            titan_defconfig
powerpc                 canyonlands_defconfig
powerpc                     ksi8560_defconfig
arm                          imote2_defconfig
sh                        apsh4ad0a_defconfig
mips                          rb532_defconfig
arc                          axs103_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                       ebony_defconfig
powerpc                      bamboo_defconfig
powerpc                     kilauea_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                        edosk7760_defconfig
mips                     cu1000-neo_defconfig
mips                      fuloong2e_defconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
mips                       rbtx49xx_defconfig
powerpc                     pq2fads_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5307c3_defconfig
arm                         mv78xx0_defconfig
m68k                            mac_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
m68k                       m5249evb_defconfig
arm                          pcm027_defconfig
xtensa                              defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                  iss476-smp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
i386                 randconfig-a004-20210802
i386                 randconfig-a005-20210802
i386                 randconfig-a002-20210802
i386                 randconfig-a006-20210802
i386                 randconfig-a001-20210802
i386                 randconfig-a003-20210802
i386                 randconfig-a004-20210803
i386                 randconfig-a005-20210803
i386                 randconfig-a002-20210803
i386                 randconfig-a006-20210803
i386                 randconfig-a001-20210803
i386                 randconfig-a003-20210803
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
i386                 randconfig-a012-20210804
i386                 randconfig-a011-20210804
i386                 randconfig-a015-20210804
i386                 randconfig-a013-20210804
i386                 randconfig-a014-20210804
i386                 randconfig-a016-20210804
i386                 randconfig-a012-20210803
i386                 randconfig-a011-20210803
i386                 randconfig-a015-20210803
i386                 randconfig-a013-20210803
i386                 randconfig-a014-20210803
i386                 randconfig-a016-20210803
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210803
x86_64               randconfig-c001-20210804
x86_64               randconfig-a012-20210803
x86_64               randconfig-a016-20210803
x86_64               randconfig-a013-20210803
x86_64               randconfig-a011-20210803
x86_64               randconfig-a014-20210803
x86_64               randconfig-a015-20210803

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
