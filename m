Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F243D4979
	for <lists+linux-media@lfdr.de>; Sat, 24 Jul 2021 21:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhGXSiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Jul 2021 14:38:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:30316 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhGXSio (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Jul 2021 14:38:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="199293745"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="199293745"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2021 12:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="663845097"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2021 12:19:13 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m7NB3-0003iL-7d; Sat, 24 Jul 2021 19:19:13 +0000
Date:   Sun, 25 Jul 2021 03:18:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f
Message-ID: <60fc6780.Q6XlXC43ljNGlZHU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f  media: atomisp: pci: reposition braces as per coding style

elapsed time: 2065m

configs tested: 225
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
i386                 randconfig-c001-20210724
powerpc                      tqm8xx_defconfig
powerpc                      obs600_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
powerpc                        icon_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
arm                         lubbock_defconfig
h8300                               defconfig
mips                      loongson3_defconfig
nds32                            alldefconfig
sh                           se7206_defconfig
sh                           se7712_defconfig
sh                           se7343_defconfig
powerpc                     skiroot_defconfig
arm                          collie_defconfig
sh                          rsk7203_defconfig
powerpc                     redwood_defconfig
powerpc                       holly_defconfig
powerpc                          allmodconfig
mips                            gpr_defconfig
powerpc                    amigaone_defconfig
mips                      pic32mzda_defconfig
powerpc                    gamecube_defconfig
arm                              alldefconfig
powerpc                      pasemi_defconfig
mips                      pistachio_defconfig
powerpc                      ppc44x_defconfig
sh                          rsk7264_defconfig
mips                     decstation_defconfig
um                             i386_defconfig
mips                         cobalt_defconfig
mips                  cavium_octeon_defconfig
powerpc                   bluestone_defconfig
arm                             mxs_defconfig
arm64                            alldefconfig
ia64                            zx1_defconfig
mips                           ci20_defconfig
mips                      bmips_stb_defconfig
arc                           tb10x_defconfig
powerpc                     akebono_defconfig
sh                          sdk7780_defconfig
mips                        bcm47xx_defconfig
powerpc                           allnoconfig
powerpc                 mpc836x_rdk_defconfig
arm                      tct_hammer_defconfig
arm                        mvebu_v5_defconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
sh                           se7721_defconfig
arm                     eseries_pxa_defconfig
sh                           se7751_defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8560_defconfig
mips                         tb0287_defconfig
mips                     cu1830-neo_defconfig
sh                   sh7724_generic_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     stx_gp3_defconfig
arm                     davinci_all_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
mips                           ip22_defconfig
arc                        nsimosci_defconfig
nios2                            allyesconfig
mips                malta_qemu_32r6_defconfig
mips                        nlm_xlr_defconfig
powerpc                   motionpro_defconfig
sh                             sh03_defconfig
s390                             alldefconfig
riscv                    nommu_k210_defconfig
mips                        workpad_defconfig
powerpc                        fsp2_defconfig
arm                         vf610m4_defconfig
m68k                                defconfig
h8300                            allyesconfig
arm                          gemini_defconfig
microblaze                          defconfig
arm                         axm55xx_defconfig
mips                     loongson2k_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            xcep_defconfig
openrisc                  or1klitex_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
powerpc                 mpc85xx_cds_defconfig
m68k                        m5407c3_defconfig
sh                          sdk7786_defconfig
csky                                defconfig
mips                        nlm_xlp_defconfig
powerpc                     sbc8548_defconfig
arm                          ixp4xx_defconfig
parisc                           allyesconfig
powerpc                    socrates_defconfig
arm                        mini2440_defconfig
mips                             allmodconfig
powerpc                      pmac32_defconfig
powerpc                     kmeter1_defconfig
um                                  defconfig
arm                         socfpga_defconfig
arm                        shmobile_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                            titan_defconfig
mips                 decstation_r4k_defconfig
powerpc                  iss476-smp_defconfig
parisc                generic-64bit_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     sequoia_defconfig
m68k                       m5275evb_defconfig
nds32                               defconfig
arm                            hisi_defconfig
arm                         orion5x_defconfig
powerpc                      pcm030_defconfig
sparc                            allyesconfig
sh                        dreamcast_defconfig
powerpc                     mpc512x_defconfig
xtensa                    xip_kc705_defconfig
arm                             ezx_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20210724
x86_64               randconfig-a006-20210724
x86_64               randconfig-a001-20210724
x86_64               randconfig-a005-20210724
x86_64               randconfig-a004-20210724
x86_64               randconfig-a002-20210724
i386                 randconfig-a005-20210724
i386                 randconfig-a003-20210724
i386                 randconfig-a004-20210724
i386                 randconfig-a002-20210724
i386                 randconfig-a001-20210724
i386                 randconfig-a006-20210724
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
i386                 randconfig-a016-20210723
i386                 randconfig-a013-20210723
i386                 randconfig-a012-20210723
i386                 randconfig-a011-20210723
i386                 randconfig-a014-20210723
i386                 randconfig-a015-20210723
i386                 randconfig-a016-20210724
i386                 randconfig-a013-20210724
i386                 randconfig-a012-20210724
i386                 randconfig-a014-20210724
i386                 randconfig-a011-20210724
i386                 randconfig-a015-20210724
i386                 randconfig-a016-20210725
i386                 randconfig-a013-20210725
i386                 randconfig-a012-20210725
i386                 randconfig-a014-20210725
i386                 randconfig-a011-20210725
i386                 randconfig-a015-20210725
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210723
x86_64               randconfig-c001-20210725
x86_64               randconfig-c001-20210724
x86_64               randconfig-b001-20210723
x86_64               randconfig-a003-20210723
x86_64               randconfig-a006-20210723
x86_64               randconfig-a001-20210723
x86_64               randconfig-a005-20210723
x86_64               randconfig-a004-20210723
x86_64               randconfig-a002-20210723
x86_64               randconfig-a011-20210724
x86_64               randconfig-a016-20210724
x86_64               randconfig-a013-20210724
x86_64               randconfig-a014-20210724
x86_64               randconfig-a012-20210724
x86_64               randconfig-a015-20210724

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
