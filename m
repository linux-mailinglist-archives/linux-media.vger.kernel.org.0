Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63833E36A5
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 20:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHGSeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Aug 2021 14:34:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:31474 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhHGSeH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Aug 2021 14:34:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10069"; a="211416978"
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; 
   d="scan'208";a="211416978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2021 11:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,303,1620716400"; 
   d="scan'208";a="672938095"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2021 11:33:48 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mCR8m-000I5d-3G; Sat, 07 Aug 2021 18:33:48 +0000
Date:   Sun, 08 Aug 2021 02:33:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 6daa9f32282ac76b8996f5291fb387d685786288
Message-ID: <610ed1fa.reOYkZTz1SmIYp3D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 6daa9f32282ac76b8996f5291fb387d685786288  media: Clean V4L2_PIX_FMT_NV12MT documentation

elapsed time: 1954m

configs tested: 234
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210804
i386                 randconfig-c001-20210805
i386                 randconfig-c001-20210807
h8300                       h8s-sim_defconfig
arm                       mainstone_defconfig
arm                            pleb_defconfig
powerpc                 mpc832x_mds_defconfig
sh                            titan_defconfig
powerpc                           allnoconfig
arm                       aspeed_g4_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      mgcoge_defconfig
sparc                       sparc64_defconfig
sh                            migor_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                              alldefconfig
mips                malta_qemu_32r6_defconfig
sparc                            alldefconfig
ia64                             allmodconfig
mips                     loongson1b_defconfig
arm                           sama5_defconfig
sh                     sh7710voipgw_defconfig
arc                                 defconfig
arm                          moxart_defconfig
mips                           jazz_defconfig
powerpc                      arches_defconfig
microblaze                          defconfig
sh                           se7721_defconfig
arm                         socfpga_defconfig
parisc                              defconfig
arm                       aspeed_g5_defconfig
arm                            dove_defconfig
xtensa                           alldefconfig
arm                          imote2_defconfig
arm                       imx_v4_v5_defconfig
arm                         axm55xx_defconfig
powerpc                     tqm5200_defconfig
sh                        sh7763rdp_defconfig
h8300                    h8300h-sim_defconfig
nds32                               defconfig
sh                ecovec24-romimage_defconfig
powerpc                   microwatt_defconfig
sh                        dreamcast_defconfig
xtensa                  nommu_kc705_defconfig
parisc                generic-32bit_defconfig
arm                        mvebu_v7_defconfig
sh                           se7343_defconfig
arm                        multi_v7_defconfig
powerpc                    sam440ep_defconfig
powerpc                       ebony_defconfig
sh                   secureedge5410_defconfig
mips                        jmr3927_defconfig
m68k                        m5307c3_defconfig
powerpc                        fsp2_defconfig
arm                      footbridge_defconfig
arm                           spitz_defconfig
powerpc                     stx_gp3_defconfig
sh                          urquell_defconfig
mips                           ip27_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
mips                           ip28_defconfig
sh                           se7722_defconfig
sh                               j2_defconfig
mips                           xway_defconfig
s390                                defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
powerpc                     pq2fads_defconfig
mips                        omega2p_defconfig
arm                          collie_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     taishan_defconfig
powerpc                     mpc83xx_defconfig
sh                        edosk7705_defconfig
arm                         nhk8815_defconfig
arm                          gemini_defconfig
mips                       bmips_be_defconfig
parisc                           allyesconfig
powerpc               mpc834x_itxgp_defconfig
sh                        edosk7760_defconfig
arm                           tegra_defconfig
parisc                           alldefconfig
m68k                         apollo_defconfig
arm                         palmz72_defconfig
mips                            gpr_defconfig
powerpc                 mpc834x_mds_defconfig
csky                                defconfig
arm                     am200epdkit_defconfig
powerpc                          allmodconfig
arm                      jornada720_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig
mips                          rb532_defconfig
arm                       spear13xx_defconfig
sh                          polaris_defconfig
m68k                       m5249evb_defconfig
ia64                        generic_defconfig
arm                          badge4_defconfig
powerpc                          allyesconfig
arm                          pcm027_defconfig
xtensa                  audio_kc705_defconfig
x86_64                            allnoconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
x86_64               randconfig-a002-20210805
x86_64               randconfig-a006-20210805
x86_64               randconfig-a004-20210805
x86_64               randconfig-a003-20210805
x86_64               randconfig-a001-20210805
x86_64               randconfig-a005-20210805
i386                 randconfig-a004-20210808
i386                 randconfig-a005-20210808
i386                 randconfig-a006-20210808
i386                 randconfig-a002-20210808
i386                 randconfig-a001-20210808
i386                 randconfig-a003-20210808
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
i386                 randconfig-a005-20210805
i386                 randconfig-a004-20210805
i386                 randconfig-a002-20210805
i386                 randconfig-a006-20210805
i386                 randconfig-a003-20210805
i386                 randconfig-a001-20210805
i386                 randconfig-a005-20210806
i386                 randconfig-a004-20210806
i386                 randconfig-a002-20210806
i386                 randconfig-a006-20210806
i386                 randconfig-a003-20210806
i386                 randconfig-a001-20210806
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
x86_64               randconfig-a016-20210808
x86_64               randconfig-a012-20210808
x86_64               randconfig-a013-20210808
x86_64               randconfig-a011-20210808
x86_64               randconfig-a014-20210808
x86_64               randconfig-a015-20210808
i386                 randconfig-a012-20210806
i386                 randconfig-a011-20210806
i386                 randconfig-a015-20210806
i386                 randconfig-a013-20210806
i386                 randconfig-a014-20210806
i386                 randconfig-a016-20210806
i386                 randconfig-a012-20210807
i386                 randconfig-a011-20210807
i386                 randconfig-a015-20210807
i386                 randconfig-a013-20210807
i386                 randconfig-a014-20210807
i386                 randconfig-a016-20210807
i386                 randconfig-a012-20210805
i386                 randconfig-a011-20210805
i386                 randconfig-a015-20210805
i386                 randconfig-a013-20210805
i386                 randconfig-a014-20210805
i386                 randconfig-a016-20210805
i386                 randconfig-a012-20210808
i386                 randconfig-a015-20210808
i386                 randconfig-a011-20210808
i386                 randconfig-a013-20210808
i386                 randconfig-a014-20210808
i386                 randconfig-a016-20210808
i386                 randconfig-a012-20210804
i386                 randconfig-a011-20210804
i386                 randconfig-a015-20210804
i386                 randconfig-a013-20210804
i386                 randconfig-a014-20210804
i386                 randconfig-a016-20210804
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210804
x86_64               randconfig-c001-20210808
x86_64               randconfig-c001-20210805
x86_64               randconfig-c001-20210807
x86_64               randconfig-c001-20210806
x86_64               randconfig-a002-20210804
x86_64               randconfig-a006-20210804
x86_64               randconfig-a004-20210804
x86_64               randconfig-a003-20210804
x86_64               randconfig-a001-20210804
x86_64               randconfig-a005-20210804
x86_64               randconfig-a012-20210805
x86_64               randconfig-a016-20210805
x86_64               randconfig-a011-20210805
x86_64               randconfig-a013-20210805
x86_64               randconfig-a014-20210805
x86_64               randconfig-a015-20210805

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
