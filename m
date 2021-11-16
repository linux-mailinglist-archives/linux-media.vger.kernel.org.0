Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A433453A46
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 20:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239708AbhKPTla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 14:41:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:60192 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236700AbhKPTla (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 14:41:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="257570083"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="257570083"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 11:38:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="604438478"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2021 11:38:21 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mn4Hc-0000kQ-ON; Tue, 16 Nov 2021 19:38:20 +0000
Date:   Wed, 17 Nov 2021 03:38:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 5efe5721c18c326036ca71bec4fb56472e1f9350
Message-ID: <6194089f.F/XfEE4uBCJnU6TR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 5efe5721c18c326036ca71bec4fb56472e1f9350  media: rc: ir-hix5hd2: Add the dependency on HAS_IOMEM

elapsed time: 2030m

configs tested: 207
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211115
arm                            zeus_defconfig
nios2                         10m50_defconfig
arm                          pcm027_defconfig
arm                         assabet_defconfig
arm                           tegra_defconfig
h8300                            alldefconfig
powerpc                 mpc834x_itx_defconfig
mips                        bcm47xx_defconfig
ia64                         bigsur_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
x86_64                              defconfig
arm                        cerfcube_defconfig
powerpc                       eiger_defconfig
mips                     loongson2k_defconfig
powerpc                    socrates_defconfig
xtensa                       common_defconfig
mips                  decstation_64_defconfig
powerpc                       maple_defconfig
powerpc                      katmai_defconfig
sh                           se7343_defconfig
arm                        trizeps4_defconfig
powerpc                    sam440ep_defconfig
mips                         bigsur_defconfig
sh                        edosk7760_defconfig
riscv                               defconfig
um                                  defconfig
sh                          r7780mp_defconfig
arm                            xcep_defconfig
sh                        apsh4ad0a_defconfig
openrisc                 simple_smp_defconfig
arc                        vdk_hs38_defconfig
powerpc64                           defconfig
arm                        mvebu_v5_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
xtensa                generic_kc705_defconfig
arm                        clps711x_defconfig
arm                         socfpga_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           rs90_defconfig
arm                          exynos_defconfig
powerpc                        cell_defconfig
arm                         axm55xx_defconfig
arm                           sama5_defconfig
mips                          rm200_defconfig
arm                           stm32_defconfig
arm                       spear13xx_defconfig
ia64                             alldefconfig
arm                         cm_x300_defconfig
arm                       cns3420vb_defconfig
sparc                       sparc64_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         lubbock_defconfig
powerpc                      ppc6xx_defconfig
arm                       omap2plus_defconfig
powerpc                     ep8248e_defconfig
mips                         cobalt_defconfig
powerpc                         ps3_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          gemini_defconfig
arm                     eseries_pxa_defconfig
arm                           u8500_defconfig
m68k                            mac_defconfig
arm                          badge4_defconfig
sh                           sh2007_defconfig
powerpc                     ksi8560_defconfig
powerpc                     kilauea_defconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
powerpc                   microwatt_defconfig
mips                       bmips_be_defconfig
um                               alldefconfig
sh                          urquell_defconfig
parisc                           alldefconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc832x_mds_defconfig
mips                     loongson1c_defconfig
arm                             pxa_defconfig
arm                             rpc_defconfig
mips                         mpc30x_defconfig
nds32                            alldefconfig
xtensa                    xip_kc705_defconfig
nios2                         3c120_defconfig
arm                       mainstone_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                         ecovec24_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mini2440_defconfig
arm                  randconfig-c002-20211116
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20211115
i386                 randconfig-c001-20211115
arm                  randconfig-c002-20211115
riscv                randconfig-c006-20211115
powerpc              randconfig-c003-20211115
s390                 randconfig-c005-20211115
mips                 randconfig-c004-20211115
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
x86_64               randconfig-a015-20211115
x86_64               randconfig-a013-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a016-20211115
x86_64               randconfig-a014-20211115
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
s390                 randconfig-r044-20211115
hexagon              randconfig-r045-20211116
hexagon              randconfig-r041-20211116
hexagon              randconfig-r041-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
