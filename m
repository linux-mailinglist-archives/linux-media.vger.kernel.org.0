Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6661BEBF3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgD2WMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:12:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:44585 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2WMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:12:15 -0400
IronPort-SDR: Pw0qN+0e/45k1yoL4kUr1VOi1Jcg3V2OaCkVIEw3k0biZdTjf3z+AQs6Hc1AKKZMnBkp3NRtG8
 C6EStpRj3dGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 15:12:13 -0700
IronPort-SDR: 7elixb/D+NGie0SaN32Tpt/1KrUx0MjcDMwO7abmrsFhhh/O5VfrmOkdcq0cZ9z7b33OJG0Qkl
 TxKWmqb/5blg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="459347368"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2020 15:12:11 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTuw7-000HUn-3f; Thu, 30 Apr 2020 06:12:11 +0800
Date:   Thu, 30 Apr 2020 06:11:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 e51759f56d314d28c25be7606b03791f048e44c7
Message-ID: <5ea9fb77.wTWTF9DAGZSHUTNC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: e51759f56d314d28c25be7606b03791f048e44c7  media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound

elapsed time: 704m

configs tested: 207
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
s390                                defconfig
ia64                              allnoconfig
ia64                                defconfig
i386                                defconfig
xtensa                          iss_defconfig
parisc                           allmodconfig
ia64                        generic_defconfig
m68k                          multi_defconfig
mips                malta_kvm_guest_defconfig
ia64                             allmodconfig
powerpc                             defconfig
h8300                     edosk2674_defconfig
sh                  sh7785lcr_32bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
powerpc                      chrp32_defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
parisc               randconfig-a001-20200429
m68k                 randconfig-a001-20200429
alpha                randconfig-a001-20200429
mips                 randconfig-a001-20200429
nds32                randconfig-a001-20200429
riscv                randconfig-a001-20200429
parisc               randconfig-a001-20200430
mips                 randconfig-a001-20200430
m68k                 randconfig-a001-20200430
riscv                randconfig-a001-20200430
alpha                randconfig-a001-20200430
nds32                randconfig-a001-20200430
nios2                randconfig-a001-20200429
h8300                randconfig-a001-20200429
c6x                  randconfig-a001-20200429
sparc64              randconfig-a001-20200429
microblaze           randconfig-a001-20200429
sh                   randconfig-a001-20200429
csky                 randconfig-a001-20200429
s390                 randconfig-a001-20200429
xtensa               randconfig-a001-20200429
openrisc             randconfig-a001-20200429
s390                 randconfig-a001-20200430
xtensa               randconfig-a001-20200430
csky                 randconfig-a001-20200430
openrisc             randconfig-a001-20200430
sh                   randconfig-a001-20200430
i386                 randconfig-b002-20200429
i386                 randconfig-b001-20200429
x86_64               randconfig-b001-20200429
i386                 randconfig-b003-20200429
x86_64               randconfig-b002-20200429
x86_64               randconfig-b003-20200429
i386                 randconfig-b001-20200430
i386                 randconfig-b002-20200430
x86_64               randconfig-b001-20200430
i386                 randconfig-b003-20200430
x86_64               randconfig-b002-20200430
x86_64               randconfig-b003-20200430
i386                 randconfig-c002-20200429
i386                 randconfig-c001-20200429
x86_64               randconfig-c002-20200429
x86_64               randconfig-c001-20200429
i386                 randconfig-c003-20200429
x86_64               randconfig-c003-20200429
x86_64               randconfig-c001-20200430
i386                 randconfig-c001-20200430
i386                 randconfig-c002-20200430
x86_64               randconfig-c002-20200430
x86_64               randconfig-c003-20200430
i386                 randconfig-c003-20200430
x86_64               randconfig-d001-20200428
i386                 randconfig-d002-20200428
i386                 randconfig-d001-20200428
x86_64               randconfig-d003-20200428
i386                 randconfig-d003-20200428
x86_64               randconfig-d001-20200429
x86_64               randconfig-d002-20200429
i386                 randconfig-d002-20200429
i386                 randconfig-d001-20200429
x86_64               randconfig-d003-20200429
i386                 randconfig-d003-20200429
x86_64               randconfig-e002-20200430
i386                 randconfig-e003-20200430
x86_64               randconfig-e003-20200430
i386                 randconfig-e002-20200430
x86_64               randconfig-e001-20200430
i386                 randconfig-e001-20200430
x86_64               randconfig-e002-20200429
i386                 randconfig-e003-20200429
i386                 randconfig-e002-20200429
x86_64               randconfig-e003-20200429
i386                 randconfig-e001-20200429
x86_64               randconfig-e001-20200429
i386                 randconfig-f002-20200429
i386                 randconfig-f003-20200429
x86_64               randconfig-f003-20200429
i386                 randconfig-f001-20200429
x86_64               randconfig-f001-20200429
x86_64               randconfig-h001-20200429
i386                 randconfig-h003-20200429
x86_64               randconfig-h003-20200429
i386                 randconfig-h002-20200429
i386                 randconfig-h001-20200429
sparc                randconfig-a001-20200429
ia64                 randconfig-a001-20200429
powerpc              randconfig-a001-20200429
arm                  randconfig-a001-20200429
arc                  randconfig-a001-20200429
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
