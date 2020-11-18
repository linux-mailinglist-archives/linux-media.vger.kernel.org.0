Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533EB2B83A6
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgKRSL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:11:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:47328 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgKRSL4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:11:56 -0500
IronPort-SDR: sPv35odg3BJXj1vTCnusXuJZyVeNqPVpxAi3T+b2MAyLwhKSwoRZG5jujpnH3Y/0u1fEdgbmCy
 yfIBjovKqArw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171330173"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="171330173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 10:11:55 -0800
IronPort-SDR: +q1TwfRhTTMaXnaV+4AP+20WdYK61fvpPBEnpUTzwEXEmDPQm6fKLTr1aGOFrmqswcgFyE5st1
 x+zTWZ0rRmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="368571565"
Received: from lkp-server02.sh.intel.com (HELO 67996b229c47) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Nov 2020 10:11:53 -0800
Received: from kbuild by 67996b229c47 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfRvt-0000Bs-0n; Wed, 18 Nov 2020 18:11:53 +0000
Date:   Thu, 19 Nov 2020 02:11:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 9463e07df8e0f93931e32c6f415d3f82bda63f35
Message-ID: <5fb563bc.+gt/Lq+gMmv9Gtup%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 9463e07df8e0f93931e32c6f415d3f82bda63f35  media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs

elapsed time: 2148m

configs tested: 290
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
um                           x86_64_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
mips                     cu1830-neo_defconfig
arm                         socfpga_defconfig
x86_64                           allyesconfig
nios2                         10m50_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm8540_defconfig
sh                          rsk7201_defconfig
powerpc                       eiger_defconfig
m68k                        mvme147_defconfig
xtensa                          iss_defconfig
mips                           ci20_defconfig
powerpc                     mpc5200_defconfig
m68k                            mac_defconfig
arm                          tango4_defconfig
arm                        spear3xx_defconfig
nios2                            alldefconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
powerpc                     skiroot_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                       cns3420vb_defconfig
arm                        mini2440_defconfig
arm                        vexpress_defconfig
mips                  decstation_64_defconfig
sh                          rsk7203_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                         bigsur_defconfig
sh                           sh2007_defconfig
mips                        bcm63xx_defconfig
mips                malta_kvm_guest_defconfig
powerpc                     redwood_defconfig
arm                        cerfcube_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
arm                    vt8500_v6_v7_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
arc                         haps_hs_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          pxa910_defconfig
sh                           se7206_defconfig
c6x                                 defconfig
mips                            ar7_defconfig
arm                            hisi_defconfig
powerpc                 linkstation_defconfig
mips                          rb532_defconfig
openrisc                    or1ksim_defconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
powerpc                     tqm8555_defconfig
powerpc                     tqm8560_defconfig
arm                         orion5x_defconfig
powerpc                      mgcoge_defconfig
mips                           mtx1_defconfig
m68k                             allmodconfig
powerpc                    ge_imp3a_defconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     ksi8560_defconfig
microblaze                    nommu_defconfig
sh                   sh7724_generic_defconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
mips                        omega2p_defconfig
mips                    maltaup_xpa_defconfig
mips                       bmips_be_defconfig
arm                          exynos_defconfig
mips                 decstation_r4k_defconfig
mips                      maltasmvp_defconfig
nds32                               defconfig
mips                          rm200_defconfig
mips                       lemote2f_defconfig
powerpc                     ppa8548_defconfig
sh                     magicpanelr2_defconfig
arm                      tct_hammer_defconfig
c6x                         dsk6455_defconfig
csky                             alldefconfig
sparc64                             defconfig
arm                           viper_defconfig
sh                   sh7770_generic_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      arches_defconfig
arm                          pcm027_defconfig
mips                           ip32_defconfig
arm                            zeus_defconfig
arm                           omap1_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
powerpc                           allnoconfig
arm                         hackkit_defconfig
m68k                         apollo_defconfig
sh                          urquell_defconfig
powerpc                      obs600_defconfig
arm                             mxs_defconfig
arc                      axs103_smp_defconfig
mips                        qi_lb60_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
c6x                        evmc6472_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
x86_64                           alldefconfig
sh                           se7721_defconfig
sh                                  defconfig
arm                         mv78xx0_defconfig
m68k                          hp300_defconfig
mips                        bcm47xx_defconfig
arm                       mainstone_defconfig
xtensa                       common_defconfig
arc                                 defconfig
h8300                    h8300h-sim_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                               alldefconfig
arm                           h3600_defconfig
powerpc                     pq2fads_defconfig
powerpc                      pmac32_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7722_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          iop32x_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
powerpc                     powernv_defconfig
arm                            mmp2_defconfig
arm                         lpc32xx_defconfig
ia64                      gensparse_defconfig
s390                          debug_defconfig
sh                          landisk_defconfig
sh                            titan_defconfig
arm                        oxnas_v6_defconfig
sh                               j2_defconfig
xtensa                  cadence_csp_defconfig
mips                        workpad_defconfig
mips                         cobalt_defconfig
sh                          polaris_defconfig
arm                            lart_defconfig
arm                          prima2_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
arm                       netwinder_defconfig
arm                         s3c2410_defconfig
csky                                defconfig
mips                         mpc30x_defconfig
riscv                               defconfig
i386                                defconfig
arm                           h5000_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm5200_defconfig
mips                            e55_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a001-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a004-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201117
i386                 randconfig-a014-20201117
i386                 randconfig-a016-20201117
i386                 randconfig-a011-20201117
i386                 randconfig-a015-20201117
i386                 randconfig-a013-20201117
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201117
x86_64               randconfig-a005-20201117
x86_64               randconfig-a004-20201117
x86_64               randconfig-a002-20201117
x86_64               randconfig-a001-20201117
x86_64               randconfig-a006-20201117
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
