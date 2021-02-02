Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5F930CA5A
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 19:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238947AbhBBSqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 13:46:01 -0500
Received: from mga01.intel.com ([192.55.52.88]:56267 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233601AbhBBSmR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 13:42:17 -0500
IronPort-SDR: 7+Ebp8P/sCdQbkZqj41cQh/oySY3OuH3IXlfb8/kmsiIHZLfl3LWMkXhBzyUfZOOXIAFf67KmH
 XFsHSefpf1AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199839406"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="199839406"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 10:41:25 -0800
IronPort-SDR: gvzDX6HxqwkR7FM9pX3K5Xq1CNIsxbpH7uoEGUDqxQwXZcvWzGFzg9Iz9roBC59JZ1eMA13SRW
 DQ9jF20g6B0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="582138180"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2021 10:41:23 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l70c6-0009bJ-WD; Tue, 02 Feb 2021 18:41:22 +0000
Date:   Wed, 03 Feb 2021 02:40:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 0b9112a58836ad6a7e84eebec06a2de9778b7573
Message-ID: <60199cbb.B1baTbUktQAxZoIC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 0b9112a58836ad6a7e84eebec06a2de9778b7573  Merge tag 'v5.11-rc6' into patchwork

elapsed time: 1999m

configs tested: 217
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
arm                           sama5_defconfig
sparc64                             defconfig
mips                 decstation_r4k_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
powerpc                    klondike_defconfig
m68k                         amcore_defconfig
powerpc                      ppc64e_defconfig
arc                        vdk_hs38_defconfig
powerpc                          g5_defconfig
arm                          iop32x_defconfig
powerpc                   currituck_defconfig
riscv                          rv32_defconfig
m68k                            q40_defconfig
m68k                             allmodconfig
powerpc                  storcenter_defconfig
arm                           h5000_defconfig
sh                           se7619_defconfig
m68k                         apollo_defconfig
csky                                defconfig
c6x                        evmc6472_defconfig
um                            kunit_defconfig
sh                               allmodconfig
sh                          rsk7203_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8313_rdb_defconfig
m68k                          amiga_defconfig
arm                       versatile_defconfig
s390                             alldefconfig
arm                          exynos_defconfig
sh                              ul2_defconfig
powerpc                 mpc834x_mds_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
sh                           sh2007_defconfig
mips                malta_kvm_guest_defconfig
powerpc                        fsp2_defconfig
m68k                          sun3x_defconfig
sh                             shx3_defconfig
m68k                        m5272c3_defconfig
i386                             allyesconfig
mips                            ar7_defconfig
sh                   secureedge5410_defconfig
mips                         mpc30x_defconfig
m68k                          hp300_defconfig
powerpc                    mvme5100_defconfig
arm                          gemini_defconfig
arc                        nsim_700_defconfig
arm                         palmz72_defconfig
mips                  decstation_64_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     powernv_defconfig
mips                          rb532_defconfig
powerpc                     tqm8540_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    amigaone_defconfig
sh                          r7780mp_defconfig
arm                             ezx_defconfig
powerpc                         ps3_defconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
arm                      pxa255-idp_defconfig
arm                        mini2440_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                            mmp2_defconfig
powerpc                     tqm8555_defconfig
arm                            hisi_defconfig
m68k                            mac_defconfig
m68k                           sun3_defconfig
riscv                            allmodconfig
powerpc                 mpc8560_ads_defconfig
powerpc64                        alldefconfig
sh                     magicpanelr2_defconfig
h8300                            allyesconfig
sh                           se7206_defconfig
arc                         haps_hs_defconfig
mips                        qi_lb60_defconfig
ia64                            zx1_defconfig
m68k                        stmark2_defconfig
arm                       aspeed_g4_defconfig
sh                           se7712_defconfig
um                             i386_defconfig
arm                          pxa910_defconfig
xtensa                         virt_defconfig
arm                      tct_hammer_defconfig
powerpc                     tqm5200_defconfig
mips                         db1xxx_defconfig
powerpc                     tqm8560_defconfig
arm                           h3600_defconfig
arm                            pleb_defconfig
mips                        maltaup_defconfig
arm                           tegra_defconfig
arm                     davinci_all_defconfig
powerpc                     taishan_defconfig
arm                        neponset_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        keystone_defconfig
sh                          lboxre2_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            mps2_defconfig
mips                        bcm63xx_defconfig
sh                        sh7763rdp_defconfig
arm                         s5pv210_defconfig
ia64                         bigsur_defconfig
mips                      maltaaprp_defconfig
powerpc                    socrates_defconfig
arm                         s3c6400_defconfig
ia64                          tiger_defconfig
powerpc                      pmac32_defconfig
mips                       lemote2f_defconfig
c6x                        evmc6457_defconfig
mips                           ip27_defconfig
arm                        realview_defconfig
arm                      integrator_defconfig
s390                       zfcpdump_defconfig
alpha                            alldefconfig
mips                        omega2p_defconfig
mips                      bmips_stb_defconfig
xtensa                  audio_kc705_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
