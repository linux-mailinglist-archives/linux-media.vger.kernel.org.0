Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CF8388362
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 01:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhESAAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 20:00:44 -0400
Received: from mga07.intel.com ([134.134.136.100]:5799 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232153AbhESAAo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 20:00:44 -0400
IronPort-SDR: BBmKIQokdUx7ikzJ53wUIH6A5MZKCT3Z4BeX12smcnWGPuCIoJP/qJQ5GYmJbiSbWeUXR4fWrN
 uIopLQ7Lplsw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="264766457"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="264766457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 16:59:25 -0700
IronPort-SDR: 9eijCVgC7fgnzj7y5ctgzBDe+QfpHSfOrNnTPgzQ1iYO3oxU3ajWxx9xc+6uyVjnH59iEzS+O6
 1JnEN4V6+89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="439703365"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 May 2021 16:59:24 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lj9cR-0002P7-CI; Tue, 18 May 2021 23:59:23 +0000
Date:   Wed, 19 May 2021 07:58:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 b9f33f574986ee4bb4b29c5a91e8c7dee52a4097
Message-ID: <60a454b8.DiXQTotojWj0DitM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: b9f33f574986ee4bb4b29c5a91e8c7dee52a4097  Merge branch 'media_stage' into to_next

elapsed time: 791m

configs tested: 276
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
parisc                              defconfig
openrisc                            defconfig
m68k                          multi_defconfig
arm                        spear6xx_defconfig
mips                           rs90_defconfig
arm                           omap1_defconfig
xtensa                       common_defconfig
microblaze                      mmu_defconfig
mips                        nlm_xlp_defconfig
powerpc64                           defconfig
m68k                          atari_defconfig
powerpc                     ep8248e_defconfig
alpha                               defconfig
arm                          lpd270_defconfig
parisc                           alldefconfig
arm                        mini2440_defconfig
arm                     am200epdkit_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ppc44x_defconfig
arm                          ixp4xx_defconfig
m68k                        stmark2_defconfig
sh                          rsk7264_defconfig
ia64                          tiger_defconfig
mips                        bcm47xx_defconfig
sh                          landisk_defconfig
arc                      axs103_smp_defconfig
mips                           xway_defconfig
csky                             alldefconfig
powerpc                     tqm8555_defconfig
sh                           se7722_defconfig
mips                         mpc30x_defconfig
um                            kunit_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc8315_rdb_defconfig
m68k                          hp300_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
arm                       imx_v6_v7_defconfig
arm64                            alldefconfig
mips                           ip27_defconfig
sparc64                          alldefconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
sh                     magicpanelr2_defconfig
arm                          gemini_defconfig
sh                             espt_defconfig
sh                        apsh4ad0a_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
sh                      rts7751r2d1_defconfig
xtensa                generic_kc705_defconfig
xtensa                    smp_lx200_defconfig
i386                                defconfig
sh                            hp6xx_defconfig
powerpc                       maple_defconfig
arm                        shmobile_defconfig
sh                ecovec24-romimage_defconfig
m68k                          sun3x_defconfig
arm                       netwinder_defconfig
alpha                            allyesconfig
mips                     loongson2k_defconfig
m68k                       m5475evb_defconfig
powerpc                   lite5200b_defconfig
arm                           u8500_defconfig
mips                           ip28_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      cm5200_defconfig
arm                           viper_defconfig
arc                        nsimosci_defconfig
i386                             alldefconfig
openrisc                  or1klitex_defconfig
sh                          kfr2r09_defconfig
mips                      malta_kvm_defconfig
arm                             rpc_defconfig
mips                       capcella_defconfig
mips                        nlm_xlr_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
sh                          urquell_defconfig
arm                        realview_defconfig
mips                           ip32_defconfig
sh                          rsk7201_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
mips                        vocore2_defconfig
ia64                                defconfig
m68k                       m5249evb_defconfig
sparc                            alldefconfig
x86_64                            allnoconfig
powerpc                     kmeter1_defconfig
arm                         socfpga_defconfig
sh                               alldefconfig
powerpc                   currituck_defconfig
arm                            dove_defconfig
arc                     nsimosci_hs_defconfig
arm                         assabet_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     rainier_defconfig
mips                        maltaup_defconfig
m68k                         amcore_defconfig
sh                           se7721_defconfig
arm                       imx_v4_v5_defconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                           tegra_defconfig
arm                         shannon_defconfig
sh                   secureedge5410_defconfig
arm                          iop32x_defconfig
mips                       rbtx49xx_defconfig
arm                        multi_v7_defconfig
m68k                         apollo_defconfig
arm                           h3600_defconfig
arm                      footbridge_defconfig
arm                            hisi_defconfig
arm                          exynos_defconfig
arm                       aspeed_g4_defconfig
sh                          polaris_defconfig
alpha                            alldefconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      acadia_defconfig
arm                         s3c2410_defconfig
arc                          axs103_defconfig
um                               allmodconfig
powerpc                     redwood_defconfig
mips                  maltasmvp_eva_defconfig
arm                        multi_v5_defconfig
mips                           ci20_defconfig
powerpc                    ge_imp3a_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7343_defconfig
arm                          pxa168_defconfig
powerpc                     tqm8541_defconfig
mips                        qi_lb60_defconfig
m68k                           sun3_defconfig
arm                        clps711x_defconfig
mips                           mtx1_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                        cell_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
parisc                generic-64bit_defconfig
x86_64                              defconfig
arm                       multi_v4t_defconfig
sparc                               defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
riscv                             allnoconfig
xtensa                  nommu_kc705_defconfig
arm                       aspeed_g5_defconfig
powerpc                      ppc64e_defconfig
sh                           se7206_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                       eiger_defconfig
powerpc                        icon_defconfig
x86_64                           allyesconfig
powerpc                     tqm5200_defconfig
arm                        keystone_defconfig
mips                       lemote2f_defconfig
mips                        workpad_defconfig
sh                          rsk7269_defconfig
sh                         apsh4a3a_defconfig
powerpc                      bamboo_defconfig
powerpc                     mpc83xx_defconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
powerpc                    klondike_defconfig
powerpc                     tqm8560_defconfig
microblaze                          defconfig
powerpc                 mpc834x_itx_defconfig
nds32                               defconfig
s390                             allyesconfig
sparc                       sparc64_defconfig
arm                          collie_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210518
x86_64               randconfig-a004-20210518
x86_64               randconfig-a005-20210518
x86_64               randconfig-a001-20210518
x86_64               randconfig-a002-20210518
x86_64               randconfig-a006-20210518
i386                 randconfig-a003-20210518
i386                 randconfig-a001-20210518
i386                 randconfig-a005-20210518
i386                 randconfig-a004-20210518
i386                 randconfig-a002-20210518
i386                 randconfig-a006-20210518
i386                 randconfig-a003-20210519
i386                 randconfig-a001-20210519
i386                 randconfig-a005-20210519
i386                 randconfig-a004-20210519
i386                 randconfig-a002-20210519
i386                 randconfig-a006-20210519
x86_64               randconfig-a012-20210519
x86_64               randconfig-a015-20210519
x86_64               randconfig-a013-20210519
x86_64               randconfig-a011-20210519
x86_64               randconfig-a016-20210519
x86_64               randconfig-a014-20210519
i386                 randconfig-a014-20210518
i386                 randconfig-a016-20210518
i386                 randconfig-a011-20210518
i386                 randconfig-a015-20210518
i386                 randconfig-a012-20210518
i386                 randconfig-a013-20210518
i386                 randconfig-a014-20210519
i386                 randconfig-a016-20210519
i386                 randconfig-a011-20210519
i386                 randconfig-a015-20210519
i386                 randconfig-a012-20210519
i386                 randconfig-a013-20210519
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allyesconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210518
x86_64               randconfig-b001-20210519
x86_64               randconfig-a003-20210519
x86_64               randconfig-a004-20210519
x86_64               randconfig-a005-20210519
x86_64               randconfig-a001-20210519
x86_64               randconfig-a002-20210519
x86_64               randconfig-a006-20210519
x86_64               randconfig-a015-20210518
x86_64               randconfig-a012-20210518
x86_64               randconfig-a013-20210518
x86_64               randconfig-a011-20210518
x86_64               randconfig-a016-20210518
x86_64               randconfig-a014-20210518

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
