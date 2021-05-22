Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E8338D54C
	for <lists+linux-media@lfdr.de>; Sat, 22 May 2021 12:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhEVKtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 May 2021 06:49:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:52236 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230232AbhEVKtR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 May 2021 06:49:17 -0400
IronPort-SDR: NOht+52/udhMOdXAUhDx5AclMMZYrOLCiU/Hgkgkp7QLl+AZ9rbqjezQEIJDNSFDn/PGnFZUFD
 iNnPqVXsgXgw==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="181948470"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="181948470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2021 03:47:52 -0700
IronPort-SDR: fc789ySOFibftb3YqinjXfv9i/4tX7MZwhtjyj2cZZyEk6O3kvCMeV3XwRpR9LKmEdQ2IK4d1e
 Fhpz2+JtY47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="441301279"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 May 2021 03:47:51 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lkPAc-00001I-Ay; Sat, 22 May 2021 10:47:50 +0000
Date:   Sat, 22 May 2021 18:47:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 89cf71e62cd39da12e7a6e36ae6db126391ca9e2
Message-ID: <60a8e142.JkNRnXN7jHDcwPlu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 89cf71e62cd39da12e7a6e36ae6db126391ca9e2  media: davinci: fix two kernel-doc comments

elapsed time: 2616m

configs tested: 194
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
powerpc                      mgcoge_defconfig
mips                      bmips_stb_defconfig
mips                        jmr3927_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           sunxi_defconfig
xtensa                generic_kc705_defconfig
mips                         tb0219_defconfig
arc                     haps_hs_smp_defconfig
mips                       capcella_defconfig
m68k                        mvme147_defconfig
xtensa                              defconfig
mips                malta_qemu_32r6_defconfig
mips                           ci20_defconfig
arc                        nsimosci_defconfig
arm                            mmp2_defconfig
powerpc                        warp_defconfig
powerpc                     skiroot_defconfig
arm                            mps2_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                         ps3_defconfig
powerpc                     tqm5200_defconfig
m68k                       m5275evb_defconfig
sh                          lboxre2_defconfig
mips                           ip27_defconfig
powerpc                      ep88xc_defconfig
arm                        spear6xx_defconfig
arm                       aspeed_g5_defconfig
um                                  defconfig
h8300                     edosk2674_defconfig
m68k                       m5249evb_defconfig
arm                      pxa255-idp_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                        icon_defconfig
powerpc                     tqm8541_defconfig
powerpc                      pcm030_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                    mvme5100_defconfig
ia64                             allmodconfig
powerpc                     pq2fads_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      katmai_defconfig
xtensa                       common_defconfig
sh                           se7722_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                         apsh4a3a_defconfig
sh                           se7206_defconfig
sh                          r7780mp_defconfig
arm                     am200epdkit_defconfig
arm                         cm_x300_defconfig
mips                           ip28_defconfig
powerpc                     asp8347_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      makalu_defconfig
powerpc                     akebono_defconfig
mips                         tb0287_defconfig
um                           x86_64_defconfig
arm                            lart_defconfig
sh                     sh7710voipgw_defconfig
arm                            zeus_defconfig
parisc                generic-64bit_defconfig
arm                           viper_defconfig
arm                           u8500_defconfig
arm                         lpc32xx_defconfig
h8300                               defconfig
arm                       omap2plus_defconfig
powerpc                       ebony_defconfig
arm                         palmz72_defconfig
arm                             ezx_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     powernv_defconfig
um                             i386_defconfig
arm                         mv78xx0_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      chrp32_defconfig
nios2                         3c120_defconfig
nds32                             allnoconfig
sh                               j2_defconfig
sh                             espt_defconfig
mips                     loongson2k_defconfig
arm                         s3c2410_defconfig
s390                       zfcpdump_defconfig
arc                                 defconfig
powerpc                     tqm8548_defconfig
mips                            gpr_defconfig
powerpc                      walnut_defconfig
arc                    vdk_hs38_smp_defconfig
openrisc                 simple_smp_defconfig
mips                        vocore2_defconfig
arm                     davinci_all_defconfig
sh                          landisk_defconfig
alpha                            allyesconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210520
x86_64               randconfig-a006-20210520
x86_64               randconfig-a005-20210520
x86_64               randconfig-a003-20210520
x86_64               randconfig-a004-20210520
x86_64               randconfig-a002-20210520
i386                 randconfig-a001-20210520
i386                 randconfig-a005-20210520
i386                 randconfig-a002-20210520
i386                 randconfig-a006-20210520
i386                 randconfig-a004-20210520
i386                 randconfig-a003-20210520
i386                 randconfig-a001-20210521
i386                 randconfig-a005-20210521
i386                 randconfig-a002-20210521
i386                 randconfig-a006-20210521
i386                 randconfig-a003-20210521
i386                 randconfig-a004-20210521
x86_64               randconfig-a013-20210521
x86_64               randconfig-a014-20210521
x86_64               randconfig-a012-20210521
x86_64               randconfig-a016-20210521
x86_64               randconfig-a015-20210521
x86_64               randconfig-a011-20210521
i386                 randconfig-a016-20210520
i386                 randconfig-a011-20210520
i386                 randconfig-a015-20210520
i386                 randconfig-a012-20210520
i386                 randconfig-a014-20210520
i386                 randconfig-a013-20210520
i386                 randconfig-a016-20210521
i386                 randconfig-a011-20210521
i386                 randconfig-a015-20210521
i386                 randconfig-a012-20210521
i386                 randconfig-a014-20210521
i386                 randconfig-a013-20210521
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210520
x86_64               randconfig-b001-20210521
x86_64               randconfig-a013-20210520
x86_64               randconfig-a014-20210520
x86_64               randconfig-a012-20210520
x86_64               randconfig-a016-20210520
x86_64               randconfig-a015-20210520
x86_64               randconfig-a011-20210520

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
