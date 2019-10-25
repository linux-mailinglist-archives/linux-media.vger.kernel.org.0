Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39008E4A0A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 13:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440168AbfJYLdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 07:33:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:63293 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440122AbfJYLdP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 07:33:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 04:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="204528396"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2019 04:33:13 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iNxqD-000Gic-7S; Fri, 25 Oct 2019 19:33:13 +0800
Date:   Fri, 25 Oct 2019 19:32:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 a4260ea49547aa0c84c353f9de5998a0315d89fe
Message-ID: <5db2dd3b.IlCoxX+auKVHYmqu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: a4260ea49547aa0c84c353f9de5998a0315d89fe  media: sun4i: Add H3 deinterlace driver

Regressions in current branch:

drivers/media/i2c/smiapp/smiapp-core.c:1356:3-9: preceding lock on line 1336

Error ids grouped by kconfigs:

recent_errors
`-- x86_64-allyesconfig
    `-- drivers-media-i2c-smiapp-smiapp-core.c:preceding-lock-on-line

elapsed time: 798m

configs tested: 121

x86_64                 randconfig-g002-201942
i386                   randconfig-g004-201942
x86_64                 randconfig-g001-201942
i386                   randconfig-g002-201942
x86_64                 randconfig-g004-201942
x86_64                 randconfig-g003-201942
i386                   randconfig-g003-201942
i386                   randconfig-g001-201942
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                           allyesconfig
i386                             allmodconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                 randconfig-f001-201942
x86_64                 randconfig-f002-201942
x86_64                 randconfig-f003-201942
x86_64                 randconfig-f004-201942
i386                   randconfig-f001-201942
i386                   randconfig-f002-201942
i386                   randconfig-f003-201942
i386                   randconfig-f004-201942
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
xtensa                       common_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
i386                              allnoconfig
i386                                defconfig
i386                             alldefconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
ia64                             alldefconfig
x86_64                 randconfig-b001-201942
x86_64                 randconfig-b002-201942
x86_64                 randconfig-b003-201942
x86_64                 randconfig-b004-201942
i386                   randconfig-b001-201942
i386                   randconfig-b002-201942
i386                   randconfig-b003-201942
i386                   randconfig-b004-201942
x86_64                 randconfig-a001-201942
x86_64                 randconfig-a002-201942
x86_64                 randconfig-a003-201942
x86_64                 randconfig-a004-201942
i386                   randconfig-a001-201942
i386                   randconfig-a002-201942
i386                   randconfig-a003-201942
i386                   randconfig-a004-201942
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
i386                   randconfig-d002-201942
x86_64                 randconfig-d002-201942
i386                   randconfig-d004-201942
x86_64                 randconfig-d004-201942
x86_64                 randconfig-d003-201942
i386                   randconfig-d003-201942
x86_64                 randconfig-d001-201942
i386                   randconfig-d001-201942
x86_64                           allmodconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
