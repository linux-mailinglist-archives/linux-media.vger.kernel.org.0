Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F9233963F
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 19:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhCLSXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 13:23:50 -0500
Received: from mga11.intel.com ([192.55.52.93]:3855 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233243AbhCLSXn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 13:23:43 -0500
IronPort-SDR: oyXLzbbPXjdAu3xthXtq98aGh2ml9raX7LFFhxnR8CJ2cHeHi3ljI+e19k5x1q0fam72ZFjEtl
 eaDDf5M9F6OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515227"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="185515227"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 10:23:42 -0800
IronPort-SDR: 4GCm1qlt4LsQRXW56B4o8BxJWfX8VCAIVWSU22LFw6fttJARIDB2nRYTzTiWkRz5d9a67OjVTh
 xCXbhQY4LlJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="521502522"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Mar 2021 10:23:41 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKmRo-0001WW-CC; Fri, 12 Mar 2021 18:23:40 +0000
Date:   Sat, 13 Mar 2021 02:23:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 1cb3ff130f4d97dec2d1bee968a87f5d6e24dd60
Message-ID: <604bb1a7.QxHkg0LwR4MakGlC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 1cb3ff130f4d97dec2d1bee968a87f5d6e24dd60  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs()

Error/Warning reports:

https://lore.kernel.org/linux-media/202103121116.EOhNQ4th-lkp@intel.com
https://lore.kernel.org/linux-media/202103121929.lhwifpkf-lkp@intel.com

Error/Warning in current branch:

aarch64-linux-ld: cec-notifier.c:(.text+0x1ac): undefined reference to `of_find_i2c_device_by_node'
arc-elf-ld: cec-notifier.c:(.text+0x49a): undefined reference to `of_find_i2c_device_by_node'
cec-notifier.c:(.text+0x49a): undefined reference to `of_find_i2c_device_by_node'

possible Error/Warning in current branch:

ld: cec-notifier.c:(.text+0x234): undefined reference to `of_find_i2c_device_by_node'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r033-20210312
|   |-- arc-elf-ld:cec-notifier.c:(.text):undefined-reference-to-of_find_i2c_device_by_node
|   `-- cec-notifier.c:(.text):undefined-reference-to-of_find_i2c_device_by_node
|-- arm64-randconfig-r022-20210312
|   `-- aarch64-linux-ld:cec-notifier.c:(.text):undefined-reference-to-of_find_i2c_device_by_node
`-- x86_64-randconfig-s032-20210312
    `-- ld:cec-notifier.c:(.text):undefined-reference-to-of_find_i2c_device_by_node

elapsed time: 1773m

configs tested: 177
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
arc                          axs101_defconfig
powerpc                       maple_defconfig
nios2                         10m50_defconfig
sparc64                             defconfig
mips                           ip22_defconfig
arm64                            alldefconfig
powerpc                      arches_defconfig
arm                           omap1_defconfig
mips                           ip32_defconfig
mips                      maltasmvp_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8555_defconfig
openrisc                 simple_smp_defconfig
powerpc64                           defconfig
arc                            hsdk_defconfig
arm                            dove_defconfig
nds32                            alldefconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
riscv                               defconfig
sh                          rsk7203_defconfig
openrisc                         alldefconfig
powerpc                      obs600_defconfig
sparc                               defconfig
ia64                         bigsur_defconfig
sh                   sh7724_generic_defconfig
m68k                         apollo_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                    adder875_defconfig
powerpc                      mgcoge_defconfig
arm                      tct_hammer_defconfig
s390                             allmodconfig
mips                            e55_defconfig
arm                       mainstone_defconfig
sparc                            allyesconfig
powerpc                       eiger_defconfig
mips                      pistachio_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ep88xc_defconfig
sh                        sh7763rdp_defconfig
arm                        neponset_defconfig
xtensa                generic_kc705_defconfig
arm                         lpc18xx_defconfig
arc                     haps_hs_smp_defconfig
um                           x86_64_defconfig
s390                             alldefconfig
h8300                    h8300h-sim_defconfig
mips                        workpad_defconfig
arm                             mxs_defconfig
openrisc                            defconfig
arm                     am200epdkit_defconfig
sh                 kfr2r09-romimage_defconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
arm                        magician_defconfig
mips                        bcm63xx_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7750_defconfig
powerpc                     tqm5200_defconfig
powerpc                     tqm8548_defconfig
mips                         cobalt_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                          r7785rp_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
arm                        trizeps4_defconfig
openrisc                  or1klitex_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
powerpc                          g5_defconfig
powerpc                     mpc83xx_defconfig
mips                     cu1830-neo_defconfig
mips                      fuloong2e_defconfig
arm                          pxa168_defconfig
powerpc                     powernv_defconfig
powerpc                  storcenter_defconfig
arm                      footbridge_defconfig
sh                   sh7770_generic_defconfig
arm                          badge4_defconfig
arm                          ixp4xx_defconfig
arm                         hackkit_defconfig
m68k                       m5249evb_defconfig
ia64                             alldefconfig
powerpc                 mpc834x_mds_defconfig
arm                         bcm2835_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                      bamboo_defconfig
arm                        realview_defconfig
arm                           corgi_defconfig
arm                     eseries_pxa_defconfig
mips                           rs90_defconfig
arm                        mini2440_defconfig
powerpc                     tqm8560_defconfig
powerpc                  iss476-smp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210311
x86_64               randconfig-a001-20210311
x86_64               randconfig-a005-20210311
x86_64               randconfig-a002-20210311
x86_64               randconfig-a003-20210311
x86_64               randconfig-a004-20210311
i386                 randconfig-a001-20210312
i386                 randconfig-a005-20210312
i386                 randconfig-a002-20210312
i386                 randconfig-a003-20210312
i386                 randconfig-a004-20210312
i386                 randconfig-a006-20210312
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
