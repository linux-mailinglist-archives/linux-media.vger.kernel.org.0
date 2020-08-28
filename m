Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F72255F62
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 19:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgH1RHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 13:07:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:62546 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgH1RHj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 13:07:39 -0400
IronPort-SDR: PDO5JN753cORyDZm7/kgul2qUeNSy47avzTIxtW3HvKOKGHF9wQmlUANWWExoqQLfr4wrm1qGj
 2V7uHXf28i+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="154247922"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="154247922"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 10:07:31 -0700
IronPort-SDR: cM930LfOnHDcp8IS9Obrmr2jI1OXyLv3JMPRXF5wKAsk/q/HKNbAr2vbQVs6P1Vi5DlLn3khdM
 OpHbNNz8VFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="444897324"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2020 10:07:30 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBhqb-00006V-ML; Fri, 28 Aug 2020 17:07:29 +0000
Date:   Sat, 29 Aug 2020 01:06:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 d84eca28c807dbcdb40a2b8e2697118b99fdb2fd
Message-ID: <5f4939b0.WwcGqtQTlfCscc3t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: d84eca28c807dbcdb40a2b8e2697118b99fdb2fd  media: MAINTAINERS: add Dafna Hirschfeld for rkisp1

elapsed time: 2021m

configs tested: 211
configs skipped: 25

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
mips                     decstation_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
sparc                               defconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
mips                         rt305x_defconfig
powerpc                     ep8248e_defconfig
powerpc                     pseries_defconfig
arm                        keystone_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
m68k                       bvme6000_defconfig
powerpc                         ps3_defconfig
arm                             rpc_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
m68k                        m5272c3_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
sh                          sdk7780_defconfig
arm                             ezx_defconfig
mips                            e55_defconfig
arm                          pxa910_defconfig
mips                        bcm47xx_defconfig
c6x                        evmc6474_defconfig
microblaze                    nommu_defconfig
arm                            zeus_defconfig
arm                       aspeed_g4_defconfig
mips                           xway_defconfig
mips                     loongson1c_defconfig
mips                            gpr_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     pq2fads_defconfig
m68k                         apollo_defconfig
m68k                             allyesconfig
sh                        sh7763rdp_defconfig
arm                         orion5x_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
nios2                            allyesconfig
powerpc                           allnoconfig
mips                         mpc30x_defconfig
powerpc                      ppc40x_defconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
mips                          rb532_defconfig
ia64                             alldefconfig
mips                        vocore2_defconfig
powerpc                     mpc5200_defconfig
mips                           ip22_defconfig
arc                            hsdk_defconfig
arc                           tb10x_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
mips                      maltaaprp_defconfig
arm                         hackkit_defconfig
arm                          moxart_defconfig
parisc                           alldefconfig
arm                        mvebu_v7_defconfig
arm                    vt8500_v6_v7_defconfig
arc                              allyesconfig
sh                             sh03_defconfig
arm                         mv78xx0_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
arm                         lpc18xx_defconfig
mips                        jmr3927_defconfig
arm                          exynos_defconfig
arm                          lpd270_defconfig
nds32                               defconfig
sh                           se7751_defconfig
mips                           rs90_defconfig
arc                     nsimosci_hs_defconfig
sh                               alldefconfig
m68k                          amiga_defconfig
sh                        edosk7705_defconfig
arm                       mainstone_defconfig
m68k                             allmodconfig
c6x                         dsk6455_defconfig
mips                malta_kvm_guest_defconfig
mips                  cavium_octeon_defconfig
arc                             nps_defconfig
arm                       spear13xx_defconfig
powerpc                     powernv_defconfig
ia64                         bigsur_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
powerpc                      ep88xc_defconfig
mips                         bigsur_defconfig
arm                         axm55xx_defconfig
sh                          urquell_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
s390                          debug_defconfig
alpha                            alldefconfig
arm                           sama5_defconfig
arm                            mmp2_defconfig
sh                        edosk7760_defconfig
sh                           sh2007_defconfig
sh                         apsh4a3a_defconfig
sparc64                             defconfig
mips                      pistachio_defconfig
h8300                            allyesconfig
sh                          lboxre2_defconfig
powerpc                      pasemi_defconfig
sh                           se7712_defconfig
arm                           omap1_defconfig
arm                         at91_dt_defconfig
sh                          kfr2r09_defconfig
arm                          pcm027_defconfig
powerpc                      ppc6xx_defconfig
nios2                            alldefconfig
arc                                 defconfig
c6x                        evmc6678_defconfig
sh                             shx3_defconfig
s390                       zfcpdump_defconfig
arm                           efm32_defconfig
powerpc                    gamecube_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
powerpc                    amigaone_defconfig
powerpc                     skiroot_defconfig
arm                         bcm2835_defconfig
mips                     loongson1b_defconfig
mips                            ar7_defconfig
alpha                               defconfig
powerpc                      tqm8xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200827
i386                 randconfig-a004-20200827
i386                 randconfig-a003-20200827
i386                 randconfig-a005-20200827
i386                 randconfig-a006-20200827
i386                 randconfig-a001-20200827
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200827
i386                 randconfig-a012-20200827
i386                 randconfig-a011-20200827
i386                 randconfig-a016-20200827
i386                 randconfig-a015-20200827
i386                 randconfig-a014-20200827
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
