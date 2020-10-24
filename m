Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89DC297DAB
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 19:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762489AbgJXRLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 13:11:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:32662 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1762487AbgJXRLx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 13:11:53 -0400
IronPort-SDR: 45KILTPaY9HdlMlyJmU5v+EWmC2Oz4RiXEiBmxZBwtmaaKKxed/n/jnEjPfenaJieB5TZkQwUu
 VQTZSgIzpHCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9784"; a="164291131"
X-IronPort-AV: E=Sophos;i="5.77,413,1596524400"; 
   d="scan'208";a="164291131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 10:11:52 -0700
IronPort-SDR: owv80j2C1O7CId5zYifpY+z7hbfRUiokYrJST+hFalOMgaLDTHJqOvayhemit4vw4OfoCMAHAr
 3zv/WifZKlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,413,1596524400"; 
   d="scan'208";a="359913648"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2020 10:11:50 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kWN54-0000aF-Bw; Sat, 24 Oct 2020 17:11:50 +0000
Date:   Sun, 25 Oct 2020 01:11:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS WITH WARNING
 cafcadac71cb4fd022318e3824a3bb60d99ba915
Message-ID: <5f946026.ePUHV5w0y8XIHf94%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: cafcadac71cb4fd022318e3824a3bb60d99ba915  docs: fs: api-summary.rst: get rid of kernel-doc include

Warning reports:

https://lore.kernel.org/linux-media/202010241843.uzmR4DZ6-lkp@intel.com

Warning in current branch:

