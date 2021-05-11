Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36312379F93
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 08:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhEKGOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 02:14:51 -0400
Received: from mga01.intel.com ([192.55.52.88]:28920 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhEKGOv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 02:14:51 -0400
IronPort-SDR: q6B7qhVcSDEKB+avr1dhcfRQqCgaMZiVoOZ8JHCXNcbmyOiqqHii/bbonf2jLETeE+dEhGbHlH
 cCasDMuSyFbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="220320635"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="220320635"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 23:13:45 -0700
IronPort-SDR: Oj17utWyshzF2uUXKnIVJZ42ODLduaCW2gmmep0dypxaxNsQGmG3GD8UJmmt/c3XN8J6AqfDr0
 Tuohh4UNOjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="621685197"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2021 23:13:43 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgLeI-0000aD-SD; Tue, 11 May 2021 06:13:42 +0000
Date:   Tue, 11 May 2021 14:12:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 73edc4da40635774100d0eb9ca2e6476e3b2b470
Message-ID: <609a2062.7WfAXZnwgV8F9MeP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 73edc4da40635774100d0eb9ca2e6476e3b2b470  media: staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h

elapsed time: 1185m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
i386                                defconfig
ia64                      gensparse_defconfig
arm                        neponset_defconfig
arm                            qcom_defconfig
sh                          urquell_defconfig
arm                          exynos_defconfig
sparc                       sparc32_defconfig
riscv                             allnoconfig
arm                       aspeed_g4_defconfig
mips                        workpad_defconfig
arm                       aspeed_g5_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
arc                                 defconfig
riscv                            alldefconfig
arm                         lpc32xx_defconfig
mips                      maltaaprp_defconfig
sh                     magicpanelr2_defconfig
m68k                        mvme16x_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
ia64                             allyesconfig
arm                          simpad_defconfig
sh                          polaris_defconfig
sparc                            allyesconfig
mips                     loongson1c_defconfig
mips                       capcella_defconfig
arm                           sunxi_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc834x_itx_defconfig
mips                     decstation_defconfig
arm                        magician_defconfig
powerpc                 mpc85xx_cds_defconfig
nios2                               defconfig
mips                     cu1830-neo_defconfig
x86_64                           alldefconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        omega2p_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc837x_mds_defconfig
arc                        vdk_hs38_defconfig
mips                          ath79_defconfig
openrisc                    or1ksim_defconfig
mips                  cavium_octeon_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
arc                 nsimosci_hs_smp_defconfig
csky                                defconfig
mips                       rbtx49xx_defconfig
sh                          kfr2r09_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rb532_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
sparc                               defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 canyonlands_defconfig
sh                           se7619_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7201_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
sh                              ul2_defconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
mips                           gcw0_defconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                      pistachio_defconfig
mips                  decstation_64_defconfig
arm                      jornada720_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a003-20210511
i386                 randconfig-a001-20210511
i386                 randconfig-a005-20210511
i386                 randconfig-a004-20210511
i386                 randconfig-a002-20210511
i386                 randconfig-a006-20210511
x86_64               randconfig-a012-20210511
x86_64               randconfig-a015-20210511
x86_64               randconfig-a011-20210511
x86_64               randconfig-a013-20210511
x86_64               randconfig-a016-20210511
x86_64               randconfig-a014-20210511
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510
x86_64               randconfig-a003-20210511
x86_64               randconfig-a004-20210511
x86_64               randconfig-a001-20210511
x86_64               randconfig-a005-20210511
x86_64               randconfig-a002-20210511
x86_64               randconfig-a006-20210511

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
