Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D6A3EBB4B
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 19:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhHMRUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 13:20:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:34693 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229705AbhHMRUp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 13:20:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="301182619"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="301182619"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 10:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="447110836"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2021 10:20:17 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEaqu-000NyV-CR; Fri, 13 Aug 2021 17:20:16 +0000
Date:   Sat, 14 Aug 2021 01:19:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 b395ba42afd9ee3abafc389d15e0985172448927
Message-ID: <6116a9a8.OaJZCRvHZeL5camY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: b395ba42afd9ee3abafc389d15e0985172448927  media: ir_toy: allow tx carrier to be set

elapsed time: 1610m

configs tested: 188
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210812
i386                 randconfig-c001-20210813
powerpc                     mpc5200_defconfig
parisc                              defconfig
powerpc                         wii_defconfig
arm                      integrator_defconfig
arm                        trizeps4_defconfig
arm                         lpc18xx_defconfig
arm                           spitz_defconfig
arm                           tegra_defconfig
arm                          badge4_defconfig
powerpc                     redwood_defconfig
arm                         at91_dt_defconfig
sh                   secureedge5410_defconfig
powerpc                     pseries_defconfig
powerpc                      makalu_defconfig
arm                      jornada720_defconfig
m68k                             alldefconfig
sh                          rsk7264_defconfig
sh                            titan_defconfig
powerpc                     asp8347_defconfig
powerpc                        icon_defconfig
arc                          axs103_defconfig
powerpc                      tqm8xx_defconfig
sh                        edosk7760_defconfig
x86_64                            allnoconfig
sh                             shx3_defconfig
nios2                         3c120_defconfig
ia64                        generic_defconfig
powerpc                     tqm8555_defconfig
powerpc                      acadia_defconfig
arm                          simpad_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                  maltasmvp_eva_defconfig
sh                            hp6xx_defconfig
arm                         shannon_defconfig
arm                        clps711x_defconfig
powerpc                      ppc64e_defconfig
sh                              ul2_defconfig
arm                         orion5x_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        maltaup_defconfig
mips                           ip22_defconfig
sh                           se7721_defconfig
riscv                    nommu_k210_defconfig
m68k                       m5208evb_defconfig
x86_64                           alldefconfig
mips                            gpr_defconfig
mips                      maltaaprp_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             alldefconfig
sh                        edosk7705_defconfig
xtensa                generic_kc705_defconfig
arm                           stm32_defconfig
arm                           omap1_defconfig
arc                           tb10x_defconfig
arm                          exynos_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                          ep93xx_defconfig
arc                              alldefconfig
powerpc                 mpc85xx_cds_defconfig
arc                     haps_hs_smp_defconfig
arm                       imx_v6_v7_defconfig
sh                           se7712_defconfig
powerpc                   microwatt_defconfig
sh                          r7780mp_defconfig
powerpc                     rainier_defconfig
arm                       cns3420vb_defconfig
mips                          ath25_defconfig
m68k                             allyesconfig
mips                        workpad_defconfig
mips                     decstation_defconfig
powerpc                        cell_defconfig
powerpc                     ppa8548_defconfig
arc                        nsimosci_defconfig
powerpc                    amigaone_defconfig
arm                         s5pv210_defconfig
arm                           viper_defconfig
sh                          lboxre2_defconfig
sh                          urquell_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
sh                         ap325rxa_defconfig
arm                          gemini_defconfig
sh                               alldefconfig
sh                         apsh4a3a_defconfig
powerpc                      cm5200_defconfig
powerpc                           allnoconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
mips                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20210812
x86_64               randconfig-a004-20210812
x86_64               randconfig-a003-20210812
x86_64               randconfig-a005-20210812
x86_64               randconfig-a002-20210812
x86_64               randconfig-a001-20210812
i386                 randconfig-a004-20210812
i386                 randconfig-a003-20210812
i386                 randconfig-a002-20210812
i386                 randconfig-a001-20210812
i386                 randconfig-a006-20210812
i386                 randconfig-a005-20210812
i386                 randconfig-a004-20210813
i386                 randconfig-a003-20210813
i386                 randconfig-a001-20210813
i386                 randconfig-a002-20210813
i386                 randconfig-a006-20210813
i386                 randconfig-a005-20210813
x86_64               randconfig-a011-20210813
x86_64               randconfig-a013-20210813
x86_64               randconfig-a012-20210813
x86_64               randconfig-a016-20210813
x86_64               randconfig-a015-20210813
x86_64               randconfig-a014-20210813
i386                 randconfig-a011-20210812
i386                 randconfig-a015-20210812
i386                 randconfig-a013-20210812
i386                 randconfig-a014-20210812
i386                 randconfig-a016-20210812
i386                 randconfig-a012-20210812
i386                 randconfig-a011-20210813
i386                 randconfig-a015-20210813
i386                 randconfig-a014-20210813
i386                 randconfig-a013-20210813
i386                 randconfig-a016-20210813
i386                 randconfig-a012-20210813
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210812
x86_64               randconfig-c001-20210813
x86_64               randconfig-a006-20210813
x86_64               randconfig-a004-20210813
x86_64               randconfig-a003-20210813
x86_64               randconfig-a002-20210813
x86_64               randconfig-a005-20210813
x86_64               randconfig-a001-20210813
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
