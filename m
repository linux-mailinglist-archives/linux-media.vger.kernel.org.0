Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF36311F87
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 19:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhBFSxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 13:53:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:3168 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231320AbhBFSxN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 13:53:13 -0500
IronPort-SDR: L3m11PqJGQ9is2MU3SdPKBJ+037ODDlLYmBtqPLhBZAT3WINrbJ4WFH23sryMmFXwfMQ9jlnZX
 15XYK8uW4ckw==
X-IronPort-AV: E=McAfee;i="6000,8403,9887"; a="243058114"
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="243058114"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2021 10:52:26 -0800
IronPort-SDR: xWVzSq+CzCpNzfe1YNzzme6pG9bI0gomVeNfRur2OGV9o4+LnEVhMqDZRuZfAayl14BZc3Gy72
 Wi/gV6mXLW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,158,1610438400"; 
   d="scan'208";a="410128929"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2021 10:52:25 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l8Sgy-0002Yy-V3; Sat, 06 Feb 2021 18:52:24 +0000
Date:   Sun, 07 Feb 2021 02:51:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 063b811f34650bf88e24998eb9c094607cb3b53e
Message-ID: <601ee52d.hECE63o4T/pg5OIc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 063b811f34650bf88e24998eb9c094607cb3b53e  media: uvc: strncpy -> strscpy

elapsed time: 1191m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
m68k                            q40_defconfig
powerpc                     tqm5200_defconfig
openrisc                            defconfig
sh                             shx3_defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
powerpc                       holly_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
arm                           u8500_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         rt305x_defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
mips                malta_qemu_32r6_defconfig
mips                        bcm47xx_defconfig
mips                          rm200_defconfig
powerpc                     asp8347_defconfig
arm                        realview_defconfig
arm                  colibri_pxa270_defconfig
m68k                          multi_defconfig
sh                           se7206_defconfig
arm                          exynos_defconfig
powerpc                    amigaone_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc512x_defconfig
arm                          imote2_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7619_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                       m5475evb_defconfig
powerpc                      bamboo_defconfig
mips                      loongson3_defconfig
powerpc                     stx_gp3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                 randconfig-a001-20210205
i386                 randconfig-a005-20210205
i386                 randconfig-a003-20210205
i386                 randconfig-a006-20210205
i386                 randconfig-a002-20210205
i386                 randconfig-a004-20210205
x86_64               randconfig-a013-20210204
x86_64               randconfig-a014-20210204
x86_64               randconfig-a015-20210204
x86_64               randconfig-a011-20210204
x86_64               randconfig-a016-20210204
x86_64               randconfig-a012-20210204
i386                 randconfig-a013-20210205
i386                 randconfig-a016-20210205
i386                 randconfig-a014-20210205
i386                 randconfig-a012-20210205
i386                 randconfig-a015-20210205
i386                 randconfig-a011-20210205
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210204
x86_64               randconfig-a001-20210204
x86_64               randconfig-a005-20210204
x86_64               randconfig-a002-20210204
x86_64               randconfig-a004-20210204
x86_64               randconfig-a003-20210204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
