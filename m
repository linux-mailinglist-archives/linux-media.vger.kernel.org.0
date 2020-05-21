Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFAB1DCDCC
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 15:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgEUNQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 09:16:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:64554 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgEUNQK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 09:16:10 -0400
IronPort-SDR: 0xm2fl6k5ySv6L8TiKMomdnczSofI2gHd6oowIm6+duyF8lE/neObw8R3JgMiLHlrzOJuUxs0+
 ZgPEv99I5PZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 06:16:09 -0700
IronPort-SDR: Lc981Qj/mJ5bMzGVbvKTjGSCj05orASUrJj40IOm5s/ljzJOtYNZU8dLPMpAKRof9KjIOgIl4O
 FqiEjfj2ZgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; 
   d="scan'208";a="253969590"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 May 2020 06:16:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jbl3O-0007t2-7D; Thu, 21 May 2020 21:16:06 +0800
Date:   Thu, 21 May 2020 21:15:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 960b2dee908b0fc51cf670841de13b40b44aaaae
Message-ID: <5ec67ed8.ughoMPSnmtTsvgoz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 960b2dee908b0fc51cf670841de13b40b44aaaae  media: dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging

Warning in current branch:

drivers/staging/media/atomisp/pci/sh_css_firmware.h:41:38: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration

Warning ids grouped by kconfigs:

recent_errors
`-- i386-allyesconfig
    `-- drivers-staging-media-atomisp-pci-sh_css_firmware.h:warning:struct-device-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration

elapsed time: 1401m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
m68k                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
arm                         shannon_defconfig
arm                            zeus_defconfig
riscv                            alldefconfig
arm                        multi_v5_defconfig
microblaze                      mmu_defconfig
arm                     eseries_pxa_defconfig
riscv                    nommu_virt_defconfig
powerpc                     mpc83xx_defconfig
arm                          imote2_defconfig
powerpc                         ps3_defconfig
sh                          r7780mp_defconfig
arm                           sama5_defconfig
sh                           se7712_defconfig
arm                          iop32x_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200520
i386                 randconfig-a004-20200520
i386                 randconfig-a006-20200520
i386                 randconfig-a003-20200520
i386                 randconfig-a002-20200520
i386                 randconfig-a005-20200520
x86_64               randconfig-a013-20200520
x86_64               randconfig-a015-20200520
x86_64               randconfig-a016-20200520
x86_64               randconfig-a012-20200520
x86_64               randconfig-a014-20200520
x86_64               randconfig-a011-20200520
i386                 randconfig-a013-20200521
i386                 randconfig-a012-20200521
i386                 randconfig-a015-20200521
i386                 randconfig-a011-20200521
i386                 randconfig-a016-20200521
i386                 randconfig-a014-20200521
i386                 randconfig-a013-20200520
i386                 randconfig-a012-20200520
i386                 randconfig-a015-20200520
i386                 randconfig-a011-20200520
i386                 randconfig-a016-20200520
i386                 randconfig-a014-20200520
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
