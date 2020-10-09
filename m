Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B55288FF7
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 19:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732937AbgJIR13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 13:27:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:45005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732999AbgJIR1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 13:27:21 -0400
IronPort-SDR: UUoL+TryC36xcMj/Td4i22MLwCo5lz43zjK1YI2nJW2zlA4UkupzJgWufr4ACK1Qrg8JQIiEYA
 L1RuEWSSRUaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="250210908"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="250210908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 10:27:18 -0700
IronPort-SDR: 2rqgGawRJFcHyFYwA8vJdgttnNsjad7YK9gcAg20JhgkJay9y+dRllMcskAqoJ0lhvdZivgATs
 49Xv7qjsbfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="312620147"
Received: from lkp-server02.sh.intel.com (HELO 80eb06af76cf) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2020 10:27:16 -0700
Received: from kbuild by 80eb06af76cf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kQwAl-0000eE-Gi; Fri, 09 Oct 2020 17:27:15 +0000
Date:   Sat, 10 Oct 2020 01:26:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 c386e0797d26a32e354daf4480c5d40165db66a1
Message-ID: <5f809d4f.ZcsUoLb8gjftFKNP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: c386e0797d26a32e354daf4480c5d40165db66a1  media: dvb-frontends/drxk_hard.c: fix uninitialized variable warning

elapsed time: 1748m

