Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA6A75C28
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 02:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfGZAwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 20:52:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:43206 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbfGZAwT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 20:52:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 17:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; 
   d="scan'208";a="178189460"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2019 17:52:17 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hqoT3-000CeZ-71; Fri, 26 Jul 2019 08:52:17 +0800
Date:   Fri, 26 Jul 2019 08:51:55 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ras:edac-for-next] BUILD SUCCESS
 3123c5c4ca157edc518102ee5385f60cb90f93f5
Message-ID: <5d3a4eab.K/bMbBfUx8WTzlkG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://kernel.googlesource.com/pub/scm/linux/kernel/git/ras/ras.git  edac-for-next
branch HEAD: 3123c5c4ca157edc518102ee5385f60cb90f93f5  edac: altera: Move Stratix10 SDRAM ECC to peripheral

elapsed time: 353m

configs tested: 150

The following configs have been built successfully.
More configs may be tested in the coming days.

x86_64                 randconfig-d001-201929
x86_64                 randconfig-d002-201929
x86_64                 randconfig-d003-201929
x86_64                 randconfig-d004-201929
i386                   randconfig-d001-201929
i386                   randconfig-d002-201929
i386                   randconfig-d003-201929
i386                   randconfig-d004-201929
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                           allyesconfig
i386                             allmodconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                 randconfig-f001-201929
x86_64                 randconfig-f002-201929
x86_64                 randconfig-f003-201929
x86_64                 randconfig-f004-201929
i386                   randconfig-f001-201929
i386                   randconfig-f002-201929
i386                   randconfig-f003-201929
i386                   randconfig-f004-201929
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64                 randconfig-a001-201929
x86_64                 randconfig-a002-201929
x86_64                 randconfig-a003-201929
x86_64                 randconfig-a004-201929
i386                   randconfig-a001-201929
i386                   randconfig-a002-201929
i386                   randconfig-a003-201929
i386                   randconfig-a004-201929
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                                   jz4740
mips                      malta_kvm_defconfig
mips                                     txx9
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                nfsroot
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                 randconfig-e001-201929
x86_64                 randconfig-e002-201929
x86_64                 randconfig-e003-201929
x86_64                 randconfig-e004-201929
i386                   randconfig-e001-201929
i386                   randconfig-e002-201929
i386                   randconfig-e003-201929
i386                   randconfig-e004-201929
x86_64                 randconfig-g001-201929
x86_64                 randconfig-g002-201929
x86_64                 randconfig-g003-201929
x86_64                 randconfig-g004-201929
i386                   randconfig-g001-201929
i386                   randconfig-g002-201929
i386                   randconfig-g003-201929
i386                   randconfig-g004-201929
i386                              allnoconfig
i386                                defconfig
i386                             alldefconfig
x86_64                           allmodconfig
x86_64                 randconfig-c001-201929
x86_64                 randconfig-c002-201929
x86_64                 randconfig-c003-201929
x86_64                 randconfig-c004-201929
i386                   randconfig-c001-201929
i386                   randconfig-c002-201929
i386                   randconfig-c003-201929
i386                   randconfig-c004-201929
riscv                              tinyconfig
i386                               tinyconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
x86_64                 randconfig-h001-201929
x86_64                 randconfig-h002-201929
x86_64                 randconfig-h003-201929
x86_64                 randconfig-h004-201929
i386                   randconfig-h001-201929
i386                   randconfig-h002-201929
i386                   randconfig-h003-201929
i386                   randconfig-h004-201929
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
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
x86_64                 randconfig-b001-201929
x86_64                 randconfig-b002-201929
x86_64                 randconfig-b003-201929
x86_64                 randconfig-b004-201929
i386                   randconfig-b001-201929
i386                   randconfig-b002-201929
i386                   randconfig-b003-201929
i386                   randconfig-b004-201929
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
alpha                            allyesconfig
sparc64                          allyesconfig
riscv                               defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
