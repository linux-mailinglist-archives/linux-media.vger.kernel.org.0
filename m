Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D9488186
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 19:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407565AbfHIRrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 13:47:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:40212 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407436AbfHIRrB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 13:47:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 10:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; 
   d="scan'208";a="193433264"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2019 10:46:58 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hw8yg-000CXS-FV; Sat, 10 Aug 2019 01:46:58 +0800
Date:   Sat, 10 Aug 2019 01:46:38 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ras:edac-for-next] BUILD INCOMPLETE
 82413e562ea6eadfb6de946dcc6f74af31d64e7f
Message-ID: <5d4db17e.SNNbLBSmqjTFJ14Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://kernel.googlesource.com/pub/scm/linux/kernel/git/ras/ras.git  edac-for-next
branch HEAD: 82413e562ea6eadfb6de946dcc6f74af31d64e7f  EDAC, mellanox: Add ECC support for BlueField DDR4

TIMEOUT after 1441m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 27

alpha                            allmodconfig
alpha                            allyesconfig
ia64                             allyesconfig
m68k                             allyesconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allyesconfig
mips                                   jz4740
mips                                     txx9
nds32                            allmodconfig
nds32                            allyesconfig
parisc                           allmodconfig
parisc                           allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
sh                               allyesconfig
sparc                            allmodconfig
sparc64                          allyesconfig
x86_64                             acpi-redef
x86_64                           allmodconfig
x86_64                           allyesdebian
x86_64                                nfsroot
xtensa                           allmodconfig
xtensa                           allyesconfig

configs tested: 104

mips                             allmodconfig
mips                      malta_kvm_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
i386                   randconfig-d002-201931
i386                   randconfig-d004-201931
x86_64                 randconfig-d004-201931
x86_64                 randconfig-d001-201931
x86_64                 randconfig-d002-201931
x86_64                 randconfig-d003-201931
i386                   randconfig-d001-201931
i386                   randconfig-d003-201931
powerpc                             defconfig
sparc64                          allmodconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                           allyesconfig
i386                             allmodconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             alldefconfig
x86_64                 randconfig-h002-201931
x86_64                 randconfig-h003-201931
i386                   randconfig-h002-201931
i386                   randconfig-h001-201931
x86_64                 randconfig-h004-201931
i386                   randconfig-h004-201931
x86_64                 randconfig-h001-201931
i386                   randconfig-h003-201931
xtensa                       common_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
riscv                              tinyconfig
i386                               tinyconfig
riscv                             allnoconfig
riscv                               defconfig
nds32                               defconfig
alpha                               defconfig
nds32                             allnoconfig
ia64                                defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
x86_64                 randconfig-g003-201931
i386                   randconfig-g004-201931
x86_64                 randconfig-g002-201931
x86_64                 randconfig-g001-201931
i386                   randconfig-g001-201931
x86_64                 randconfig-g004-201931
i386                   randconfig-g002-201931
i386                   randconfig-g003-201931
i386                              allnoconfig
i386                                defconfig
i386                             alldefconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
s390                              allnoconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
