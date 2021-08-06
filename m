Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D13E23B8
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 09:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243021AbhHFHJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 03:09:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:18772 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235480AbhHFHJD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Aug 2021 03:09:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="236298100"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; 
   d="scan'208";a="236298100"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 00:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; 
   d="scan'208";a="523360552"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2021 00:08:46 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mBtyI-000GdR-5s; Fri, 06 Aug 2021 07:08:46 +0000
Date:   Fri, 06 Aug 2021 15:08:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
Message-ID: <610cdff8.fT/g6apmXDOgt58h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead  Merge tag 'v5.14-rc4' into media_tree

elapsed time: 943m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210804
i386                 randconfig-c001-20210805
s390                       zfcpdump_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7269_defconfig
arc                 nsimosci_hs_smp_defconfig
h8300                               defconfig
arm                         socfpga_defconfig
csky                             alldefconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8560_defconfig
mips                         tb0219_defconfig
arm                       mainstone_defconfig
powerpc                     mpc512x_defconfig
um                                  defconfig
riscv                            allmodconfig
sh                      rts7751r2d1_defconfig
mips                     loongson2k_defconfig
arc                                 defconfig
m68k                       m5275evb_defconfig
arm                          imote2_defconfig
m68k                       m5249evb_defconfig
arm                        multi_v7_defconfig
arm                      jornada720_defconfig
i386                             alldefconfig
sh                   sh7724_generic_defconfig
sh                          sdk7780_defconfig
ia64                        generic_defconfig
arm                            hisi_defconfig
mips                         tb0226_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
nios2                            allyesconfig
arm                            lart_defconfig
parisc                generic-64bit_defconfig
sh                        apsh4ad0a_defconfig
powerpc                     sequoia_defconfig
arm                      pxa255-idp_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
openrisc                  or1klitex_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
arm                        oxnas_v6_defconfig
sh                          urquell_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     ep8248e_defconfig
x86_64                            allnoconfig
sh                         ecovec24_defconfig
parisc                           alldefconfig
m68k                         apollo_defconfig
arm                         palmz72_defconfig
mips                            gpr_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210805
x86_64               randconfig-a006-20210805
x86_64               randconfig-a004-20210805
x86_64               randconfig-a003-20210805
x86_64               randconfig-a001-20210805
x86_64               randconfig-a005-20210805
i386                 randconfig-a005-20210805
i386                 randconfig-a004-20210805
i386                 randconfig-a002-20210805
i386                 randconfig-a006-20210805
i386                 randconfig-a003-20210805
i386                 randconfig-a001-20210805
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
i386                 randconfig-a012-20210805
i386                 randconfig-a011-20210805
i386                 randconfig-a015-20210805
i386                 randconfig-a013-20210805
i386                 randconfig-a014-20210805
i386                 randconfig-a016-20210805
i386                 randconfig-a012-20210804
i386                 randconfig-a011-20210804
i386                 randconfig-a015-20210804
i386                 randconfig-a013-20210804
i386                 randconfig-a014-20210804
i386                 randconfig-a016-20210804
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210804
x86_64               randconfig-c001-20210805
x86_64               randconfig-a002-20210804
x86_64               randconfig-a006-20210804
x86_64               randconfig-a004-20210804
x86_64               randconfig-a003-20210804
x86_64               randconfig-a001-20210804
x86_64               randconfig-a005-20210804
x86_64               randconfig-a012-20210805
x86_64               randconfig-a016-20210805
x86_64               randconfig-a011-20210805
x86_64               randconfig-a013-20210805
x86_64               randconfig-a014-20210805
x86_64               randconfig-a015-20210805

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
