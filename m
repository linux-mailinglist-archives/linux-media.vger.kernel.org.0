Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EA0436EF4
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 02:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhJVAqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 20:46:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:5147 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231518AbhJVAqD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 20:46:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="209984465"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; 
   d="scan'208";a="209984465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 17:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; 
   d="scan'208";a="568680635"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2021 17:43:45 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mdieu-000Exn-Pj; Fri, 22 Oct 2021 00:43:44 +0000
Date:   Fri, 22 Oct 2021 08:42:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 b35d3fea2a39c040ae1787d9544b24e5343b0645
Message-ID: <61720913.ktMJC5nH4Aaie7dh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: b35d3fea2a39c040ae1787d9544b24e5343b0645  media: allegro: write vui parameters for HEVC

elapsed time: 1958m

configs tested: 205
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211021
i386                 randconfig-c001-20211019
sh                         microdev_defconfig
arm                        mvebu_v5_defconfig
powerpc                       eiger_defconfig
ia64                      gensparse_defconfig
arm                         shannon_defconfig
arm                             pxa_defconfig
m68k                        mvme16x_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     asp8347_defconfig
powerpc                      mgcoge_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
i386                                defconfig
powerpc                   currituck_defconfig
arm                          exynos_defconfig
sh                          lboxre2_defconfig
sparc                               defconfig
arm                       aspeed_g4_defconfig
arm                        clps711x_defconfig
arc                      axs103_smp_defconfig
arm                            xcep_defconfig
arm                        magician_defconfig
x86_64                           allyesconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
sh                            hp6xx_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          rm200_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
sh                 kfr2r09-romimage_defconfig
csky                             alldefconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    adder875_defconfig
mips                malta_qemu_32r6_defconfig
arc                            hsdk_defconfig
xtensa                       common_defconfig
arm                        shmobile_defconfig
sh                   secureedge5410_defconfig
arm                         palmz72_defconfig
mips                  decstation_64_defconfig
arm                            mmp2_defconfig
powerpc                     tqm8548_defconfig
openrisc                 simple_smp_defconfig
sh                          sdk7780_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        cerfcube_defconfig
xtensa                  nommu_kc705_defconfig
sparc                       sparc64_defconfig
arm                           viper_defconfig
powerpc                          g5_defconfig
mips                           ip28_defconfig
mips                         tb0219_defconfig
m68k                       m5208evb_defconfig
mips                       rbtx49xx_defconfig
um                               alldefconfig
mips                            ar7_defconfig
powerpc                       holly_defconfig
mips                       capcella_defconfig
xtensa                          iss_defconfig
nios2                         3c120_defconfig
sparc                       sparc32_defconfig
arm                  colibri_pxa270_defconfig
powerpc                      pmac32_defconfig
sh                               allmodconfig
arm                          gemini_defconfig
arm                        spear6xx_defconfig
powerpc                      ppc6xx_defconfig
arm                        trizeps4_defconfig
sh                          kfr2r09_defconfig
powerpc                     sequoia_defconfig
arm                         orion5x_defconfig
sh                             espt_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8540_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                            lart_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                         wii_defconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
sh                        edosk7760_defconfig
m68k                       bvme6000_defconfig
sh                          rsk7201_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20211021
x86_64               randconfig-a015-20211021
x86_64               randconfig-a011-20211021
x86_64               randconfig-a014-20211021
x86_64               randconfig-a016-20211021
x86_64               randconfig-a012-20211021
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a012-20211021
i386                 randconfig-a013-20211021
i386                 randconfig-a011-20211021
i386                 randconfig-a016-20211021
i386                 randconfig-a015-20211021
i386                 randconfig-a014-20211021
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211021
riscv                randconfig-r042-20211021
s390                 randconfig-r044-20211021
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20211021
riscv                randconfig-c006-20211021
arm                  randconfig-c002-20211021
x86_64               randconfig-c007-20211021
mips                 randconfig-c004-20211021
s390                 randconfig-c005-20211021
i386                 randconfig-c001-20211021
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
x86_64               randconfig-a002-20211021
x86_64               randconfig-a004-20211021
x86_64               randconfig-a005-20211021
x86_64               randconfig-a001-20211021
x86_64               randconfig-a006-20211021
x86_64               randconfig-a003-20211021
i386                 randconfig-a004-20211021
i386                 randconfig-a003-20211021
i386                 randconfig-a002-20211021
i386                 randconfig-a005-20211021
i386                 randconfig-a001-20211021
i386                 randconfig-a006-20211021
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
hexagon              randconfig-r045-20211021
hexagon              randconfig-r041-20211021
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
