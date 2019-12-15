Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACA711F9C8
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfLORmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:42:05 -0500
Received: from mga18.intel.com ([134.134.136.126]:22664 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbfLORmF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 12:42:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Dec 2019 09:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,318,1571727600"; 
   d="scan'208";a="211853608"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2019 09:42:02 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1igXu5-000BBE-OX; Mon, 16 Dec 2019 01:42:01 +0800
Date:   Mon, 16 Dec 2019 01:41:16 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 da090bf60370c9ad6ede4e76adbf37ce79b84791
Message-ID: <5df6703c.3eebOmVKhAufGYSZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: da090bf60370c9ad6ede4e76adbf37ce79b84791  media: Drop superfluous ioctl PCM ops

elapsed time: 3418m

configs tested: 141

The following configs have been built successfully.
More configs may be tested in the coming days.

csky                 randconfig-a001-20191213
openrisc             randconfig-a001-20191213
s390                 randconfig-a001-20191213
sh                   randconfig-a001-20191213
xtensa               randconfig-a001-20191213
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
x86_64               randconfig-g001-20191213
x86_64               randconfig-g002-20191213
x86_64               randconfig-g003-20191213
i386                 randconfig-g001-20191213
i386                 randconfig-g002-20191213
i386                 randconfig-g003-20191213
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
i386                             allyesconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arm                              allmodconfig
arm64                            allmodconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
x86_64               randconfig-d001-20191215
x86_64               randconfig-d002-20191215
x86_64               randconfig-d003-20191215
i386                 randconfig-d001-20191215
i386                 randconfig-d002-20191215
i386                 randconfig-d003-20191215
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64               randconfig-e001-20191213
x86_64               randconfig-e002-20191213
x86_64               randconfig-e003-20191213
i386                 randconfig-e001-20191213
i386                 randconfig-e002-20191213
i386                 randconfig-e003-20191213
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-h001-20191213
x86_64               randconfig-h002-20191213
x86_64               randconfig-h003-20191213
i386                 randconfig-h001-20191213
i386                 randconfig-h002-20191213
i386                 randconfig-h003-20191213
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
x86_64               randconfig-a001-20191213
x86_64               randconfig-a002-20191213
x86_64               randconfig-a003-20191213
i386                 randconfig-a001-20191213
i386                 randconfig-a002-20191213
i386                 randconfig-a003-20191213
x86_64               randconfig-g001-20191215
x86_64               randconfig-g002-20191215
x86_64               randconfig-g003-20191215
i386                 randconfig-g001-20191215
i386                 randconfig-g002-20191215
i386                 randconfig-g003-20191215
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arc                              allyesconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
x86_64               randconfig-d001-20191213
x86_64               randconfig-d002-20191213
x86_64               randconfig-d003-20191213
i386                 randconfig-d001-20191213
i386                 randconfig-d002-20191213
i386                 randconfig-d003-20191213
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
