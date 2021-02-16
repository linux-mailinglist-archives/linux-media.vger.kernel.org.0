Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7C231CFFC
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 19:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBPSN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 13:13:59 -0500
Received: from mga05.intel.com ([192.55.52.43]:59508 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbhBPSNz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 13:13:55 -0500
IronPort-SDR: +l+Y3z4xPcuOGD77vqCrJv2iQrj1SGBSKMpsq/KDUJPUAT6oRyxd3g1FMXLgdKhMG+L8kyv3VB
 pkrqkILBFRQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="267819842"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="267819842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 10:13:14 -0800
IronPort-SDR: +f/ycyHAJJCiKfWv4pC3dSn8mPANN9AOqmJZtP96gdiy2SArpTOkadfdMqhFK6VLfWeiXsNbwh
 +Wi5Q+VVaRog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="512608807"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 10:13:13 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lC4qW-0008L3-9O; Tue, 16 Feb 2021 18:13:12 +0000
Date:   Wed, 17 Feb 2021 02:12:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 8f202f8e9ff38e29694a4bc0a519b4e03c1726ee
Message-ID: <602c0b11.PhSBPV1NRRSCQ5FQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 8f202f8e9ff38e29694a4bc0a519b4e03c1726ee  media: v4l: async: Fix kerneldoc documentation for async functions

elapsed time: 1601m

configs tested: 164
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                                  defconfig
mips                         tb0219_defconfig
sh                          rsk7269_defconfig
powerpc                          allyesconfig
sparc                               defconfig
sh                          lboxre2_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
arm                          lpd270_defconfig
sh                           se7721_defconfig
arm                     eseries_pxa_defconfig
sparc                            alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                  mpc885_ads_defconfig
m68k                          hp300_defconfig
sh                          rsk7264_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     rainier_defconfig
arm                         nhk8815_defconfig
h8300                       h8s-sim_defconfig
arm                       omap2plus_defconfig
ia64                          tiger_defconfig
mips                           ip32_defconfig
xtensa                              defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8540_ads_defconfig
sh                               j2_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
sh                      rts7751r2d1_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                       capcella_defconfig
mips                             allmodconfig
sh                           se7619_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                         bcm2835_defconfig
m68k                            q40_defconfig
nds32                             allnoconfig
mips                    maltaup_xpa_defconfig
powerpc                     powernv_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         axm55xx_defconfig
sh                          rsk7203_defconfig
arm                         socfpga_defconfig
mips                      fuloong2e_defconfig
mips                        workpad_defconfig
mips                malta_qemu_32r6_defconfig
arc                            hsdk_defconfig
arm                        vexpress_defconfig
openrisc                  or1klitex_defconfig
c6x                                 defconfig
arc                        vdk_hs38_defconfig
sh                          r7780mp_defconfig
arm                          badge4_defconfig
powerpc                     ksi8560_defconfig
mips                  cavium_octeon_defconfig
mips                           jazz_defconfig
riscv                            alldefconfig
mips                       rbtx49xx_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7722_defconfig
mips                     cu1000-neo_defconfig
sh                             espt_defconfig
arm                            xcep_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      chrp32_defconfig
powerpc                    amigaone_defconfig
h8300                    h8300h-sim_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210215
i386                 randconfig-a005-20210215
i386                 randconfig-a002-20210215
i386                 randconfig-a006-20210215
i386                 randconfig-a004-20210215
i386                 randconfig-a001-20210215
i386                 randconfig-a003-20210216
i386                 randconfig-a005-20210216
i386                 randconfig-a002-20210216
i386                 randconfig-a006-20210216
i386                 randconfig-a001-20210216
i386                 randconfig-a004-20210216
x86_64               randconfig-a003-20210216
x86_64               randconfig-a002-20210216
x86_64               randconfig-a004-20210216
x86_64               randconfig-a001-20210216
x86_64               randconfig-a005-20210216
x86_64               randconfig-a006-20210216
x86_64               randconfig-a016-20210215
x86_64               randconfig-a013-20210215
x86_64               randconfig-a012-20210215
x86_64               randconfig-a015-20210215
x86_64               randconfig-a014-20210215
x86_64               randconfig-a011-20210215
i386                 randconfig-a016-20210215
i386                 randconfig-a014-20210215
i386                 randconfig-a012-20210215
i386                 randconfig-a013-20210215
i386                 randconfig-a011-20210215
i386                 randconfig-a015-20210215
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210215
x86_64               randconfig-a002-20210215
x86_64               randconfig-a001-20210215
x86_64               randconfig-a004-20210215
x86_64               randconfig-a005-20210215
x86_64               randconfig-a006-20210215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
