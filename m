Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7B838F251
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 19:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhEXRg7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 13:36:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:27300 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232708AbhEXRg7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 13:36:59 -0400
IronPort-SDR: EVJXkniay4mVLYckz5EkAjJ+wsWN8UF83Rm/ZZptWgU+SbqdNNW12OUK4QyvczQPAm6M/6iQSf
 qTJbZDNZAWDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202011765"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="202011765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 10:35:29 -0700
IronPort-SDR: 8Ixe3CoLZL55wGLf8/r2LHpUozN9uzw+Xv2vCc0+Y9pXuZP6DmB8d/hlbpVLbeRmLWfNZmNXEJ
 MTsiApQP+6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="396476851"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 May 2021 10:35:27 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llEUA-0001Ih-K6; Mon, 24 May 2021 17:35:26 +0000
Date:   Tue, 25 May 2021 01:35:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 2fb27551ba4053ae503ce6c3b7b5d87cd206b1fd
Message-ID: <60abe3cc.qz62ZtVW+BfHLMSM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 2fb27551ba4053ae503ce6c3b7b5d87cd206b1fd  media: imx: imx7_mipi_csis: Update MAINTAINERS

elapsed time: 1404m

configs tested: 279
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
m68k                       m5249evb_defconfig
mips                     loongson1c_defconfig
arm                        mini2440_defconfig
powerpc                         wii_defconfig
microblaze                          defconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      mgcoge_defconfig
arm                          imote2_defconfig
arm                           u8500_defconfig
powerpc                     tqm8548_defconfig
mips                          ath25_defconfig
mips                            gpr_defconfig
riscv                            allmodconfig
arm                          pxa3xx_defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
ia64                        generic_defconfig
arm                         s5pv210_defconfig
arm                          pxa168_defconfig
powerpc                  iss476-smp_defconfig
arm                           h3600_defconfig
mips                           rs90_defconfig
xtensa                       common_defconfig
mips                      maltaaprp_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      pcm030_defconfig
mips                           ip27_defconfig
mips                           mtx1_defconfig
arm                             mxs_defconfig
mips                             allmodconfig
mips                        bcm47xx_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
sh                         apsh4a3a_defconfig
arm                           spitz_defconfig
powerpc                      makalu_defconfig
sh                        edosk7760_defconfig
powerpc                      arches_defconfig
mips                      pistachio_defconfig
mips                           ip22_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          lpd270_defconfig
arm                       aspeed_g4_defconfig
arm64                            alldefconfig
ia64                          tiger_defconfig
csky                                defconfig
powerpc                     stx_gp3_defconfig
mips                     loongson2k_defconfig
ia64                      gensparse_defconfig
sh                          rsk7201_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
arm                          ep93xx_defconfig
sh                        sh7757lcr_defconfig
xtensa                           allyesconfig
powerpc                      ppc64e_defconfig
riscv                    nommu_virt_defconfig
sh                            shmin_defconfig
xtensa                           alldefconfig
mips                      loongson3_defconfig
arm                         orion5x_defconfig
arm                         axm55xx_defconfig
arm                          pcm027_defconfig
powerpc                   currituck_defconfig
xtensa                              defconfig
powerpc                      obs600_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                  cadence_csp_defconfig
um                             i386_defconfig
sh                           se7206_defconfig
arm                          exynos_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        m5407c3_defconfig
mips                      pic32mzda_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
arc                          axs101_defconfig
riscv                    nommu_k210_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
arm                           h5000_defconfig
sh                              ul2_defconfig
sh                           se7724_defconfig
sparc                            allyesconfig
mips                     cu1000-neo_defconfig
arm                       spear13xx_defconfig
riscv                          rv32_defconfig
nios2                         3c120_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     taishan_defconfig
nds32                               defconfig
sh                          kfr2r09_defconfig
powerpc                     mpc512x_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
arm                      integrator_defconfig
arm                        oxnas_v6_defconfig
powerpc                      chrp32_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7722_defconfig
arm                          badge4_defconfig
s390                                defconfig
arm                         lpc18xx_defconfig
openrisc                            defconfig
riscv                               defconfig
powerpc                     skiroot_defconfig
xtensa                    xip_kc705_defconfig
sh                        dreamcast_defconfig
ia64                            zx1_defconfig
mips                  cavium_octeon_defconfig
sparc                               defconfig
csky                             alldefconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
sh                          landisk_defconfig
arm                      footbridge_defconfig
arm                          collie_defconfig
mips                        omega2p_defconfig
sh                        sh7785lcr_defconfig
sh                                  defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      acadia_defconfig
mips                        vocore2_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc8272_ads_defconfig
arm                      tct_hammer_defconfig
mips                  maltasmvp_eva_defconfig
riscv                            alldefconfig
sh                            migor_defconfig
powerpc                     powernv_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
arm                       cns3420vb_defconfig
arm                           viper_defconfig
powerpc                 mpc8560_ads_defconfig
sh                           sh2007_defconfig
um                            kunit_defconfig
arm                     eseries_pxa_defconfig
powerpc                    adder875_defconfig
xtensa                    smp_lx200_defconfig
sh                           se7619_defconfig
arm                         hackkit_defconfig
m68k                       m5275evb_defconfig
arm                        cerfcube_defconfig
um                                allnoconfig
powerpc                     akebono_defconfig
parisc                           alldefconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
openrisc                  or1klitex_defconfig
parisc                generic-32bit_defconfig
mips                     decstation_defconfig
arc                              alldefconfig
powerpc                     tqm5200_defconfig
sparc                            alldefconfig
powerpc                     pseries_defconfig
arm                         palmz72_defconfig
nds32                            alldefconfig
arm                  colibri_pxa300_defconfig
arm                           tegra_defconfig
powerpc                  mpc885_ads_defconfig
m68k                             alldefconfig
sh                        sh7763rdp_defconfig
sh                   rts7751r2dplus_defconfig
mips                           gcw0_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          simpad_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                          atari_defconfig
powerpc                      katmai_defconfig
sh                     sh7710voipgw_defconfig
xtensa                         virt_defconfig
alpha                            alldefconfig
arc                 nsimosci_hs_smp_defconfig
sh                          rsk7203_defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
riscv                            allyesconfig
riscv                             allnoconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-a006-20210523
x86_64               randconfig-a001-20210523
x86_64               randconfig-a005-20210523
x86_64               randconfig-a003-20210523
x86_64               randconfig-a004-20210523
x86_64               randconfig-a002-20210523
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
