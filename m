Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2E3122901
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 11:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfLQKhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 05:37:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:12582 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfLQKhA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 05:37:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 02:36:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; 
   d="scan'208";a="205433239"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2019 02:36:58 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ihADp-000J5M-If; Tue, 17 Dec 2019 18:36:57 +0800
Date:   Tue, 17 Dec 2019 18:36:17 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a
Message-ID: <5df8afa1.GEmNCQvqnK7p3f+m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/media_tree.git  media-tree
branch HEAD: 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a  media: vivid: support multiplanar touch devices

elapsed time: 1313m

configs tested: 147

The following configs have been built successfully.
More configs may be tested in the coming days.

c6x                  randconfig-a001-20191217
h8300                randconfig-a001-20191217
nios2                randconfig-a001-20191217
sparc64              randconfig-a001-20191217
x86_64               randconfig-a001-20191217
x86_64               randconfig-a002-20191217
x86_64               randconfig-a003-20191217
i386                 randconfig-a001-20191217
i386                 randconfig-a002-20191217
i386                 randconfig-a003-20191217
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
x86_64               randconfig-f001-20191217
x86_64               randconfig-f002-20191217
x86_64               randconfig-f003-20191217
i386                 randconfig-f001-20191217
i386                 randconfig-f002-20191217
i386                 randconfig-f003-20191217
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arc                  randconfig-a001-20191217
arm                  randconfig-a001-20191217
arm64                randconfig-a001-20191217
powerpc              randconfig-a001-20191217
sparc                randconfig-a001-20191217
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64               randconfig-g001-20191217
x86_64               randconfig-g002-20191217
x86_64               randconfig-g003-20191217
i386                 randconfig-g001-20191217
i386                 randconfig-g002-20191217
i386                 randconfig-g003-20191217
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
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
x86_64               randconfig-b001-20191217
x86_64               randconfig-b002-20191217
x86_64               randconfig-b003-20191217
i386                 randconfig-b001-20191217
i386                 randconfig-b002-20191217
i386                 randconfig-b003-20191217
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-h001-20191217
x86_64               randconfig-h002-20191217
x86_64               randconfig-h003-20191217
i386                 randconfig-h001-20191217
i386                 randconfig-h002-20191217
i386                 randconfig-h003-20191217
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
alpha                randconfig-a001-20191217
mips                 randconfig-a001-20191217
nds32                randconfig-a001-20191217
parisc               randconfig-a001-20191217
riscv                randconfig-a001-20191217
csky                 randconfig-a001-20191217
openrisc             randconfig-a001-20191217
sh                   randconfig-a001-20191217
s390                             alldefconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
s390                 randconfig-a001-20191217
xtensa               randconfig-a001-20191217
microblaze           randconfig-a001-20191217
x86_64               randconfig-e001-20191217
x86_64               randconfig-e002-20191217
x86_64               randconfig-e003-20191217
i386                 randconfig-e001-20191217
i386                 randconfig-e002-20191217
i386                 randconfig-e003-20191217

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
