Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA0D45AB40
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 19:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239764AbhKWSc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 13:32:59 -0500
Received: from mga07.intel.com ([134.134.136.100]:8482 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232807AbhKWSc6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 13:32:58 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="298504245"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="298504245"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 10:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="509513837"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Nov 2021 10:17:47 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpaMU-0002A1-PU; Tue, 23 Nov 2021 18:17:46 +0000
Date:   Wed, 24 Nov 2021 02:17:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 0d2517b3765aa331aee0a95f9b8072062d6bb7e5
Message-ID: <619d302b.KuPFx5wrcwbGrSD5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 0d2517b3765aa331aee0a95f9b8072062d6bb7e5  media: hantro: Support NV12 on the G2 core

elapsed time: 2028m

configs tested: 361
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211123
i386                 randconfig-c001-20211122
mips                 randconfig-c004-20211122
powerpc                 mpc836x_rdk_defconfig
m68k                        mvme16x_defconfig
m68k                          sun3x_defconfig
powerpc                     sequoia_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                           sh2007_defconfig
arm                       mainstone_defconfig
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                            pleb_defconfig
mips                     loongson1c_defconfig
mips                            e55_defconfig
sh                          landisk_defconfig
mips                      pic32mzda_defconfig
mips                        bcm47xx_defconfig
arc                          axs103_defconfig
nds32                            alldefconfig
powerpc                   microwatt_defconfig
mips                        vocore2_defconfig
arm                        multi_v7_defconfig
sh                      rts7751r2d1_defconfig
arm                         lpc18xx_defconfig
sh                         microdev_defconfig
powerpc                      pmac32_defconfig
um                                  defconfig
arm                          exynos_defconfig
mips                        qi_lb60_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8548_defconfig
mips                      maltasmvp_defconfig
powerpc                      tqm8xx_defconfig
arm                         socfpga_defconfig
arm                          pcm027_defconfig
powerpc                        fsp2_defconfig
mips                  decstation_64_defconfig
sh                         ecovec24_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7705_defconfig
mips                         tb0219_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
sh                             shx3_defconfig
arm                            zeus_defconfig
mips                          rm200_defconfig
arm                       cns3420vb_defconfig
arm                          pxa910_defconfig
mips                         rt305x_defconfig
arm                         at91_dt_defconfig
arm                        mvebu_v5_defconfig
riscv                    nommu_virt_defconfig
powerpc                       eiger_defconfig
sh                           se7722_defconfig
mips                             allmodconfig
arm                          iop32x_defconfig
powerpc                      ppc40x_defconfig
xtensa                  nommu_kc705_defconfig
nios2                         3c120_defconfig
xtensa                    smp_lx200_defconfig
mips                       capcella_defconfig
h8300                            alldefconfig
arm                         hackkit_defconfig
arm                        shmobile_defconfig
ia64                             alldefconfig
powerpc                    adder875_defconfig
mips                        maltaup_defconfig
sparc                       sparc64_defconfig
sparc64                          alldefconfig
m68k                            q40_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                       common_defconfig
mips                          ath79_defconfig
powerpc64                           defconfig
arm                          ixp4xx_defconfig
arm                      integrator_defconfig
mips                          rb532_defconfig
mips                           ip32_defconfig
arm                            dove_defconfig
mips                           gcw0_defconfig
arm                          pxa3xx_defconfig
powerpc                 linkstation_defconfig
arm                        magician_defconfig
sh                           se7343_defconfig
powerpc                     mpc5200_defconfig
powerpc                   bluestone_defconfig
arm                           stm32_defconfig
parisc                generic-32bit_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
arm                        oxnas_v6_defconfig
sh                        sh7757lcr_defconfig
arc                          axs101_defconfig
mips                           ip28_defconfig
mips                     cu1830-neo_defconfig
arm                            xcep_defconfig
arm                        mini2440_defconfig
mips                           ci20_defconfig
openrisc                            defconfig
mips                    maltaup_xpa_defconfig
m68k                        mvme147_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
ia64                      gensparse_defconfig
arc                         haps_hs_defconfig
sh                          sdk7786_defconfig
powerpc                      ppc44x_defconfig
m68k                          multi_defconfig
powerpc                     akebono_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          lboxre2_defconfig
powerpc                     pq2fads_defconfig
powerpc                      pasemi_defconfig
mips                            ar7_defconfig
powerpc                      arches_defconfig
arm                           tegra_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
csky                                defconfig
mips                  cavium_octeon_defconfig
mips                     decstation_defconfig
mips                           xway_defconfig
arm                         cm_x300_defconfig
powerpc                    amigaone_defconfig
m68k                          atari_defconfig
powerpc                      ppc6xx_defconfig
xtensa                           alldefconfig
powerpc                     kilauea_defconfig
sh                   sh7724_generic_defconfig
parisc                           alldefconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        m5272c3_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
powerpc                     rainier_defconfig
arm                         s5pv210_defconfig
alpha                               defconfig
arm                          simpad_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      pcm030_defconfig
m68k                       m5475evb_defconfig
m68k                       bvme6000_defconfig
arm                     davinci_all_defconfig
powerpc                       ebony_defconfig
powerpc                     ksi8560_defconfig
mips                        bcm63xx_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm8560_defconfig
powerpc                     mpc512x_defconfig
sh                          rsk7264_defconfig
powerpc                     kmeter1_defconfig
xtensa                         virt_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          lpd270_defconfig
arm                         orion5x_defconfig
m68k                                defconfig
arm                    vt8500_v6_v7_defconfig
mips                             allyesconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      walnut_defconfig
ia64                            zx1_defconfig
sh                              ul2_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ep88xc_defconfig
m68k                         amcore_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                        apsh4ad0a_defconfig
arm                       versatile_defconfig
h8300                    h8300h-sim_defconfig
powerpc                          allmodconfig
sh                          kfr2r09_defconfig
powerpc                 mpc832x_rdb_defconfig
riscv                    nommu_k210_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
h8300                               defconfig
arc                                 defconfig
powerpc                      mgcoge_defconfig
powerpc                         ps3_defconfig
sh                        dreamcast_defconfig
mips                        workpad_defconfig
x86_64                           alldefconfig
arm                         assabet_defconfig
arm                          collie_defconfig
mips                         tb0287_defconfig
xtensa                              defconfig
openrisc                  or1klitex_defconfig
m68k                       m5208evb_defconfig
arm                      footbridge_defconfig
arm                         axm55xx_defconfig
mips                           jazz_defconfig
arc                              alldefconfig
arm                       aspeed_g5_defconfig
sparc64                             defconfig
sh                             espt_defconfig
powerpc                      ppc64e_defconfig
h8300                     edosk2674_defconfig
powerpc                      katmai_defconfig
riscv                          rv32_defconfig
arm                          gemini_defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
sh                   secureedge5410_defconfig
mips                     loongson2k_defconfig
powerpc                   lite5200b_defconfig
arm                           h5000_defconfig
arm                          badge4_defconfig
arm                            lart_defconfig
sh                               allmodconfig
m68k                             alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                        trizeps4_defconfig
s390                       zfcpdump_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
powerpc                    socrates_defconfig
sh                         apsh4a3a_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
riscv                            alldefconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                          pxa168_defconfig
arm                     eseries_pxa_defconfig
arm                           sama5_defconfig
mips                           rs90_defconfig
powerpc                   currituck_defconfig
arm                       multi_v4t_defconfig
m68k                        m5407c3_defconfig
arm                      tct_hammer_defconfig
ia64                        generic_defconfig
arc                        vdk_hs38_defconfig
powerpc                     redwood_defconfig
powerpc                          g5_defconfig
arm                     am200epdkit_defconfig
arc                        nsimosci_defconfig
microblaze                          defconfig
mips                           mtx1_defconfig
sh                          polaris_defconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
arm                           corgi_defconfig
ia64                         bigsur_defconfig
mips                   sb1250_swarm_defconfig
arm                  randconfig-c002-20211122
arm                  randconfig-c002-20211123
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a001-20211123
x86_64               randconfig-a003-20211123
x86_64               randconfig-a006-20211123
x86_64               randconfig-a004-20211123
x86_64               randconfig-a005-20211123
x86_64               randconfig-a002-20211123
i386                 randconfig-a001-20211123
i386                 randconfig-a002-20211123
i386                 randconfig-a005-20211123
i386                 randconfig-a006-20211123
i386                 randconfig-a004-20211123
i386                 randconfig-a003-20211123
x86_64               randconfig-a014-20211122
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
arc                  randconfig-r043-20211123
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211123
i386                 randconfig-c001-20211123
powerpc              randconfig-c003-20211123
arm                  randconfig-c002-20211123
riscv                randconfig-c006-20211123
x86_64               randconfig-c007-20211123
mips                 randconfig-c004-20211123
s390                 randconfig-c005-20211122
i386                 randconfig-c001-20211122
powerpc              randconfig-c003-20211122
riscv                randconfig-c006-20211122
arm                  randconfig-c002-20211122
x86_64               randconfig-c007-20211122
mips                 randconfig-c004-20211122
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
x86_64               randconfig-a014-20211123
x86_64               randconfig-a011-20211123
x86_64               randconfig-a012-20211123
x86_64               randconfig-a016-20211123
x86_64               randconfig-a013-20211123
x86_64               randconfig-a015-20211123
i386                 randconfig-a016-20211123
i386                 randconfig-a015-20211123
i386                 randconfig-a012-20211123
i386                 randconfig-a013-20211123
i386                 randconfig-a014-20211123
i386                 randconfig-a011-20211123
hexagon              randconfig-r045-20211123
s390                 randconfig-r044-20211123
hexagon              randconfig-r041-20211123
riscv                randconfig-r042-20211123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
