Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DFC2C74E2
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388419AbgK1Vti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:38 -0500
Received: from mga07.intel.com ([134.134.136.100]:39736 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgK1SWE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:22:04 -0500
IronPort-SDR: emnXehHApzPX6opKHZ8RNWAQIfvZOB93vC5hx2tput/nJJZnYzIzXEp45lKbgb5l+QoYFXNjtj
 AJigrYL+T6ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9819"; a="236619635"
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; 
   d="scan'208";a="236619635"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2020 10:21:23 -0800
IronPort-SDR: fPxbv17UuSnPdgXA2hdOs0KJHAxK2jH9JptYq9VvW6ig1dSlxcCo4YICLWVa8gF3ScZz9W4dYx
 353hDdOwxvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; 
   d="scan'208";a="328995817"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Nov 2020 10:21:22 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kj4qX-0000VW-Bt; Sat, 28 Nov 2020 18:21:21 +0000
Date:   Sun, 29 Nov 2020 02:20:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 a3f132df0e5f25399c9592c2d14997975ddbf290
Message-ID: <5fc294fb.FCZlVPntp7fucWnk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: a3f132df0e5f25399c9592c2d14997975ddbf290  media: bttv: use generic power management

elapsed time: 1733m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             rpc_defconfig
mips                          rb532_defconfig
sh                        sh7757lcr_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
sh                         microdev_defconfig
arm                        realview_defconfig
mips                    maltaup_xpa_defconfig
c6x                        evmc6472_defconfig
mips                           ip28_defconfig
sh                               allmodconfig
m68k                         amcore_defconfig
mips                            gpr_defconfig
arm                          collie_defconfig
powerpc                  mpc866_ads_defconfig
arm                          moxart_defconfig
mips                  decstation_64_defconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         lpc18xx_defconfig
mips                         db1xxx_defconfig
arc                         haps_hs_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      ppc40x_defconfig
arm                            dove_defconfig
arm                      jornada720_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         cm_x300_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
openrisc                 simple_smp_defconfig
sh                                  defconfig
ia64                      gensparse_defconfig
s390                       zfcpdump_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            hisi_defconfig
sh                           sh2007_defconfig
powerpc                     mpc512x_defconfig
mips                      malta_kvm_defconfig
c6x                         dsk6455_defconfig
arm                           h5000_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                           jazz_defconfig
mips                         rt305x_defconfig
sh                             sh03_defconfig
sparc64                             defconfig
arm                  colibri_pxa300_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
mips                           ip22_defconfig
sh                           se7722_defconfig
powerpc                 linkstation_defconfig
arm                        oxnas_v6_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
i386                 randconfig-a004-20201128
i386                 randconfig-a003-20201128
i386                 randconfig-a002-20201128
i386                 randconfig-a005-20201128
i386                 randconfig-a001-20201128
i386                 randconfig-a006-20201128
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
i386                 randconfig-a012-20201128
i386                 randconfig-a013-20201128
i386                 randconfig-a011-20201128
i386                 randconfig-a016-20201128
i386                 randconfig-a014-20201128
i386                 randconfig-a015-20201128
x86_64               randconfig-a003-20201128
x86_64               randconfig-a006-20201128
x86_64               randconfig-a004-20201128
x86_64               randconfig-a005-20201128
x86_64               randconfig-a001-20201128
x86_64               randconfig-a002-20201128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127
x86_64               randconfig-a015-20201128
x86_64               randconfig-a011-20201128
x86_64               randconfig-a016-20201128
x86_64               randconfig-a014-20201128
x86_64               randconfig-a012-20201128
x86_64               randconfig-a013-20201128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
