Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274D7256F74
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 19:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgH3RIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 13:08:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:27630 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgH3RIj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 13:08:39 -0400
IronPort-SDR: AgpgbodJBqU01ZFfVs0WzImPTIUgzT0HMrBu5zlQKz0c7rpBzB3kdVj8VZDT41Vd3TI+I9jaDS
 21+syOXigmdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241686332"
X-IronPort-AV: E=Sophos;i="5.76,372,1592895600"; 
   d="scan'208";a="241686332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2020 10:08:37 -0700
IronPort-SDR: p7shRyjkQ/z8TzKxsYgnbm0HaPaqLAi98MldirMZAf9wyhaC0rRdhjBKW2mXik4SQ9XA7GL337
 IeCw9pSs8b3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,372,1592895600"; 
   d="scan'208";a="501083554"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2020 10:08:37 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCQom-0000yA-J4; Sun, 30 Aug 2020 17:08:36 +0000
Date:   Mon, 31 Aug 2020 01:07:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 07d999f0d9463ea0d1f76e0f8921ea363d805767
Message-ID: <5f4bdce4.Afbq2YkkgvjNkmPR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 07d999f0d9463ea0d1f76e0f8921ea363d805767  media: open.rst: document mc-centric and video-node-centric

Warning in current branch:

drivers/staging/media/tegra-video/vi.c:555:35: warning: unused variable 'vi_ctrl_ops' [-Wunused-const-variable]
drivers/staging/media/tegra-video/vi.c:559:26: warning: unused variable 'vi_pattern_strings' [-Wunused-const-variable]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- arm64-randconfig-r022-20200830
    |-- drivers-staging-media-tegra-video-vi.c:warning:unused-variable-vi_ctrl_ops
    `-- drivers-staging-media-tegra-video-vi.c:warning:unused-variable-vi_pattern_strings

elapsed time: 1936m

configs tested: 101
configs skipped: 9

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         s3c6400_defconfig
arm                        vexpress_defconfig
mips                   sb1250_swarm_defconfig
mips                         bigsur_defconfig
sh                        dreamcast_defconfig
h8300                            alldefconfig
arm                            mps2_defconfig
arm                          pxa910_defconfig
m68k                       m5249evb_defconfig
arm                           omap1_defconfig
arm                          ep93xx_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
powerpc                       holly_defconfig
mips                            gpr_defconfig
mips                 decstation_r4k_defconfig
powerpc                      ppc64e_defconfig
powerpc                  mpc866_ads_defconfig
m68k                          atari_defconfig
mips                             allmodconfig
xtensa                          iss_defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20200829
x86_64               randconfig-a003-20200829
x86_64               randconfig-a006-20200829
x86_64               randconfig-a005-20200829
x86_64               randconfig-a001-20200829
x86_64               randconfig-a004-20200829
x86_64               randconfig-a002-20200830
x86_64               randconfig-a005-20200830
x86_64               randconfig-a001-20200830
i386                 randconfig-a002-20200829
i386                 randconfig-a005-20200829
i386                 randconfig-a003-20200829
i386                 randconfig-a004-20200829
i386                 randconfig-a001-20200829
i386                 randconfig-a006-20200829
i386                 randconfig-a001-20200830
i386                 randconfig-a002-20200830
i386                 randconfig-a004-20200830
i386                 randconfig-a006-20200830
i386                 randconfig-a005-20200830
i386                 randconfig-a003-20200830
i386                 randconfig-a015-20200830
i386                 randconfig-a016-20200830
i386                 randconfig-a014-20200830
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
