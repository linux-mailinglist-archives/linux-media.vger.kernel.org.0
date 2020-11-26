Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A342C5BC6
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 19:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404870AbgKZSOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 13:14:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:54835 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404838AbgKZSOS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 13:14:18 -0500
IronPort-SDR: Znhf1Evv3e+0/m6WJGdU9C15QFxEfjpTaURAskTCEfD8+/PnjLy/APuPhL2lP8/qzqHJk92rWP
 h2+pWAftdBDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="190468106"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="190468106"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 10:14:17 -0800
IronPort-SDR: v+d7mQcNR6CPqc40E3FbEsfsfM3zr0yAweH/U915bLfJK8IxRNl6hOfz8tTSAY+OLfTQTcarNp
 P9vAK6uv9VMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="535820410"
Received: from lkp-server01.sh.intel.com (HELO acb209a98034) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2020 10:14:16 -0800
Received: from kbuild by acb209a98034 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kiLma-00001P-2y; Thu, 26 Nov 2020 18:14:16 +0000
Date:   Fri, 27 Nov 2020 02:13:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 4863b93cfd2dfe88557f820b3399c3fa2163ec43
Message-ID: <5fbff04c.2oSJmCJtyNWew8rH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 4863b93cfd2dfe88557f820b3399c3fa2163ec43  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660

elapsed time: 1659m

configs tested: 172
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                     edosk2674_defconfig
sparc                            alldefconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
arc                          axs103_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     loongson1c_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
sh                          rsk7201_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                      obs600_defconfig
arm                            pleb_defconfig
powerpc                        warp_defconfig
arm                            mps2_defconfig
mips                         rt305x_defconfig
openrisc                         alldefconfig
powerpc                       ebony_defconfig
sh                          r7785rp_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
arm                            qcom_defconfig
m68k                        mvme147_defconfig
arm                            dove_defconfig
sh                   rts7751r2dplus_defconfig
h8300                       h8s-sim_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                       cns3420vb_defconfig
arm                        magician_defconfig
mips                            e55_defconfig
mips                  cavium_octeon_defconfig
i386                             alldefconfig
powerpc                    socrates_defconfig
c6x                         dsk6455_defconfig
arm                           efm32_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                      maltasmvp_defconfig
m68k                          multi_defconfig
powerpc                          allyesconfig
sparc64                             defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
nios2                               defconfig
xtensa                         virt_defconfig
arc                      axs103_smp_defconfig
arm                           h5000_defconfig
c6x                        evmc6472_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
powerpc                     taishan_defconfig
powerpc                     tqm8541_defconfig
mips                      pic32mzda_defconfig
riscv                            allyesconfig
arm                        neponset_defconfig
xtensa                           allyesconfig
powerpc                     tqm5200_defconfig
powerpc                       holly_defconfig
um                            kunit_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7750_defconfig
powerpc                      arches_defconfig
arc                           tb10x_defconfig
sh                           se7780_defconfig
sh                           se7206_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc64e_defconfig
arm                         ebsa110_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                     nsimosci_hs_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                   lite5200b_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201125
i386                 randconfig-a003-20201125
i386                 randconfig-a002-20201125
i386                 randconfig-a005-20201125
i386                 randconfig-a001-20201125
i386                 randconfig-a006-20201125
i386                 randconfig-a004-20201126
i386                 randconfig-a003-20201126
i386                 randconfig-a002-20201126
i386                 randconfig-a005-20201126
i386                 randconfig-a001-20201126
i386                 randconfig-a006-20201126
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
x86_64               randconfig-a006-20201126
x86_64               randconfig-a003-20201126
x86_64               randconfig-a004-20201126
x86_64               randconfig-a005-20201126
x86_64               randconfig-a001-20201126
x86_64               randconfig-a002-20201126
i386                 randconfig-a012-20201125
i386                 randconfig-a013-20201125
i386                 randconfig-a011-20201125
i386                 randconfig-a016-20201125
i386                 randconfig-a014-20201125
i386                 randconfig-a015-20201125
i386                 randconfig-a012-20201126
i386                 randconfig-a013-20201126
i386                 randconfig-a011-20201126
i386                 randconfig-a016-20201126
i386                 randconfig-a014-20201126
i386                 randconfig-a015-20201126
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
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125
x86_64               randconfig-a015-20201126
x86_64               randconfig-a011-20201126
x86_64               randconfig-a014-20201126
x86_64               randconfig-a016-20201126
x86_64               randconfig-a012-20201126
x86_64               randconfig-a013-20201126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
