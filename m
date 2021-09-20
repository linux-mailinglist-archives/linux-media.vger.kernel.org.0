Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F8A412764
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 22:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhITUlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 16:41:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:13530 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231755AbhITUjs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 16:39:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="222877265"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; 
   d="scan'208";a="222877265"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 13:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; 
   d="scan'208";a="702642664"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2021 13:35:31 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mSQ0g-00066T-K9; Mon, 20 Sep 2021 20:35:30 +0000
Date:   Tue, 21 Sep 2021 04:34:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 0a24c52d78e06d4e6e7cf1f8fe6012f89e93c985
Message-ID: <6148f054.9/iWL9U+ALjIn6Qx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 0a24c52d78e06d4e6e7cf1f8fe6012f89e93c985  media: dvb-frontends/cxd2099: Remove repeated verbose license text

elapsed time: 1893m

configs tested: 227
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210920
arm                         axm55xx_defconfig
mips                     cu1830-neo_defconfig
arc                           tb10x_defconfig
arm                        cerfcube_defconfig
m68k                            q40_defconfig
arm                            mmp2_defconfig
arm                     am200epdkit_defconfig
openrisc                    or1ksim_defconfig
powerpc                    adder875_defconfig
arm                          pcm027_defconfig
sh                         ecovec24_defconfig
arm                        oxnas_v6_defconfig
arc                     nsimosci_hs_defconfig
arm                     davinci_all_defconfig
arm                       aspeed_g5_defconfig
arm                           spitz_defconfig
arm                          ixp4xx_defconfig
microblaze                          defconfig
powerpc                   bluestone_defconfig
powerpc                      bamboo_defconfig
powerpc                        cell_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
alpha                               defconfig
arm                           sunxi_defconfig
sparc                            allyesconfig
arm                          ep93xx_defconfig
powerpc                      pasemi_defconfig
sh                          sdk7780_defconfig
sh                           se7712_defconfig
alpha                            allyesconfig
arm                  colibri_pxa300_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
mips                  decstation_64_defconfig
powerpc                      ppc44x_defconfig
s390                          debug_defconfig
arm                         vf610m4_defconfig
arm                          badge4_defconfig
powerpc                     stx_gp3_defconfig
arm                          moxart_defconfig
powerpc64                           defconfig
arm                        realview_defconfig
mips                        jmr3927_defconfig
arm                      footbridge_defconfig
arm                         s5pv210_defconfig
mips                      fuloong2e_defconfig
m68k                       m5249evb_defconfig
sh                             espt_defconfig
powerpc                   microwatt_defconfig
sh                           se7206_defconfig
mips                           jazz_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            zeus_defconfig
m68k                          amiga_defconfig
sh                                  defconfig
sh                          rsk7264_defconfig
powerpc                   lite5200b_defconfig
mips                        maltaup_defconfig
arm                         assabet_defconfig
mips                        bcm47xx_defconfig
nds32                             allnoconfig
sh                          r7785rp_defconfig
arm                       netwinder_defconfig
arm                         lubbock_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 mpc837x_mds_defconfig
arm                         s3c6400_defconfig
m68k                        mvme147_defconfig
powerpc64                        alldefconfig
arm                       imx_v4_v5_defconfig
mips                         db1xxx_defconfig
arm                   milbeaut_m10v_defconfig
sh                            migor_defconfig
powerpc                      mgcoge_defconfig
mips                     cu1000-neo_defconfig
arm                       cns3420vb_defconfig
xtensa                    smp_lx200_defconfig
mips                           ip32_defconfig
m68k                             alldefconfig
arc                                 defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
powerpc                    ge_imp3a_defconfig
sh                               alldefconfig
x86_64                              defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                            defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
nds32                            alldefconfig
mips                        workpad_defconfig
arm                            xcep_defconfig
arm                           omap1_defconfig
arm                          exynos_defconfig
mips                     decstation_defconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        mvme16x_defconfig
i386                                defconfig
powerpc                  mpc866_ads_defconfig
arm                         at91_dt_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     asp8347_defconfig
mips                       lemote2f_defconfig
arm                         hackkit_defconfig
sh                          rsk7203_defconfig
sh                          rsk7269_defconfig
powerpc                     powernv_defconfig
sh                          rsk7201_defconfig
powerpc                      cm5200_defconfig
powerpc                          g5_defconfig
mips                       rbtx49xx_defconfig
arm                           tegra_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         socfpga_defconfig
h8300                    h8300h-sim_defconfig
x86_64               randconfig-c001-20210920
arm                  randconfig-c002-20210920
x86_64               randconfig-c001-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20210919
x86_64               randconfig-a004-20210919
x86_64               randconfig-a006-20210919
x86_64               randconfig-a003-20210919
x86_64               randconfig-a001-20210919
x86_64               randconfig-a005-20210919
i386                 randconfig-a004-20210919
i386                 randconfig-a005-20210919
i386                 randconfig-a002-20210919
i386                 randconfig-a006-20210919
i386                 randconfig-a001-20210919
i386                 randconfig-a003-20210919
x86_64               randconfig-a014-20210920
x86_64               randconfig-a011-20210920
x86_64               randconfig-a013-20210920
x86_64               randconfig-a012-20210920
x86_64               randconfig-a015-20210920
x86_64               randconfig-a016-20210920
i386                 randconfig-a014-20210920
i386                 randconfig-a013-20210920
i386                 randconfig-a016-20210920
i386                 randconfig-a012-20210920
i386                 randconfig-a011-20210920
i386                 randconfig-a015-20210920
arc                  randconfig-r043-20210920
riscv                randconfig-r042-20210920
s390                 randconfig-r044-20210920
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
powerpc              randconfig-c003-20210920
arm                  randconfig-c002-20210920
mips                 randconfig-c004-20210920
x86_64               randconfig-c007-20210920
riscv                randconfig-c006-20210920
s390                 randconfig-c005-20210920
i386                 randconfig-c001-20210920
x86_64               randconfig-a002-20210920
x86_64               randconfig-a006-20210920
x86_64               randconfig-a005-20210920
x86_64               randconfig-a001-20210920
x86_64               randconfig-a004-20210920
x86_64               randconfig-a003-20210920
i386                 randconfig-a001-20210920
i386                 randconfig-a005-20210920
i386                 randconfig-a002-20210920
i386                 randconfig-a006-20210920
i386                 randconfig-a003-20210920
i386                 randconfig-a004-20210920
x86_64               randconfig-a013-20210919
x86_64               randconfig-a016-20210919
x86_64               randconfig-a012-20210919
x86_64               randconfig-a011-20210919
x86_64               randconfig-a014-20210919
x86_64               randconfig-a015-20210919
i386                 randconfig-a016-20210919
i386                 randconfig-a012-20210919
i386                 randconfig-a011-20210919
i386                 randconfig-a015-20210919
i386                 randconfig-a013-20210919
i386                 randconfig-a014-20210919
riscv                randconfig-r042-20210919
hexagon              randconfig-r045-20210919
s390                 randconfig-r044-20210919
hexagon              randconfig-r041-20210919

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
