Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE98142770E
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 06:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhJIEEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 00:04:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:53430 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhJIEEf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 00:04:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="287513283"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="scan'208";a="287513283"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 21:02:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="scan'208";a="590748556"
Received: from lkp-server02.sh.intel.com (HELO 1950922c5479) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Oct 2021 21:02:38 -0700
Received: from kbuild by 1950922c5479 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mZ3ZF-00016b-Rv; Sat, 09 Oct 2021 04:02:37 +0000
Date:   Sat, 09 Oct 2021 12:02:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 b93a34cf0f89dd7009b1e3b11454906468057b68
Message-ID: <61611445.wyEJrKE4o8OnblZn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: b93a34cf0f89dd7009b1e3b11454906468057b68  media: venus: Set buffer to FW based on FW min count requirement.

elapsed time: 1122m

configs tested: 171
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211008
s390                          debug_defconfig
parisc                generic-32bit_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
sh                            hp6xx_defconfig
arc                         haps_hs_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                          iss_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                        mvme16x_defconfig
mips                         tb0226_defconfig
arm                          pxa168_defconfig
powerpc                     akebono_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7269_defconfig
sh                               alldefconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
m68k                         amcore_defconfig
arm                      pxa255-idp_defconfig
mips                            gpr_defconfig
mips                         rt305x_defconfig
arm                            zeus_defconfig
arm                         socfpga_defconfig
arm                           corgi_defconfig
arm                         bcm2835_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
nds32                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                       lemote2f_defconfig
m68k                        stmark2_defconfig
sh                          sdk7786_defconfig
powerpc                       holly_defconfig
arm                     am200epdkit_defconfig
sh                            migor_defconfig
powerpc                      pasemi_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
ia64                             alldefconfig
powerpc                 mpc832x_mds_defconfig
arm                            xcep_defconfig
mips                           rs90_defconfig
mips                        bcm63xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
arm                        keystone_defconfig
riscv                               defconfig
mips                         tb0219_defconfig
arc                            hsdk_defconfig
sh                        apsh4ad0a_defconfig
mips                  decstation_64_defconfig
sh                        sh7785lcr_defconfig
m68k                         apollo_defconfig
openrisc                            defconfig
powerpc                      arches_defconfig
sh                   secureedge5410_defconfig
m68k                            mac_defconfig
xtensa                       common_defconfig
powerpc                   lite5200b_defconfig
powerpc                      cm5200_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
arm                          ep93xx_defconfig
powerpc                   microwatt_defconfig
riscv                            alldefconfig
arc                        nsim_700_defconfig
arm                        vexpress_defconfig
sh                     sh7710voipgw_defconfig
arm                           u8500_defconfig
h8300                    h8300h-sim_defconfig
arm                           viper_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         s3c6400_defconfig
arm                        realview_defconfig
powerpc                     tqm8560_defconfig
x86_64               randconfig-c001-20211008
arm                  randconfig-c002-20211008
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211008
x86_64               randconfig-a012-20211008
x86_64               randconfig-a016-20211008
x86_64               randconfig-a013-20211008
x86_64               randconfig-a011-20211008
x86_64               randconfig-a014-20211008
i386                 randconfig-a013-20211008
i386                 randconfig-a016-20211008
i386                 randconfig-a014-20211008
i386                 randconfig-a011-20211008
i386                 randconfig-a012-20211008
i386                 randconfig-a015-20211008
arc                  randconfig-r043-20211008
s390                 randconfig-r044-20211008
riscv                randconfig-r042-20211008
arc                  randconfig-r043-20211004
s390                 randconfig-r044-20211004
riscv                randconfig-r042-20211004
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211008
i386                 randconfig-c001-20211008
arm                  randconfig-c002-20211008
s390                 randconfig-c005-20211008
powerpc              randconfig-c003-20211008
riscv                randconfig-c006-20211008
mips                 randconfig-c004-20211008
x86_64               randconfig-a003-20211008
x86_64               randconfig-a005-20211008
x86_64               randconfig-a001-20211008
x86_64               randconfig-a002-20211008
x86_64               randconfig-a004-20211008
x86_64               randconfig-a006-20211008
i386                 randconfig-a001-20211008
i386                 randconfig-a003-20211008
i386                 randconfig-a005-20211008
i386                 randconfig-a004-20211008
i386                 randconfig-a002-20211008
i386                 randconfig-a006-20211008
hexagon              randconfig-r045-20211004
hexagon              randconfig-r041-20211004

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