configs tested: 284
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_virt_defconfig
powerpc                      katmai_defconfig
mips                      loongson3_defconfig
s390                                defconfig
arm                  colibri_pxa300_defconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
arm                          exynos_defconfig
powerpc                  mpc885_ads_defconfig
mips                      bmips_stb_defconfig
arm                      footbridge_defconfig
s390                       zfcpdump_defconfig
m68k                       m5208evb_defconfig
powerpc                    mvme5100_defconfig
mips                        jmr3927_defconfig
mips                       rbtx49xx_defconfig
arm                            u300_defconfig
arm                            lart_defconfig
m68k                          atari_defconfig
powerpc                     pseries_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7757lcr_defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        m5307c3_defconfig
arm                             mxs_defconfig
h8300                               defconfig
xtensa                generic_kc705_defconfig
sh                   secureedge5410_defconfig
sh                        apsh4ad0a_defconfig
arm                       multi_v4t_defconfig
m68k                           sun3_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        mvebu_v5_defconfig
arm                           omap1_defconfig
mips                   sb1250_swarm_defconfig
m68k                          hp300_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                          alldefconfig
arm                     am200epdkit_defconfig
arm                        magician_defconfig
powerpc                      ppc44x_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
powerpc                      ppc64e_defconfig
powerpc                        warp_defconfig
arc                          axs101_defconfig
powerpc                 mpc8540_ads_defconfig
mips                         bigsur_defconfig
arm                       imx_v6_v7_defconfig
i386                             allyesconfig
arm                           corgi_defconfig
arc                      axs103_smp_defconfig
arm                         s3c6400_defconfig
arm                       mainstone_defconfig
mips                             allyesconfig
powerpc                     ep8248e_defconfig
powerpc                        fsp2_defconfig
sh                           se7343_defconfig
sh                          polaris_defconfig
arm                           sama5_defconfig
powerpc                      bamboo_defconfig
sh                         ecovec24_defconfig
arm                        clps711x_defconfig
arm                       aspeed_g5_defconfig
arm                              zx_defconfig
sh                          r7785rp_defconfig
powerpc                     kilauea_defconfig
arm                           efm32_defconfig
powerpc                 mpc8560_ads_defconfig
arm                             rpc_defconfig
m68k                          sun3x_defconfig
mips                      pistachio_defconfig
arm                          moxart_defconfig
powerpc                         ps3_defconfig
arm                           h3600_defconfig
powerpc                     mpc512x_defconfig
parisc                           allyesconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                             allmodconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
sh                          landisk_defconfig
mips                     decstation_defconfig
sparc                               defconfig
arm                       netwinder_defconfig
arm                          ep93xx_defconfig
powerpc                   motionpro_defconfig
sparc64                             defconfig
arc                        nsim_700_defconfig
arm                        multi_v7_defconfig
powerpc                       maple_defconfig
i386                             alldefconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     powernv_defconfig
powerpc                      mgcoge_defconfig
sh                          kfr2r09_defconfig
powerpc                     tqm5200_defconfig
powerpc                  storcenter_defconfig
sh                        dreamcast_defconfig
m68k                       m5275evb_defconfig
riscv                             allnoconfig
powerpc                     ppa8548_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
sh                           se7724_defconfig
sh                           sh2007_defconfig
sh                        sh7785lcr_defconfig
arm                         cm_x300_defconfig
powerpc                      walnut_defconfig
mips                     loongson1b_defconfig
mips                      malta_kvm_defconfig
sh                           se7721_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7780mp_defconfig
um                             i386_defconfig
powerpc                     tqm8548_defconfig
parisc                           alldefconfig
powerpc                      obs600_defconfig
riscv                               defconfig
sh                             shx3_defconfig
arm                       spear13xx_defconfig
mips                 decstation_r4k_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
xtensa                              defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
sh                           se7712_defconfig
mips                         mpc30x_defconfig
powerpc                      makalu_defconfig
arm                         mv78xx0_defconfig
arm                         assabet_defconfig
mips                          ath25_defconfig
powerpc                      pcm030_defconfig
xtensa                    xip_kc705_defconfig
arm                          pcm027_defconfig
sh                         microdev_defconfig
arm                            xcep_defconfig
parisc                generic-32bit_defconfig
microblaze                    nommu_defconfig
mips                           rs90_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
sparc                       sparc32_defconfig
h8300                            alldefconfig
arm                           viper_defconfig
powerpc                      chrp32_defconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      pic32mzda_defconfig
arm                         s5pv210_defconfig
x86_64                              defconfig
powerpc                   currituck_defconfig
arm                           tegra_defconfig
mips                            gpr_defconfig
arm                          collie_defconfig
arm                         nhk8815_defconfig
arm                       aspeed_g4_defconfig
arm                        spear3xx_defconfig
openrisc                         alldefconfig
arm                          pxa168_defconfig
arc                        vdk_hs38_defconfig
arm                        trizeps4_defconfig
mips                           ip28_defconfig
m68k                         apollo_defconfig
powerpc                      ppc6xx_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        qi_lb60_defconfig
c6x                        evmc6472_defconfig
sh                     sh7710voipgw_defconfig
m68k                          multi_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
ia64                             alldefconfig
arm                        oxnas_v6_defconfig
h8300                     edosk2674_defconfig
sh                             espt_defconfig
arm                   milbeaut_m10v_defconfig
mips                    maltaup_xpa_defconfig
arm                         bcm2835_defconfig
arm                        shmobile_defconfig
powerpc                      arches_defconfig
powerpc                    gamecube_defconfig
powerpc                     ksi8560_defconfig
arm                     eseries_pxa_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
sh                              ul2_defconfig
sh                          lboxre2_defconfig
mips                       capcella_defconfig
powerpc                       eiger_defconfig
powerpc                     kmeter1_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
sparc                            allyesconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201008
x86_64               randconfig-a003-20201008
x86_64               randconfig-a005-20201008
x86_64               randconfig-a001-20201008
x86_64               randconfig-a002-20201008
x86_64               randconfig-a006-20201008
i386                 randconfig-a006-20201008
i386                 randconfig-a005-20201008
i386                 randconfig-a001-20201008
i386                 randconfig-a004-20201008
i386                 randconfig-a002-20201008
i386                 randconfig-a003-20201008
i386                 randconfig-a006-20201009
i386                 randconfig-a005-20201009
i386                 randconfig-a001-20201009
i386                 randconfig-a004-20201009
i386                 randconfig-a002-20201009
i386                 randconfig-a003-20201009
x86_64               randconfig-a012-20201009
x86_64               randconfig-a015-20201009
x86_64               randconfig-a013-20201009
x86_64               randconfig-a014-20201009
x86_64               randconfig-a011-20201009
x86_64               randconfig-a016-20201009
i386                 randconfig-a015-20201009
i386                 randconfig-a013-20201009
i386                 randconfig-a014-20201009
i386                 randconfig-a016-20201009
i386                 randconfig-a011-20201009
i386                 randconfig-a012-20201009
i386                 randconfig-a015-20201008
i386                 randconfig-a013-20201008
i386                 randconfig-a014-20201008
i386                 randconfig-a016-20201008
i386                 randconfig-a011-20201008
i386                 randconfig-a012-20201008
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201009
x86_64               randconfig-a003-20201009
x86_64               randconfig-a005-20201009
x86_64               randconfig-a001-20201009
x86_64               randconfig-a002-20201009
x86_64               randconfig-a006-20201009
x86_64               randconfig-a012-20201008
x86_64               randconfig-a015-20201008
x86_64               randconfig-a013-20201008
x86_64               randconfig-a014-20201008
x86_64               randconfig-a011-20201008
x86_64               randconfig-a016-20201008

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
