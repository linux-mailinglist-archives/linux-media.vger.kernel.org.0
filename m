Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797563AD208
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 20:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhFRSXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 14:23:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:40751 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhFRSXd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 14:23:33 -0400
IronPort-SDR: TQrl73Ij4gcnKvQxJAjIHts4Cifckr0kiJ3Tn1HbGMRavQT3HjOnpNbyQvGvSShW8TBTvzclIk
 l5fxpsTiOpEA==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="270450637"
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="270450637"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 11:21:23 -0700
IronPort-SDR: Xo/XG5Npa/Lfyd90QCr+l06fKIieRawCjPy8FLWPX4qlQN5J9Hr/xyA/yA48+W/CzXN4EuVYjL
 N8gPluNUCzlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="422303797"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jun 2021 11:21:21 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1luJ7I-00033l-Nt; Fri, 18 Jun 2021 18:21:20 +0000
Date:   Sat, 19 Jun 2021 02:21:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 198bb646e8553e8abd8d83492a27b601ab97b75d
Message-ID: <60cce41d.4dbp0LQLO+kTeZg8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 198bb646e8553e8abd8d83492a27b601ab97b75d  media: i2c: rdacm20: Re-work ov10635 reset

elapsed time: 1817m

configs tested: 265
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
arm                         s3c6400_defconfig
powerpc                      arches_defconfig
arm                          ep93xx_defconfig
um                            kunit_defconfig
sh                          rsk7269_defconfig
powerpc                     asp8347_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
powerpc                   bluestone_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     tqm8548_defconfig
arm                        multi_v5_defconfig
sh                           sh2007_defconfig
nds32                            alldefconfig
arm                         at91_dt_defconfig
arm                          pcm027_defconfig
powerpc                      ppc6xx_defconfig
arm                        keystone_defconfig
mips                      loongson3_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
mips                     loongson1c_defconfig
arm                         lpc32xx_defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
x86_64                            allnoconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
mips                      bmips_stb_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
arm                          pxa3xx_defconfig
mips                malta_qemu_32r6_defconfig
arm                       multi_v4t_defconfig
arm                         nhk8815_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                    amigaone_defconfig
mips                             allyesconfig
sh                        dreamcast_defconfig
xtensa                    xip_kc705_defconfig
m68k                         apollo_defconfig
mips                         db1xxx_defconfig
powerpc                    gamecube_defconfig
sh                          rsk7203_defconfig
sh                         ap325rxa_defconfig
parisc                           alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc834x_mds_defconfig
x86_64                           alldefconfig
mips                        jmr3927_defconfig
arc                        nsim_700_defconfig
sh                            shmin_defconfig
nios2                         3c120_defconfig
m68k                        mvme16x_defconfig
sh                            hp6xx_defconfig
s390                                defconfig
arm64                            alldefconfig
riscv                          rv32_defconfig
arm                        trizeps4_defconfig
sh                      rts7751r2d1_defconfig
arm                       omap2plus_defconfig
s390                          debug_defconfig
mips                         mpc30x_defconfig
sh                          rsk7264_defconfig
mips                          malta_defconfig
sparc64                             defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                  cavium_octeon_defconfig
sh                           se7722_defconfig
arc                      axs103_smp_defconfig
arc                              alldefconfig
m68k                           sun3_defconfig
mips                       lemote2f_defconfig
nios2                            alldefconfig
powerpc                    adder875_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                            q40_defconfig
powerpc                     tqm8560_defconfig
arm                  colibri_pxa300_defconfig
riscv                            allyesconfig
powerpc                     ksi8560_defconfig
powerpc                     ppa8548_defconfig
arm                         axm55xx_defconfig
powerpc                    mvme5100_defconfig
openrisc                            defconfig
arm                            hisi_defconfig
arm                      jornada720_defconfig
h8300                     edosk2674_defconfig
xtensa                         virt_defconfig
powerpc                      obs600_defconfig
mips                        bcm47xx_defconfig
mips                     decstation_defconfig
sh                            titan_defconfig
arm                           h5000_defconfig
powerpc                  iss476-smp_defconfig
arm                              alldefconfig
arm                           corgi_defconfig
sh                             sh03_defconfig
mips                             allmodconfig
xtensa                              defconfig
powerpc                      walnut_defconfig
arm                           h3600_defconfig
arm                          pxa910_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         vf610m4_defconfig
powerpc                      ppc40x_defconfig
m68k                          multi_defconfig
powerpc                    sam440ep_defconfig
mips                         tb0219_defconfig
arm                   milbeaut_m10v_defconfig
mips                  decstation_64_defconfig
powerpc64                        alldefconfig
arc                            hsdk_defconfig
openrisc                 simple_smp_defconfig
mips                      pistachio_defconfig
arm                  colibri_pxa270_defconfig
sh                        sh7757lcr_defconfig
arm                        spear3xx_defconfig
mips                        omega2p_defconfig
powerpc                          g5_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
arm                          moxart_defconfig
powerpc                     redwood_defconfig
powerpc                       ppc64_defconfig
powerpc                       ebony_defconfig
mips                     loongson1b_defconfig
powerpc                     pseries_defconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
arm                         lubbock_defconfig
sparc                            allyesconfig
arm                      footbridge_defconfig
sparc                       sparc64_defconfig
arm                      tct_hammer_defconfig
arm                      pxa255-idp_defconfig
arm                             pxa_defconfig
arm                       mainstone_defconfig
alpha                            alldefconfig
powerpc                 linkstation_defconfig
arm                           sama5_defconfig
powerpc                        fsp2_defconfig
arm                         s5pv210_defconfig
powerpc                    klondike_defconfig
powerpc                       eiger_defconfig
ia64                            zx1_defconfig
powerpc                      ppc64e_defconfig
arm                           spitz_defconfig
mips                            gpr_defconfig
mips                            ar7_defconfig
xtensa                          iss_defconfig
powerpc                     sbc8548_defconfig
powerpc                  storcenter_defconfig
s390                             alldefconfig
powerpc                mpc7448_hpc2_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
sh                          r7785rp_defconfig
xtensa                    smp_lx200_defconfig
m68k                          sun3x_defconfig
arm                        cerfcube_defconfig
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
sparc                               defconfig
i386                                defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210617
x86_64               randconfig-a001-20210617
x86_64               randconfig-a002-20210617
x86_64               randconfig-a003-20210617
x86_64               randconfig-a006-20210617
x86_64               randconfig-a005-20210617
i386                 randconfig-a002-20210617
i386                 randconfig-a006-20210617
i386                 randconfig-a001-20210617
i386                 randconfig-a004-20210617
i386                 randconfig-a005-20210617
i386                 randconfig-a003-20210617
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210617
i386                 randconfig-a013-20210617
i386                 randconfig-a016-20210617
i386                 randconfig-a012-20210617
i386                 randconfig-a014-20210617
i386                 randconfig-a011-20210617
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210618
x86_64               randconfig-b001-20210617
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618
x86_64               randconfig-a015-20210617
x86_64               randconfig-a011-20210617
x86_64               randconfig-a014-20210617
x86_64               randconfig-a012-20210617
x86_64               randconfig-a013-20210617
x86_64               randconfig-a016-20210617

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
