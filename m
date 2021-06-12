Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C41A3A4FE0
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 19:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhFLRQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 13:16:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:55053 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229532AbhFLRQO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 13:16:14 -0400
IronPort-SDR: m0BncgIasRbHD9KZcQKoL2Q7Xu8bmMRJTMXMUWySvpt9+FineNQxJ8Y9aNL+iGeLx5GR9g24AA
 ADvT7tDYgaZg==
X-IronPort-AV: E=McAfee;i="6200,9189,10013"; a="266822611"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; 
   d="scan'208";a="266822611"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2021 10:14:14 -0700
IronPort-SDR: +TfevmHRl50064zpV72XqL3cSX2e7qOdrCpmtUligi9sXPRmZqyPcCvi9BfPzSePqrK31p+vFk
 /nRjAGKzOztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; 
   d="scan'208";a="552980608"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2021 10:14:13 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ls7D3-0000zs-Ra; Sat, 12 Jun 2021 17:14:13 +0000
Date:   Sun, 13 Jun 2021 01:14:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 4c6e0976295add7f0ed94d276c04a3d6f1ea8f83
Message-ID: <60c4eb59.3xu0HvzD3Fp3xbrd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 4c6e0976295add7f0ed94d276c04a3d6f1ea8f83  media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K

elapsed time: 1862m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          moxart_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
powerpc                     kmeter1_defconfig
m68k                        m5307c3_defconfig
nios2                            allyesconfig
m68k                       bvme6000_defconfig
sh                            shmin_defconfig
sh                          sdk7786_defconfig
m68k                         amcore_defconfig
arm                        mini2440_defconfig
x86_64                            allnoconfig
arm                          collie_defconfig
powerpc                      acadia_defconfig
sh                     sh7710voipgw_defconfig
riscv                               defconfig
arm                          pxa3xx_defconfig
arm64                            alldefconfig
powerpc                      cm5200_defconfig
m68k                            mac_defconfig
arc                     nsimosci_hs_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     sequoia_defconfig
arm                      jornada720_defconfig
sh                         ap325rxa_defconfig
powerpc                      ep88xc_defconfig
m68k                       m5475evb_defconfig
powerpc                       ppc64_defconfig
sh                         ecovec24_defconfig
mips                      maltasmvp_defconfig
sh                      rts7751r2d1_defconfig
powerpc64                           defconfig
arm                            hisi_defconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
arm                            qcom_defconfig
m68k                       m5249evb_defconfig
sparc                            alldefconfig
arm                           spitz_defconfig
powerpc                     stx_gp3_defconfig
mips                  maltasmvp_eva_defconfig
mips                malta_qemu_32r6_defconfig
mips                      loongson3_defconfig
mips                           ci20_defconfig
arc                          axs103_defconfig
arm                             pxa_defconfig
arm                      tct_hammer_defconfig
m68k                          sun3x_defconfig
mips                            gpr_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                generic_kc705_defconfig
arm                        shmobile_defconfig
arm                       imx_v6_v7_defconfig
ia64                          tiger_defconfig
mips                         tb0226_defconfig
arm                           sunxi_defconfig
s390                       zfcpdump_defconfig
sparc                               defconfig
microblaze                          defconfig
arm                      footbridge_defconfig
arm                        multi_v7_defconfig
sh                           se7780_defconfig
sh                                  defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  nommu_kc705_defconfig
arm                             mxs_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
arm                            mmp2_defconfig
powerpc                       eiger_defconfig
um                                  defconfig
arm                    vt8500_v6_v7_defconfig
arm                     eseries_pxa_defconfig
mips                        bcm47xx_defconfig
mips                  decstation_64_defconfig
arm                      integrator_defconfig
arm                  colibri_pxa300_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
arm                            mps2_defconfig
arm                        spear6xx_defconfig
mips                           jazz_defconfig
arm                        trizeps4_defconfig
powerpc                    ge_imp3a_defconfig
mips                        omega2p_defconfig
xtensa                       common_defconfig
sh                        dreamcast_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210611
x86_64               randconfig-a001-20210611
x86_64               randconfig-a004-20210611
x86_64               randconfig-a003-20210611
x86_64               randconfig-a006-20210611
x86_64               randconfig-a005-20210611
i386                 randconfig-a002-20210611
i386                 randconfig-a006-20210611
i386                 randconfig-a004-20210611
i386                 randconfig-a001-20210611
i386                 randconfig-a005-20210611
i386                 randconfig-a003-20210611
i386                 randconfig-a002-20210612
i386                 randconfig-a006-20210612
i386                 randconfig-a001-20210612
i386                 randconfig-a004-20210612
i386                 randconfig-a005-20210612
i386                 randconfig-a003-20210612
x86_64               randconfig-a015-20210612
x86_64               randconfig-a011-20210612
x86_64               randconfig-a014-20210612
x86_64               randconfig-a012-20210612
x86_64               randconfig-a013-20210612
x86_64               randconfig-a016-20210612
i386                 randconfig-a015-20210611
i386                 randconfig-a013-20210611
i386                 randconfig-a016-20210611
i386                 randconfig-a014-20210611
i386                 randconfig-a012-20210611
i386                 randconfig-a011-20210611
i386                 randconfig-a015-20210612
i386                 randconfig-a013-20210612
i386                 randconfig-a016-20210612
i386                 randconfig-a014-20210612
i386                 randconfig-a012-20210612
i386                 randconfig-a011-20210612
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210612
x86_64               randconfig-a004-20210612
x86_64               randconfig-a001-20210612
x86_64               randconfig-a003-20210612
x86_64               randconfig-a006-20210612
x86_64               randconfig-a005-20210612
x86_64               randconfig-a015-20210611
x86_64               randconfig-a011-20210611
x86_64               randconfig-a012-20210611
x86_64               randconfig-a014-20210611
x86_64               randconfig-a016-20210611
x86_64               randconfig-a013-20210611

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
