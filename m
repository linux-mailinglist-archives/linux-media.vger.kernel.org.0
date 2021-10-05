Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1794A422F2A
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 19:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbhJER1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 13:27:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:19272 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233671AbhJER1U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 13:27:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225704683"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="225704683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 10:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="589441302"
Received: from lkp-server01.sh.intel.com (HELO 72c3bd3cf19c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2021 10:21:41 -0700
Received: from kbuild by 72c3bd3cf19c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mXo8L-00066L-0y; Tue, 05 Oct 2021 17:21:41 +0000
Date:   Wed, 06 Oct 2021 01:20:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 c52e7b855b33ff2a3af57b1b1d114720cd39ec7e
Message-ID: <615c896f.6wPOs4HaFyItfGVx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: c52e7b855b33ff2a3af57b1b1d114720cd39ec7e  Merge tag 'v5.15-rc4' into media_tree

elapsed time: 2056m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
arm                         bcm2835_defconfig
xtensa                    xip_kc705_defconfig
nios2                         10m50_defconfig
mips                            gpr_defconfig
mips                 decstation_r4k_defconfig
powerpc                    amigaone_defconfig
arm                        realview_defconfig
h8300                               defconfig
arm                        oxnas_v6_defconfig
sh                        edosk7705_defconfig
powerpc                     pq2fads_defconfig
m68k                        mvme147_defconfig
mips                            e55_defconfig
powerpc                      pmac32_defconfig
arm                        trizeps4_defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
arm                         assabet_defconfig
powerpc                     stx_gp3_defconfig
arc                        nsimosci_defconfig
arm                       aspeed_g4_defconfig
sh                   sh7724_generic_defconfig
powerpc                     asp8347_defconfig
arc                           tb10x_defconfig
powerpc                mpc7448_hpc2_defconfig
s390                             allmodconfig
powerpc                     tqm8541_defconfig
powerpc                      ppc64e_defconfig
mips                             allmodconfig
riscv                          rv32_defconfig
mips                   sb1250_swarm_defconfig
s390                       zfcpdump_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           gcw0_defconfig
sh                           se7751_defconfig
m68k                        m5407c3_defconfig
ia64                             allyesconfig
powerpc                      bamboo_defconfig
mips                  decstation_64_defconfig
arm                       multi_v4t_defconfig
sh                        dreamcast_defconfig
um                                  defconfig
sh                   secureedge5410_defconfig
arm                      footbridge_defconfig
arm                         s5pv210_defconfig
m68k                           sun3_defconfig
sh                           se7619_defconfig
powerpc                     ksi8560_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
m68k                        m5307c3_defconfig
arm                        magician_defconfig
arm                          collie_defconfig
x86_64               randconfig-c001-20211003
i386                 randconfig-c001-20211003
arm                  randconfig-c002-20211003
x86_64               randconfig-c001-20211004
i386                 randconfig-c001-20211004
arm                  randconfig-c002-20211004
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211004
x86_64               randconfig-a012-20211004
x86_64               randconfig-a016-20211004
x86_64               randconfig-a014-20211004
x86_64               randconfig-a013-20211004
x86_64               randconfig-a011-20211004
i386                 randconfig-a013-20211004
i386                 randconfig-a016-20211004
i386                 randconfig-a014-20211004
i386                 randconfig-a011-20211004
i386                 randconfig-a012-20211004
i386                 randconfig-a015-20211004
arc                  randconfig-r043-20211004
s390                 randconfig-r044-20211004
riscv                randconfig-r042-20211004
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211003
i386                 randconfig-c001-20211003
arm                  randconfig-c002-20211003
s390                 randconfig-c005-20211003
powerpc              randconfig-c003-20211003
riscv                randconfig-c006-20211003
mips                 randconfig-c004-20211003
x86_64               randconfig-a003-20211004
x86_64               randconfig-a005-20211004
x86_64               randconfig-a001-20211004
x86_64               randconfig-a002-20211004
x86_64               randconfig-a004-20211004
x86_64               randconfig-a006-20211004
i386                 randconfig-a001-20211004
i386                 randconfig-a003-20211004
i386                 randconfig-a005-20211004
i386                 randconfig-a002-20211004
i386                 randconfig-a004-20211004
i386                 randconfig-a006-20211004
hexagon              randconfig-r045-20211004
hexagon              randconfig-r041-20211004

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
