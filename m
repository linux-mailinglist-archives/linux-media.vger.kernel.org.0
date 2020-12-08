Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0280D2D31DE
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 19:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbgLHSN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 13:13:26 -0500
Received: from mga02.intel.com ([134.134.136.20]:27995 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730495AbgLHSN0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Dec 2020 13:13:26 -0500
IronPort-SDR: y8X6We9VnM2u6YBq6YW2wYtTJiqM2bV1QsH1xyLQR1qw83c6akIRMDDrMQPaluMYDyA7lhseYM
 hO6uLIyKQMUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="160993321"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="160993321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:11:24 -0800
IronPort-SDR: NJ9eq+ZiX1WqFFE6mcuxfD/KDaZQaM0jaAYcHLcj+BpHVCrkZJoiW0y2+EnmzbQJn/gDxuf5BD
 mifTmUVRg15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="370477306"
Received: from lkp-server01.sh.intel.com (HELO c88bd47c8831) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2020 10:11:23 -0800
Received: from kbuild by c88bd47c8831 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmhSN-0000OL-4u; Tue, 08 Dec 2020 18:11:23 +0000
Date:   Wed, 09 Dec 2020 02:10:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 7ea4d23293300ca2f225595849a4fe444fb80ea4
Message-ID: <5fcfc19c.B/ieOTE53lgaYDN7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 7ea4d23293300ca2f225595849a4fe444fb80ea4  media: ccs: Add support for obtaining C-PHY configuration from firmware

elapsed time: 1547m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                               defconfig
nds32                               defconfig
powerpc                     tqm8555_defconfig
arm                         palmz72_defconfig
arc                          axs103_defconfig
powerpc                    klondike_defconfig
mips                     loongson1c_defconfig
sh                   secureedge5410_defconfig
powerpc                  storcenter_defconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc832x_rdb_defconfig
c6x                         dsk6455_defconfig
m68k                        m5272c3_defconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
arm                             ezx_defconfig
mips                            gpr_defconfig
microblaze                          defconfig
microblaze                    nommu_defconfig
sh                           se7712_defconfig
xtensa                          iss_defconfig
arm                        multi_v7_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     powernv_defconfig
m68k                        mvme16x_defconfig
arm                           tegra_defconfig
powerpc                     tqm8540_defconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
ia64                         bigsur_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
mips                         rt305x_defconfig
powerpc                   lite5200b_defconfig
arm                         mv78xx0_defconfig
powerpc                   currituck_defconfig
sparc                       sparc32_defconfig
sh                   rts7751r2dplus_defconfig
sh                                  defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
arm                        multi_v5_defconfig
mips                           ci20_defconfig
powerpc                      chrp32_defconfig
mips                         db1xxx_defconfig
m68k                       m5249evb_defconfig
arc                        nsim_700_defconfig
arm                       omap2plus_defconfig
arm                         lpc18xx_defconfig
sh                          sdk7780_defconfig
m68k                       m5275evb_defconfig
mips                         tb0287_defconfig
m68k                             alldefconfig
arm                           omap1_defconfig
um                            kunit_defconfig
arc                           tb10x_defconfig
arm                          badge4_defconfig
mips                       lemote2f_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201208
x86_64               randconfig-a006-20201208
x86_64               randconfig-a005-20201208
x86_64               randconfig-a001-20201208
x86_64               randconfig-a002-20201208
x86_64               randconfig-a003-20201208
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
i386                 randconfig-a004-20201208
i386                 randconfig-a005-20201208
i386                 randconfig-a001-20201208
i386                 randconfig-a002-20201208
i386                 randconfig-a006-20201208
i386                 randconfig-a003-20201208
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a013-20201208
i386                 randconfig-a014-20201208
i386                 randconfig-a011-20201208
i386                 randconfig-a015-20201208
i386                 randconfig-a012-20201208
i386                 randconfig-a016-20201208
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201207
x86_64               randconfig-a006-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a003-20201207
x86_64               randconfig-a016-20201208
x86_64               randconfig-a012-20201208
x86_64               randconfig-a013-20201208
x86_64               randconfig-a014-20201208
x86_64               randconfig-a015-20201208
x86_64               randconfig-a011-20201208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
