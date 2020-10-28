Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDA229D8A7
	for <lists+linux-media@lfdr.de>; Wed, 28 Oct 2020 23:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387988AbgJ1Wep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 18:34:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:52091 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388042AbgJ1WcP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:32:15 -0400
IronPort-SDR: jUszHSGFI+sp1HFdSX4jA3ZXuD9vlF9D5mt7uToOaKmj4zjrInzIWSoX0Id06r3zJivU27patd
 HqJsJAyXOQtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="155284400"
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; 
   d="scan'208";a="155284400"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 11:27:56 -0700
IronPort-SDR: WjGNI3TXn5Ut/jC1Q0sStfsU15BLjRc7nPSQC/YmDDC2HiJA7E2Hn49ofaloQJtKGKd0OXQSeC
 BIZSqoVbhedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; 
   d="scan'208";a="351108706"
Received: from lkp-server02.sh.intel.com (HELO 0471ce7c9af6) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2020 11:27:55 -0700
Received: from kbuild by 0471ce7c9af6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXqAs-00008F-Sj; Wed, 28 Oct 2020 18:27:54 +0000
Date:   Thu, 29 Oct 2020 02:27:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 d0a9fffedca102633c168adaf157f34288a4ea67
Message-ID: <5f99b819.6NCBbfOWRVwoNVV8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: d0a9fffedca102633c168adaf157f34288a4ea67  docs: fs: api-summary.rst: get rid of kernel-doc include

elapsed time: 2120m

