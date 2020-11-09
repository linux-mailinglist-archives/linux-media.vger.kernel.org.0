Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739E32AAE90
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 01:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgKIAqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Nov 2020 19:46:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:2448 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728104AbgKIAqq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 8 Nov 2020 19:46:46 -0500
IronPort-SDR: xQ6HmD4Z3++O0NVE5rYdFMG+DD1fcOLTuGFejbX1Guk3cVQA0zywGaGC18W4reAVufF9hr6WL+
 W9okeDafFP2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="156742013"
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; 
   d="scan'208";a="156742013"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2020 16:46:45 -0800
IronPort-SDR: DxDkg+9Bqlds04qwY8lPbCcofFPOeKMhqLCj5G+OirRqdh6QgFEPuQ3yeeljZ3P8MRYvEs5Pjx
 dta0/HU2j0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; 
   d="scan'208";a="540621842"
Received: from lkp-server02.sh.intel.com (HELO defa7f6e4f65) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2020 16:46:44 -0800
Received: from kbuild by defa7f6e4f65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kbvKV-00001T-KS; Mon, 09 Nov 2020 00:46:43 +0000
Date:   Mon, 09 Nov 2020 08:46:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 0ab4f9087ea94ff92dc2ae68180faaf6bd443021
Message-ID: <5fa89163.u8JR6K32MeFBBCKK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 0ab4f9087ea94ff92dc2ae68180faaf6bd443021  media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()

elapsed time: 4756m

configs tested: 177
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
sh                          rsk7269_defconfig
sh                        sh7763rdp_defconfig
powerpc                      cm5200_defconfig
mips                        maltaup_defconfig
arm                           viper_defconfig
arm                  colibri_pxa300_defconfig
arm                         lpc18xx_defconfig
arm                      tct_hammer_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                           se7705_defconfig
openrisc                         alldefconfig
powerpc                    amigaone_defconfig
arm                         mv78xx0_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc834x_itx_defconfig
c6x                                 defconfig
mips                       bmips_be_defconfig
sparc                       sparc32_defconfig
arm                            zeus_defconfig
arm                            pleb_defconfig
arm                     am200epdkit_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7724_defconfig
mips                        nlm_xlr_defconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
s390                             allyesconfig
sh                           se7206_defconfig
powerpc                     ep8248e_defconfig
xtensa                       common_defconfig
powerpc                     kilauea_defconfig
s390                          debug_defconfig
arm                        mini2440_defconfig
arm                       versatile_defconfig
sh                            shmin_defconfig
powerpc                 mpc834x_mds_defconfig
c6x                        evmc6457_defconfig
arm                           tegra_defconfig
mips                         rt305x_defconfig
powerpc                     powernv_defconfig
powerpc                     taishan_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       multi_v4t_defconfig
powerpc64                        alldefconfig
mips                        bcm63xx_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7264_defconfig
arm                          lpd270_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         hackkit_defconfig
arc                     haps_hs_smp_defconfig
riscv                            alldefconfig
arm                         s3c2410_defconfig
powerpc                         ps3_defconfig
m68k                            mac_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
openrisc                 simple_smp_defconfig
nds32                            alldefconfig
sh                         ap325rxa_defconfig
arm                          gemini_defconfig
arm                            xcep_defconfig
mips                          ath79_defconfig
nios2                         3c120_defconfig
xtensa                  audio_kc705_defconfig
arm                        multi_v7_defconfig
mips                      maltaaprp_defconfig
mips                           ip27_defconfig
powerpc                     sequoia_defconfig
mips                        bcm47xx_defconfig
sh                         ecovec24_defconfig
arm                          moxart_defconfig
arm                      footbridge_defconfig
powerpc                     kmeter1_defconfig
sh                           se7722_defconfig
mips                      malta_kvm_defconfig
powerpc                      ppc44x_defconfig
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
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201105
x86_64               randconfig-a003-20201105
x86_64               randconfig-a005-20201105
x86_64               randconfig-a002-20201105
x86_64               randconfig-a006-20201105
x86_64               randconfig-a001-20201105
i386                 randconfig-a004-20201104
i386                 randconfig-a006-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
i386                 randconfig-a004-20201105
i386                 randconfig-a006-20201105
i386                 randconfig-a005-20201105
i386                 randconfig-a001-20201105
i386                 randconfig-a002-20201105
i386                 randconfig-a003-20201105
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
x86_64               randconfig-a012-20201106
x86_64               randconfig-a011-20201106
x86_64               randconfig-a013-20201106
x86_64               randconfig-a014-20201106
x86_64               randconfig-a016-20201106
x86_64               randconfig-a015-20201106
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
i386                 randconfig-a015-20201105
i386                 randconfig-a013-20201105
i386                 randconfig-a014-20201105
i386                 randconfig-a016-20201105
i386                 randconfig-a011-20201105
i386                 randconfig-a012-20201105
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
