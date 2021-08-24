Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4044F3F5FE0
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 16:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237710AbhHXOHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 10:07:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:60138 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237545AbhHXOHc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 10:07:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="204514508"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204514508"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 07:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="685377314"
Received: from lkp-server02.sh.intel.com (HELO 181e7be6f509) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 07:06:46 -0700
Received: from kbuild by 181e7be6f509 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mIX4g-0000bN-1D; Tue, 24 Aug 2021 14:06:46 +0000
Date:   Tue, 24 Aug 2021 22:05:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 d62cd4d277cc711f781a7bdec4109c6148529b25
Message-ID: <6124fcba.uNwMoExCFdfKIB+K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: d62cd4d277cc711f781a7bdec4109c6148529b25  media: uvcvideo: Remove unused including <linux/version.h>

possible Warning in current branch (please contact us if interested):

drivers/media/rc/meson-ir-tx.c:327:2-9: line 327 is redundant because platform_get_irq() already prints an error
drivers/media/rc/meson-ir-tx.c:398:3-8: No need to set .owner here. The core will do it.

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sparc64-randconfig-c024-20210822
    |-- drivers-media-rc-meson-ir-tx.c:No-need-to-set-.owner-here.-The-core-will-do-it.
    `-- drivers-media-rc-meson-ir-tx.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error

elapsed time: 4645m

configs tested: 199
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210824
arm                         cm_x300_defconfig
alpha                            alldefconfig
m68k                         apollo_defconfig
powerpc                      pmac32_defconfig
sh                           se7751_defconfig
arm                       aspeed_g5_defconfig
sh                          sdk7786_defconfig
m68k                          sun3x_defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
powerpc                   bluestone_defconfig
arm                         lpc18xx_defconfig
arc                                 defconfig
arm                       multi_v4t_defconfig
s390                                defconfig
mips                        bcm63xx_defconfig
xtensa                         virt_defconfig
mips                      bmips_stb_defconfig
sh                   secureedge5410_defconfig
sparc                       sparc32_defconfig
mips                      maltasmvp_defconfig
arm                        spear6xx_defconfig
mips                malta_qemu_32r6_defconfig
xtensa                       common_defconfig
arm                         at91_dt_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7206_defconfig
mips                           jazz_defconfig
arm                       spear13xx_defconfig
arm                          pxa910_defconfig
m68k                                defconfig
powerpc                     akebono_defconfig
powerpc                      tqm8xx_defconfig
mips                         db1xxx_defconfig
mips                          ath25_defconfig
m68k                           sun3_defconfig
mips                         tb0287_defconfig
powerpc                 mpc832x_mds_defconfig
mips                            e55_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
arm                     davinci_all_defconfig
mips                           ip32_defconfig
arm                        multi_v7_defconfig
riscv                            alldefconfig
mips                            gpr_defconfig
h8300                               defconfig
powerpc                     stx_gp3_defconfig
arm                            mps2_defconfig
powerpc                  mpc866_ads_defconfig
mips                           gcw0_defconfig
powerpc64                           defconfig
mips                           mtx1_defconfig
m68k                         amcore_defconfig
powerpc                      katmai_defconfig
powerpc                          g5_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                          rb532_defconfig
ia64                      gensparse_defconfig
mips                         cobalt_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc8540_ads_defconfig
arc                         haps_hs_defconfig
arm                         s5pv210_defconfig
nios2                            allyesconfig
powerpc                     sbc8548_defconfig
arm                        mini2440_defconfig
arm                          lpd270_defconfig
powerpc                 mpc8272_ads_defconfig
arc                      axs103_smp_defconfig
sh                ecovec24-romimage_defconfig
arm                          badge4_defconfig
sh                     sh7710voipgw_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
powerpc                     sequoia_defconfig
h8300                    h8300h-sim_defconfig
mips                        nlm_xlp_defconfig
arm                            zeus_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                  storcenter_defconfig
s390                             alldefconfig
mips                        workpad_defconfig
arm                          moxart_defconfig
arm                           corgi_defconfig
xtensa                  audio_kc705_defconfig
mips                   sb1250_swarm_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
x86_64               randconfig-a005-20210822
x86_64               randconfig-a006-20210822
x86_64               randconfig-a001-20210822
x86_64               randconfig-a003-20210822
x86_64               randconfig-a004-20210822
x86_64               randconfig-a002-20210822
x86_64               randconfig-a005-20210824
x86_64               randconfig-a006-20210824
x86_64               randconfig-a001-20210824
x86_64               randconfig-a003-20210824
x86_64               randconfig-a004-20210824
x86_64               randconfig-a002-20210824
i386                 randconfig-a006-20210822
i386                 randconfig-a001-20210822
i386                 randconfig-a002-20210822
i386                 randconfig-a005-20210822
i386                 randconfig-a003-20210822
i386                 randconfig-a004-20210822
i386                 randconfig-a006-20210824
i386                 randconfig-a001-20210824
i386                 randconfig-a002-20210824
i386                 randconfig-a005-20210824
i386                 randconfig-a003-20210824
i386                 randconfig-a004-20210824
x86_64               randconfig-a014-20210821
x86_64               randconfig-a016-20210821
x86_64               randconfig-a015-20210821
x86_64               randconfig-a013-20210821
x86_64               randconfig-a012-20210821
x86_64               randconfig-a011-20210821
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210822
s390                 randconfig-c005-20210822
arm                  randconfig-c002-20210822
riscv                randconfig-c006-20210822
powerpc              randconfig-c003-20210822
x86_64               randconfig-c007-20210822
mips                 randconfig-c004-20210822
x86_64               randconfig-a005-20210821
x86_64               randconfig-a001-20210821
x86_64               randconfig-a006-20210821
x86_64               randconfig-a003-20210821
x86_64               randconfig-a004-20210821
x86_64               randconfig-a002-20210821
x86_64               randconfig-a014-20210822
x86_64               randconfig-a016-20210822
x86_64               randconfig-a015-20210822
x86_64               randconfig-a013-20210822
x86_64               randconfig-a012-20210822
x86_64               randconfig-a011-20210822
i386                 randconfig-a011-20210822
i386                 randconfig-a016-20210822
i386                 randconfig-a012-20210822
i386                 randconfig-a014-20210822
i386                 randconfig-a013-20210822
i386                 randconfig-a015-20210822
hexagon              randconfig-r041-20210822
hexagon              randconfig-r045-20210822
riscv                randconfig-r042-20210822
s390                 randconfig-r044-20210822

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
