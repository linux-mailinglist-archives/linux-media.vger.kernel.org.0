Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C747C149974
	for <lists+linux-media@lfdr.de>; Sun, 26 Jan 2020 07:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgAZGSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jan 2020 01:18:16 -0500
Received: from mga09.intel.com ([134.134.136.24]:11826 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgAZGSQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jan 2020 01:18:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jan 2020 22:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,364,1574150400"; 
   d="scan'208";a="428686891"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jan 2020 22:18:14 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ivbFN-000851-Td; Sun, 26 Jan 2020 14:18:13 +0800
Date:   Sun, 26 Jan 2020 14:17:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD INCOMPLETE
 1697d98124819aab09b86602978bd4f50e101e2d
Message-ID: <5e2d2f0e.Y/VcfnntP8GBxao6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 1697d98124819aab09b86602978bd4f50e101e2d  media: staging/intel-ipu3: remove TODO item about acronyms

TIMEOUT after 3779m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 10

mips                         64r6el_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
powerpc                          rhel-kconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                              fedora-25
x86_64                                   rhel
x86_64                         rhel-7.2-clear

configs tested: 123
configs skipped: 1

um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
xtensa                       common_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
x86_64               randconfig-c003-20200126
i386                 randconfig-c003-20200126
x86_64               randconfig-c002-20200126
x86_64               randconfig-c001-20200126
i386                 randconfig-c001-20200126
i386                 randconfig-c002-20200126
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
ia64                                defconfig
powerpc                             defconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
mips                             allmodconfig
mips                           32r2_defconfig
mips                             allyesconfig
mips                              allnoconfig
x86_64               randconfig-a001-20200125
i386                 randconfig-a001-20200125
x86_64               randconfig-a002-20200125
i386                 randconfig-a002-20200125
i386                 randconfig-a003-20200125
x86_64               randconfig-a003-20200125
s390                              allnoconfig
s390                             alldefconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                             allyesconfig
i386                             alldefconfig
x86_64                                    lkp
x86_64                               rhel-7.6
x86_64                                  kexec
x86_64               randconfig-f003-20200125
x86_64               randconfig-f001-20200125
x86_64               randconfig-f002-20200125
i386                 randconfig-f002-20200125
i386                 randconfig-f003-20200125
i386                 randconfig-f001-20200125
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
arm64                randconfig-a001-20200124
ia64                 randconfig-a001-20200124
arm                  randconfig-a001-20200124
arc                  randconfig-a001-20200124
sparc                randconfig-a001-20200124
x86_64               randconfig-b002-20200125
i386                 randconfig-b003-20200125
i386                 randconfig-b001-20200125
i386                 randconfig-b002-20200125
x86_64               randconfig-b001-20200125
x86_64               randconfig-b003-20200125
riscv                randconfig-a001-20200124
alpha                randconfig-a001-20200124
parisc               randconfig-a001-20200124
m68k                 randconfig-a001-20200124
nds32                randconfig-a001-20200124
openrisc             randconfig-a001-20200124
xtensa               randconfig-a001-20200124
csky                 randconfig-a001-20200124
s390                 randconfig-a001-20200124
sh                   randconfig-a001-20200124
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
sparc64                          allmodconfig
sparc                            allyesconfig
sparc64                          allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
