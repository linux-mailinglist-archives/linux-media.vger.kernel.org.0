Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B541D42347B
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 01:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhJEXcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 19:32:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:17216 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233540AbhJEXcj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 19:32:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223281990"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
   d="scan'208";a="223281990"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 16:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; 
   d="scan'208";a="477897939"
Received: from lkp-server01.sh.intel.com (HELO 72c3bd3cf19c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Oct 2021 16:30:46 -0700
Received: from kbuild by 72c3bd3cf19c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mXttW-0006HC-0B; Tue, 05 Oct 2021 23:30:46 +0000
Date:   Wed, 06 Oct 2021 07:30:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 ff93780378831cd12010f796ccd688ba4b9dd6e4
Message-ID: <615ce007.i2nQ3nv+5AagpHus%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: ff93780378831cd12010f796ccd688ba4b9dd6e4  media: imx-jpeg: Remove soft reset between frames encoding

elapsed time: 875m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    amigaone_defconfig
arm                        realview_defconfig
h8300                               defconfig
arm                        oxnas_v6_defconfig
sh                        edosk7705_defconfig
mips                     cu1000-neo_defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
arm                      jornada720_defconfig
powerpc                     pq2fads_defconfig
m68k                        mvme147_defconfig
mips                            e55_defconfig
powerpc                      pmac32_defconfig
arm                        trizeps4_defconfig
arm                     eseries_pxa_defconfig
powerpc64                           defconfig
arm                         lpc32xx_defconfig
arm                        neponset_defconfig
microblaze                      mmu_defconfig
um                                  defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
arm                         assabet_defconfig
powerpc                     stx_gp3_defconfig
arc                        nsimosci_defconfig
riscv                    nommu_k210_defconfig
powerpc                          allyesconfig
powerpc                 mpc8272_ads_defconfig
mips                           ip32_defconfig
sh                        dreamcast_defconfig
arm                       aspeed_g4_defconfig
sh                   sh7724_generic_defconfig
powerpc                     asp8347_defconfig
s390                             allmodconfig
arc                           tb10x_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8541_defconfig
powerpc                      ppc64e_defconfig
mips                             allmodconfig
riscv                          rv32_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      bamboo_defconfig
mips                  decstation_64_defconfig
arm                       multi_v4t_defconfig
sh                   secureedge5410_defconfig
arm                      footbridge_defconfig
arm                         s5pv210_defconfig
m68k                           sun3_defconfig
sh                           se7619_defconfig
powerpc                     ksi8560_defconfig
arm                         at91_dt_defconfig
sh                             shx3_defconfig
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
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
arc                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
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
