Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 379BD34BD3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfFDPQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 11:16:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:54077 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfFDPQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 11:16:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 08:16:41 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2019 08:16:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hYBB1-0007Mp-PC; Tue, 04 Jun 2019 23:16:39 +0800
Date:   Tue, 04 Jun 2019 23:16:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD INCOMPLETE
 0864c9ce8fe83eadfd21b08e98997111d091660c
Message-ID: <5cf68b52.fhBZTzbMl8lXg0CD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 0864c9ce8fe83eadfd21b08e98997111d091660c  media: dt-bindings: Fix vendor-prefixes YAML

TIMEOUT after 1460m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 55

alpha                            allmodconfig
alpha                            allyesconfig
i386                             allmodconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
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
s390                             allmodconfig
s390                             allyesconfig
sh                               allyesconfig
sparc                            allmodconfig
sparc                            allyesconfig
sparc64                          allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-x000
x86_64                        randconfig-x001
x86_64                        randconfig-x002
x86_64                        randconfig-x003
x86_64                        randconfig-x004
x86_64                        randconfig-x005
x86_64                        randconfig-x006
x86_64                        randconfig-x007
x86_64                        randconfig-x008
x86_64                        randconfig-x009
x86_64                        randconfig-x010
x86_64                        randconfig-x011
x86_64                        randconfig-x012
x86_64                        randconfig-x013
x86_64                        randconfig-x014
x86_64                        randconfig-x015
x86_64                        randconfig-x016
x86_64                        randconfig-x017
x86_64                        randconfig-x018
x86_64                        randconfig-x019
xtensa                           allmodconfig
xtensa                           allyesconfig

configs tested: 159

xtensa                       common_defconfig
xtensa                          iss_defconfig
h8300                    h8300h-sim_defconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
s390                          debug_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
openrisc                    or1ksim_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
nds32                             allnoconfig
nds32                               defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                                    lkp
x86_64                                nfsroot
x86_64                                   rhel
x86_64                           rhel-7.2-aep
x86_64                               rhel-7.6
x86_64                                  kexec
x86_64                              fedora-25
mips                             allmodconfig
mips                      malta_kvm_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
riscv                             allnoconfig
riscv                               defconfig
alpha                               defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
um                                  defconfig
x86_64                           allmodconfig
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
i386                   randconfig-n025-201922
x86_64                 randconfig-n006-201922
i386                   randconfig-n005-201922
x86_64                 randconfig-n022-201922
i386                   randconfig-n004-201922
x86_64                 randconfig-n023-201922
i386                   randconfig-n008-201922
x86_64                 randconfig-n016-201922
x86_64                 randconfig-n032-201922
x86_64                 randconfig-n013-201922
x86_64                 randconfig-n012-201922
x86_64                 randconfig-n014-201922
i386                   randconfig-n013-201922
x86_64                 randconfig-n009-201922
x86_64                 randconfig-n028-201922
x86_64                 randconfig-n011-201922
i386                   randconfig-n024-201922
x86_64                 randconfig-n007-201922
i386                   randconfig-n030-201922
x86_64                 randconfig-n031-201922
i386                   randconfig-n031-201922
x86_64                 randconfig-n030-201922
i386                   randconfig-n029-201922
i386                   randconfig-n010-201922
i386                   randconfig-n028-201922
i386                   randconfig-n011-201922
i386                   randconfig-n023-201922
i386                   randconfig-n014-201922
i386                   randconfig-n021-201922
i386                   randconfig-n018-201922
x86_64                 randconfig-n002-201922
x86_64                 randconfig-n027-201922
x86_64                 randconfig-n029-201922
x86_64                 randconfig-n010-201922
i386                   randconfig-n003-201922
x86_64                 randconfig-n024-201922
i386                   randconfig-n002-201922
x86_64                 randconfig-n025-201922
i386                   randconfig-n009-201922
x86_64                 randconfig-n017-201922
i386                   randconfig-n007-201922
x86_64                 randconfig-n020-201922
x86_64                 randconfig-n019-201922
i386                   randconfig-n015-201922
x86_64                 randconfig-n015-201922
i386                   randconfig-n012-201922
x86_64                 randconfig-n008-201922
i386                   randconfig-n016-201922
i386                   randconfig-n017-201922
i386                   randconfig-n022-201922
x86_64                 randconfig-n001-201922
i386                   randconfig-n032-201922
i386                   randconfig-n006-201922
x86_64                 randconfig-n021-201922
x86_64                 randconfig-n018-201922
i386                   randconfig-n027-201922
x86_64                 randconfig-n004-201922
i386                   randconfig-n026-201922
x86_64                 randconfig-n005-201922
i386                   randconfig-n020-201922
i386                   randconfig-n019-201922
x86_64                 randconfig-n003-201922
i386                   randconfig-n001-201922
x86_64                 randconfig-n026-201922
i386                   randconfig-x011-201922
i386                   randconfig-x012-201922
i386                   randconfig-x013-201922
i386                   randconfig-x018-201922
i386                   randconfig-x016-201922
i386                   randconfig-x017-201922
i386                   randconfig-x010-201922
i386                   randconfig-x014-201922
i386                   randconfig-x015-201922
i386                   randconfig-x019-201922
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
i386                   randconfig-x000-201922
i386                   randconfig-x001-201922
i386                   randconfig-x002-201922
i386                   randconfig-x003-201922
i386                   randconfig-x004-201922
i386                   randconfig-x005-201922
i386                   randconfig-x006-201922
i386                   randconfig-x007-201922
i386                   randconfig-x008-201922
i386                   randconfig-x009-201922
riscv                              tinyconfig
i386                               tinyconfig
i386                   randconfig-x073-201922
i386                   randconfig-x070-201922
i386                   randconfig-x071-201922
i386                   randconfig-x074-201922
i386                   randconfig-x078-201922
i386                   randconfig-x075-201922
i386                   randconfig-x072-201922
i386                   randconfig-x076-201922
i386                   randconfig-x077-201922
i386                   randconfig-x079-201922

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
