Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96A03E1A4A
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 19:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238816AbhHERVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 13:21:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:46992 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230172AbhHERVT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 13:21:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="213939134"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="213939134"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 10:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="522915797"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2021 10:21:00 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mBh3D-000G4m-Qi; Thu, 05 Aug 2021 17:20:59 +0000
Date:   Fri, 06 Aug 2021 01:19:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 bfee75f73c37a2f46a6326eaa06f5db701f76f01
Message-ID: <610c1dbf.1VMkQ1OMzezaqyNK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: bfee75f73c37a2f46a6326eaa06f5db701f76f01  media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control

elapsed time: 1691m

configs tested: 188
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210804
i386                 randconfig-c001-20210805
arm                     davinci_all_defconfig
sh                          rsk7264_defconfig
powerpc                      obs600_defconfig
powerpc                        fsp2_defconfig
mips                          rb532_defconfig
arc                                 defconfig
arm                     eseries_pxa_defconfig
powerpc                      walnut_defconfig
mips                 decstation_r4k_defconfig
m68k                          multi_defconfig
arm                              alldefconfig
powerpc                       ppc64_defconfig
arm                        magician_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                              defconfig
mips                   sb1250_swarm_defconfig
powerpc                     powernv_defconfig
sh                          kfr2r09_defconfig
powerpc                          g5_defconfig
powerpc                 canyonlands_defconfig
m68k                        stmark2_defconfig
powerpc                      pcm030_defconfig
arm                            pleb_defconfig
arm                           u8500_defconfig
arm                         palmz72_defconfig
sh                           se7343_defconfig
powerpc                     kilauea_defconfig
powerpc                      cm5200_defconfig
arm                            xcep_defconfig
mips                             allmodconfig
powerpc                      acadia_defconfig
sh                   rts7751r2dplus_defconfig
arm                          gemini_defconfig
mips                          malta_defconfig
alpha                            allyesconfig
mips                        bcm47xx_defconfig
powerpc                     tqm8548_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      mgcoge_defconfig
mips                           jazz_defconfig
mips                       bmips_be_defconfig
arm                       omap2plus_defconfig
arm                       aspeed_g5_defconfig
openrisc                            defconfig
arm                        mini2440_defconfig
arm                           corgi_defconfig
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
um                           x86_64_defconfig
sh                        sh7757lcr_defconfig
m68k                        m5307c3_defconfig
sh                             sh03_defconfig
mips                      bmips_stb_defconfig
arm                        trizeps4_defconfig
sh                        edosk7705_defconfig
sh                          polaris_defconfig
sh                               j2_defconfig
arm                        vexpress_defconfig
ia64                      gensparse_defconfig
sh                     sh7710voipgw_defconfig
mips                        workpad_defconfig
mips                      fuloong2e_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                       m5249evb_defconfig
riscv                    nommu_virt_defconfig
arm                           viper_defconfig
powerpc                      chrp32_defconfig
nios2                         3c120_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7203_defconfig
mips                  maltasmvp_eva_defconfig
s390                                defconfig
mips                        nlm_xlp_defconfig
powerpc                     tqm8541_defconfig
openrisc                  or1klitex_defconfig
riscv                            allyesconfig
i386                                defconfig
powerpc                     tqm5200_defconfig
riscv                               defconfig
arm                          imote2_defconfig
sh                           se7705_defconfig
arm                         cm_x300_defconfig
arc                          axs101_defconfig
powerpc                      ep88xc_defconfig
m68k                            mac_defconfig
arm                         orion5x_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
arm                         socfpga_defconfig
mips                  decstation_64_defconfig
x86_64                            allnoconfig
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
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210805
x86_64               randconfig-a006-20210805
x86_64               randconfig-a004-20210805
x86_64               randconfig-a003-20210805
x86_64               randconfig-a001-20210805
x86_64               randconfig-a005-20210805
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
i386                 randconfig-a005-20210805
i386                 randconfig-a004-20210805
i386                 randconfig-a002-20210805
i386                 randconfig-a006-20210805
i386                 randconfig-a003-20210805
i386                 randconfig-a001-20210805
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
i386                 randconfig-a012-20210805
i386                 randconfig-a011-20210805
i386                 randconfig-a015-20210805
i386                 randconfig-a013-20210805
i386                 randconfig-a014-20210805
i386                 randconfig-a016-20210805
i386                 randconfig-a012-20210804
i386                 randconfig-a011-20210804
i386                 randconfig-a015-20210804
i386                 randconfig-a013-20210804
i386                 randconfig-a014-20210804
i386                 randconfig-a016-20210804
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210804
x86_64               randconfig-c001-20210805
x86_64               randconfig-a002-20210804
x86_64               randconfig-a006-20210804
x86_64               randconfig-a004-20210804
x86_64               randconfig-a003-20210804
x86_64               randconfig-a001-20210804
x86_64               randconfig-a005-20210804
x86_64               randconfig-a012-20210805
x86_64               randconfig-a016-20210805
x86_64               randconfig-a011-20210805
x86_64               randconfig-a013-20210805
x86_64               randconfig-a014-20210805
x86_64               randconfig-a015-20210805

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
