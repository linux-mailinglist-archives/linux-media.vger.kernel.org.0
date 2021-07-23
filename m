Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323563D3E65
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 19:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhGWQka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 12:40:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:21835 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGWQk3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 12:40:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="199124140"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; 
   d="scan'208";a="199124140"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2021 10:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; 
   d="scan'208";a="663358047"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 10:21:00 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m6yr6-00027r-36; Fri, 23 Jul 2021 17:21:00 +0000
Date:   Sat, 24 Jul 2021 01:20:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 c27479d762de4eda72ba9e0aa150d439970f2077
Message-ID: <60fafa69.sKuIu9Kl1fG9G+zC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: c27479d762de4eda72ba9e0aa150d439970f2077  media: atomisp: pci: reposition braces as per coding style

elapsed time: 1700m

configs tested: 172
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210723
i386                 randconfig-c001-20210722
sh                          rsk7203_defconfig
powerpc                     redwood_defconfig
powerpc                       holly_defconfig
powerpc                          allmodconfig
mips                            gpr_defconfig
powerpc                      pcm030_defconfig
mips                      pic32mzda_defconfig
ia64                        generic_defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
sh                        dreamcast_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
mips                           mtx1_defconfig
arc                        nsimosci_defconfig
powerpc                    ge_imp3a_defconfig
arm                         orion5x_defconfig
arm                              alldefconfig
powerpc                       maple_defconfig
arm                         axm55xx_defconfig
arm                          pcm027_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc8540_ads_defconfig
sh                               j2_defconfig
arm                          ixp4xx_defconfig
powerpc                    sam440ep_defconfig
arm                       imx_v4_v5_defconfig
arm                      tct_hammer_defconfig
arm                           omap1_defconfig
mips                         tb0226_defconfig
arm                     davinci_all_defconfig
mips                        workpad_defconfig
powerpc                        fsp2_defconfig
arm                         vf610m4_defconfig
m68k                                defconfig
mips                     loongson2k_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            xcep_defconfig
ia64                            zx1_defconfig
openrisc                  or1klitex_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
powerpc                 mpc85xx_cds_defconfig
nds32                            alldefconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     asp8347_defconfig
microblaze                          defconfig
s390                       zfcpdump_defconfig
sh                         ap325rxa_defconfig
x86_64                           allyesconfig
powerpc                      bamboo_defconfig
mips                       lemote2f_defconfig
powerpc                      chrp32_defconfig
sh                          polaris_defconfig
mips                        bcm47xx_defconfig
mips                       bmips_be_defconfig
mips                            e55_defconfig
mips                 decstation_r4k_defconfig
arm                        oxnas_v6_defconfig
powerpc                     powernv_defconfig
nds32                               defconfig
arm                            hisi_defconfig
mips                           ci20_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 canyonlands_defconfig
alpha                               defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210722
x86_64               randconfig-a006-20210722
x86_64               randconfig-a001-20210722
x86_64               randconfig-a005-20210722
x86_64               randconfig-a004-20210722
x86_64               randconfig-a002-20210722
i386                 randconfig-a005-20210722
i386                 randconfig-a003-20210722
i386                 randconfig-a004-20210722
i386                 randconfig-a002-20210722
i386                 randconfig-a001-20210722
i386                 randconfig-a006-20210722
i386                 randconfig-a005-20210723
i386                 randconfig-a003-20210723
i386                 randconfig-a004-20210723
i386                 randconfig-a002-20210723
i386                 randconfig-a001-20210723
i386                 randconfig-a006-20210723
x86_64               randconfig-a011-20210723
x86_64               randconfig-a016-20210723
x86_64               randconfig-a013-20210723
x86_64               randconfig-a014-20210723
x86_64               randconfig-a012-20210723
x86_64               randconfig-a015-20210723
i386                 randconfig-a016-20210722
i386                 randconfig-a013-20210722
i386                 randconfig-a012-20210722
i386                 randconfig-a011-20210722
i386                 randconfig-a014-20210722
i386                 randconfig-a015-20210722
i386                 randconfig-a016-20210723
i386                 randconfig-a013-20210723
i386                 randconfig-a012-20210723
i386                 randconfig-a011-20210723
i386                 randconfig-a014-20210723
i386                 randconfig-a015-20210723
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210723
x86_64               randconfig-b001-20210722
x86_64               randconfig-b001-20210723
x86_64               randconfig-a003-20210723
x86_64               randconfig-a006-20210723
x86_64               randconfig-a001-20210723
x86_64               randconfig-a005-20210723
x86_64               randconfig-a004-20210723
x86_64               randconfig-a002-20210723
x86_64               randconfig-a011-20210722
x86_64               randconfig-a016-20210722
x86_64               randconfig-a013-20210722
x86_64               randconfig-a014-20210722
x86_64               randconfig-a012-20210722
x86_64               randconfig-a015-20210722

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
