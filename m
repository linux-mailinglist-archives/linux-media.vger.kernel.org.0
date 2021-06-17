Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD773ABADE
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 19:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhFQRvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 13:51:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:3418 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232701AbhFQRvR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 13:51:17 -0400
IronPort-SDR: kmAuw/G+YxI2hjlrI8N/FlZfCH17xvScuLgYLMUbClVU7gixlVNYS0dH4DntWUaATLGsUIjuL0
 fnjTUD9gRB+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="193734297"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="193734297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 10:49:08 -0700
IronPort-SDR: 8SFrW0udxcZIgIXqjx8FOwAD1rb8/iyp/h/knic642IhgYAq9tNknpwq1bC9A7qHx6yUeDjXOW
 Akjab6w9W9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="452859410"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2021 10:49:07 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ltw8Y-0002CI-DF; Thu, 17 Jun 2021 17:49:06 +0000
Date:   Fri, 18 Jun 2021 01:48:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 6ef43d273e8562366035d8086008e4000a270fd8
Message-ID: <60cb8b06.tKPf85UlHW6lPAGQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 6ef43d273e8562366035d8086008e4000a270fd8  media: admin-guide: avoid using ReST :doc:`foo` markup

elapsed time: 2079m

configs tested: 337
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1000-neo_defconfig
ia64                        generic_defconfig
arm                       versatile_defconfig
arm                         lpc32xx_defconfig
powerpc                      chrp32_defconfig
i386                             alldefconfig
arm                        mvebu_v5_defconfig
arm                         lubbock_defconfig
powerpc                     skiroot_defconfig
powerpc                       maple_defconfig
mips                           ip28_defconfig
m68k                          amiga_defconfig
arc                              alldefconfig
sh                   rts7751r2dplus_defconfig
arm                          collie_defconfig
powerpc                    sam440ep_defconfig
arm                           omap1_defconfig
arm                          ep93xx_defconfig
arm                        magician_defconfig
powerpc                     kmeter1_defconfig
m68k                                defconfig
m68k                       m5475evb_defconfig
arm                  colibri_pxa270_defconfig
mips                          ath79_defconfig
arm                            mps2_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                   bluestone_defconfig
sh                          r7785rp_defconfig
sh                        sh7785lcr_defconfig
arm                        clps711x_defconfig
sparc                       sparc64_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
m68k                          multi_defconfig
powerpc                   motionpro_defconfig
powerpc                      pcm030_defconfig
nios2                         10m50_defconfig
mips                            e55_defconfig
arm                          pxa910_defconfig
xtensa                    smp_lx200_defconfig
powerpc                  iss476-smp_defconfig
nds32                            alldefconfig
arm                         at91_dt_defconfig
arm                          pcm027_defconfig
powerpc                      ppc6xx_defconfig
arm                        keystone_defconfig
mips                      loongson3_defconfig
arm                         shannon_defconfig
sh                          sdk7786_defconfig
sh                     magicpanelr2_defconfig
arm                        multi_v5_defconfig
arm                         orion5x_defconfig
riscv                            allmodconfig
powerpc                 mpc8315_rdb_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
mips                      bmips_stb_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
xtensa                         virt_defconfig
arm                            lart_defconfig
sh                           se7619_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7206_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          rsk7201_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        omega2p_defconfig
powerpc                   currituck_defconfig
um                               alldefconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        oxnas_v6_defconfig
arm                        multi_v7_defconfig
mips                         tb0219_defconfig
mips                      pistachio_defconfig
arc                          axs103_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
powerpc                     tqm5200_defconfig
sh                           se7712_defconfig
powerpc                     stx_gp3_defconfig
arc                        nsimosci_defconfig
powerpc64                           defconfig
parisc                generic-64bit_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
x86_64                           alldefconfig
arm                     am200epdkit_defconfig
powerpc                        cell_defconfig
mips                           ci20_defconfig
m68k                            q40_defconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
riscv                    nommu_virt_defconfig
arm                          lpd270_defconfig
powerpc                     pq2fads_defconfig
powerpc                     taishan_defconfig
mips                    maltaup_xpa_defconfig
m68k                            mac_defconfig
i386                             allyesconfig
parisc                generic-32bit_defconfig
arm                   milbeaut_m10v_defconfig
h8300                    h8300h-sim_defconfig
arm                            dove_defconfig
m68k                        mvme16x_defconfig
powerpc                      cm5200_defconfig
arm                       netwinder_defconfig
arm                         assabet_defconfig
mips                       rbtx49xx_defconfig
powerpc                    mvme5100_defconfig
arm                      pxa255-idp_defconfig
mips                        bcm47xx_defconfig
i386                                defconfig
sparc                       sparc32_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
sh                          urquell_defconfig
arm                       imx_v6_v7_defconfig
mips                  decstation_64_defconfig
nds32                               defconfig
powerpc                   lite5200b_defconfig
arm                        neponset_defconfig
arm                             pxa_defconfig
mips                     cu1830-neo_defconfig
sparc64                          alldefconfig
arm                          simpad_defconfig
m68k                             alldefconfig
powerpc                  storcenter_defconfig
powerpc                        warp_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         vf610m4_defconfig
arm                           corgi_defconfig
sh                             sh03_defconfig
xtensa                              defconfig
mips                             allmodconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       eiger_defconfig
powerpc                     kilauea_defconfig
um                                  defconfig
arc                     nsimosci_hs_defconfig
powerpc                     ppa8548_defconfig
h8300                       h8s-sim_defconfig
arm                           u8500_defconfig
powerpc                       holly_defconfig
xtensa                          iss_defconfig
mips                         cobalt_defconfig
mips                           ip22_defconfig
powerpc                          g5_defconfig
sh                             shx3_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
powerpc                      ep88xc_defconfig
um                           x86_64_defconfig
arm64                            alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                         amcore_defconfig
microblaze                      mmu_defconfig
powerpc                    socrates_defconfig
arc                        nsim_700_defconfig
sh                            migor_defconfig
sh                            hp6xx_defconfig
arm                         axm55xx_defconfig
arm                     eseries_pxa_defconfig
x86_64                            allnoconfig
arm                       omap2plus_defconfig
h8300                     edosk2674_defconfig
sh                         ecovec24_defconfig
arm                          imote2_defconfig
powerpc                     mpc5200_defconfig
riscv                    nommu_k210_defconfig
mips                      pic32mzda_defconfig
arm                       mainstone_defconfig
sh                        apsh4ad0a_defconfig
powerpc                      acadia_defconfig
m68k                       m5275evb_defconfig
arm                         palmz72_defconfig
powerpc                     pseries_defconfig
arm                          ixp4xx_defconfig
powerpc                      tqm8xx_defconfig
m68k                        m5307c3_defconfig
sparc                            alldefconfig
arm                          exynos_defconfig
powerpc                     asp8347_defconfig
arm                          gemini_defconfig
sparc64                             defconfig
m68k                        stmark2_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
mips                        workpad_defconfig
mips                        jmr3927_defconfig
arm                           spitz_defconfig
mips                   sb1250_swarm_defconfig
arm                            qcom_defconfig
arm                            zeus_defconfig
m68k                          sun3x_defconfig
sh                           se7343_defconfig
arm                              alldefconfig
arm                         hackkit_defconfig
powerpc                      katmai_defconfig
arm                           viper_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                           tegra_defconfig
s390                          debug_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                          rv32_defconfig
powerpc                     powernv_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        maltaup_defconfig
m68k                           sun3_defconfig
mips                     loongson1b_defconfig
alpha                               defconfig
m68k                        mvme147_defconfig
sh                           se7751_defconfig
mips                       bmips_be_defconfig
s390                       zfcpdump_defconfig
openrisc                  or1klitex_defconfig
sh                           se7724_defconfig
mips                          rm200_defconfig
arm                         nhk8815_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
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
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
x86_64               randconfig-a002-20210615
x86_64               randconfig-a003-20210615
x86_64               randconfig-a006-20210615
x86_64               randconfig-a005-20210615
x86_64               randconfig-a004-20210617
x86_64               randconfig-a001-20210617
x86_64               randconfig-a002-20210617
x86_64               randconfig-a003-20210617
x86_64               randconfig-a006-20210617
x86_64               randconfig-a005-20210617
i386                 randconfig-a002-20210615
i386                 randconfig-a006-20210615
i386                 randconfig-a004-20210615
i386                 randconfig-a001-20210615
i386                 randconfig-a005-20210615
i386                 randconfig-a003-20210615
i386                 randconfig-a002-20210617
i386                 randconfig-a006-20210617
i386                 randconfig-a001-20210617
i386                 randconfig-a004-20210617
i386                 randconfig-a005-20210617
i386                 randconfig-a003-20210617
x86_64               randconfig-a015-20210616
x86_64               randconfig-a011-20210616
x86_64               randconfig-a014-20210616
x86_64               randconfig-a012-20210616
x86_64               randconfig-a013-20210616
x86_64               randconfig-a016-20210616
i386                 randconfig-a015-20210617
i386                 randconfig-a013-20210617
i386                 randconfig-a016-20210617
i386                 randconfig-a012-20210617
i386                 randconfig-a014-20210617
i386                 randconfig-a011-20210617
i386                 randconfig-a015-20210615
i386                 randconfig-a013-20210615
i386                 randconfig-a016-20210615
i386                 randconfig-a012-20210615
i386                 randconfig-a014-20210615
i386                 randconfig-a011-20210615
i386                 randconfig-a015-20210616
i386                 randconfig-a013-20210616
i386                 randconfig-a016-20210616
i386                 randconfig-a012-20210616
i386                 randconfig-a014-20210616
i386                 randconfig-a011-20210616
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210617
x86_64               randconfig-b001-20210615
x86_64               randconfig-b001-20210616
x86_64               randconfig-a004-20210616
x86_64               randconfig-a001-20210616
x86_64               randconfig-a002-20210616
x86_64               randconfig-a003-20210616
x86_64               randconfig-a006-20210616
x86_64               randconfig-a005-20210616
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615
x86_64               randconfig-a015-20210617
x86_64               randconfig-a011-20210617
x86_64               randconfig-a014-20210617
x86_64               randconfig-a012-20210617
x86_64               randconfig-a013-20210617
x86_64               randconfig-a016-20210617

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
