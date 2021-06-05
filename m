Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7835339C5D5
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 06:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFEE1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 00:27:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:42066 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhFEE1X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 00:27:23 -0400
IronPort-SDR: oeY/u5uKKbIFgATQ2scbSLMSQZigimQ7sqSGaLA5NbON/rp4IkSWL2zigSSci/ttB/8W2GDzcL
 wevOFLDmDgtg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="201389432"
X-IronPort-AV: E=Sophos;i="5.83,250,1616482800"; 
   d="scan'208";a="201389432"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 21:25:36 -0700
IronPort-SDR: EyGup0t3tvuFS1Y+BmXJec2gzZ6uDxnPvEoUiFiP/na6TnyOgkifgPCt9DbQLlWxEMxvxlkwCO
 GXsgdg1SEMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,250,1616482800"; 
   d="scan'208";a="468524231"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2021 21:25:34 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lpNsM-0007Fp-BM; Sat, 05 Jun 2021 04:25:34 +0000
Date:   Sat, 05 Jun 2021 12:25:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 5b448065febe1c6bb6693735844f2fb2b7b654dc
Message-ID: <60bafca3.qBofpZuDIGCU9fys%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 5b448065febe1c6bb6693735844f2fb2b7b654dc  media: pci: tw5864: avoid usage of some characters

elapsed time: 1249m

configs tested: 270
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                         3c120_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
powerpc                       holly_defconfig
sh                   rts7751r2dplus_defconfig
mips                     cu1830-neo_defconfig
arm                        clps711x_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
arm                          collie_defconfig
xtensa                generic_kc705_defconfig
powerpc                      mgcoge_defconfig
mips                          rm200_defconfig
powerpc                        fsp2_defconfig
arm                           stm32_defconfig
mips                         rt305x_defconfig
mips                           mtx1_defconfig
arm                          ep93xx_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     kilauea_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  colibri_pxa270_defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                         apsh4a3a_defconfig
arm                         mv78xx0_defconfig
sh                         ecovec24_defconfig
powerpc                    adder875_defconfig
powerpc                       ebony_defconfig
sh                        apsh4ad0a_defconfig
arm                        keystone_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
powerpc                         ps3_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
mips                        maltaup_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                           gcw0_defconfig
powerpc                      obs600_defconfig
arm                           sama5_defconfig
mips                    maltaup_xpa_defconfig
powerpc                       eiger_defconfig
m68k                            q40_defconfig
powerpc                          g5_defconfig
powerpc                     tqm8540_defconfig
powerpc                      chrp32_defconfig
arm                           corgi_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
arm                             mxs_defconfig
m68k                       m5275evb_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
mips                     loongson2k_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
m68k                        mvme16x_defconfig
mips                      maltaaprp_defconfig
powerpc                    sam440ep_defconfig
sh                            titan_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc64                           defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
mips                  decstation_64_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
powerpc                      makalu_defconfig
mips                   sb1250_swarm_defconfig
arm                            mmp2_defconfig
sparc                            alldefconfig
mips                           rs90_defconfig
i386                                defconfig
sh                        edosk7705_defconfig
powerpc                      pcm030_defconfig
powerpc                   lite5200b_defconfig
arm                           u8500_defconfig
um                                  defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
sparc64                             defconfig
arm                       versatile_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
powerpc                           allnoconfig
powerpc                     tqm8541_defconfig
m68k                       m5208evb_defconfig
arc                        nsim_700_defconfig
mips                            gpr_defconfig
mips                           ci20_defconfig
nds32                            alldefconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
arm                         hackkit_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
arm                         cm_x300_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
microblaze                          defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          urquell_defconfig
sh                           se7724_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                      ppc40x_defconfig
powerpc                 canyonlands_defconfig
arm                          pxa168_defconfig
arm                         at91_dt_defconfig
mips                           jazz_defconfig
sh                           se7619_defconfig
sh                           se7712_defconfig
powerpc                     rainier_defconfig
arm                         orion5x_defconfig
xtensa                    xip_kc705_defconfig
nios2                         10m50_defconfig
mips                         db1xxx_defconfig
openrisc                 simple_smp_defconfig
arm                              alldefconfig
arm                         nhk8815_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        dreamcast_defconfig
arm                      integrator_defconfig
arm                            mps2_defconfig
arm                          simpad_defconfig
mips                      pic32mzda_defconfig
sh                            hp6xx_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7201_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
nios2                               defconfig
sh                               allmodconfig
arm                  colibri_pxa300_defconfig
arm                          gemini_defconfig
powerpc                      pasemi_defconfig
arc                      axs103_smp_defconfig
arm                        mvebu_v7_defconfig
mips                           ip28_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
xtensa                         virt_defconfig
sh                          sdk7780_defconfig
arm                            lart_defconfig
arm                          pxa910_defconfig
arc                        nsimosci_defconfig
arm                         lubbock_defconfig
powerpc                     mpc83xx_defconfig
powerpc                     kmeter1_defconfig
mips                         cobalt_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        jmr3927_defconfig
sh                   sh7770_generic_defconfig
mips                         mpc30x_defconfig
powerpc                   motionpro_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig
alpha                            alldefconfig
xtensa                          iss_defconfig
mips                       lemote2f_defconfig
riscv                    nommu_k210_defconfig
arm                           omap1_defconfig
sparc                       sparc32_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210604
x86_64               randconfig-a004-20210604
x86_64               randconfig-a003-20210604
x86_64               randconfig-a006-20210604
x86_64               randconfig-a005-20210604
x86_64               randconfig-a001-20210604
i386                 randconfig-a003-20210604
i386                 randconfig-a006-20210604
i386                 randconfig-a004-20210604
i386                 randconfig-a001-20210604
i386                 randconfig-a005-20210604
i386                 randconfig-a002-20210604
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a005-20210603
i386                 randconfig-a002-20210603
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
i386                 randconfig-a015-20210604
i386                 randconfig-a013-20210604
i386                 randconfig-a016-20210604
i386                 randconfig-a011-20210604
i386                 randconfig-a014-20210604
i386                 randconfig-a012-20210604
i386                 randconfig-a015-20210603
i386                 randconfig-a013-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a016-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210604
x86_64               randconfig-a015-20210604
x86_64               randconfig-a011-20210604
x86_64               randconfig-a014-20210604
x86_64               randconfig-a012-20210604
x86_64               randconfig-a016-20210604
x86_64               randconfig-a013-20210604

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