WARNING: modpost: vmlinux.o(.text+0x29d3bdc): Section mismatch in reference from the function p9_release_pages() to the variable .init.text:.L0

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- riscv-randconfig-r034-20201023
    `-- Section-mismatch-in-reference-from-the-function-p9_release_pages()-to-the-variable-.init.text:.L0

elapsed time: 2077m

configs tested: 241
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                         lpc18xx_defconfig
arc                        vdk_hs38_defconfig
mips                      bmips_stb_defconfig
powerpc                      katmai_defconfig
mips                             allmodconfig
mips                         cobalt_defconfig
h8300                       h8s-sim_defconfig
arm                             pxa_defconfig
arm                           h3600_defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc                       sparc32_defconfig
arm                        spear6xx_defconfig
riscv                            alldefconfig
arm                            xcep_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
powerpc                     ksi8560_defconfig
mips                      malta_kvm_defconfig
arm                             mxs_defconfig
arc                        nsim_700_defconfig
mips                          ath79_defconfig
powerpc                      ppc44x_defconfig
m68k                                defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                     am200epdkit_defconfig
microblaze                          defconfig
s390                             allyesconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
arm                          pxa910_defconfig
mips                           gcw0_defconfig
powerpc                     redwood_defconfig
sh                             espt_defconfig
powerpc                       ppc64_defconfig
um                            kunit_defconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
arm                       netwinder_defconfig
arm                        oxnas_v6_defconfig
xtensa                  cadence_csp_defconfig
s390                       zfcpdump_defconfig
mips                malta_kvm_guest_defconfig
arm                         hackkit_defconfig
m68k                       m5249evb_defconfig
sh                           se7619_defconfig
sh                            hp6xx_defconfig
sparc64                             defconfig
sh                           se7343_defconfig
h8300                               defconfig
sh                           se7780_defconfig
xtensa                           allyesconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
arm                      jornada720_defconfig
sh                          lboxre2_defconfig
nios2                         3c120_defconfig
arm                           tegra_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
powerpc                          allyesconfig
mips                malta_qemu_32r6_defconfig
m68k                          multi_defconfig
s390                          debug_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            lart_defconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
m68k                            q40_defconfig
openrisc                    or1ksim_defconfig
sh                           se7705_defconfig
sh                          polaris_defconfig
arm                           stm32_defconfig
powerpc                         wii_defconfig
powerpc                    sam440ep_defconfig
xtensa                         virt_defconfig
arm                      tct_hammer_defconfig
m68k                          atari_defconfig
powerpc                      bamboo_defconfig
powerpc                     mpc5200_defconfig
arm                              zx_defconfig
mips                        bcm47xx_defconfig
xtensa                           alldefconfig
xtensa                  nommu_kc705_defconfig
powerpc                     akebono_defconfig
arm                            dove_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  iss476-smp_defconfig
m68k                          hp300_defconfig
mips                        qi_lb60_defconfig
arm                            hisi_defconfig
xtensa                              defconfig
powerpc                        warp_defconfig
arm                        neponset_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       imx_v4_v5_defconfig
mips                           rs90_defconfig
sh                        edosk7705_defconfig
riscv                               defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7724_defconfig
arm                      pxa255-idp_defconfig
powerpc                      ppc40x_defconfig
arm                           viper_defconfig
powerpc                      ppc6xx_defconfig
arm                       versatile_defconfig
m68k                        stmark2_defconfig
powerpc                        icon_defconfig
nios2                               defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        shmobile_defconfig
sh                     sh7710voipgw_defconfig
ia64                        generic_defconfig
sparc                       sparc64_defconfig
sh                   sh7770_generic_defconfig
arm                          imote2_defconfig
arm                   milbeaut_m10v_defconfig
arm                         palmz72_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201023
x86_64               randconfig-a002-20201023
x86_64               randconfig-a003-20201023
x86_64               randconfig-a006-20201023
x86_64               randconfig-a004-20201023
x86_64               randconfig-a005-20201023
i386                 randconfig-a002-20201023
i386                 randconfig-a005-20201023
i386                 randconfig-a003-20201023
i386                 randconfig-a001-20201023
i386                 randconfig-a006-20201023
i386                 randconfig-a004-20201023
i386                 randconfig-a002-20201024
i386                 randconfig-a003-20201024
i386                 randconfig-a005-20201024
i386                 randconfig-a001-20201024
i386                 randconfig-a006-20201024
i386                 randconfig-a004-20201024
i386                 randconfig-a002-20201022
i386                 randconfig-a005-20201022
i386                 randconfig-a003-20201022
i386                 randconfig-a001-20201022
i386                 randconfig-a006-20201022
i386                 randconfig-a004-20201022
x86_64               randconfig-a011-20201024
x86_64               randconfig-a013-20201024
x86_64               randconfig-a016-20201024
x86_64               randconfig-a015-20201024
x86_64               randconfig-a012-20201024
x86_64               randconfig-a014-20201024
x86_64               randconfig-a011-20201022
x86_64               randconfig-a013-20201022
x86_64               randconfig-a016-20201022
x86_64               randconfig-a015-20201022
x86_64               randconfig-a012-20201022
x86_64               randconfig-a014-20201022
i386                 randconfig-a016-20201022
i386                 randconfig-a014-20201022
i386                 randconfig-a015-20201022
i386                 randconfig-a012-20201022
i386                 randconfig-a013-20201022
i386                 randconfig-a011-20201022
i386                 randconfig-a016-20201024
i386                 randconfig-a015-20201024
i386                 randconfig-a014-20201024
i386                 randconfig-a013-20201024
i386                 randconfig-a012-20201024
i386                 randconfig-a011-20201024
i386                 randconfig-a014-20201023
i386                 randconfig-a015-20201023
i386                 randconfig-a012-20201023
i386                 randconfig-a013-20201023
i386                 randconfig-a011-20201023
i386                 randconfig-a016-20201023
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201024
x86_64               randconfig-a003-20201024
x86_64               randconfig-a002-20201024
x86_64               randconfig-a006-20201024
x86_64               randconfig-a005-20201024
x86_64               randconfig-a004-20201024
x86_64               randconfig-a001-20201022
x86_64               randconfig-a002-20201022
x86_64               randconfig-a003-20201022
x86_64               randconfig-a006-20201022
x86_64               randconfig-a004-20201022
x86_64               randconfig-a005-20201022
x86_64               randconfig-a011-20201023
x86_64               randconfig-a013-20201023
x86_64               randconfig-a016-20201023
x86_64               randconfig-a015-20201023
x86_64               randconfig-a012-20201023
x86_64               randconfig-a014-20201023

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
