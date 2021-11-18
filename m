Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D096245643F
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 21:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhKRUff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 15:35:35 -0500
Received: from mga01.intel.com ([192.55.52.88]:27383 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232523AbhKRUfe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 15:35:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="258072316"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="258072316"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 12:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="672952417"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Nov 2021 12:32:24 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mno51-0003bH-Rt; Thu, 18 Nov 2021 20:32:23 +0000
Date:   Fri, 19 Nov 2021 04:31:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS WITH WARNING
 999ed03518cb01aa9ef55c025db79567eec6268c
Message-ID: <6196b818.jtPo8JX/AlI9dKX2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 999ed03518cb01aa9ef55c025db79567eec6268c  media: atomisp: cleanup qbuf logic

Warning reports:

https://lore.kernel.org/linux-media/202111182229.beNw3l9E-lkp@intel.com

Warning in current branch:

drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:32:40: warning: redefinition of typedef 'input_system_cfg2400_t' is a C11 feature [-Wtypedef-redefinition]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-buildonly-randconfig-r001-20211118
    `-- drivers-staging-media-atomisp-pci-isp2400_input_system_local.h:warning:redefinition-of-typedef-input_system_cfg2400_t-is-a-C11-feature

elapsed time: 1411m

configs tested: 150
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211118
mips                 randconfig-c004-20211118
powerpc                   motionpro_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        mvebu_v7_defconfig
arm                        neponset_defconfig
sh                 kfr2r09-romimage_defconfig
mips                           jazz_defconfig
mips                       capcella_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc836x_mds_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
xtensa                              defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     rainier_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     tqm8541_defconfig
powerpc                    gamecube_defconfig
mips                            e55_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                      bmips_stb_defconfig
arm                           corgi_defconfig
m68k                       m5208evb_defconfig
mips                     cu1000-neo_defconfig
arm                           tegra_defconfig
sh                            migor_defconfig
powerpc                     mpc5200_defconfig
arc                              allyesconfig
m68k                            q40_defconfig
arm                          ixp4xx_defconfig
openrisc                    or1ksim_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                             espt_defconfig
arc                           tb10x_defconfig
powerpc                     kilauea_defconfig
powerpc                  mpc866_ads_defconfig
mips                           gcw0_defconfig
arm                   milbeaut_m10v_defconfig
arm                       spear13xx_defconfig
arm                  randconfig-c002-20211117
arm                  randconfig-c002-20211118
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
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
x86_64               randconfig-a005-20211117
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a006-20211117
x86_64               randconfig-a004-20211117
arc                  randconfig-r043-20211118
riscv                randconfig-r042-20211118
s390                 randconfig-r044-20211118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a006-20211118
i386                 randconfig-a003-20211118
i386                 randconfig-a001-20211118
i386                 randconfig-a005-20211118
i386                 randconfig-a004-20211118
i386                 randconfig-a002-20211118
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117
hexagon              randconfig-r045-20211118
hexagon              randconfig-r041-20211118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
