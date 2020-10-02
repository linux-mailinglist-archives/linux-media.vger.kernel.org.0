Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB1B281900
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 19:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388161AbgJBRSA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 13:18:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:28727 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBRSA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 13:18:00 -0400
IronPort-SDR: 5uABbU5ClEmjBuHlI3l9o/poNpQx9JZEVFCyVoY3klnNcC4tGw66TnTi5gJ8Dzv1uXpUvOt4aG
 EzfgXOPeUATg==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="247773416"
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; 
   d="scan'208";a="247773416"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 10:17:59 -0700
IronPort-SDR: 1bFyCcX6V31nzhKA0i6IUvo4mWLe6MNZFywGqUNtAB9EKYoZWPdJ8sK5I812SZaoD4HXfyG10m
 pvW63CGI2DMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; 
   d="scan'208";a="458687457"
Received: from lkp-server02.sh.intel.com (HELO 404f47266ee4) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Oct 2020 10:17:58 -0700
Received: from kbuild by 404f47266ee4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kOOgv-00003z-G4; Fri, 02 Oct 2020 17:17:57 +0000
Date:   Sat, 03 Oct 2020 01:17:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 eb5f6b8ee9e4fcdda3807aff02a3df2d7ca51bbf
Message-ID: <5f7760ab.qc33a/fj7/hUOcjF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: eb5f6b8ee9e4fcdda3807aff02a3df2d7ca51bbf  media: atomisp: fixes build breakage for ISP2400 due to a cleanup

elapsed time: 1778m

