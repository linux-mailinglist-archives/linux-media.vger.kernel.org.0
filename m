Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E42D358BEE
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 20:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhDHSI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 14:08:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:25586 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232604AbhDHSI5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 14:08:57 -0400
IronPort-SDR: K0iZTZt5mF7BLoHFxP55oH8ys1MaR1s6DyfKsXLYzVvp0QOpb730AP4oryLDLJIvhTU+qf3oq7
 i2P6m2favDiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="257584201"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="257584201"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 11:08:45 -0700
IronPort-SDR: wYhdwH0Lz49B1a1TxODUt1s1E6T5BwggyRefMG5HHig+iAAdVp+nReXmO44IQ16CFSYmq3msNt
 wGsUE8VXmWqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; 
   d="scan'208";a="387479938"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2021 11:08:44 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUZ59-000FQz-KE; Thu, 08 Apr 2021 18:08:43 +0000
Date:   Fri, 09 Apr 2021 02:07:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 c1c1d437b1f0a84de6b53416026f7ea1ef3df996
Message-ID: <606f4673.jd3/lp41XAQtm8XY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: c1c1d437b1f0a84de6b53416026f7ea1ef3df996  MAINTAINERS: update ovti,ov2680.yaml reference

elapsed time: 1981m

configs tested: 305
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

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
arm                         hackkit_defconfig
arm                           u8500_defconfig
mips                       bmips_be_defconfig
arm                           h5000_defconfig
mips                      loongson3_defconfig
ia64                             allyesconfig
arm                         lpc18xx_defconfig
arc                         haps_hs_defconfig
riscv                            alldefconfig
powerpc                     mpc83xx_defconfig
openrisc                 simple_smp_defconfig
nios2                               defconfig
arc                          axs101_defconfig
alpha                            alldefconfig
s390                                defconfig
mips                        nlm_xlp_defconfig
m68k                                defconfig
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          exynos_defconfig
arm                           viper_defconfig
sh                          lboxre2_defconfig
powerpc                 mpc834x_itx_defconfig
mips                  maltasmvp_eva_defconfig
arm                       netwinder_defconfig
arm                     am200epdkit_defconfig
mips                          rb532_defconfig
powerpc                   currituck_defconfig
powerpc                      chrp32_defconfig
arm                        keystone_defconfig
alpha                            allyesconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
mips                        maltaup_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
xtensa                  cadence_csp_defconfig
m68k                             allyesconfig
powerpc                     akebono_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
m68k                         amcore_defconfig
sparc                       sparc32_defconfig
powerpc                     ppa8548_defconfig
xtensa                         virt_defconfig
arm                         lubbock_defconfig
powerpc                     tqm8555_defconfig
s390                             alldefconfig
sh                           se7619_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                        m5307c3_defconfig
m68k                       m5208evb_defconfig
mips                malta_qemu_32r6_defconfig
sh                           se7712_defconfig
arm                        oxnas_v6_defconfig
powerpc                      ppc44x_defconfig
arm                  colibri_pxa300_defconfig
m68k                         apollo_defconfig
sh                          r7785rp_defconfig
powerpc                      pmac32_defconfig
mips                       lemote2f_defconfig
arm                         bcm2835_defconfig
arc                      axs103_smp_defconfig
arm                            hisi_defconfig
mips                            e55_defconfig
sh                            hp6xx_defconfig
arc                     nsimosci_hs_defconfig
arm                        clps711x_defconfig
openrisc                  or1klitex_defconfig
powerpc                    amigaone_defconfig
sh                ecovec24-romimage_defconfig
mips                         cobalt_defconfig
m68k                        m5407c3_defconfig
arm                           spitz_defconfig
arm                         palmz72_defconfig
arm                         lpc32xx_defconfig
ia64                             alldefconfig
powerpc                 mpc836x_rdk_defconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
i386                                defconfig
mips                             allyesconfig
arm                         at91_dt_defconfig
powerpc                 mpc8272_ads_defconfig
sh                   sh7770_generic_defconfig
arm                          collie_defconfig
arm                           sama5_defconfig
xtensa                           alldefconfig
sh                          sdk7780_defconfig
powerpc                      arches_defconfig
csky                             alldefconfig
powerpc                           allnoconfig
powerpc                     mpc5200_defconfig
arm                       omap2plus_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
arm                        neponset_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
arm                           tegra_defconfig
powerpc                     stx_gp3_defconfig
m68k                        stmark2_defconfig
arm                        spear3xx_defconfig
mips                           gcw0_defconfig
arm                          moxart_defconfig
m68k                       m5475evb_defconfig
s390                             allyesconfig
m68k                             alldefconfig
arm                          gemini_defconfig
mips                           mtx1_defconfig
arc                           tb10x_defconfig
mips                            gpr_defconfig
arm                            zeus_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
mips                     cu1000-neo_defconfig
sh                   secureedge5410_defconfig
arm                         nhk8815_defconfig
sh                          landisk_defconfig
sh                          kfr2r09_defconfig
arm                      footbridge_defconfig
arm                          iop32x_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
sh                           se7343_defconfig
sh                        sh7785lcr_defconfig
sh                          rsk7201_defconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
sh                 kfr2r09-romimage_defconfig
arm                             mxs_defconfig
mips                          malta_defconfig
h8300                     edosk2674_defconfig
arm                       versatile_defconfig
mips                      pistachio_defconfig
parisc                           allyesconfig
arm                         axm55xx_defconfig
mips                      fuloong2e_defconfig
sh                        sh7757lcr_defconfig
sh                               j2_defconfig
sh                            titan_defconfig
arm                           omap1_defconfig
arm                        shmobile_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                                 defconfig
powerpc                    socrates_defconfig
mips                            ar7_defconfig
sh                          sdk7786_defconfig
arm                           sunxi_defconfig
powerpc                   motionpro_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                              ul2_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
mips                        nlm_xlr_defconfig
powerpc                     sbc8548_defconfig
powerpc                        warp_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
arm                      tct_hammer_defconfig
mips                           ip28_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
mips                        bcm47xx_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      walnut_defconfig
m68k                       m5275evb_defconfig
arm                        mini2440_defconfig
xtensa                  audio_kc705_defconfig
sh                               alldefconfig
m68k                       m5249evb_defconfig
sh                        sh7763rdp_defconfig
h8300                               defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
mips                           ip32_defconfig
powerpc                         ps3_defconfig
x86_64                           alldefconfig
arm                            xcep_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
arm                  colibri_pxa270_defconfig
mips                           ip22_defconfig
arm                     davinci_all_defconfig
sh                      rts7751r2d1_defconfig
powerpc                      mgcoge_defconfig
powerpc                         wii_defconfig
powerpc                    mvme5100_defconfig
mips                    maltaup_xpa_defconfig
arm                        trizeps4_defconfig
mips                         rt305x_defconfig
ia64                            zx1_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
powerpc                        fsp2_defconfig
um                               allyesconfig
powerpc                      pasemi_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
arc                        nsim_700_defconfig
nios2                         3c120_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa3xx_defconfig
arc                    vdk_hs38_smp_defconfig
sh                         ap325rxa_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      bamboo_defconfig
arm                         shannon_defconfig
openrisc                            defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210407
i386                 randconfig-a003-20210407
i386                 randconfig-a001-20210407
i386                 randconfig-a004-20210407
i386                 randconfig-a002-20210407
i386                 randconfig-a005-20210407
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
x86_64               randconfig-a014-20210407
x86_64               randconfig-a015-20210407
x86_64               randconfig-a013-20210407
x86_64               randconfig-a011-20210407
x86_64               randconfig-a012-20210407
x86_64               randconfig-a016-20210407
i386                 randconfig-a014-20210407
i386                 randconfig-a011-20210407
i386                 randconfig-a016-20210407
i386                 randconfig-a012-20210407
i386                 randconfig-a015-20210407
i386                 randconfig-a013-20210407
i386                 randconfig-a014-20210408
i386                 randconfig-a016-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a015-20210408
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210407
x86_64               randconfig-a003-20210407
x86_64               randconfig-a005-20210407
x86_64               randconfig-a001-20210407
x86_64               randconfig-a002-20210407
x86_64               randconfig-a006-20210407
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
