Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B2734809F
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 19:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237632AbhCXSiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 14:38:25 -0400
Received: from mga06.intel.com ([134.134.136.31]:23215 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237588AbhCXSiE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 14:38:04 -0400
IronPort-SDR: 2sTRWLhz0iztMQNM5h1AAD3h+9JQAiPWVL8dgWDvhX7Ysi/UNTf5qzKZF0afVA/W6y9Yn+IMuB
 H+tj6WPr1DTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="252122856"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="252122856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 11:38:03 -0700
IronPort-SDR: 82HrEA9Kv1JjO5q3m3qB3RLtXzhvKc+N5Onukq/2OorhF9Ofn+aEdMciHUOGnboAbJq/is06eH
 XXwVzZNJ4ngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="374747338"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 11:38:02 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lP8OH-0001R6-9n; Wed, 24 Mar 2021 18:38:01 +0000
Date:   Thu, 25 Mar 2021 02:37:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 97b34809ec240d82c82af97626c2071a4062e0e6
Message-ID: <605b8702.+t9cc+34CTinvtNa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 97b34809ec240d82c82af97626c2071a4062e0e6  media: staging: atomisp: reduce kernel stack usage

possible Warning in current branch:

drivers/media/platform/imx-jpeg/mxc-jpeg.c:1993:3-10: line 1993 is redundant because platform_get_irq() already prints an error

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- riscv-allmodconfig
    `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error

elapsed time: 1541m

configs tested: 196
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                         ps3_defconfig
um                           x86_64_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
sh                          rsk7203_defconfig
sh                             shx3_defconfig
arm                         orion5x_defconfig
mips                        workpad_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                     cu1000-neo_defconfig
arm                        mini2440_defconfig
powerpc                      obs600_defconfig
arm                           h3600_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      pmac32_defconfig
sh                        sh7785lcr_defconfig
mips                         tb0287_defconfig
sh                ecovec24-romimage_defconfig
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                      tct_hammer_defconfig
arm                             mxs_defconfig
sh                            titan_defconfig
mips                 decstation_r4k_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    klondike_defconfig
sh                           se7712_defconfig
ia64                          tiger_defconfig
mips                          ath25_defconfig
arm                         cm_x300_defconfig
openrisc                  or1klitex_defconfig
powerpc                 linkstation_defconfig
powerpc                   lite5200b_defconfig
mips                  cavium_octeon_defconfig
arm                       imx_v4_v5_defconfig
powerpc64                           defconfig
m68k                        mvme147_defconfig
m68k                          hp300_defconfig
arc                           tb10x_defconfig
mips                        bcm63xx_defconfig
powerpc                   bluestone_defconfig
arm                      pxa255-idp_defconfig
arm                            hisi_defconfig
arm                          exynos_defconfig
h8300                       h8s-sim_defconfig
mips                      pic32mzda_defconfig
arm                       versatile_defconfig
arm                          collie_defconfig
sh                          sdk7780_defconfig
powerpc                  storcenter_defconfig
powerpc                     kilauea_defconfig
mips                   sb1250_swarm_defconfig
ia64                             allmodconfig
powerpc                     pseries_defconfig
mips                        jmr3927_defconfig
powerpc                     taishan_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                          multi_defconfig
powerpc                    socrates_defconfig
arm                       imx_v6_v7_defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
m68k                            q40_defconfig
mips                     loongson1b_defconfig
m68k                        m5407c3_defconfig
arm                      footbridge_defconfig
arm                          simpad_defconfig
mips                      malta_kvm_defconfig
arm                           stm32_defconfig
arc                     haps_hs_smp_defconfig
s390                             alldefconfig
mips                            e55_defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
xtensa                         virt_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          sdk7786_defconfig
sh                           se7721_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5475evb_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltaaprp_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
mips                             allyesconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
mips                     cu1830-neo_defconfig
powerpc                           allnoconfig
mips                  maltasmvp_eva_defconfig
riscv                               defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
arm                  colibri_pxa300_defconfig
mips                           jazz_defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7619_defconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210323
x86_64               randconfig-a003-20210323
x86_64               randconfig-a006-20210323
x86_64               randconfig-a001-20210323
x86_64               randconfig-a004-20210323
x86_64               randconfig-a005-20210323
i386                 randconfig-a003-20210323
i386                 randconfig-a004-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a004-20210324
i386                 randconfig-a003-20210324
i386                 randconfig-a001-20210324
i386                 randconfig-a002-20210324
i386                 randconfig-a006-20210324
i386                 randconfig-a005-20210324
x86_64               randconfig-a012-20210324
x86_64               randconfig-a015-20210324
x86_64               randconfig-a014-20210324
x86_64               randconfig-a013-20210324
x86_64               randconfig-a016-20210324
x86_64               randconfig-a011-20210324
i386                 randconfig-a014-20210324
i386                 randconfig-a011-20210324
i386                 randconfig-a015-20210324
i386                 randconfig-a016-20210324
i386                 randconfig-a013-20210324
i386                 randconfig-a012-20210324
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a015-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210324
x86_64               randconfig-a003-20210324
x86_64               randconfig-a001-20210324
x86_64               randconfig-a006-20210324
x86_64               randconfig-a005-20210324
x86_64               randconfig-a004-20210324
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
