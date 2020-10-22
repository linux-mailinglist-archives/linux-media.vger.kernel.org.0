Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38B7296357
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898669AbgJVRI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:08:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:60103 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506325AbgJVRIZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:08:25 -0400
IronPort-SDR: kr82WLZW9yrobdfJS9DYnsZo65JTlgngs70TR03RgkMQ0NI4mqbSol0w3oIHjZFn+LS7aFpPyA
 MZix1wehmxCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="166779702"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="166779702"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 10:08:25 -0700
IronPort-SDR: yctD8x+Gix3hpEGBEruL7sF1QPehwH7GipklAvyfxQtFfqylzuz+BCAubChrekMtYBdegGpJXW
 MuUeacDASHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="316797083"
Received: from lkp-server01.sh.intel.com (HELO 56e21eaf2661) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2020 10:08:23 -0700
Received: from kbuild by 56e21eaf2661 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kVe4d-00002v-2o; Thu, 22 Oct 2020 17:08:23 +0000
Date:   Fri, 23 Oct 2020 01:08:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 264d4b6e65897fd0697c1ca61ae36cf79ecb95b9
Message-ID: <5f91bc70.yMPd2UbAP6pGXxtP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 264d4b6e65897fd0697c1ca61ae36cf79ecb95b9  docs: fs: api-summary.rst: get rid of kernel-doc include

elapsed time: 1673m

configs tested: 233
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_kvm_guest_defconfig
powerpc                      chrp32_defconfig
mips                         bigsur_defconfig
xtensa                  audio_kc705_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc8315_rdb_defconfig
nds32                            alldefconfig
m68k                          hp300_defconfig
arm                            lart_defconfig
ia64                      gensparse_defconfig
arm                          pxa168_defconfig
powerpc                      ppc64e_defconfig
powerpc                     sbc8548_defconfig
mips                    maltaup_xpa_defconfig
sh                           se7206_defconfig
powerpc                     tqm5200_defconfig
arm                           spitz_defconfig
h8300                    h8300h-sim_defconfig
c6x                        evmc6474_defconfig
powerpc                        icon_defconfig
arc                        vdk_hs38_defconfig
powerpc                       ebony_defconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
sh                               j2_defconfig
powerpc                        warp_defconfig
s390                             alldefconfig
arm                         shannon_defconfig
arm                       aspeed_g4_defconfig
powerpc                       maple_defconfig
arm                        cerfcube_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       cns3420vb_defconfig
arm                        oxnas_v6_defconfig
arc                     nsimosci_hs_defconfig
arm                         bcm2835_defconfig
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      pcm030_defconfig
powerpc                        fsp2_defconfig
riscv                               defconfig
powerpc                     kilauea_defconfig
s390                       zfcpdump_defconfig
powerpc                      mgcoge_defconfig
sh                  sh7785lcr_32bit_defconfig
um                            kunit_defconfig
arm                         nhk8815_defconfig
alpha                            alldefconfig
mips                      fuloong2e_defconfig
mips                      pic32mzda_defconfig
arm                         palmz72_defconfig
powerpc                 mpc834x_mds_defconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
arm                       netwinder_defconfig
xtensa                  cadence_csp_defconfig
powerpc                         ps3_defconfig
powerpc                 linkstation_defconfig
mips                           ci20_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         assabet_defconfig
mips                      pistachio_defconfig
sh                          rsk7264_defconfig
sparc                            allyesconfig
mips                          rm200_defconfig
powerpc                     ep8248e_defconfig
arm                        magician_defconfig
arm                            dove_defconfig
mips                         tb0287_defconfig
sh                          r7785rp_defconfig
powerpc                     stx_gp3_defconfig
mips                      maltasmvp_defconfig
m68k                             alldefconfig
um                           x86_64_defconfig
parisc                              defconfig
arm                      footbridge_defconfig
sh                             shx3_defconfig
powerpc                 mpc834x_itx_defconfig
sparc64                             defconfig
powerpc                     taishan_defconfig
sh                         ecovec24_defconfig
arm                       mainstone_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
m68k                         amcore_defconfig
powerpc                     tqm8555_defconfig
arm                    vt8500_v6_v7_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           ip32_defconfig
arm                        neponset_defconfig
xtensa                         virt_defconfig
arm                     eseries_pxa_defconfig
sh                            titan_defconfig
sh                            migor_defconfig
ia64                             alldefconfig
sh                          kfr2r09_defconfig
mips                         db1xxx_defconfig
arm                           sama5_defconfig
sh                     magicpanelr2_defconfig
arc                         haps_hs_defconfig
mips                        qi_lb60_defconfig
arm                            hisi_defconfig
arm                        multi_v5_defconfig
xtensa                              defconfig
powerpc                  mpc866_ads_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
alpha                               defconfig
powerpc                     tqm8548_defconfig
um                             i386_defconfig
arm                        realview_defconfig
powerpc                      ppc6xx_defconfig
m68k                       bvme6000_defconfig
arm                        keystone_defconfig
arm                            qcom_defconfig
powerpc                 mpc8560_ads_defconfig
sh                             sh03_defconfig
mips                  decstation_64_defconfig
mips                         cobalt_defconfig
ia64                        generic_defconfig
arm                       versatile_defconfig
powerpc                        cell_defconfig
sh                          lboxre2_defconfig
powerpc                    socrates_defconfig
c6x                        evmc6678_defconfig
sh                               allmodconfig
mips                        omega2p_defconfig
powerpc                 mpc837x_mds_defconfig
c6x                                 defconfig
m68k                        m5272c3_defconfig
xtensa                           alldefconfig
powerpc                     ksi8560_defconfig
sh                           se7705_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          exynos_defconfig
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
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201021
x86_64               randconfig-a002-20201021
x86_64               randconfig-a003-20201021
x86_64               randconfig-a006-20201021
x86_64               randconfig-a005-20201021
x86_64               randconfig-a004-20201021
i386                 randconfig-a002-20201021
i386                 randconfig-a005-20201021
i386                 randconfig-a003-20201021
i386                 randconfig-a001-20201021
i386                 randconfig-a006-20201021
i386                 randconfig-a004-20201021
i386                 randconfig-a002-20201022
i386                 randconfig-a005-20201022
i386                 randconfig-a003-20201022
i386                 randconfig-a001-20201022
i386                 randconfig-a006-20201022
i386                 randconfig-a004-20201022
x86_64               randconfig-a011-20201022
x86_64               randconfig-a013-20201022
x86_64               randconfig-a016-20201022
x86_64               randconfig-a015-20201022
x86_64               randconfig-a012-20201022
x86_64               randconfig-a014-20201022
i386                 randconfig-a016-20201021
i386                 randconfig-a014-20201021
i386                 randconfig-a015-20201021
i386                 randconfig-a013-20201021
i386                 randconfig-a012-20201021
i386                 randconfig-a011-20201021
i386                 randconfig-a016-20201022
i386                 randconfig-a014-20201022
i386                 randconfig-a015-20201022
i386                 randconfig-a012-20201022
i386                 randconfig-a013-20201022
i386                 randconfig-a011-20201022
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
x86_64               randconfig-a001-20201022
x86_64               randconfig-a002-20201022
x86_64               randconfig-a003-20201022
x86_64               randconfig-a006-20201022
x86_64               randconfig-a004-20201022
x86_64               randconfig-a005-20201022
x86_64               randconfig-a011-20201021
x86_64               randconfig-a013-20201021
x86_64               randconfig-a016-20201021
x86_64               randconfig-a015-20201021
x86_64               randconfig-a012-20201021
x86_64               randconfig-a014-20201021

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
