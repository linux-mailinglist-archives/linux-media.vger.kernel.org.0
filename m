Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E625D43512E
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 19:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhJTR2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 13:28:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:51725 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhJTR2R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 13:28:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="226302421"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; 
   d="scan'208";a="226302421"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 10:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; 
   d="scan'208";a="662331651"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2021 10:25:52 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mdFLb-000DXw-Qe; Wed, 20 Oct 2021 17:25:51 +0000
Date:   Thu, 21 Oct 2021 01:25:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 fdc881783099c6343921ff017450831c8766d12a
Message-ID: <61705101.8CRaExygkFelF2lM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: fdc881783099c6343921ff017450831c8766d12a  media: ite-cir: IR receiver stop working after receive overflow

elapsed time: 2034m

configs tested: 195
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211019
i386                             alldefconfig
powerpc                      mgcoge_defconfig
sh                          r7780mp_defconfig
arm                         hackkit_defconfig
mips                        omega2p_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
xtensa                          iss_defconfig
arm                           viper_defconfig
mips                           gcw0_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                           u8500_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     ksi8560_defconfig
openrisc                         alldefconfig
arm                          pcm027_defconfig
mips                         mpc30x_defconfig
arm                         vf610m4_defconfig
sh                           se7343_defconfig
h8300                       h8s-sim_defconfig
arc                          axs101_defconfig
powerpc                     asp8347_defconfig
sh                        edosk7705_defconfig
mips                         tb0287_defconfig
powerpc                      ppc6xx_defconfig
arm                             ezx_defconfig
s390                             alldefconfig
sh                            shmin_defconfig
mips                      malta_kvm_defconfig
powerpc                       eiger_defconfig
arm                         nhk8815_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
mips                malta_qemu_32r6_defconfig
arm                              alldefconfig
sh                          rsk7264_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         orion5x_defconfig
powerpc                     ppa8548_defconfig
arm                  colibri_pxa300_defconfig
powerpc64                           defconfig
arm                          simpad_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     skiroot_defconfig
arm                         s3c6400_defconfig
mips                             allyesconfig
powerpc                        icon_defconfig
powerpc                     stx_gp3_defconfig
arm                            mps2_defconfig
arm                          collie_defconfig
sh                   sh7724_generic_defconfig
x86_64                           alldefconfig
arc                          axs103_defconfig
arm                           corgi_defconfig
m68k                        m5407c3_defconfig
arm                       imx_v6_v7_defconfig
riscv                            alldefconfig
arm                          pxa910_defconfig
parisc                generic-64bit_defconfig
sh                              ul2_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7722_defconfig
powerpc                   bluestone_defconfig
x86_64                           allyesconfig
mips                     decstation_defconfig
m68k                       m5275evb_defconfig
arm                          ep93xx_defconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
alpha                            allyesconfig
powerpc                      pasemi_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     pseries_defconfig
powerpc                      acadia_defconfig
ia64                            zx1_defconfig
arm                     davinci_all_defconfig
sh                          polaris_defconfig
sh                        edosk7760_defconfig
powerpc                      walnut_defconfig
arm                        realview_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
openrisc                    or1ksim_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                         s3c2410_defconfig
h8300                            alldefconfig
mips                        vocore2_defconfig
arm                         cm_x300_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     pq2fads_defconfig
m68k                        m5307c3_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7780_defconfig
arc                      axs103_smp_defconfig
powerpc                     tqm8540_defconfig
mips                           ci20_defconfig
powerpc                     tqm5200_defconfig
powerpc                        fsp2_defconfig
arm                         palmz72_defconfig
mips                      maltasmvp_defconfig
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20211020
i386                 randconfig-a003-20211020
i386                 randconfig-a002-20211020
i386                 randconfig-a005-20211020
i386                 randconfig-a006-20211020
i386                 randconfig-a001-20211020
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211020
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211019
mips                 randconfig-c004-20211019
i386                 randconfig-c001-20211019
s390                 randconfig-c005-20211019
x86_64               randconfig-c007-20211019
riscv                randconfig-c006-20211019
powerpc              randconfig-c003-20211019
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019
riscv                randconfig-r042-20211020
s390                 randconfig-r044-20211020
hexagon              randconfig-r045-20211020
hexagon              randconfig-r041-20211020

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