configs tested: 247
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
sh                             sh03_defconfig
arm64                            alldefconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     rainier_defconfig
m68k                        mvme147_defconfig
powerpc                    socrates_defconfig
mips                         bigsur_defconfig
arm                  colibri_pxa270_defconfig
powerpc64                        alldefconfig
arm                          gemini_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
arm                              alldefconfig
riscv                             allnoconfig
um                           x86_64_defconfig
powerpc                        warp_defconfig
powerpc                         wii_defconfig
mips                        nlm_xlr_defconfig
mips                       lemote2f_defconfig
alpha                               defconfig
mips                         tb0287_defconfig
arm                       cns3420vb_defconfig
arm                        realview_defconfig
csky                                defconfig
arm                         assabet_defconfig
mips                       rbtx49xx_defconfig
m68k                          hp300_defconfig
arc                      axs103_smp_defconfig
csky                             alldefconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7203_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7724_defconfig
xtensa                    smp_lx200_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                    ge_imp3a_defconfig
sh                          polaris_defconfig
m68k                          atari_defconfig
mips                          ath79_defconfig
xtensa                  cadence_csp_defconfig
c6x                        evmc6457_defconfig
powerpc                     asp8347_defconfig
arm                         mv78xx0_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                        bcm63xx_defconfig
nds32                            alldefconfig
nios2                         10m50_defconfig
xtensa                       common_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
mips                     cu1830-neo_defconfig
arm                            mmp2_defconfig
powerpc                    gamecube_defconfig
arm                          simpad_defconfig
mips                  cavium_octeon_defconfig
arm                             mxs_defconfig
mips                             allyesconfig
microblaze                          defconfig
arm                         bcm2835_defconfig
powerpc                          g5_defconfig
arm                         vf610m4_defconfig
sh                           se7343_defconfig
powerpc                           allnoconfig
xtensa                generic_kc705_defconfig
alpha                            alldefconfig
powerpc                    mvme5100_defconfig
sh                            titan_defconfig
riscv                               defconfig
powerpc                     mpc512x_defconfig
mips                           xway_defconfig
ia64                          tiger_defconfig
powerpc                 canyonlands_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
sh                           se7722_defconfig
sh                           se7751_defconfig
mips                      malta_kvm_defconfig
s390                       zfcpdump_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
arm                           spitz_defconfig
h8300                               defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
sparc                       sparc32_defconfig
mips                          ath25_defconfig
sh                          kfr2r09_defconfig
m68k                        m5407c3_defconfig
riscv                    nommu_virt_defconfig
mips                     decstation_defconfig
m68k                             allmodconfig
arm                             rpc_defconfig
powerpc                 mpc836x_rdk_defconfig
parisc                              defconfig
sh                              ul2_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
arm                        multi_v7_defconfig
arm                           efm32_defconfig
arm                   milbeaut_m10v_defconfig
h8300                            alldefconfig
arm                           viper_defconfig
powerpc                     akebono_defconfig
arm                            zeus_defconfig
arm                         socfpga_defconfig
mips                            ar7_defconfig
xtensa                         virt_defconfig
arm                        clps711x_defconfig
mips                          rb532_defconfig
arm                        multi_v5_defconfig
powerpc                     kmeter1_defconfig
powerpc                      chrp32_defconfig
arm                           stm32_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
h8300                     edosk2674_defconfig
sh                                  defconfig
arm                           omap1_defconfig
mips                   sb1250_swarm_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
powerpc                      pcm030_defconfig
powerpc                       eiger_defconfig
arm                         axm55xx_defconfig
m68k                        m5307c3_defconfig
xtensa                  audio_kc705_defconfig
powerpc                          allmodconfig
microblaze                      mmu_defconfig
c6x                        evmc6678_defconfig
nios2                               defconfig
riscv                            alldefconfig
arm                         palmz72_defconfig
powerpc                     ksi8560_defconfig
sh                        sh7785lcr_defconfig
sh                   sh7724_generic_defconfig
sh                             espt_defconfig
arm                          iop32x_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc8313_rdb_defconfig
s390                             alldefconfig
arm                          pxa910_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a004-20201002
x86_64               randconfig-a001-20201002
x86_64               randconfig-a002-20201002
x86_64               randconfig-a005-20201002
x86_64               randconfig-a003-20201002
x86_64               randconfig-a006-20201002
i386                 randconfig-a003-20200930
i386                 randconfig-a002-20200930
i386                 randconfig-a006-20200930
i386                 randconfig-a005-20200930
i386                 randconfig-a004-20200930
i386                 randconfig-a001-20200930
i386                 randconfig-a006-20201002
i386                 randconfig-a005-20201002
i386                 randconfig-a001-20201002
i386                 randconfig-a004-20201002
i386                 randconfig-a003-20201002
i386                 randconfig-a002-20201002
x86_64               randconfig-a015-20200930
x86_64               randconfig-a013-20200930
x86_64               randconfig-a012-20200930
x86_64               randconfig-a016-20200930
x86_64               randconfig-a014-20200930
x86_64               randconfig-a011-20200930
x86_64               randconfig-a012-20201001
x86_64               randconfig-a015-20201001
x86_64               randconfig-a014-20201001
x86_64               randconfig-a013-20201001
x86_64               randconfig-a011-20201001
x86_64               randconfig-a016-20201001
i386                 randconfig-a014-20201002
i386                 randconfig-a013-20201002
i386                 randconfig-a015-20201002
i386                 randconfig-a016-20201002
i386                 randconfig-a011-20201002
i386                 randconfig-a012-20201002
i386                 randconfig-a011-20200930
i386                 randconfig-a015-20200930
i386                 randconfig-a012-20200930
i386                 randconfig-a014-20200930
i386                 randconfig-a016-20200930
i386                 randconfig-a013-20200930
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20200930
x86_64               randconfig-a005-20200930
x86_64               randconfig-a003-20200930
x86_64               randconfig-a004-20200930
x86_64               randconfig-a002-20200930
x86_64               randconfig-a006-20200930
x86_64               randconfig-a004-20201001
x86_64               randconfig-a001-20201001
x86_64               randconfig-a002-20201001
x86_64               randconfig-a003-20201001
x86_64               randconfig-a005-20201001
x86_64               randconfig-a006-20201001
x86_64               randconfig-a012-20201002
x86_64               randconfig-a015-20201002
x86_64               randconfig-a014-20201002
x86_64               randconfig-a013-20201002
x86_64               randconfig-a011-20201002
x86_64               randconfig-a016-20201002

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
