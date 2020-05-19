Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CED1D972F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 15:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgESNJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 09:09:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:53047 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728818AbgESNJn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 09:09:43 -0400
IronPort-SDR: bFplxhMhs/y+AytieZDQ6jIqpZAjFjK+3ULYAobm0vydbKtx2rvBIFjB+cpZ3PNSzjuHw6eDzf
 evPNG94XEKPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 06:09:42 -0700
IronPort-SDR: sMwJA+b9IPwjwljraL+MumJVJ5ve7m8p9WvYB+CPItRyFtd14XgbhvWWulFzVA0a+QyDkHnELZ
 xRUpQ9MX3Wig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="373720851"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 May 2020 06:09:41 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jb204-000Cht-HM; Tue, 19 May 2020 21:09:40 +0800
Date:   Tue, 19 May 2020 21:08:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 ad3a44cbd1b2e1559c6b93e80dc0c9c29632969a
Message-ID: <5ec3da69.vEpq9hV1N0KkgK/c%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: ad3a44cbd1b2e1559c6b93e80dc0c9c29632969a  media: i2c: imx219: Parse and register properties

elapsed time: 1398m

configs tested: 160
configs skipped: 9

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
powerpc                      tqm8xx_defconfig
arm                       omap2plus_defconfig
sh                         apsh4a3a_defconfig
mips                   sb1250_swarm_defconfig
arm                        magician_defconfig
powerpc                      chrp32_defconfig
sh                          polaris_defconfig
powerpc                       ppc64_defconfig
c6x                        evmc6457_defconfig
arm                           corgi_defconfig
mips                     cu1000-neo_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
arm                            mps2_defconfig
sh                                  defconfig
mips                          rm200_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                          imote2_defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
riscv                          rv32_defconfig
arc                        nsimosci_defconfig
arc                        vdk_hs38_defconfig
sh                           se7751_defconfig
arm                       netwinder_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
mips                         tb0287_defconfig
powerpc                      mgcoge_defconfig
um                           x86_64_defconfig
powerpc                  storcenter_defconfig
sh                            shmin_defconfig
arm                          pxa3xx_defconfig
powerpc                         wii_defconfig
csky                                defconfig
s390                          debug_defconfig
c6x                        evmc6678_defconfig
sh                          r7780mp_defconfig
arm                            lart_defconfig
arm                        shmobile_defconfig
arm                           stm32_defconfig
powerpc                       holly_defconfig
mips                         tb0226_defconfig
parisc                            allnoconfig
mips                    maltaup_xpa_defconfig
sh                          lboxre2_defconfig
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
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a003-20200519
x86_64               randconfig-a005-20200519
x86_64               randconfig-a004-20200519
x86_64               randconfig-a006-20200519
x86_64               randconfig-a002-20200519
x86_64               randconfig-a001-20200519
i386                 randconfig-a006-20200518
i386                 randconfig-a005-20200518
i386                 randconfig-a001-20200518
i386                 randconfig-a003-20200518
i386                 randconfig-a004-20200518
i386                 randconfig-a002-20200518
i386                 randconfig-a006-20200519
i386                 randconfig-a005-20200519
i386                 randconfig-a001-20200519
i386                 randconfig-a003-20200519
i386                 randconfig-a004-20200519
i386                 randconfig-a002-20200519
x86_64               randconfig-a016-20200518
x86_64               randconfig-a012-20200518
x86_64               randconfig-a015-20200518
x86_64               randconfig-a013-20200518
x86_64               randconfig-a011-20200518
x86_64               randconfig-a014-20200518
i386                 randconfig-a012-20200518
i386                 randconfig-a014-20200518
i386                 randconfig-a016-20200518
i386                 randconfig-a011-20200518
i386                 randconfig-a015-20200518
i386                 randconfig-a013-20200518
i386                 randconfig-a012-20200519
i386                 randconfig-a014-20200519
i386                 randconfig-a016-20200519
i386                 randconfig-a011-20200519
i386                 randconfig-a015-20200519
i386                 randconfig-a013-20200519
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
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
