Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844873B2027
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhFWSWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:22:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:21536 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhFWSWJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:22:09 -0400
IronPort-SDR: Dtw8XDA/vOnbDFtUelzbJBbO9FF91B5FahYuEB+qHUxjAr6LKZizWUMmFHt1N1+QwFPKSJuuCm
 0QTk8g54KNrA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="228898914"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="228898914"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 11:19:51 -0700
IronPort-SDR: jx6foRQLI4s+965949SQbuAZwkVZ/2u4/izda0SzEIKmHQmJjVOOHJ5HQDiYpHmTC1QQsP3xqV
 9L70WjF7iGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="557061319"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2021 11:19:50 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lw7TY-00064U-D6; Wed, 23 Jun 2021 18:19:48 +0000
Date:   Thu, 24 Jun 2021 02:19:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD REGRESSION
 86734f2e678a40a0d5b1f6f4d82e66c32d22a72b
Message-ID: <60d37b17.XNCLKMwo3Obnq/1M%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 86734f2e678a40a0d5b1f6f4d82e66c32d22a72b  media: ivtv: prevent going past the hw arrays

Error/Warning in current branch:

arceb-elf-ld: ths8200.c:(.text+0x2da): undefined reference to `v4l2_async_unregister_subdev'
arceb-elf-ld: ths8200.c:(.text+0x442): undefined reference to `v4l2_async_register_subdev'
arceb-elf-ld: tw9910.c:(.text+0x154): undefined reference to `v4l2_async_unregister_subdev'
arceb-elf-ld: tw9910.c:(.text+0x898): undefined reference to `v4l2_async_register_subdev'
ths8200.c:(.text+0x2da): undefined reference to `v4l2_async_unregister_subdev'
ths8200.c:(.text+0x442): undefined reference to `v4l2_async_register_subdev'
tw9910.c:(.text+0x154): undefined reference to `v4l2_async_unregister_subdev'
tw9910.c:(.text+0x898): undefined reference to `v4l2_async_register_subdev'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arc-randconfig-p002-20210623
    |-- arceb-elf-ld:ths8200.c:(.text):undefined-reference-to-v4l2_async_register_subdev
    |-- arceb-elf-ld:ths8200.c:(.text):undefined-reference-to-v4l2_async_unregister_subdev
    |-- arceb-elf-ld:tw9910.c:(.text):undefined-reference-to-v4l2_async_register_subdev
    |-- arceb-elf-ld:tw9910.c:(.text):undefined-reference-to-v4l2_async_unregister_subdev
    |-- ths8200.c:(.text):undefined-reference-to-v4l2_async_register_subdev
    |-- ths8200.c:(.text):undefined-reference-to-v4l2_async_unregister_subdev
    |-- tw9910.c:(.text):undefined-reference-to-v4l2_async_register_subdev
    `-- tw9910.c:(.text):undefined-reference-to-v4l2_async_unregister_subdev

elapsed time: 1963m

configs tested: 221
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      mgcoge_defconfig
sh                            titan_defconfig
arm                         s5pv210_defconfig
h8300                            alldefconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                           h3600_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arc                                 defconfig
arm                            lart_defconfig
powerpc                        fsp2_defconfig
sparc64                             defconfig
mips                         mpc30x_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8315_rdb_defconfig
nds32                               defconfig
mips                           mtx1_defconfig
mips                            gpr_defconfig
m68k                        m5272c3_defconfig
microblaze                      mmu_defconfig
nds32                            alldefconfig
powerpc                       maple_defconfig
arm                           corgi_defconfig
arc                    vdk_hs38_smp_defconfig
mips                   sb1250_swarm_defconfig
powerpc                   motionpro_defconfig
arc                        vdk_hs38_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                    gamecube_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         at91_dt_defconfig
mips                         db1xxx_defconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
powerpc                    sam440ep_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          malta_defconfig
xtensa                           alldefconfig
powerpc                      makalu_defconfig
arm                       imx_v4_v5_defconfig
alpha                            alldefconfig
powerpc                      ppc64e_defconfig
microblaze                          defconfig
h8300                     edosk2674_defconfig
sh                           se7724_defconfig
arc                           tb10x_defconfig
mips                         rt305x_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
i386                                defconfig
powerpc                      acadia_defconfig
arc                     nsimosci_hs_defconfig
arm                         cm_x300_defconfig
sh                   secureedge5410_defconfig
mips                  decstation_64_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         hackkit_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
arm                       netwinder_defconfig
sh                          rsk7264_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
sh                           se7780_defconfig
arm                              alldefconfig
sh                          r7785rp_defconfig
mips                      bmips_stb_defconfig
sh                        edosk7705_defconfig
arm                            zeus_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                     ep8248e_defconfig
sh                   rts7751r2dplus_defconfig
mips                           jazz_defconfig
mips                        jmr3927_defconfig
mips                       rbtx49xx_defconfig
sh                         microdev_defconfig
parisc                generic-32bit_defconfig
powerpc                     pq2fads_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
powerpc                      pcm030_defconfig
arm                           sama5_defconfig
arm                       cns3420vb_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                          atari_defconfig
powerpc                     tqm8555_defconfig
sh                           se7722_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
ia64                         bigsur_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         axm55xx_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm8560_defconfig
openrisc                 simple_smp_defconfig
arm                        realview_defconfig
m68k                        mvme16x_defconfig
s390                             allmodconfig
um                            kunit_defconfig
riscv                               defconfig
mips                        omega2p_defconfig
m68k                         amcore_defconfig
xtensa                  nommu_kc705_defconfig
sh                                  defconfig
arm                        mvebu_v5_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                        shmobile_defconfig
h8300                               defconfig
arm                       aspeed_g4_defconfig
parisc                generic-64bit_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
um                               alldefconfig
mips                         bigsur_defconfig
powerpc                      katmai_defconfig
mips                        nlm_xlr_defconfig
powerpc                     ppa8548_defconfig
powerpc                     sequoia_defconfig
m68k                        mvme147_defconfig
mips                      maltasmvp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20210623
x86_64               randconfig-a001-20210623
x86_64               randconfig-a005-20210623
x86_64               randconfig-a003-20210623
x86_64               randconfig-a004-20210623
x86_64               randconfig-a006-20210623
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
x86_64               randconfig-a012-20210622
i386                 randconfig-a011-20210623
i386                 randconfig-a014-20210623
i386                 randconfig-a013-20210623
i386                 randconfig-a015-20210623
i386                 randconfig-a012-20210623
i386                 randconfig-a016-20210623
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210623
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
