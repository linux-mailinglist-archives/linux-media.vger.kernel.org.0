Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A74A2A0D42
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 19:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgJ3SUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 14:20:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:17795 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgJ3SUP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 14:20:15 -0400
IronPort-SDR: U2bsB5YYh9Ky2HWlr6uo7pEIQVPctxeuvrczgzvG/9wGNRG5MuEDAF7joPvhMsnBupfjq5t1oF
 Sw0nxBEnw3MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="253353967"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="253353967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 11:20:15 -0700
IronPort-SDR: XBuf8/L7dujK6YVDOnTx/s+296v8mVg+pMVBwz/7WVZmOsuf5uzqhgeV/BTpqGo/Lb1YJIeLOl
 rOZStHTMPItw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="319400341"
Received: from lkp-server02.sh.intel.com (HELO fcc9f8859912) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Oct 2020 11:20:13 -0700
Received: from kbuild by fcc9f8859912 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYZ0W-0000GL-OD; Fri, 30 Oct 2020 18:20:12 +0000
Date:   Sat, 31 Oct 2020 02:20:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 dfe3d19bd092cefb184c6e65b881602c793edd33
Message-ID: <5f9c5958.xEKR8TTkTjHWAMNj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: dfe3d19bd092cefb184c6e65b881602c793edd33  Merge tag 'v5.10-rc1' into patchwork

elapsed time: 1940m

