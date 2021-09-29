Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7388041BC27
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 03:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243648AbhI2BWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 21:22:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:56102 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243604AbhI2BWP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 21:22:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="310386653"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="310386653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 18:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="708128131"
Received: from lkp-server02.sh.intel.com (HELO f7acefbbae94) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2021 18:20:34 -0700
Received: from kbuild by f7acefbbae94 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mVOGv-0001iV-PF; Wed, 29 Sep 2021 01:20:33 +0000
Date:   Wed, 29 Sep 2021 09:20:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 952aab37b1217fbd9146dbb841ab38fe2477c753
Message-ID: <6153bf45.xKuPP+6WwBxKCZVz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 952aab37b1217fbd9146dbb841ab38fe2477c753  Merge tag 'v5.15-rc2' into media_stage

elapsed time: 2004m

configs tested: 247
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210927
i386                 randconfig-c001-20210928
h8300                       h8s-sim_defconfig
sh                         ecovec24_defconfig
sh                   rts7751r2dplus_defconfig
sh                        edosk7705_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     ppa8548_defconfig
arm                         socfpga_defconfig
sh                               alldefconfig
sh                        dreamcast_defconfig
sh                              ul2_defconfig
m68k                       bvme6000_defconfig
xtensa                    xip_kc705_defconfig
arm                            hisi_defconfig
mips                  decstation_64_defconfig
powerpc                      pasemi_defconfig
m68k                        m5307c3_defconfig
sh                           se7343_defconfig
powerpc                     mpc512x_defconfig
mips                         cobalt_defconfig
powerpc                     powernv_defconfig
arm                      pxa255-idp_defconfig
arm                          pxa168_defconfig
sh                           se7721_defconfig
mips                     decstation_defconfig
arm                         s5pv210_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
sh                           se7722_defconfig
arm                            pleb_defconfig
arm                          ep93xx_defconfig
arm                     am200epdkit_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_rdb_defconfig
riscv                    nommu_k210_defconfig
mips                     cu1830-neo_defconfig
nios2                         3c120_defconfig
sh                        edosk7760_defconfig
arc                        nsim_700_defconfig
riscv                             allnoconfig
sh                          rsk7269_defconfig
sh                          r7785rp_defconfig
powerpc                        fsp2_defconfig
s390                             alldefconfig
arc                          axs103_defconfig
powerpc                   motionpro_defconfig
powerpc                      makalu_defconfig
arm                         lpc18xx_defconfig
arm                        magician_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8548_defconfig
xtensa                              defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ep88xc_defconfig
m68k                          atari_defconfig
mips                           ip32_defconfig
arc                        nsimosci_defconfig
nds32                               defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    klondike_defconfig
mips                           xway_defconfig
arm                         vf610m4_defconfig
xtensa                          iss_defconfig
sh                          rsk7203_defconfig
riscv                            alldefconfig
sparc64                             defconfig
powerpc                     kilauea_defconfig
arm                         palmz72_defconfig
powerpc                      ppc40x_defconfig
arm                          collie_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
mips                         tb0226_defconfig
arm                          lpd270_defconfig
mips                        bcm63xx_defconfig
arm                         hackkit_defconfig
mips                           ci20_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc6xx_defconfig
mips                      maltaaprp_defconfig
arc                        vdk_hs38_defconfig
powerpc                 linkstation_defconfig
powerpc                       holly_defconfig
sh                            migor_defconfig
sh                     magicpanelr2_defconfig
arm                         axm55xx_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
um                             i386_defconfig
arm                              alldefconfig
arm                             rpc_defconfig
arm                          badge4_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7264_defconfig
m68k                            q40_defconfig
powerpc                     pseries_defconfig
openrisc                 simple_smp_defconfig
arm                        spear6xx_defconfig
m68k                        mvme16x_defconfig
sparc                       sparc32_defconfig
sh                          urquell_defconfig
mips                           ip27_defconfig
mips                      fuloong2e_defconfig
sh                          r7780mp_defconfig
m68k                        m5272c3_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                     haps_hs_smp_defconfig
alpha                            allyesconfig
arm                          gemini_defconfig
sh                           sh2007_defconfig
mips                           ip22_defconfig
csky                             alldefconfig
powerpc                   currituck_defconfig
sh                           se7619_defconfig
s390                                defconfig
sh                           se7780_defconfig
mips                malta_qemu_32r6_defconfig
arm                           h5000_defconfig
h8300                               defconfig
powerpc                     tqm5200_defconfig
powerpc                      acadia_defconfig
microblaze                      mmu_defconfig
sh                        sh7785lcr_defconfig
arm                          pxa3xx_defconfig
sh                           se7751_defconfig
sh                          sdk7780_defconfig
arm                             ezx_defconfig
sh                             shx3_defconfig
x86_64               randconfig-c001-20210928
arm                  randconfig-c002-20210928
x86_64               randconfig-c001-20210927
arm                  randconfig-c002-20210927
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210927
x86_64               randconfig-a006-20210927
x86_64               randconfig-a001-20210927
x86_64               randconfig-a005-20210927
x86_64               randconfig-a004-20210927
x86_64               randconfig-a003-20210927
i386                 randconfig-a001-20210927
i386                 randconfig-a005-20210927
i386                 randconfig-a006-20210927
i386                 randconfig-a002-20210927
i386                 randconfig-a003-20210927
i386                 randconfig-a004-20210927
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
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
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
x86_64               randconfig-a014-20210927
x86_64               randconfig-a011-20210927
x86_64               randconfig-a013-20210927
x86_64               randconfig-a016-20210927
x86_64               randconfig-a015-20210927
x86_64               randconfig-a012-20210927
i386                 randconfig-a014-20210927
i386                 randconfig-a013-20210927
i386                 randconfig-a016-20210927
i386                 randconfig-a012-20210927
i386                 randconfig-a015-20210927
i386                 randconfig-a011-20210927
hexagon              randconfig-r045-20210927
riscv                randconfig-r042-20210927
hexagon              randconfig-r041-20210927
s390                 randconfig-r044-20210927
hexagon              randconfig-r045-20210928
hexagon              randconfig-r041-20210928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
