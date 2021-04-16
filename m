Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC063628EC
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 21:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243397AbhDPTwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 15:52:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:29732 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236465AbhDPTwW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 15:52:22 -0400
IronPort-SDR: QsuCxH26ROpFHvHeIuswuKkgFRFXTM3SOSmKLONUdE1rD6BJufMEIBBnWJN1IaMwZIqT0yaOIf
 nvxkKT6gMHAA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="182593564"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; 
   d="scan'208";a="182593564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 12:51:56 -0700
IronPort-SDR: KsuC/S6h0DRouovn4OIhvzU6RaMvsa3kuqp0XXnKQuZ/c5Le+UGXsiRYGGC+RD+8p9WJouMVi9
 MqvJ4SqRYHQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; 
   d="scan'208";a="400004670"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Apr 2021 12:51:54 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lXUVO-0000W9-50; Fri, 16 Apr 2021 19:51:54 +0000
Date:   Sat, 17 Apr 2021 03:51:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 0b276e470a4d43e1365d3eb53c608a3d208cabd4
Message-ID: <6079eaa7.KkPVZY+LGrI0J+pO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 0b276e470a4d43e1365d3eb53c608a3d208cabd4  media: coda: fix macroblocks count control usage

elapsed time: 1929m

configs tested: 290
configs skipped: 4

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
xtensa                    xip_kc705_defconfig
sparc64                          alldefconfig
ia64                      gensparse_defconfig
arc                          axs103_defconfig
arm                         lpc18xx_defconfig
i386                                defconfig
arm                      jornada720_defconfig
arm                           corgi_defconfig
parisc                generic-64bit_defconfig
powerpc                     taishan_defconfig
mips                  decstation_64_defconfig
powerpc                       ebony_defconfig
powerpc                     ksi8560_defconfig
i386                             alldefconfig
m68k                        m5307c3_defconfig
arm                         lpc32xx_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
m68k                             alldefconfig
arc                         haps_hs_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      makalu_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
sh                         apsh4a3a_defconfig
s390                             alldefconfig
arm                          pxa168_defconfig
powerpc                      ep88xc_defconfig
mips                      pic32mzda_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
h8300                     edosk2674_defconfig
powerpc                     tqm5200_defconfig
powerpc                    klondike_defconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
arm                       aspeed_g5_defconfig
sh                           se7712_defconfig
mips                        jmr3927_defconfig
arm                        trizeps4_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
sh                          r7785rp_defconfig
powerpc                 canyonlands_defconfig
sh                        dreamcast_defconfig
mips                         tb0287_defconfig
sh                        edosk7760_defconfig
powerpc                    mvme5100_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc8272_ads_defconfig
arm                      tct_hammer_defconfig
mips                           jazz_defconfig
arm                   milbeaut_m10v_defconfig
sh                           se7750_defconfig
arm                            qcom_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8560_ads_defconfig
sh                          landisk_defconfig
openrisc                  or1klitex_defconfig
powerpc                          allyesconfig
arm                      footbridge_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
mips                      pistachio_defconfig
arm                         shannon_defconfig
powerpc                      ppc44x_defconfig
um                                allnoconfig
sh                          polaris_defconfig
ia64                            zx1_defconfig
sh                           se7619_defconfig
arm                       spear13xx_defconfig
powerpc                     ep8248e_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                       multi_v4t_defconfig
arm64                            alldefconfig
powerpc                      acadia_defconfig
xtensa                       common_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8560_defconfig
openrisc                         alldefconfig
arc                            hsdk_defconfig
mips                    maltaup_xpa_defconfig
powerpc                        warp_defconfig
arm                          pxa910_defconfig
arm                          imote2_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8541_defconfig
xtensa                  audio_kc705_defconfig
sh                              ul2_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           xway_defconfig
arc                        nsim_700_defconfig
arm                           h5000_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     tqm8555_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
arc                              allyesconfig
sh                           se7751_defconfig
arm                            pleb_defconfig
arm                        mini2440_defconfig
sparc                       sparc32_defconfig
mips                           ip22_defconfig
sh                          rsk7203_defconfig
arm                        vexpress_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            mps2_defconfig
mips                      bmips_stb_defconfig
sh                           se7705_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
ia64                         bigsur_defconfig
um                               alldefconfig
ia64                        generic_defconfig
mips                           ip32_defconfig
sh                             shx3_defconfig
powerpc                     mpc512x_defconfig
powerpc                      obs600_defconfig
arm                            lart_defconfig
arm                        cerfcube_defconfig
mips                         tb0226_defconfig
arm                        clps711x_defconfig
riscv                            alldefconfig
arm                       cns3420vb_defconfig
mips                       bmips_be_defconfig
nios2                            alldefconfig
powerpc                     powernv_defconfig
arm                             mxs_defconfig
powerpc                     kmeter1_defconfig
mips                           gcw0_defconfig
arm                         vf610m4_defconfig
mips                          ath79_defconfig
sh                           se7721_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      arches_defconfig
arm                      integrator_defconfig
powerpc                        icon_defconfig
arm                         cm_x300_defconfig
arm                           sunxi_defconfig
arm                          moxart_defconfig
powerpc                     redwood_defconfig
arm                        spear6xx_defconfig
um                               allyesconfig
mips                            e55_defconfig
m68k                          multi_defconfig
xtensa                         virt_defconfig
mips                            gpr_defconfig
powerpc64                        alldefconfig
riscv                    nommu_k210_defconfig
arm                          gemini_defconfig
m68k                            q40_defconfig
m68k                         apollo_defconfig
ia64                             alldefconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
powerpc                   bluestone_defconfig
arm                          lpd270_defconfig
mips                        nlm_xlp_defconfig
powerpc                        cell_defconfig
sh                        sh7785lcr_defconfig
arm                           h3600_defconfig
powerpc64                           defconfig
arc                           tb10x_defconfig
h8300                               defconfig
h8300                            alldefconfig
s390                       zfcpdump_defconfig
sh                           se7724_defconfig
sh                   sh7770_generic_defconfig
xtensa                              defconfig
powerpc                      mgcoge_defconfig
sh                         microdev_defconfig
powerpc                     kilauea_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         db1xxx_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                    sam440ep_defconfig
mips                        workpad_defconfig
arm                         s3c6400_defconfig
powerpc                  mpc866_ads_defconfig
sparc                               defconfig
riscv                             allnoconfig
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
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210415
x86_64               randconfig-a002-20210415
x86_64               randconfig-a005-20210415
x86_64               randconfig-a001-20210415
x86_64               randconfig-a006-20210415
x86_64               randconfig-a004-20210415
i386                 randconfig-a003-20210416
i386                 randconfig-a006-20210416
i386                 randconfig-a001-20210416
i386                 randconfig-a005-20210416
i386                 randconfig-a004-20210416
i386                 randconfig-a002-20210416
i386                 randconfig-a003-20210415
i386                 randconfig-a006-20210415
i386                 randconfig-a001-20210415
i386                 randconfig-a005-20210415
i386                 randconfig-a004-20210415
i386                 randconfig-a002-20210415
x86_64               randconfig-a014-20210416
x86_64               randconfig-a015-20210416
x86_64               randconfig-a011-20210416
x86_64               randconfig-a013-20210416
x86_64               randconfig-a012-20210416
x86_64               randconfig-a016-20210416
i386                 randconfig-a015-20210415
i386                 randconfig-a014-20210415
i386                 randconfig-a013-20210415
i386                 randconfig-a012-20210415
i386                 randconfig-a016-20210415
i386                 randconfig-a011-20210415
i386                 randconfig-a015-20210416
i386                 randconfig-a014-20210416
i386                 randconfig-a013-20210416
i386                 randconfig-a012-20210416
i386                 randconfig-a016-20210416
i386                 randconfig-a011-20210416
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210416
x86_64               randconfig-a002-20210416
x86_64               randconfig-a005-20210416
x86_64               randconfig-a001-20210416
x86_64               randconfig-a006-20210416
x86_64               randconfig-a004-20210416
x86_64               randconfig-a014-20210415
x86_64               randconfig-a015-20210415
x86_64               randconfig-a011-20210415
x86_64               randconfig-a013-20210415
x86_64               randconfig-a012-20210415
x86_64               randconfig-a016-20210415

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
