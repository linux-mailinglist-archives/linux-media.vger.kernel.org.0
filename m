Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867C7301DE1
	for <lists+linux-media@lfdr.de>; Sun, 24 Jan 2021 18:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbhAXRZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Jan 2021 12:25:25 -0500
Received: from mga03.intel.com ([134.134.136.65]:55252 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbhAXRZY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Jan 2021 12:25:24 -0500
IronPort-SDR: ZX7X1El21XElt1VTrKP7rbhyJxNCcth9TTRXPAeKtsd2xGcjL0B+kNrAxQTKkdFrvbHJ6zlKpr
 EJtae8JCvf3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="179707782"
X-IronPort-AV: E=Sophos;i="5.79,371,1602572400"; 
   d="scan'208";a="179707782"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 09:24:42 -0800
IronPort-SDR: iCGGpEOFl0SuGaRTW30MRAaHCV/d3IRp/8/cHScZeNph8rxfo81ioInn2TW0eSeX/vpP0tGcFP
 rFwMAqabkKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,371,1602572400"; 
   d="scan'208";a="349890672"
Received: from lkp-server01.sh.intel.com (HELO 27c4e0a4b6d9) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2021 09:24:41 -0800
Received: from kbuild by 27c4e0a4b6d9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l3j7w-0000N8-RS; Sun, 24 Jan 2021 17:24:40 +0000
Date:   Mon, 25 Jan 2021 01:24:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 066a94e28a23e04c0e9cb293f9ead56d409d7e41
Message-ID: <600dad4e.XLEZ12MVDzVpIR2/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 066a94e28a23e04c0e9cb293f9ead56d409d7e41  media: dt-bindings: media: Use graph and video-interfaces schemas

elapsed time: 731m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
arc                     haps_hs_smp_defconfig
mips                     loongson1b_defconfig
openrisc                            defconfig
arm                         s5pv210_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        omega2p_defconfig
powerpc                     tqm8548_defconfig
arm                      jornada720_defconfig
arm                        mvebu_v5_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
sh                              ul2_defconfig
mips                       lemote2f_defconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
m68k                          atari_defconfig
arm                          exynos_defconfig
arm                            lart_defconfig
powerpc                    gamecube_defconfig
sh                            migor_defconfig
powerpc                      ppc44x_defconfig
mips                         tb0219_defconfig
powerpc                      pcm030_defconfig
powerpc                       ebony_defconfig
sh                             espt_defconfig
sparc64                             defconfig
arc                              allyesconfig
sh                         apsh4a3a_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                                  defconfig
sh                           se7712_defconfig
arm                        neponset_defconfig
arm                       aspeed_g4_defconfig
mips                      fuloong2e_defconfig
m68k                       bvme6000_defconfig
microblaze                      mmu_defconfig
powerpc64                        alldefconfig
sh                        edosk7705_defconfig
powerpc                    sam440ep_defconfig
arm                          pxa3xx_defconfig
arm                           h3600_defconfig
arm                        mini2440_defconfig
xtensa                       common_defconfig
mips                            e55_defconfig
mips                         db1xxx_defconfig
arm                             mxs_defconfig
powerpc                  storcenter_defconfig
mips                      pistachio_defconfig
arm                          lpd270_defconfig
sh                      rts7751r2d1_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                   secureedge5410_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlr_defconfig
nios2                            alldefconfig
arm                          pcm027_defconfig
mips                       capcella_defconfig
mips                          ath25_defconfig
sh                   rts7751r2dplus_defconfig
arm                          simpad_defconfig
m68k                        m5407c3_defconfig
mips                           jazz_defconfig
arm                         lpc32xx_defconfig
arm                         shannon_defconfig
powerpc                        fsp2_defconfig
arc                           tb10x_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   lite5200b_defconfig
arm                           stm32_defconfig
arm                        realview_defconfig
powerpc                     sbc8548_defconfig
alpha                               defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        vexpress_defconfig
arm                        oxnas_v6_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210124
i386                 randconfig-a002-20210124
i386                 randconfig-a004-20210124
i386                 randconfig-a006-20210124
i386                 randconfig-a005-20210124
i386                 randconfig-a003-20210124
x86_64               randconfig-a012-20210124
x86_64               randconfig-a016-20210124
x86_64               randconfig-a015-20210124
x86_64               randconfig-a011-20210124
x86_64               randconfig-a013-20210124
x86_64               randconfig-a014-20210124
i386                 randconfig-a013-20210124
i386                 randconfig-a011-20210124
i386                 randconfig-a012-20210124
i386                 randconfig-a015-20210124
i386                 randconfig-a014-20210124
i386                 randconfig-a016-20210124
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210124
x86_64               randconfig-a002-20210124
x86_64               randconfig-a001-20210124
x86_64               randconfig-a005-20210124
x86_64               randconfig-a006-20210124
x86_64               randconfig-a004-20210124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
