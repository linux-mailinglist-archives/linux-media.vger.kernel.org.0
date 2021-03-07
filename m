Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FF332FE60
	for <lists+linux-media@lfdr.de>; Sun,  7 Mar 2021 02:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCGBpO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 20:45:14 -0500
Received: from mga04.intel.com ([192.55.52.120]:14136 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229788AbhCGBoo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Mar 2021 20:44:44 -0500
IronPort-SDR: V2KLA8rKSm28Egd4AE0tGBFKZWtNGUFQNCcnoe7fuxIJeraAipx5gA5kcOamJSUJVQn1roSRlN
 VffbV+tw+7TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9915"; a="185453764"
X-IronPort-AV: E=Sophos;i="5.81,229,1610438400"; 
   d="scan'208";a="185453764"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2021 17:44:43 -0800
IronPort-SDR: tYVhqyluQTf1W/C4F5jLWzF2qBO9wzVUvtuotG0eRWuie7vrrY3PBuJEJEq6UX8lK6//nzzjcZ
 2KWGcRPKubfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,229,1610438400"; 
   d="scan'208";a="598352221"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2021 17:44:42 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lIiTK-00004i-1i; Sun, 07 Mar 2021 01:44:42 +0000
Date:   Sun, 07 Mar 2021 09:43:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 f14d3f1c7d7794df01743334c1bb52b7a04fa565
Message-ID: <60442fcc.S97aYEZ7Kf58LOTl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: f14d3f1c7d7794df01743334c1bb52b7a04fa565  media: v4l docs: move some cross-reference identifiers

elapsed time: 3348m

configs tested: 152
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
arm                          pxa3xx_defconfig
arm                           u8500_defconfig
m68k                          sun3x_defconfig
arm                        mvebu_v7_defconfig
m68k                         apollo_defconfig
arm                         s3c2410_defconfig
ia64                            zx1_defconfig
powerpc                     kmeter1_defconfig
s390                                defconfig
m68k                            q40_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                        cell_defconfig
arm                           sunxi_defconfig
m68k                        m5307c3_defconfig
sh                ecovec24-romimage_defconfig
sparc64                          alldefconfig
arm                            dove_defconfig
arm                       multi_v4t_defconfig
powerpc                       maple_defconfig
mips                     cu1830-neo_defconfig
powerpc                 linkstation_defconfig
x86_64                              defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
x86_64                           allyesconfig
h8300                    h8300h-sim_defconfig
arm                         orion5x_defconfig
mips                           ci20_defconfig
m68k                          multi_defconfig
powerpc                     tqm8541_defconfig
powerpc                      pcm030_defconfig
um                           x86_64_defconfig
arc                            hsdk_defconfig
arc                        nsim_700_defconfig
arm                         mv78xx0_defconfig
mips                 decstation_r4k_defconfig
arc                      axs103_smp_defconfig
m68k                          amiga_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     pq2fads_defconfig
arm                           h3600_defconfig
arm                        cerfcube_defconfig
sh                            shmin_defconfig
arm                             rpc_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        neponset_defconfig
mips                      maltasmvp_defconfig
powerpc                     pseries_defconfig
h8300                               defconfig
riscv                          rv32_defconfig
powerpc                  iss476-smp_defconfig
powerpc                  mpc885_ads_defconfig
nds32                            alldefconfig
parisc                generic-32bit_defconfig
arm                            mps2_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
x86_64               randconfig-a006-20210304
x86_64               randconfig-a001-20210304
x86_64               randconfig-a004-20210304
x86_64               randconfig-a005-20210304
x86_64               randconfig-a002-20210304
x86_64               randconfig-a003-20210304
i386                 randconfig-a005-20210304
i386                 randconfig-a003-20210304
i386                 randconfig-a002-20210304
i386                 randconfig-a004-20210304
i386                 randconfig-a006-20210304
i386                 randconfig-a001-20210304
i386                 randconfig-a005-20210305
i386                 randconfig-a003-20210305
i386                 randconfig-a002-20210305
i386                 randconfig-a004-20210305
i386                 randconfig-a006-20210305
i386                 randconfig-a001-20210305
x86_64               randconfig-a013-20210305
x86_64               randconfig-a016-20210305
x86_64               randconfig-a015-20210305
x86_64               randconfig-a014-20210305
x86_64               randconfig-a012-20210305
x86_64               randconfig-a011-20210305
i386                 randconfig-a016-20210304
i386                 randconfig-a012-20210304
i386                 randconfig-a013-20210304
i386                 randconfig-a014-20210304
i386                 randconfig-a011-20210304
i386                 randconfig-a015-20210304
i386                 randconfig-a016-20210305
i386                 randconfig-a012-20210305
i386                 randconfig-a013-20210305
i386                 randconfig-a014-20210305
i386                 randconfig-a011-20210305
i386                 randconfig-a015-20210305
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210305
x86_64               randconfig-a001-20210305
x86_64               randconfig-a004-20210305
x86_64               randconfig-a005-20210305
x86_64               randconfig-a002-20210305
x86_64               randconfig-a003-20210305
x86_64               randconfig-a013-20210304
x86_64               randconfig-a016-20210304
x86_64               randconfig-a015-20210304
x86_64               randconfig-a014-20210304
x86_64               randconfig-a012-20210304
x86_64               randconfig-a011-20210304

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
