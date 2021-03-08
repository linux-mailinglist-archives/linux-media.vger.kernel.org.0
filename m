Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ABA331742
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 20:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCHT2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 14:28:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:34856 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230173AbhCHT12 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Mar 2021 14:27:28 -0500
IronPort-SDR: 6G2vhU6VGHtVzEXSjenQwtZeHzP1K3g2nBdPXvrRpUGecu2rmn0POA7Q1D6Sqnzqg6rhjKMJkq
 /tvF/RdPyqsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="187455348"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="187455348"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 11:27:28 -0800
IronPort-SDR: SRBn03Hney4XPWtiKS0mui85n+Fz0GCzcEW7uKWQJaMWk+5r/3tbMOlsfgqkRdRBKTOcV0lf4+
 YqpMZpD9AneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="598994417"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2021 11:27:26 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJLXK-00017q-7S; Mon, 08 Mar 2021 19:27:26 +0000
Date:   Tue, 09 Mar 2021 03:26:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39
Message-ID: <60467a6b.n3aRRb0Drcwfs4z2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39  Merge tag 'v5.12-rc2' into patchwork

elapsed time: 1576m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
powerpc                   bluestone_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     tqm8555_defconfig
powerpc                     kmeter1_defconfig
powerpc                    ge_imp3a_defconfig
arm                       mainstone_defconfig
mips                             allmodconfig
arm                            dove_defconfig
sh                             shx3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     ppa8548_defconfig
mips                        bcm63xx_defconfig
arm                         nhk8815_defconfig
powerpc                    amigaone_defconfig
powerpc                     redwood_defconfig
powerpc                     rainier_defconfig
arm                           spitz_defconfig
mips                         mpc30x_defconfig
mips                           ci20_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arc                            hsdk_defconfig
powerpc                        warp_defconfig
mips                      loongson3_defconfig
m68k                                defconfig
powerpc                      chrp32_defconfig
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
mips                  decstation_64_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
sh                           se7722_defconfig
mips                         db1xxx_defconfig
arm                            pleb_defconfig
arm                           omap1_defconfig
s390                             allmodconfig
sh                   rts7751r2dplus_defconfig
arm                         at91_dt_defconfig
powerpc                     powernv_defconfig
csky                             alldefconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
m68k                          hp300_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                             espt_defconfig
sh                              ul2_defconfig
sh                                  defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
ia64                         bigsur_defconfig
sparc                            allyesconfig
m68k                          sun3x_defconfig
sparc                       sparc64_defconfig
powerpc                  mpc885_ads_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
mips                            gpr_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
arc                    vdk_hs38_smp_defconfig
mips                       rbtx49xx_defconfig
sh                          sdk7780_defconfig
powerpc                      bamboo_defconfig
arm                      jornada720_defconfig
powerpc                 mpc834x_itx_defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
sh                           se7721_defconfig
mips                    maltaup_xpa_defconfig
arm                        mvebu_v7_defconfig
mips                        vocore2_defconfig
arc                     nsimosci_hs_defconfig
nds32                               defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
powerpc                mpc7448_hpc2_defconfig
arc                          axs101_defconfig
xtensa                          iss_defconfig
mips                         tb0226_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210307
i386                 randconfig-a003-20210307
i386                 randconfig-a002-20210307
i386                 randconfig-a004-20210307
i386                 randconfig-a006-20210307
i386                 randconfig-a001-20210307
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
i386                 randconfig-a016-20210307
i386                 randconfig-a012-20210307
i386                 randconfig-a013-20210307
i386                 randconfig-a014-20210307
i386                 randconfig-a011-20210307
i386                 randconfig-a015-20210307
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210307
x86_64               randconfig-a001-20210307
x86_64               randconfig-a004-20210307
x86_64               randconfig-a005-20210307
x86_64               randconfig-a002-20210307
x86_64               randconfig-a003-20210307
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
