Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0766290A50
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436523AbgJPRK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:10:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:32276 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410953AbgJPRK0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:10:26 -0400
IronPort-SDR: vUKuH5DjWIUKt/SgqoBtAu0RZ+JN2Vt+yOMXQHNMYfXY/HwyHGiOcuVZupdqEb+lSpNeVRKdcw
 D0rVcfXm48fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="164025139"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; 
   d="scan'208";a="164025139"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2020 10:10:26 -0700
IronPort-SDR: xDYao2ZbWPnp0pXTHYLyfmuOoBJZ3rlFSnMvkDQ7BuHFiN2eVKhU3RoMSSQNMqcjncupy6gtg5
 /+aLedHyYrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; 
   d="scan'208";a="319509670"
Received: from lkp-server02.sh.intel.com (HELO 262a2cdd3070) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2020 10:10:25 -0700
Received: from kbuild by 262a2cdd3070 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kTTFI-000053-8B; Fri, 16 Oct 2020 17:10:24 +0000
Date:   Sat, 17 Oct 2020 01:09:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 f4a45be35c346c3a6c0faa51559e984b19b16e3f
Message-ID: <5f89d3e7.75GHJd8hRVbGfFHh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: f4a45be35c346c3a6c0faa51559e984b19b16e3f  PM / devfreq: remove a duplicated kernel-doc markup

elapsed time: 2101m

configs tested: 142
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
ia64                                defconfig
mips                            ar7_defconfig
mips                            gpr_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
s390                             allyesconfig
arm                       netwinder_defconfig
xtensa                              defconfig
mips                            e55_defconfig
arm                         cm_x300_defconfig
arm                              zx_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     tqm8555_defconfig
arm                              alldefconfig
mips                     cu1830-neo_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc832x_mds_defconfig
h8300                               defconfig
arm                          pxa168_defconfig
arm                  colibri_pxa300_defconfig
arm                            xcep_defconfig
alpha                               defconfig
powerpc                       eiger_defconfig
mips                           ip32_defconfig
mips                     decstation_defconfig
powerpc                     sbc8548_defconfig
powerpc                       holly_defconfig
riscv                    nommu_k210_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
powerpc                      pmac32_defconfig
arm                          simpad_defconfig
arm                            pleb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     ppa8548_defconfig
mips                        jmr3927_defconfig
sh                              ul2_defconfig
mips                   sb1250_swarm_defconfig
arc                          axs101_defconfig
sh                           se7750_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                  iss476-smp_defconfig
arm                             pxa_defconfig
arm                         bcm2835_defconfig
parisc                              defconfig
m68k                         amcore_defconfig
arm                         lubbock_defconfig
sparc                       sparc64_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc836x_rdk_defconfig
h8300                     edosk2674_defconfig
arm                        keystone_defconfig
powerpc                    gamecube_defconfig
riscv                            allmodconfig
sh                     magicpanelr2_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
ia64                             allmodconfig
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
sh                               allmodconfig
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
i386                 randconfig-a005-20201015
i386                 randconfig-a006-20201015
i386                 randconfig-a001-20201015
i386                 randconfig-a003-20201015
i386                 randconfig-a004-20201015
i386                 randconfig-a002-20201015
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201016
x86_64               randconfig-a002-20201016
x86_64               randconfig-a006-20201016
x86_64               randconfig-a001-20201016
x86_64               randconfig-a005-20201016
x86_64               randconfig-a003-20201016
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
