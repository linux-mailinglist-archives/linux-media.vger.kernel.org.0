Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D1E86D75
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 00:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404278AbfHHWx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 18:53:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:18608 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732708AbfHHWx3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 18:53:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 15:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,363,1559545200"; 
   d="scan'208";a="186498166"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Aug 2019 15:53:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hvrHi-0003Ut-Jf; Fri, 09 Aug 2019 06:53:26 +0800
Date:   Fri, 09 Aug 2019 06:53:12 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 97299a3035328d7ae2f4fccaf6e549974df6e118
Message-ID: <5d4ca7d8.whnvQuM6gyQZQSyZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 97299a3035328d7ae2f4fccaf6e549974df6e118  media: Remove dev_err() usage after platform_get_irq()

elapsed time: 1580m

configs tested: 150

The following configs have been built successfully.
More configs may be tested in the coming days.

x86_64                 randconfig-b001-201931
x86_64                 randconfig-b002-201931
x86_64                 randconfig-b003-201931
x86_64                 randconfig-b004-201931
i386                   randconfig-b002-201931
i386                   randconfig-b003-201931
i386                   randconfig-b004-201931
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             alldefconfig
ia64                                defconfig
x86_64                           allyesconfig
i386                             allmodconfig
x86_64                           allmodconfig
i386                             alldefconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                 randconfig-e001-201931
x86_64                 randconfig-e002-201931
x86_64                 randconfig-e003-201931
x86_64                 randconfig-e004-201931
i386                   randconfig-e001-201931
i386                   randconfig-e002-201931
i386                   randconfig-e003-201931
i386                   randconfig-e004-201931
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
x86_64                 randconfig-d001-201931
x86_64                 randconfig-d002-201931
x86_64                 randconfig-d003-201931
x86_64                 randconfig-d004-201931
i386                   randconfig-d001-201931
i386                   randconfig-d002-201931
i386                   randconfig-d003-201931
i386                   randconfig-d004-201931
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                 randconfig-f001-201931
x86_64                 randconfig-f002-201931
x86_64                 randconfig-f003-201931
x86_64                 randconfig-f004-201931
i386                   randconfig-f001-201931
i386                   randconfig-f002-201931
i386                   randconfig-f003-201931
i386                   randconfig-f004-201931
i386                   randconfig-b001-201931
x86_64                 randconfig-a001-201931
x86_64                 randconfig-a002-201931
x86_64                 randconfig-a003-201931
x86_64                 randconfig-a004-201931
i386                   randconfig-a001-201931
i386                   randconfig-a002-201931
i386                   randconfig-a003-201931
i386                   randconfig-a004-201931
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
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
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                                   jz4740
mips                      malta_kvm_defconfig
mips                                     txx9
x86_64                 randconfig-g001-201931
x86_64                 randconfig-g003-201931
x86_64                 randconfig-g004-201931
i386                   randconfig-g001-201931
i386                   randconfig-g002-201931
i386                   randconfig-g003-201931
i386                   randconfig-g004-201931
x86_64                 randconfig-g002-201931
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                 randconfig-c001-201931
x86_64                 randconfig-c002-201931
x86_64                 randconfig-c003-201931
x86_64                 randconfig-c004-201931
i386                   randconfig-c001-201931
i386                   randconfig-c002-201931
i386                   randconfig-c003-201931
i386                   randconfig-c004-201931
x86_64                 randconfig-h001-201931
x86_64                 randconfig-h002-201931
x86_64                 randconfig-h003-201931
x86_64                 randconfig-h004-201931
i386                   randconfig-h001-201931
i386                   randconfig-h002-201931
i386                   randconfig-h003-201931
i386                   randconfig-h004-201931
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
i386                              allnoconfig
i386                                defconfig
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                nfsroot
x86_64                                   rhel
x86_64                               rhel-7.6

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