configs tested: 266
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
arm                        mvebu_v5_defconfig
xtensa                    smp_lx200_defconfig
arm                     davinci_all_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                        sh7785lcr_defconfig
h8300                     edosk2674_defconfig
powerpc                    klondike_defconfig
sh                             espt_defconfig
m68k                         amcore_defconfig
arm                         s3c2410_defconfig
sh                          rsk7203_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
powerpc                     pseries_defconfig
arc                        nsim_700_defconfig
microblaze                          defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                        mvme16x_defconfig
mips                      maltasmvp_defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
m68k                          amiga_defconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
xtensa                           alldefconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
arm                            pleb_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  nommu_kc705_defconfig
openrisc                         alldefconfig
powerpc                     powernv_defconfig
arm                             rpc_defconfig
m68k                       bvme6000_defconfig
csky                                defconfig
arm                          pxa910_defconfig
h8300                       h8s-sim_defconfig
powerpc                    socrates_defconfig
mips                      pistachio_defconfig
sh                           se7619_defconfig
mips                         cobalt_defconfig
openrisc                            defconfig
arm                            hisi_defconfig
h8300                               defconfig
powerpc                     stx_gp3_defconfig
arm                              alldefconfig
arm                         hackkit_defconfig
arm                         bcm2835_defconfig
m68k                        m5307c3_defconfig
arm                        mvebu_v7_defconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
sh                           se7712_defconfig
sparc                       sparc64_defconfig
arm                           efm32_defconfig
mips                malta_kvm_guest_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      pcm030_defconfig
m68k                       m5249evb_defconfig
powerpc                     sbc8548_defconfig
mips                  decstation_64_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     sequoia_defconfig
powerpc                     tqm8555_defconfig
arm                     am200epdkit_defconfig
arm                          badge4_defconfig
arm                          pxa3xx_defconfig
mips                        qi_lb60_defconfig
arm                       versatile_defconfig
mips                           ip32_defconfig
sh                           sh2007_defconfig
arm                         cm_x300_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
mips                        bcm63xx_defconfig
xtensa                  audio_kc705_defconfig
mips                           jazz_defconfig
mips                malta_qemu_32r6_defconfig
alpha                               defconfig
mips                         tb0226_defconfig
mips                           ip28_defconfig
sh                ecovec24-romimage_defconfig
sparc64                          alldefconfig
sh                              ul2_defconfig
um                            kunit_defconfig
openrisc                    or1ksim_defconfig
powerpc                 mpc8540_ads_defconfig
mips                           mtx1_defconfig
mips                          rm200_defconfig
arm                        multi_v5_defconfig
powerpc                     mpc5200_defconfig
powerpc                       maple_defconfig
powerpc                      arches_defconfig
mips                          rb532_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                        dreamcast_defconfig
sh                        edosk7705_defconfig
arm                             pxa_defconfig
powerpc                      chrp32_defconfig
mips                           ip27_defconfig
sh                           se7751_defconfig
c6x                        evmc6472_defconfig
m68k                        m5407c3_defconfig
arm                        keystone_defconfig
powerpc                     tqm8540_defconfig
arm                          pxa168_defconfig
um                           x86_64_defconfig
arc                            hsdk_defconfig
mips                        bcm47xx_defconfig
m68k                           sun3_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
mips                      maltaaprp_defconfig
arm                      tct_hammer_defconfig
c6x                                 defconfig
mips                       bmips_be_defconfig
ia64                      gensparse_defconfig
m68k                       m5475evb_defconfig
powerpc                    gamecube_defconfig
powerpc                  mpc885_ads_defconfig
sh                          rsk7264_defconfig
sh                             sh03_defconfig
arm                          prima2_defconfig
mips                       capcella_defconfig
c6x                              alldefconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
s390                             allyesconfig
sh                         ecovec24_defconfig
sh                          sdk7780_defconfig
arm                              zx_defconfig
ia64                          tiger_defconfig
mips                       rbtx49xx_defconfig
powerpc                        warp_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
powerpc                     redwood_defconfig
arm                         s3c6400_defconfig
powerpc                     ksi8560_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           spitz_defconfig
arm                            u300_defconfig
powerpc                     ppa8548_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
arm                      integrator_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      walnut_defconfig
arm                        mini2440_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                            q40_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
h8300                            alldefconfig
c6x                        evmc6457_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
arm                        clps711x_defconfig
riscv                            allyesconfig
powerpc                      cm5200_defconfig
mips                           rs90_defconfig
arm                        neponset_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201029
x86_64               randconfig-a002-20201029
x86_64               randconfig-a003-20201029
x86_64               randconfig-a006-20201029
x86_64               randconfig-a005-20201029
x86_64               randconfig-a004-20201029
x86_64               randconfig-a005-20201030
x86_64               randconfig-a001-20201030
x86_64               randconfig-a002-20201030
x86_64               randconfig-a003-20201030
x86_64               randconfig-a006-20201030
x86_64               randconfig-a004-20201030
i386                 randconfig-a002-20201029
i386                 randconfig-a005-20201029
i386                 randconfig-a003-20201029
i386                 randconfig-a001-20201029
i386                 randconfig-a004-20201029
i386                 randconfig-a006-20201029
i386                 randconfig-a005-20201030
i386                 randconfig-a003-20201030
i386                 randconfig-a002-20201030
i386                 randconfig-a001-20201030
i386                 randconfig-a006-20201030
i386                 randconfig-a004-20201030
i386                 randconfig-a011-20201030
i386                 randconfig-a014-20201030
i386                 randconfig-a015-20201030
i386                 randconfig-a012-20201030
i386                 randconfig-a013-20201030
i386                 randconfig-a016-20201030
i386                 randconfig-a016-20201029
i386                 randconfig-a014-20201029
i386                 randconfig-a015-20201029
i386                 randconfig-a013-20201029
i386                 randconfig-a012-20201029
i386                 randconfig-a011-20201029
riscv                    nommu_k210_defconfig
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20201029
x86_64               randconfig-a013-20201029
x86_64               randconfig-a016-20201029
x86_64               randconfig-a015-20201029
x86_64               randconfig-a012-20201029
x86_64               randconfig-a014-20201029
x86_64               randconfig-a013-20201030
x86_64               randconfig-a014-20201030
x86_64               randconfig-a015-20201030
x86_64               randconfig-a016-20201030
x86_64               randconfig-a011-20201030
x86_64               randconfig-a012-20201030

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
