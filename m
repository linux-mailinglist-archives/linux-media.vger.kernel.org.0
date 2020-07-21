Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F062F227B43
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 10:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgGUI5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 04:57:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:33758 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgGUI5E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 04:57:04 -0400
IronPort-SDR: NuhB6MIUR3DF74NkzWqhesP/KjNUCTVyaXspTEKAmhLWg5g9T60ymwlGfkHZF8PlxAoa1PMMXR
 dbqIA9BP+hPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="130164937"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="130164937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 01:57:01 -0700
IronPort-SDR: drG5yXyqv/oND+aSHwZeSlSZGgEvQNt03GAPdYpVXAsFHxCY1+lnuuyu5g2c4hA1GdvYBQjHtX
 gQWRoRQblZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="327805884"
Received: from lkp-server02.sh.intel.com (HELO 7dd7ac9fbea4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2020 01:57:00 -0700
Received: from kbuild by 7dd7ac9fbea4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jxo55-00001W-QE; Tue, 21 Jul 2020 08:56:59 +0000
Date:   Tue, 21 Jul 2020 16:56:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29
Message-ID: <5f16ada8.Ryw+q95GnSHP4bnJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29  media: dvbdev.h: keep * together with the type

Warning in current branch:

drivers/media/platform/exynos4-is/media-dev.c:1273:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Warning ids grouped by kconfigs:

recent_errors
`-- xtensa-randconfig-c023-20200719
    `-- drivers-media-platform-exynos4-is-media-dev.c:WARNING:PTR_ERR_OR_ZERO-can-be-used

elapsed time: 2637m

configs tested: 142
configs skipped: 10

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arc                         haps_hs_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    gamecube_defconfig
c6x                                 defconfig
c6x                        evmc6474_defconfig
sh                          rsk7264_defconfig
powerpc                       maple_defconfig
sh                         apsh4a3a_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
sparc64                           allnoconfig
xtensa                           allyesconfig
sh                          landisk_defconfig
powerpc                 linkstation_defconfig
mips                    maltaup_xpa_defconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
sh                               alldefconfig
mips                         bigsur_defconfig
arm                           sama5_defconfig
arm                           omap1_defconfig
mips                            e55_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
arm                          simpad_defconfig
openrisc                         allyesconfig
mips                   sb1250_swarm_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
powerpc                           allnoconfig
arm                         shannon_defconfig
powerpc                       ppc64_defconfig
arm                      footbridge_defconfig
s390                             alldefconfig
xtensa                    xip_kc705_defconfig
ia64                        generic_defconfig
mips                          rb532_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            zeus_defconfig
sh                ecovec24-romimage_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlr_defconfig
powerpc                        cell_defconfig
xtensa                generic_kc705_defconfig
arm                         bcm2835_defconfig
arc                     haps_hs_smp_defconfig
s390                          debug_defconfig
arm                          pxa3xx_defconfig
m68k                        m5407c3_defconfig
sh                          sdk7780_defconfig
arm                           h5000_defconfig
powerpc                    amigaone_defconfig
arm                         lubbock_defconfig
powerpc                         wii_defconfig
h8300                               defconfig
arm                         s3c6400_defconfig
mips                       rbtx49xx_defconfig
arm                            u300_defconfig
ia64                             alldefconfig
arm                           corgi_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
arm                         orion5x_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
