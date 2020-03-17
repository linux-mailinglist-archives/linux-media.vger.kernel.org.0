Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A023E188752
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 15:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgCQOUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 10:20:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:48854 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgCQOUx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 10:20:53 -0400
IronPort-SDR: TxD5+7QAiswpl2cqYE8OvymEwLQ6PfaGE4mKekRb4UOEAEVGIugvti0oUUSP4CBUEm+3C8BdJC
 8xP/f/ItJctw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2020 07:20:53 -0700
IronPort-SDR: MWHYMTfonbuyWYwy252l+I8RaiU9a1HPsZEikPSNyVKPTAXI7vITxFKPEc8OEc7p5/fky1ohHA
 Dtig6synusvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
   d="scan'208";a="445507022"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2020 07:20:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jED5P-000Hpq-3q; Tue, 17 Mar 2020 22:20:51 +0800
Date:   Tue, 17 Mar 2020 22:20:40 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 6fafbbe8d4140e44e0a64d6c914d628bdb2902ed
Message-ID: <5e70dcb8.u/Eb7rl8EfMTzAM9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 6fafbbe8d4140e44e0a64d6c914d628bdb2902ed  device property: Export fwnode_get_name()

elapsed time: 1854m

configs tested: 234
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
sh                                allnoconfig
sparc64                          allmodconfig
riscv                               defconfig
h8300                     edosk2674_defconfig
mips                              allnoconfig
nds32                             allnoconfig
sh                               allmodconfig
parisc                           allyesconfig
sh                            titan_defconfig
um                                  defconfig
sparc                               defconfig
i386                                defconfig
parisc                            allnoconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
um                             i386_defconfig
h8300                    h8300h-sim_defconfig
ia64                             alldefconfig
microblaze                    nommu_defconfig
powerpc                             defconfig
sh                          rsk7269_defconfig
s390                          debug_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200316
x86_64               randconfig-a002-20200316
x86_64               randconfig-a003-20200316
i386                 randconfig-a001-20200316
i386                 randconfig-a002-20200316
i386                 randconfig-a003-20200316
x86_64               randconfig-a001-20200317
x86_64               randconfig-a002-20200317
x86_64               randconfig-a003-20200317
i386                 randconfig-a001-20200317
i386                 randconfig-a002-20200317
i386                 randconfig-a003-20200317
alpha                randconfig-a001-20200316
m68k                 randconfig-a001-20200316
mips                 randconfig-a001-20200316
nds32                randconfig-a001-20200316
parisc               randconfig-a001-20200316
riscv                randconfig-a001-20200316
alpha                randconfig-a001-20200317
m68k                 randconfig-a001-20200317
mips                 randconfig-a001-20200317
nds32                randconfig-a001-20200317
parisc               randconfig-a001-20200317
riscv                randconfig-a001-20200317
c6x                  randconfig-a001-20200317
h8300                randconfig-a001-20200317
microblaze           randconfig-a001-20200317
nios2                randconfig-a001-20200317
sparc64              randconfig-a001-20200317
c6x                  randconfig-a001-20200316
h8300                randconfig-a001-20200316
microblaze           randconfig-a001-20200316
nios2                randconfig-a001-20200316
sparc64              randconfig-a001-20200316
csky                 randconfig-a001-20200316
openrisc             randconfig-a001-20200316
s390                 randconfig-a001-20200316
sh                   randconfig-a001-20200316
xtensa               randconfig-a001-20200316
csky                 randconfig-a001-20200317
openrisc             randconfig-a001-20200317
s390                 randconfig-a001-20200317
sh                   randconfig-a001-20200317
xtensa               randconfig-a001-20200317
x86_64               randconfig-b001-20200316
x86_64               randconfig-b002-20200316
x86_64               randconfig-b003-20200316
i386                 randconfig-b001-20200316
i386                 randconfig-b002-20200316
i386                 randconfig-b003-20200316
x86_64               randconfig-b001-20200317
x86_64               randconfig-b002-20200317
x86_64               randconfig-b003-20200317
i386                 randconfig-b001-20200317
i386                 randconfig-b002-20200317
i386                 randconfig-b003-20200317
x86_64               randconfig-c001-20200316
x86_64               randconfig-c002-20200316
x86_64               randconfig-c003-20200316
i386                 randconfig-c001-20200316
i386                 randconfig-c002-20200316
i386                 randconfig-c003-20200316
x86_64               randconfig-c001-20200317
x86_64               randconfig-c002-20200317
x86_64               randconfig-c003-20200317
i386                 randconfig-c001-20200317
i386                 randconfig-c002-20200317
i386                 randconfig-c003-20200317
x86_64               randconfig-d001-20200316
x86_64               randconfig-d002-20200316
x86_64               randconfig-d003-20200316
i386                 randconfig-d001-20200316
i386                 randconfig-d002-20200316
i386                 randconfig-d003-20200316
x86_64               randconfig-d001-20200317
x86_64               randconfig-d002-20200317
x86_64               randconfig-d003-20200317
i386                 randconfig-d001-20200317
i386                 randconfig-d002-20200317
i386                 randconfig-d003-20200317
x86_64               randconfig-e001-20200316
x86_64               randconfig-e002-20200316
x86_64               randconfig-e003-20200316
i386                 randconfig-e001-20200316
i386                 randconfig-e002-20200316
i386                 randconfig-e003-20200316
x86_64               randconfig-e001-20200317
x86_64               randconfig-e002-20200317
x86_64               randconfig-e003-20200317
i386                 randconfig-e001-20200317
i386                 randconfig-e002-20200317
i386                 randconfig-e003-20200317
x86_64               randconfig-f001-20200316
x86_64               randconfig-f002-20200316
x86_64               randconfig-f003-20200316
i386                 randconfig-f001-20200316
i386                 randconfig-f002-20200316
i386                 randconfig-f003-20200316
x86_64               randconfig-f001-20200317
x86_64               randconfig-f002-20200317
x86_64               randconfig-f003-20200317
i386                 randconfig-f001-20200317
i386                 randconfig-f002-20200317
i386                 randconfig-f003-20200317
x86_64               randconfig-g001-20200316
x86_64               randconfig-g002-20200316
x86_64               randconfig-g003-20200316
i386                 randconfig-g001-20200316
i386                 randconfig-g002-20200316
i386                 randconfig-g003-20200316
x86_64               randconfig-g001-20200317
x86_64               randconfig-g002-20200317
x86_64               randconfig-g003-20200317
i386                 randconfig-g001-20200317
i386                 randconfig-g002-20200317
i386                 randconfig-g003-20200317
x86_64               randconfig-h001-20200316
x86_64               randconfig-h002-20200316
x86_64               randconfig-h003-20200316
i386                 randconfig-h001-20200316
i386                 randconfig-h002-20200316
i386                 randconfig-h003-20200316
x86_64               randconfig-h001-20200317
x86_64               randconfig-h002-20200317
x86_64               randconfig-h003-20200317
i386                 randconfig-h001-20200317
i386                 randconfig-h002-20200317
i386                 randconfig-h003-20200317
arc                  randconfig-a001-20200317
arm                  randconfig-a001-20200317
arm64                randconfig-a001-20200317
ia64                 randconfig-a001-20200317
powerpc              randconfig-a001-20200317
sparc                randconfig-a001-20200317
arc                  randconfig-a001-20200316
arm                  randconfig-a001-20200316
arm64                randconfig-a001-20200316
ia64                 randconfig-a001-20200316
powerpc              randconfig-a001-20200316
sparc                randconfig-a001-20200316
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
