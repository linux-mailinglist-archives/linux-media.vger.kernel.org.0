Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04944319230
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 19:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhBKSZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 13:25:13 -0500
Received: from mga12.intel.com ([192.55.52.136]:55508 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232575AbhBKSWx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 13:22:53 -0500
IronPort-SDR: 3w+VrsotU3DHZkZ7vU5p3D4ekg+XWrCrBbOtlZRkArY0w0rxFckfmTjJHhH9Ln/jW4WU95CX/V
 HIeqe/risokA==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="161435953"
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; 
   d="scan'208";a="161435953"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 10:22:04 -0800
IronPort-SDR: E4IzsxeUYrmqTC/Y/LiwYFFks1WrukekmON+gsyvNAk3D1/R1yESeEPkIqo0f+J2lUpL34IMXx
 TdybpNETR5bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; 
   d="scan'208";a="380837026"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2021 10:22:03 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lAGbK-0003zO-NJ; Thu, 11 Feb 2021 18:22:02 +0000
Date:   Fri, 12 Feb 2021 02:21:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 ce79aecf608469b8b8e422928e6fca50b6ca7133
Message-ID: <602575c6.qH/39mJBE5+hi5zJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: ce79aecf608469b8b8e422928e6fca50b6ca7133  media: i2c: max9271: Add MODULE_* macros

elapsed time: 1202m

configs tested: 179
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           sama5_defconfig
m68k                        mvme147_defconfig
arm                          badge4_defconfig
sh                        dreamcast_defconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
powerpc                    klondike_defconfig
c6x                         dsk6455_defconfig
mips                          malta_defconfig
powerpc                        cell_defconfig
m68k                       m5249evb_defconfig
powerpc                     sbc8548_defconfig
sh                            shmin_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
arm                              alldefconfig
openrisc                  or1klitex_defconfig
powerpc                      obs600_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
powerpc                      pasemi_defconfig
sh                         apsh4a3a_defconfig
sh                          rsk7201_defconfig
ia64                             allmodconfig
arc                     haps_hs_smp_defconfig
mips                         bigsur_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc64                           defconfig
mips                           xway_defconfig
mips                            e55_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        nlm_xlp_defconfig
xtensa                         virt_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                     tqm8540_defconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
powerpc                  mpc885_ads_defconfig
arc                         haps_hs_defconfig
arm                          prima2_defconfig
powerpc                          g5_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     tqm8555_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
arm                          gemini_defconfig
powerpc                     taishan_defconfig
s390                             allmodconfig
arm                    vt8500_v6_v7_defconfig
arm                        realview_defconfig
sh                                  defconfig
sh                         microdev_defconfig
mips                        bcm47xx_defconfig
ia64                         bigsur_defconfig
mips                         tb0287_defconfig
powerpc                    socrates_defconfig
mips                            ar7_defconfig
powerpc                          allmodconfig
powerpc                         ps3_defconfig
powerpc                      walnut_defconfig
powerpc                    mvme5100_defconfig
mips                     loongson1c_defconfig
nds32                            alldefconfig
sh                          landisk_defconfig
arm                           corgi_defconfig
arm                         at91_dt_defconfig
arm                      integrator_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        m5407c3_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
powerpc                          allyesconfig
sh                           se7750_defconfig
sh                        sh7763rdp_defconfig
m68k                       m5275evb_defconfig
sparc64                          alldefconfig
powerpc                 mpc836x_mds_defconfig
nios2                            alldefconfig
mips                           ip27_defconfig
powerpc                      katmai_defconfig
xtensa                       common_defconfig
riscv                            alldefconfig
arm                        vexpress_defconfig
m68k                            mac_defconfig
arm                             pxa_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7751_defconfig
powerpc                     sequoia_defconfig
ia64                      gensparse_defconfig
m68k                             alldefconfig
m68k                         apollo_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
m68k                                defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
x86_64               randconfig-a016-20210211
x86_64               randconfig-a013-20210211
x86_64               randconfig-a012-20210211
x86_64               randconfig-a015-20210211
x86_64               randconfig-a014-20210211
x86_64               randconfig-a011-20210211
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
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
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
