Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33C735735B
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 19:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbhDGRmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 13:42:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:30615 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229605AbhDGRmU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 13:42:20 -0400
IronPort-SDR: P47z/VfJLzqctHxDaM2VHKm1UvBarlrXSM/s2cCQEAbYIkaFtyII58Ad4xmM+Fpd0nB53n/LLs
 eb3prcoUYDkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="278627612"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="278627612"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 10:42:10 -0700
IronPort-SDR: AB6PSleGDf3QmV739nNEHP9Jeatcg0SK+X4ofeg5I+4dAWBMCDEvdP1uX84wadiRk1xR9ciBir
 CpIwvQvPYx5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="381407760"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2021 10:42:06 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUCBp-000DYp-LQ; Wed, 07 Apr 2021 17:42:05 +0000
Date:   Thu, 08 Apr 2021 01:41:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 7acc54ed6061c9219774d1897efa34c6304ffda8
Message-ID: <606deee7.IpPgQUJ9AIUXSLog%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 7acc54ed6061c9219774d1897efa34c6304ffda8  media: s5p-mfc: Fix kernel-doc entries in s5p_mfc_common.h

Warning reports:

https://lore.kernel.org/linux-media/202104070543.z8N0lkx6-lkp@intel.com

possible Warning in current branch:

drivers/media/platform/imx-jpeg/mxc-jpeg.c:1993:3-10: line 1993 is redundant because platform_get_irq() already prints an error

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc64-randconfig-s031-20210406
|   `-- drivers-media-platform-qcom-venus-core.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- riscv-allyesconfig
    `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error

elapsed time: 1395m

configs tested: 165
configs skipped: 3

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
mips                      fuloong2e_defconfig
ia64                                defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
arm                  colibri_pxa270_defconfig
mips                      maltaaprp_defconfig
nios2                               defconfig
arc                          axs101_defconfig
alpha                            alldefconfig
mips                        nlm_xlp_defconfig
m68k                                defconfig
riscv                            alldefconfig
sh                          sdk7786_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
powerpc64                           defconfig
powerpc                    mvme5100_defconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
arc                        vdk_hs38_defconfig
mips                          rm200_defconfig
sh                        dreamcast_defconfig
powerpc                     stx_gp3_defconfig
openrisc                 simple_smp_defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7264_defconfig
mips                     loongson1c_defconfig
sh                           se7780_defconfig
sh                          sdk7780_defconfig
powerpc                      arches_defconfig
csky                             alldefconfig
arc                     nsimosci_hs_defconfig
powerpc                           allnoconfig
openrisc                  or1klitex_defconfig
arm                        spear6xx_defconfig
mips                    maltaup_xpa_defconfig
arm                      jornada720_defconfig
arm                         shannon_defconfig
mips                        jmr3927_defconfig
arm                          ep93xx_defconfig
mips                        nlm_xlr_defconfig
sh                        sh7757lcr_defconfig
mips                           ip27_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          pxa910_defconfig
powerpc                   motionpro_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc8313_rdb_defconfig
ia64                        generic_defconfig
sh                              ul2_defconfig
arc                      axs103_smp_defconfig
powerpc                      katmai_defconfig
arm                        mini2440_defconfig
powerpc                      acadia_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                    adder875_defconfig
arm                       aspeed_g5_defconfig
arm                            hisi_defconfig
arm                          ixp4xx_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            mmp2_defconfig
powerpc                     sequoia_defconfig
sh                          rsk7203_defconfig
powerpc                      pcm030_defconfig
arm                       multi_v4t_defconfig
arm                       spear13xx_defconfig
riscv                          rv32_defconfig
arc                                 defconfig
sh                          kfr2r09_defconfig
powerpc                      walnut_defconfig
mips                            gpr_defconfig
arm                          simpad_defconfig
arm                     davinci_all_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20210406
i386                 randconfig-a003-20210406
i386                 randconfig-a001-20210406
i386                 randconfig-a004-20210406
i386                 randconfig-a005-20210406
i386                 randconfig-a002-20210406
i386                 randconfig-a003-20210407
i386                 randconfig-a001-20210407
i386                 randconfig-a004-20210407
i386                 randconfig-a002-20210407
i386                 randconfig-a005-20210407
i386                 randconfig-a006-20210407
x86_64               randconfig-a014-20210407
x86_64               randconfig-a015-20210407
x86_64               randconfig-a013-20210407
x86_64               randconfig-a011-20210407
x86_64               randconfig-a012-20210407
x86_64               randconfig-a016-20210407
i386                 randconfig-a014-20210407
i386                 randconfig-a011-20210407
i386                 randconfig-a016-20210407
i386                 randconfig-a012-20210407
i386                 randconfig-a015-20210407
i386                 randconfig-a013-20210407
i386                 randconfig-a014-20210406
i386                 randconfig-a016-20210406
i386                 randconfig-a011-20210406
i386                 randconfig-a012-20210406
i386                 randconfig-a015-20210406
i386                 randconfig-a013-20210406
x86_64               randconfig-a004-20210406
x86_64               randconfig-a003-20210406
x86_64               randconfig-a005-20210406
x86_64               randconfig-a001-20210406
x86_64               randconfig-a002-20210406
x86_64               randconfig-a006-20210406
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
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
x86_64               randconfig-a014-20210406
x86_64               randconfig-a015-20210406
x86_64               randconfig-a013-20210406
x86_64               randconfig-a011-20210406
x86_64               randconfig-a012-20210406
x86_64               randconfig-a016-20210406

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
