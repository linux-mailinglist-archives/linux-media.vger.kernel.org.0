Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C3241CB65
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 19:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344646AbhI2SAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 14:00:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:52936 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244878AbhI2SAK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 14:00:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225075985"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="225075985"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 10:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="708460010"
Received: from lkp-server02.sh.intel.com (HELO f7acefbbae94) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2021 10:58:27 -0700
Received: from kbuild by f7acefbbae94 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mVdqc-00033B-I7; Wed, 29 Sep 2021 17:58:26 +0000
Date:   Thu, 30 Sep 2021 01:58:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 ff79e5dea29136a6e92bfabc58ec4562f6ae9526
Message-ID: <6154a93c.Tt35BR6YmitxjfIK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: ff79e5dea29136a6e92bfabc58ec4562f6ae9526  Merge commit 'e6609f2c07de03b948fd6c37c5eb4ade3a6d785c' into media_stage

elapsed time: 2101m

configs tested: 321
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210928
i386                 randconfig-c001-20210929
i386                 randconfig-c001-20210927
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
sh                         microdev_defconfig
sh                        apsh4ad0a_defconfig
h8300                       h8s-sim_defconfig
sh                         ecovec24_defconfig
sh                   rts7751r2dplus_defconfig
sh                        edosk7705_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     ppa8548_defconfig
arm                       imx_v6_v7_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      bamboo_defconfig
mips                    maltaup_xpa_defconfig
arm                          ep93xx_defconfig
powerpc                    amigaone_defconfig
powerpc                     ksi8560_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7203_defconfig
powerpc                       ebony_defconfig
mips                            ar7_defconfig
xtensa                    smp_lx200_defconfig
arm                          iop32x_defconfig
powerpc                      pasemi_defconfig
m68k                        m5307c3_defconfig
sh                           se7343_defconfig
powerpc                     mpc512x_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
powerpc                 mpc8560_ads_defconfig
mips                           rs90_defconfig
powerpc                     kilauea_defconfig
powerpc                       ppc64_defconfig
ia64                      gensparse_defconfig
powerpc                      pmac32_defconfig
m68k                            mac_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         bigsur_defconfig
arm                          collie_defconfig
sh                         ap325rxa_defconfig
powerpc                      mgcoge_defconfig
mips                       lemote2f_defconfig
sh                        sh7757lcr_defconfig
powerpc                     powernv_defconfig
arm                      pxa255-idp_defconfig
arm                          pxa168_defconfig
sh                           se7721_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
mips                        maltaup_defconfig
powerpc                       holly_defconfig
arm                      footbridge_defconfig
um                                  defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
powerpc                      arches_defconfig
arc                          axs101_defconfig
xtensa                    xip_kc705_defconfig
ia64                          tiger_defconfig
arm                           spitz_defconfig
mips                        bcm47xx_defconfig
sh                          lboxre2_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
parisc                           alldefconfig
ia64                                defconfig
powerpc                     taishan_defconfig
mips                     decstation_defconfig
arm                         s5pv210_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
powerpc                     tqm8555_defconfig
powerpc                   microwatt_defconfig
microblaze                          defconfig
arm                         hackkit_defconfig
powerpc                   bluestone_defconfig
powerpc                    adder875_defconfig
powerpc                    socrates_defconfig
sh                           se7722_defconfig
arm                            pleb_defconfig
arm                     am200epdkit_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_rdb_defconfig
nds32                            alldefconfig
mips                           jazz_defconfig
arm                       netwinder_defconfig
mips                      maltaaprp_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     tqm8541_defconfig
powerpc                 linkstation_defconfig
sh                        sh7763rdp_defconfig
arm                           sama7_defconfig
powerpc                     tqm8560_defconfig
powerpc                     asp8347_defconfig
mips                        jmr3927_defconfig
sparc                       sparc32_defconfig
m68k                        mvme16x_defconfig
arm                        realview_defconfig
ia64                            zx1_defconfig
nds32                               defconfig
powerpc                      ep88xc_defconfig
m68k                          atari_defconfig
mips                           ip32_defconfig
arc                        nsimosci_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
m68k                       bvme6000_defconfig
mips                     loongson1c_defconfig
mips                         mpc30x_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                          g5_defconfig
sh                            hp6xx_defconfig
arm                       spear13xx_defconfig
arc                        nsim_700_defconfig
arm                           tegra_defconfig
riscv                            alldefconfig
sparc64                             defconfig
arm                            hisi_defconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
arm                         s3c6400_defconfig
powerpc                  storcenter_defconfig
m68k                           sun3_defconfig
parisc                              defconfig
arm                           u8500_defconfig
mips                         tb0226_defconfig
arm                          lpd270_defconfig
mips                        bcm63xx_defconfig
mips                           ci20_defconfig
arm                        keystone_defconfig
arm                        mvebu_v7_defconfig
mips                            gpr_defconfig
mips                   sb1250_swarm_defconfig
sh                           se7750_defconfig
sh                          kfr2r09_defconfig
arm                          simpad_defconfig
arm                         lpc18xx_defconfig
powerpc                      ppc6xx_defconfig
mips                  decstation_64_defconfig
sh                            migor_defconfig
sh                     magicpanelr2_defconfig
arm                         axm55xx_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
um                             i386_defconfig
arm                              alldefconfig
mips                         rt305x_defconfig
sh                                  defconfig
sh                          rsk7264_defconfig
sh                      rts7751r2d1_defconfig
microblaze                      mmu_defconfig
arm                           viper_defconfig
h8300                            allyesconfig
arm                        spear6xx_defconfig
arm                            mmp2_defconfig
arm                         assabet_defconfig
sh                           sh2007_defconfig
arm                          ixp4xx_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm5200_defconfig
sh                ecovec24-romimage_defconfig
sh                          urquell_defconfig
mips                           ip27_defconfig
sh                          r7780mp_defconfig
m68k                        m5272c3_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                         amcore_defconfig
powerpc                    gamecube_defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
sh                               j2_defconfig
sh                           se7780_defconfig
sh                             shx3_defconfig
arm                          gemini_defconfig
m68k                            q40_defconfig
mips                           ip22_defconfig
csky                             alldefconfig
powerpc                   currituck_defconfig
sh                           se7619_defconfig
s390                                defconfig
s390                          debug_defconfig
ia64                             alldefconfig
arm                         palmz72_defconfig
powerpc                      acadia_defconfig
sh                        sh7785lcr_defconfig
arm                          pxa3xx_defconfig
mips                           xway_defconfig
sh                           se7751_defconfig
sh                          sdk7780_defconfig
arm                             ezx_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7705_defconfig
mips                     cu1830-neo_defconfig
x86_64               randconfig-c001-20210928
arm                  randconfig-c002-20210928
x86_64               randconfig-c001-20210929
arm                  randconfig-c002-20210929
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210929
x86_64               randconfig-a005-20210929
x86_64               randconfig-a001-20210929
x86_64               randconfig-a006-20210929
x86_64               randconfig-a003-20210929
x86_64               randconfig-a004-20210929
i386                 randconfig-a001-20210929
i386                 randconfig-a005-20210929
i386                 randconfig-a002-20210929
i386                 randconfig-a006-20210929
i386                 randconfig-a004-20210929
i386                 randconfig-a003-20210929
x86_64               randconfig-a014-20210928
x86_64               randconfig-a011-20210928
x86_64               randconfig-a013-20210928
x86_64               randconfig-a012-20210928
x86_64               randconfig-a015-20210928
x86_64               randconfig-a016-20210928
i386                 randconfig-a014-20210928
i386                 randconfig-a013-20210928
i386                 randconfig-a016-20210928
i386                 randconfig-a011-20210928
i386                 randconfig-a015-20210928
i386                 randconfig-a012-20210928
arc                  randconfig-r043-20210928
riscv                randconfig-r042-20210928
s390                 randconfig-r044-20210928
arc                  randconfig-r043-20210929
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
powerpc              randconfig-c003-20210927
x86_64               randconfig-c007-20210927
mips                 randconfig-c004-20210927
arm                  randconfig-c002-20210927
riscv                randconfig-c006-20210927
s390                 randconfig-c005-20210927
i386                 randconfig-c001-20210927
powerpc              randconfig-c003-20210929
mips                 randconfig-c004-20210929
arm                  randconfig-c002-20210929
x86_64               randconfig-c007-20210929
riscv                randconfig-c006-20210929
s390                 randconfig-c005-20210929
i386                 randconfig-c001-20210929
powerpc              randconfig-c003-20210928
arm                  randconfig-c002-20210928
mips                 randconfig-c004-20210928
x86_64               randconfig-c007-20210928
riscv                randconfig-c006-20210928
s390                 randconfig-c005-20210928
i386                 randconfig-c001-20210928
x86_64               randconfig-a002-20210928
x86_64               randconfig-a005-20210928
x86_64               randconfig-a001-20210928
x86_64               randconfig-a006-20210928
x86_64               randconfig-a003-20210928
x86_64               randconfig-a004-20210928
i386                 randconfig-a001-20210928
i386                 randconfig-a005-20210928
i386                 randconfig-a002-20210928
i386                 randconfig-a006-20210928
i386                 randconfig-a004-20210928
i386                 randconfig-a003-20210928
x86_64               randconfig-a014-20210929
x86_64               randconfig-a011-20210929
x86_64               randconfig-a013-20210929
x86_64               randconfig-a015-20210929
x86_64               randconfig-a012-20210929
x86_64               randconfig-a016-20210929
i386                 randconfig-a014-20210929
i386                 randconfig-a013-20210929
i386                 randconfig-a016-20210929
i386                 randconfig-a011-20210929
i386                 randconfig-a015-20210929
i386                 randconfig-a012-20210929
hexagon              randconfig-r045-20210929
riscv                randconfig-r042-20210929
hexagon              randconfig-r041-20210929
s390                 randconfig-r044-20210929
hexagon              randconfig-r045-20210928
hexagon              randconfig-r041-20210928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
