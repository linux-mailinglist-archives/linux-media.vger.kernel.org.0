Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879FE2CF3CC
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 19:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgLDSQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 13:16:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:59593 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbgLDSQy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 13:16:54 -0500
IronPort-SDR: nR/J24Ih9NzQFHFs+1zNV2qAHHLNIADcptTAmb181aSVzOpZ5+OMsTAajfIjIl/4uplStHNXiC
 f6FpuMrjIuUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="191666414"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; 
   d="scan'208";a="191666414"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 10:16:11 -0800
IronPort-SDR: YyerzVM28TwfoPIsXSLT9XiRzrkVBU+zxuH17OgWXusCW4ytZagzi4F+ASmtOWHgxvA/ZUawiC
 qZ9AUFqk1Ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; 
   d="scan'208";a="362257552"
Received: from lkp-server02.sh.intel.com (HELO f74a175f0d75) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Dec 2020 10:16:09 -0800
Received: from kbuild by f74a175f0d75 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1klFcm-0000IS-TF; Fri, 04 Dec 2020 18:16:08 +0000
Date:   Sat, 05 Dec 2020 02:15:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 63288c829b1a5991d8f8c15cab596108ed206ba6
Message-ID: <5fca7cb8.NHWZN2PvfHeiogzJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 63288c829b1a5991d8f8c15cab596108ed206ba6  media: pixfmt-compressed.rst: fix 'bullet' formatting

elapsed time: 1841m

configs tested: 179
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           mtx1_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
arm                           h5000_defconfig
nios2                               defconfig
mips                  cavium_octeon_defconfig
mips                      bmips_stb_defconfig
arm                     am200epdkit_defconfig
m68k                        mvme147_defconfig
mips                         tb0226_defconfig
arm                       aspeed_g5_defconfig
riscv                            alldefconfig
sh                             espt_defconfig
sh                            hp6xx_defconfig
arm                          pxa168_defconfig
arm                         orion5x_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                           se7724_defconfig
riscv                            allyesconfig
powerpc                     tqm8548_defconfig
arc                        nsimosci_defconfig
mips                         tb0219_defconfig
m68k                       m5475evb_defconfig
powerpc                     ep8248e_defconfig
powerpc                     mpc512x_defconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
powerpc                      acadia_defconfig
arm                         assabet_defconfig
powerpc                     skiroot_defconfig
powerpc                    socrates_defconfig
um                             i386_defconfig
ia64                          tiger_defconfig
powerpc                      ppc64e_defconfig
powerpc                       eiger_defconfig
s390                       zfcpdump_defconfig
powerpc                     mpc5200_defconfig
powerpc                     pq2fads_defconfig
arm                        cerfcube_defconfig
mips                     loongson1b_defconfig
arm                            pleb_defconfig
mips                          ath79_defconfig
arm                        multi_v7_defconfig
xtensa                generic_kc705_defconfig
sh                        edosk7760_defconfig
arm                        mini2440_defconfig
alpha                               defconfig
arm                  colibri_pxa300_defconfig
powerpc                      chrp32_defconfig
sh                          urquell_defconfig
arm                       netwinder_defconfig
mips                            gpr_defconfig
sh                          rsk7264_defconfig
powerpc                     kilauea_defconfig
arc                          axs103_defconfig
arm                            zeus_defconfig
arm                             pxa_defconfig
mips                        workpad_defconfig
mips                          ath25_defconfig
arm                           sunxi_defconfig
arm                         shannon_defconfig
mips                           ip32_defconfig
arm                         s3c2410_defconfig
xtensa                              defconfig
c6x                        evmc6474_defconfig
mips                     decstation_defconfig
arm                             ezx_defconfig
sh                        sh7757lcr_defconfig
sh                        edosk7705_defconfig
arm                    vt8500_v6_v7_defconfig
arm                        keystone_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
sh                          r7785rp_defconfig
powerpc                     rainier_defconfig
s390                             alldefconfig
c6x                        evmc6472_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      mgcoge_defconfig
arm                        spear3xx_defconfig
arm                           corgi_defconfig
arm                        vexpress_defconfig
sh                   rts7751r2dplus_defconfig
mips                         db1xxx_defconfig
powerpc                   lite5200b_defconfig
powerpc64                        alldefconfig
mips                       lemote2f_defconfig
sh                     magicpanelr2_defconfig
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
x86_64               randconfig-a004-20201204
x86_64               randconfig-a006-20201204
x86_64               randconfig-a002-20201204
x86_64               randconfig-a001-20201204
x86_64               randconfig-a005-20201204
x86_64               randconfig-a003-20201204
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
i386                 randconfig-a014-20201204
i386                 randconfig-a013-20201204
i386                 randconfig-a011-20201204
i386                 randconfig-a015-20201204
i386                 randconfig-a012-20201204
i386                 randconfig-a016-20201204
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
x86_64               randconfig-a016-20201204
x86_64               randconfig-a012-20201204
x86_64               randconfig-a014-20201204
x86_64               randconfig-a013-20201204
x86_64               randconfig-a015-20201204
x86_64               randconfig-a011-20201204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
