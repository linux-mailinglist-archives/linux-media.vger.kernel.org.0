Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B50D1D4EBF
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 15:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgEONPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 09:15:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:6163 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgEONPp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 09:15:45 -0400
IronPort-SDR: MzOCktH6a2Lq5Dh/SSFQYrZkrm81ApklPFnui/qnezmuUTyXwD784U3m9t0XQ5ElT+E/xty0b4
 Fc8WXQinVFsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 06:15:44 -0700
IronPort-SDR: LUGti0DyJKAfd8iFHFRLUYbChAdH0M9V/FaNmlcogwz9mHkxbVO/okZd3imPC3RAh0hlPhE6e+
 njMhEz3/+AYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="263187046"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 May 2020 06:15:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jZaBi-0009FF-5Y; Fri, 15 May 2020 21:15:42 +0800
Date:   Fri, 15 May 2020 21:14:52 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 35dd70b4c4935012ee02b4296618e56bd6ae3040
Message-ID: <5ebe95cc.l/6ijzJZoKUuEy2F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 35dd70b4c4935012ee02b4296618e56bd6ae3040  media: media: sh_veu: Remove driver

elapsed time: 1458m

configs tested: 192
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
arc                 nsimosci_hs_smp_defconfig
mips                          malta_defconfig
arm                          exynos_defconfig
powerpc                      pmac32_defconfig
mips                         rt305x_defconfig
arm                           corgi_defconfig
m68k                       m5208evb_defconfig
powerpc                       holly_defconfig
arm                        oxnas_v6_defconfig
powerpc                           allnoconfig
m68k                            q40_defconfig
sh                          sdk7780_defconfig
riscv                            alldefconfig
sh                             espt_defconfig
m68k                         amcore_defconfig
sh                          polaris_defconfig
arc                     haps_hs_smp_defconfig
mips                           jazz_defconfig
powerpc                          g5_defconfig
powerpc                     mpc5200_defconfig
arc                        nsim_700_defconfig
arm                  colibri_pxa270_defconfig
arm                  colibri_pxa300_defconfig
arm                            qcom_defconfig
mips                          lasat_defconfig
ia64                        generic_defconfig
arm                        magician_defconfig
arm                          imote2_defconfig
s390                       zfcpdump_defconfig
powerpc                       maple_defconfig
sh                           se7722_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
powerpc                      tqm8xx_defconfig
mips                           ip28_defconfig
arm                        clps711x_defconfig
m68k                           sun3_defconfig
mips                   sb1250_swarm_defconfig
arm                           efm32_defconfig
nios2                         3c120_defconfig
um                             i386_defconfig
arm                         lubbock_defconfig
arm                       multi_v4t_defconfig
arc                          axs103_defconfig
arc                      axs103_smp_defconfig
arm                         cm_x2xx_defconfig
arm                         palmz72_defconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
sh                            shmin_defconfig
arm                        neponset_defconfig
sh                         microdev_defconfig
x86_64                              defconfig
arm                         s3c2410_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
sh                        sh7763rdp_defconfig
arm                             ezx_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         cobalt_defconfig
arm                         axm55xx_defconfig
sh                          rsk7203_defconfig
arm                           viper_defconfig
mips                         db1xxx_defconfig
m68k                          atari_defconfig
sh                               j2_defconfig
arm                          lpd270_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
mips                        nlm_xlr_defconfig
mips                        nlm_xlp_defconfig
arm                      jornada720_defconfig
arm                         socfpga_defconfig
m68k                        m5407c3_defconfig
mips                  decstation_64_defconfig
sh                          rsk7264_defconfig
sh                ecovec24-romimage_defconfig
sh                            titan_defconfig
riscv                    nommu_virt_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20200514
i386                 randconfig-a005-20200514
i386                 randconfig-a003-20200514
i386                 randconfig-a001-20200514
i386                 randconfig-a004-20200514
i386                 randconfig-a002-20200514
i386                 randconfig-a006-20200515
i386                 randconfig-a005-20200515
i386                 randconfig-a003-20200515
i386                 randconfig-a001-20200515
i386                 randconfig-a004-20200515
i386                 randconfig-a002-20200515
x86_64               randconfig-a005-20200515
x86_64               randconfig-a003-20200515
x86_64               randconfig-a006-20200515
x86_64               randconfig-a004-20200515
x86_64               randconfig-a001-20200515
x86_64               randconfig-a002-20200515
x86_64               randconfig-a012-20200514
x86_64               randconfig-a016-20200514
x86_64               randconfig-a015-20200514
x86_64               randconfig-a013-20200514
x86_64               randconfig-a014-20200514
x86_64               randconfig-a011-20200514
i386                 randconfig-a012-20200514
i386                 randconfig-a016-20200514
i386                 randconfig-a014-20200514
i386                 randconfig-a011-20200514
i386                 randconfig-a013-20200514
i386                 randconfig-a015-20200514
i386                 randconfig-a012-20200515
i386                 randconfig-a016-20200515
i386                 randconfig-a014-20200515
i386                 randconfig-a011-20200515
i386                 randconfig-a013-20200515
i386                 randconfig-a015-20200515
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
