Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B405186117
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 01:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgCPA7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 20:59:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:1585 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbgCPA7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 20:59:55 -0400
IronPort-SDR: bxUZn05lgCanNMH4/W7xSDgh01OCa/5Vv6v9EHyuNbqRlKsykItjx1OgPFJF+GMAZ89vREuQ10
 seO7+JjLUd2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2020 17:59:46 -0700
IronPort-SDR: SpIJ6cc/3OJUb0aE6Y20LBnB+6z5MIDVXJjvtX6B/oUpHw0/v+vqcdQFetBrsZNhXdci3Wh4r2
 vAilSCWrQtqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,558,1574150400"; 
   d="scan'208";a="416964497"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Mar 2020 17:59:45 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jDe6a-00063p-KX; Mon, 16 Mar 2020 08:59:44 +0800
Date:   Mon, 16 Mar 2020 08:59:18 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 2a9c226da9aa997d862a22292279e806114a9db8
Message-ID: <5e6ecf66.vO+bV2/Tk9CPyNIK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 2a9c226da9aa997d862a22292279e806114a9db8  media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8

elapsed time: 4813m

configs tested: 222
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
riscv                          rv32_defconfig
csky                                defconfig
sh                          rsk7269_defconfig
i386                                defconfig
riscv                               defconfig
um                                  defconfig
nios2                         10m50_defconfig
mips                      fuloong2e_defconfig
parisc                generic-32bit_defconfig
s390                             alldefconfig
i386                             alldefconfig
sh                                allnoconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
nios2                         3c120_defconfig
openrisc                 simple_smp_defconfig
ia64                                defconfig
i386                              allnoconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
openrisc                    or1ksim_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
i386                 randconfig-a003-20200313
i386                 randconfig-a001-20200313
x86_64               randconfig-a001-20200313
i386                 randconfig-a002-20200313
x86_64               randconfig-a003-20200313
x86_64               randconfig-a002-20200313
x86_64               randconfig-a001-20200311
x86_64               randconfig-a002-20200311
x86_64               randconfig-a003-20200311
i386                 randconfig-a001-20200311
i386                 randconfig-a002-20200311
i386                 randconfig-a003-20200311
alpha                randconfig-a001-20200312
m68k                 randconfig-a001-20200312
mips                 randconfig-a001-20200312
nds32                randconfig-a001-20200312
parisc               randconfig-a001-20200312
riscv                randconfig-a001-20200312
riscv                randconfig-a001-20200313
nds32                randconfig-a001-20200313
alpha                randconfig-a001-20200313
m68k                 randconfig-a001-20200313
parisc               randconfig-a001-20200313
mips                 randconfig-a001-20200313
c6x                  randconfig-a001-20200312
h8300                randconfig-a001-20200312
microblaze           randconfig-a001-20200312
nios2                randconfig-a001-20200312
sparc64              randconfig-a001-20200312
c6x                  randconfig-a001-20200313
h8300                randconfig-a001-20200313
microblaze           randconfig-a001-20200313
nios2                randconfig-a001-20200313
sparc64              randconfig-a001-20200313
csky                 randconfig-a001-20200313
openrisc             randconfig-a001-20200313
s390                 randconfig-a001-20200313
xtensa               randconfig-a001-20200313
csky                 randconfig-a001-20200312
openrisc             randconfig-a001-20200312
s390                 randconfig-a001-20200312
sh                   randconfig-a001-20200312
xtensa               randconfig-a001-20200312
sh                   randconfig-a001-20200313
x86_64               randconfig-b001-20200311
x86_64               randconfig-b002-20200311
x86_64               randconfig-b003-20200311
i386                 randconfig-b001-20200311
i386                 randconfig-b002-20200311
i386                 randconfig-b003-20200311
x86_64               randconfig-c001-20200313
i386                 randconfig-c001-20200313
x86_64               randconfig-c002-20200313
i386                 randconfig-c002-20200313
i386                 randconfig-c003-20200313
x86_64               randconfig-c003-20200313
x86_64               randconfig-c001-20200311
x86_64               randconfig-c002-20200311
x86_64               randconfig-c003-20200311
i386                 randconfig-c001-20200311
i386                 randconfig-c002-20200311
i386                 randconfig-c003-20200311
x86_64               randconfig-d001-20200312
x86_64               randconfig-d002-20200312
x86_64               randconfig-d003-20200312
i386                 randconfig-d001-20200312
i386                 randconfig-d002-20200312
i386                 randconfig-d003-20200312
x86_64               randconfig-d001-20200313
i386                 randconfig-d001-20200313
i386                 randconfig-d003-20200313
i386                 randconfig-d002-20200313
x86_64               randconfig-d002-20200313
x86_64               randconfig-d003-20200313
x86_64               randconfig-e001-20200312
x86_64               randconfig-e002-20200312
x86_64               randconfig-e003-20200312
i386                 randconfig-e001-20200312
i386                 randconfig-e002-20200312
i386                 randconfig-e003-20200312
x86_64               randconfig-f001-20200312
x86_64               randconfig-f002-20200312
x86_64               randconfig-f003-20200312
i386                 randconfig-f001-20200312
i386                 randconfig-f002-20200312
i386                 randconfig-f003-20200312
i386                 randconfig-f002-20200313
x86_64               randconfig-f001-20200313
i386                 randconfig-f003-20200313
i386                 randconfig-f001-20200313
x86_64               randconfig-f002-20200313
x86_64               randconfig-f003-20200313
i386                 randconfig-g003-20200313
i386                 randconfig-g001-20200313
x86_64               randconfig-g003-20200313
x86_64               randconfig-g002-20200313
x86_64               randconfig-g001-20200313
i386                 randconfig-g002-20200313
x86_64               randconfig-g001-20200312
x86_64               randconfig-g002-20200312
x86_64               randconfig-g003-20200312
i386                 randconfig-g001-20200312
i386                 randconfig-g002-20200312
i386                 randconfig-g003-20200312
x86_64               randconfig-h001-20200312
x86_64               randconfig-h002-20200312
x86_64               randconfig-h003-20200312
i386                 randconfig-h001-20200312
i386                 randconfig-h002-20200312
i386                 randconfig-h003-20200312
x86_64               randconfig-h001-20200313
i386                 randconfig-h001-20200313
x86_64               randconfig-h002-20200313
x86_64               randconfig-h003-20200313
i386                 randconfig-h002-20200313
i386                 randconfig-h003-20200313
arc                  randconfig-a001-20200312
arm                  randconfig-a001-20200312
arm64                randconfig-a001-20200312
ia64                 randconfig-a001-20200312
powerpc              randconfig-a001-20200312
sparc                randconfig-a001-20200312
arc                  randconfig-a001-20200313
ia64                 randconfig-a001-20200313
arm                  randconfig-a001-20200313
arm64                randconfig-a001-20200313
sparc                randconfig-a001-20200313
powerpc              randconfig-a001-20200313
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
