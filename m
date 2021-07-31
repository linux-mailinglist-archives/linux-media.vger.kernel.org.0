Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4810E3DC732
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 19:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhGaR25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 13:28:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:24693 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231380AbhGaR2w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 13:28:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10062"; a="274324351"
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="274324351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2021 10:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="519434552"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2021 10:28:40 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m9smu-000BO2-0D; Sat, 31 Jul 2021 17:28:40 +0000
Date:   Sun, 01 Aug 2021 01:27:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 8028b7a2157efb09b134461856689347958f88b7
Message-ID: <6105880e.TyJA0B1+w8MEySVl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 8028b7a2157efb09b134461856689347958f88b7  media: imx258: Limit the max analogue gain to 480

elapsed time: 1516m

configs tested: 153
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210730
xtensa                generic_kc705_defconfig
sh                               allmodconfig
sh                             espt_defconfig
powerpc                      katmai_defconfig
arm                        magician_defconfig
powerpc                 mpc8315_rdb_defconfig
parisc                           alldefconfig
sh                           se7751_defconfig
sh                           se7724_defconfig
powerpc                      bamboo_defconfig
powerpc                         wii_defconfig
mips                            e55_defconfig
nios2                         3c120_defconfig
powerpc                 mpc8540_ads_defconfig
mips                     loongson1b_defconfig
m68k                          amiga_defconfig
powerpc                        cell_defconfig
arm                       aspeed_g5_defconfig
powerpc                        warp_defconfig
m68k                                defconfig
mips                           ip27_defconfig
m68k                        m5307c3_defconfig
powerpc                    socrates_defconfig
arm                       cns3420vb_defconfig
um                             i386_defconfig
sh                        apsh4ad0a_defconfig
mips                      pic32mzda_defconfig
mips                          malta_defconfig
h8300                            alldefconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
arm                           sunxi_defconfig
h8300                     edosk2674_defconfig
arm                       mainstone_defconfig
arm                            dove_defconfig
sh                        edosk7705_defconfig
powerpc                     tqm5200_defconfig
sh                          sdk7780_defconfig
mips                        qi_lb60_defconfig
powerpc                     kilauea_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   secureedge5410_defconfig
csky                             alldefconfig
powerpc                     sbc8548_defconfig
arm                          simpad_defconfig
riscv                    nommu_virt_defconfig
powerpc                      mgcoge_defconfig
nios2                         10m50_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
s390                       zfcpdump_defconfig
arm                  colibri_pxa300_defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                  audio_kc705_defconfig
powerpc                    gamecube_defconfig
sh                           se7705_defconfig
mips                           mtx1_defconfig
x86_64                           alldefconfig
powerpc                   currituck_defconfig
s390                          debug_defconfig
sh                                  defconfig
arm                      footbridge_defconfig
mips                             allmodconfig
mips                     loongson2k_defconfig
openrisc                  or1klitex_defconfig
sh                          urquell_defconfig
powerpc                 xes_mpc85xx_defconfig
sparc64                          alldefconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210730
i386                 randconfig-a004-20210730
i386                 randconfig-a003-20210730
i386                 randconfig-a002-20210730
i386                 randconfig-a006-20210730
i386                 randconfig-a001-20210730
i386                 randconfig-a005-20210731
i386                 randconfig-a004-20210731
i386                 randconfig-a003-20210731
i386                 randconfig-a002-20210731
i386                 randconfig-a006-20210731
i386                 randconfig-a001-20210731
x86_64               randconfig-a015-20210730
x86_64               randconfig-a014-20210730
x86_64               randconfig-a013-20210730
x86_64               randconfig-a011-20210730
x86_64               randconfig-a012-20210730
x86_64               randconfig-a016-20210730
i386                 randconfig-a013-20210730
i386                 randconfig-a016-20210730
i386                 randconfig-a012-20210730
i386                 randconfig-a011-20210730
i386                 randconfig-a014-20210730
i386                 randconfig-a015-20210730
x86_64               randconfig-a001-20210731
x86_64               randconfig-a006-20210731
x86_64               randconfig-a005-20210731
x86_64               randconfig-a004-20210731
x86_64               randconfig-a002-20210731
x86_64               randconfig-a003-20210731
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210730
x86_64               randconfig-c001-20210731
x86_64               randconfig-a001-20210730
x86_64               randconfig-a006-20210730
x86_64               randconfig-a005-20210730
x86_64               randconfig-a004-20210730
x86_64               randconfig-a002-20210730
x86_64               randconfig-a003-20210730

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
