Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D8B256951
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 19:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgH2RVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 13:21:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:32285 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728105AbgH2RVF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 13:21:05 -0400
IronPort-SDR: hUHjMBEOwvZWQ9x7nDdiFQx9YPsSrWgMaBFpgqyMMiAgRdG4opuvH6t3zqGOnA/TXQnAsoKLH9
 KqwXPGuLqHsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9728"; a="174856917"
X-IronPort-AV: E=Sophos;i="5.76,368,1592895600"; 
   d="scan'208";a="174856917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2020 10:21:01 -0700
IronPort-SDR: wx4LtOVE3WFTwiCy9aI3sUIau2wIJEUWEIOoLZD/Pb8umr1i6cCRWlAutsQYE+/NmHV30rWPIB
 UFvHXShTzmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,368,1592895600"; 
   d="scan'208";a="300581913"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Aug 2020 10:20:59 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kC4XD-0000YH-64; Sat, 29 Aug 2020 17:20:59 +0000
Date:   Sun, 30 Aug 2020 01:20:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 45f13a57d8134459f02fbee0b1711eddc3260af7
Message-ID: <5f4a8e63.9ceJudn3M/ql9kpm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 45f13a57d8134459f02fbee0b1711eddc3260af7  media: platform: Add jpeg enc feature

elapsed time: 1626m

configs tested: 136
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
sh                          sdk7786_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
mips                        nlm_xlp_defconfig
m68k                             alldefconfig
sh                   secureedge5410_defconfig
mips                        bcm47xx_defconfig
c6x                        evmc6474_defconfig
microblaze                    nommu_defconfig
arm                         s3c6400_defconfig
arm                        vexpress_defconfig
mips                   sb1250_swarm_defconfig
arm                         axm55xx_defconfig
sh                               alldefconfig
mips                      fuloong2e_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
arm                        clps711x_defconfig
sh                        sh7763rdp_defconfig
arm                       versatile_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                           se7750_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                        spear3xx_defconfig
powerpc                      ppc64e_defconfig
arm                         ebsa110_defconfig
ia64                      gensparse_defconfig
arc                     nsimosci_hs_defconfig
sh                     magicpanelr2_defconfig
s390                       zfcpdump_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5275evb_defconfig
arm                       mainstone_defconfig
mips                     decstation_defconfig
sh                   rts7751r2dplus_defconfig
m68k                        stmark2_defconfig
powerpc                         wii_defconfig
arm                            dove_defconfig
m68k                             allyesconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
m68k                          sun3x_defconfig
powerpc                  mpc866_ads_defconfig
xtensa                         virt_defconfig
arm                         s5pv210_defconfig
arm                           tegra_defconfig
arm                        multi_v7_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
i386                 randconfig-a002-20200829
i386                 randconfig-a005-20200829
i386                 randconfig-a003-20200829
i386                 randconfig-a004-20200829
i386                 randconfig-a001-20200829
i386                 randconfig-a006-20200829
x86_64               randconfig-a002-20200829
x86_64               randconfig-a003-20200829
x86_64               randconfig-a006-20200829
x86_64               randconfig-a005-20200829
x86_64               randconfig-a001-20200829
x86_64               randconfig-a004-20200829
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
i386                 randconfig-a013-20200829
i386                 randconfig-a012-20200829
i386                 randconfig-a011-20200829
i386                 randconfig-a016-20200829
i386                 randconfig-a014-20200829
i386                 randconfig-a015-20200829
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
