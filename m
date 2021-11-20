Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4310C45800E
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 19:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbhKTS4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 13:56:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:44869 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhKTS4U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 13:56:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10174"; a="221477626"
X-IronPort-AV: E=Sophos;i="5.87,251,1631602800"; 
   d="scan'208";a="221477626"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2021 10:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,251,1631602800"; 
   d="scan'208";a="673598653"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2021 10:53:14 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1moVUA-00069O-7l; Sat, 20 Nov 2021 18:53:14 +0000
Date:   Sun, 21 Nov 2021 02:52:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 e594cda5f8c8e34ac6444166418690c65bbda47f
Message-ID: <61994408./Xe9lSxck46RhxPD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: e594cda5f8c8e34ac6444166418690c65bbda47f  media: sp887x: drop unneeded assignment

elapsed time: 1522m

configs tested: 268
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211118
i386                 randconfig-c001-20211119
mips                 randconfig-c004-20211118
i386                 randconfig-c001-20211120
arm                        spear6xx_defconfig
powerpc                     tqm8555_defconfig
xtensa                       common_defconfig
sh                        dreamcast_defconfig
powerpc                        cell_defconfig
arm                            pleb_defconfig
xtensa                              defconfig
xtensa                           alldefconfig
mips                       lemote2f_defconfig
powerpc                      walnut_defconfig
mips                             allyesconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
arm                         at91_dt_defconfig
mips                        omega2p_defconfig
powerpc                   microwatt_defconfig
arm                              alldefconfig
s390                          debug_defconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                         palmz72_defconfig
arc                     nsimosci_hs_defconfig
arm                       omap2plus_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                         apollo_defconfig
mips                           mtx1_defconfig
powerpc                        icon_defconfig
sh                           se7750_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
arc                         haps_hs_defconfig
m68k                       m5475evb_defconfig
mips                         bigsur_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        m5272c3_defconfig
alpha                            allyesconfig
sh                          rsk7264_defconfig
sh                          rsk7269_defconfig
arc                        nsim_700_defconfig
mips                 decstation_r4k_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
sparc                       sparc32_defconfig
xtensa                  cadence_csp_defconfig
mips                  cavium_octeon_defconfig
arm                         socfpga_defconfig
arm                          ep93xx_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     ppa8548_defconfig
sh                        edosk7705_defconfig
riscv                            alldefconfig
powerpc                   lite5200b_defconfig
mips                         tb0226_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         s5pv210_defconfig
m68k                        stmark2_defconfig
arm64                            alldefconfig
powerpc                     tqm8560_defconfig
mips                   sb1250_swarm_defconfig
arm                          pxa3xx_defconfig
m68k                             alldefconfig
powerpc                     skiroot_defconfig
sh                        sh7785lcr_defconfig
sh                          lboxre2_defconfig
powerpc                     pseries_defconfig
arm                         s3c2410_defconfig
sh                                  defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      pasemi_defconfig
powerpc                     rainier_defconfig
sparc64                             defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          collie_defconfig
arc                     haps_hs_smp_defconfig
sh                   sh7770_generic_defconfig
mips                       bmips_be_defconfig
m68k                            mac_defconfig
h8300                     edosk2674_defconfig
arm                             mxs_defconfig
sh                               allmodconfig
arm                           stm32_defconfig
arm                            hisi_defconfig
sh                          urquell_defconfig
sh                        apsh4ad0a_defconfig
arm                          simpad_defconfig
parisc                              defconfig
m68k                        m5407c3_defconfig
arm                        vexpress_defconfig
powerpc                    sam440ep_defconfig
mips                     loongson1c_defconfig
m68k                           sun3_defconfig
arm                         cm_x300_defconfig
powerpc                     ep8248e_defconfig
csky                                defconfig
powerpc                      ppc40x_defconfig
powerpc                         ps3_defconfig
arc                        vdk_hs38_defconfig
arm                            dove_defconfig
xtensa                          iss_defconfig
microblaze                          defconfig
parisc                           allyesconfig
arm                           sunxi_defconfig
m68k                          multi_defconfig
s390                       zfcpdump_defconfig
um                           x86_64_defconfig
powerpc                   motionpro_defconfig
powerpc                     kmeter1_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
arm                         hackkit_defconfig
arm                     eseries_pxa_defconfig
sh                        sh7763rdp_defconfig
i386                             alldefconfig
arm                      tct_hammer_defconfig
powerpc                      bamboo_defconfig
arm                         lubbock_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
h8300                            allyesconfig
mips                           gcw0_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                  randconfig-c002-20211118
arm                  randconfig-c002-20211119
arm                  randconfig-c002-20211120
arm                  randconfig-c002-20211121
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
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211119
x86_64               randconfig-a003-20211119
x86_64               randconfig-a002-20211119
x86_64               randconfig-a001-20211119
x86_64               randconfig-a006-20211119
x86_64               randconfig-a004-20211119
i386                 randconfig-a006-20211119
i386                 randconfig-a003-20211119
i386                 randconfig-a001-20211119
i386                 randconfig-a005-20211119
i386                 randconfig-a004-20211119
i386                 randconfig-a002-20211119
x86_64               randconfig-a001-20211121
x86_64               randconfig-a006-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
x86_64               randconfig-a002-20211121
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
x86_64               randconfig-a011-20211120
x86_64               randconfig-a014-20211120
x86_64               randconfig-a012-20211120
x86_64               randconfig-a016-20211120
x86_64               randconfig-a013-20211120
x86_64               randconfig-a015-20211120
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
i386                 randconfig-a016-20211120
i386                 randconfig-a015-20211120
i386                 randconfig-a012-20211120
i386                 randconfig-a013-20211120
i386                 randconfig-a014-20211120
i386                 randconfig-a011-20211120
arc                  randconfig-r043-20211120
s390                 randconfig-r044-20211120
riscv                randconfig-r042-20211120
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20211119
x86_64               randconfig-c007-20211119
arm                  randconfig-c002-20211119
s390                 randconfig-c005-20211119
powerpc              randconfig-c003-20211119
riscv                randconfig-c006-20211119
i386                 randconfig-c001-20211118
x86_64               randconfig-c007-20211118
arm                  randconfig-c002-20211118
s390                 randconfig-c005-20211118
powerpc              randconfig-c003-20211118
riscv                randconfig-c006-20211118
mips                 randconfig-c004-20211118
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
i386                 randconfig-a006-20211118
i386                 randconfig-a003-20211118
i386                 randconfig-a001-20211118
i386                 randconfig-a005-20211118
i386                 randconfig-a004-20211118
i386                 randconfig-a002-20211118
x86_64               randconfig-a015-20211119
x86_64               randconfig-a011-20211119
x86_64               randconfig-a012-20211119
x86_64               randconfig-a013-20211119
x86_64               randconfig-a016-20211119
x86_64               randconfig-a014-20211119
hexagon              randconfig-r045-20211119
hexagon              randconfig-r041-20211119
riscv                randconfig-r042-20211119
s390                 randconfig-r044-20211119
hexagon              randconfig-r045-20211118
hexagon              randconfig-r041-20211118
hexagon              randconfig-r045-20211121
s390                 randconfig-r044-20211121
hexagon              randconfig-r041-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