configs tested: 284
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
sh                            titan_defconfig
powerpc                     tqm8548_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
arm                     davinci_all_defconfig
powerpc                       maple_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
m68k                        mvme147_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
sh                             sh03_defconfig
powerpc                     sequoia_defconfig
ia64                             alldefconfig
arm                           sunxi_defconfig
powerpc                        icon_defconfig
sh                     magicpanelr2_defconfig
arm                  colibri_pxa300_defconfig
arm                          pxa3xx_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                            mps2_defconfig
sh                               alldefconfig
mips                     loongson1b_defconfig
sh                        apsh4ad0a_defconfig
mips                         tb0219_defconfig
sh                          landisk_defconfig
arm                             mxs_defconfig
ia64                             allyesconfig
arm                          pxa910_defconfig
powerpc                     tqm8541_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
riscv                    nommu_k210_defconfig
nds32                             allnoconfig
powerpc                     tqm8555_defconfig
mips                        bcm47xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                   motionpro_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
arc                      axs103_smp_defconfig
arm                       cns3420vb_defconfig
arc                              alldefconfig
arm                            dove_defconfig
m68k                                defconfig
c6x                                 defconfig
powerpc                     asp8347_defconfig
c6x                        evmc6474_defconfig
sh                          rsk7269_defconfig
powerpc                      obs600_defconfig
mips                      pic32mzda_defconfig
sh                         ap325rxa_defconfig
arc                         haps_hs_defconfig
mips                           rs90_defconfig
m68k                       m5275evb_defconfig
powerpc                  iss476-smp_defconfig
arm                         lpc18xx_defconfig
sh                ecovec24-romimage_defconfig
arm                        mvebu_v7_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                     haps_hs_smp_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
sh                      rts7751r2d1_defconfig
mips                      malta_kvm_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
arm                     am200epdkit_defconfig
arm                          lpd270_defconfig
xtensa                         virt_defconfig
powerpc                 linkstation_defconfig
parisc                generic-32bit_defconfig
arm                      integrator_defconfig
arm                          simpad_defconfig
sparc                               defconfig
mips                malta_qemu_32r6_defconfig
m68k                            mac_defconfig
arm                     eseries_pxa_defconfig
sh                          r7785rp_defconfig
c6x                         dsk6455_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                       ppc64_defconfig
sh                             espt_defconfig
i386                                defconfig
arm                          iop32x_defconfig
xtensa                              defconfig
arm                        multi_v7_defconfig
h8300                            allyesconfig
mips                     cu1000-neo_defconfig
mips                     loongson1c_defconfig
powerpc                         wii_defconfig
arm                           h5000_defconfig
arc                          axs101_defconfig
sh                               j2_defconfig
mips                            gpr_defconfig
sh                            migor_defconfig
arm                        shmobile_defconfig
x86_64                           alldefconfig
sparc                       sparc32_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
sh                           se7750_defconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
mips                    maltaup_xpa_defconfig
riscv                             allnoconfig
powerpc                      walnut_defconfig
c6x                        evmc6472_defconfig
mips                        nlm_xlp_defconfig
arc                        nsimosci_defconfig
sh                           se7780_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
ia64                        generic_defconfig
m68k                        m5272c3_defconfig
powerpc                     akebono_defconfig
arm                       omap2plus_defconfig
nds32                               defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc834x_mds_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
mips                            ar7_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
mips                malta_kvm_guest_defconfig
powerpc                   bluestone_defconfig
powerpc                   lite5200b_defconfig
arm                         mv78xx0_defconfig
sh                          rsk7264_defconfig
arm                         vf610m4_defconfig
mips                      fuloong2e_defconfig
mips                           mtx1_defconfig
sh                        dreamcast_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                             alldefconfig
sh                           se7712_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                       imx_v6_v7_defconfig
arm                           u8500_defconfig
mips                             allmodconfig
powerpc                           allnoconfig
nds32                            alldefconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
arm                              zx_defconfig
mips                       bmips_be_defconfig
arm                           viper_defconfig
powerpc                      chrp32_defconfig
mips                        maltaup_defconfig
powerpc                      bamboo_defconfig
mips                         mpc30x_defconfig
sh                          lboxre2_defconfig
arm                           stm32_defconfig
powerpc                    gamecube_defconfig
mips                      pistachio_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
i386                 randconfig-a002-20201027
i386                 randconfig-a003-20201027
i386                 randconfig-a005-20201027
i386                 randconfig-a001-20201027
i386                 randconfig-a006-20201027
i386                 randconfig-a004-20201027
i386                 randconfig-a002-20201028
i386                 randconfig-a005-20201028
i386                 randconfig-a003-20201028
i386                 randconfig-a001-20201028
i386                 randconfig-a004-20201028
i386                 randconfig-a006-20201028
x86_64               randconfig-a011-20201028
x86_64               randconfig-a013-20201028
x86_64               randconfig-a016-20201028
x86_64               randconfig-a015-20201028
x86_64               randconfig-a012-20201028
x86_64               randconfig-a014-20201028
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
i386                 randconfig-a016-20201027
i386                 randconfig-a015-20201027
i386                 randconfig-a014-20201027
i386                 randconfig-a012-20201027
i386                 randconfig-a013-20201027
i386                 randconfig-a011-20201027
i386                 randconfig-a016-20201028
i386                 randconfig-a014-20201028
i386                 randconfig-a015-20201028
i386                 randconfig-a013-20201028
i386                 randconfig-a012-20201028
i386                 randconfig-a011-20201028
x86_64               randconfig-a001-20201027
x86_64               randconfig-a003-20201027
x86_64               randconfig-a002-20201027
x86_64               randconfig-a006-20201027
x86_64               randconfig-a004-20201027
x86_64               randconfig-a005-20201027
riscv                            allyesconfig
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
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026
x86_64               randconfig-a001-20201028
x86_64               randconfig-a002-20201028
x86_64               randconfig-a003-20201028
x86_64               randconfig-a006-20201028
x86_64               randconfig-a005-20201028
x86_64               randconfig-a004-20201028
x86_64               randconfig-a011-20201027
x86_64               randconfig-a013-20201027
x86_64               randconfig-a016-20201027
x86_64               randconfig-a015-20201027
x86_64               randconfig-a012-20201027
x86_64               randconfig-a014-20201027

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
