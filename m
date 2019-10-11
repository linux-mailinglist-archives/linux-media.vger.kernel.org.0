Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE54D397F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 08:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfJKGpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 02:45:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:55931 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbfJKGpv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 02:45:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 23:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; 
   d="scan'208";a="193443518"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2019 23:45:49 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iIogO-0001rk-Go; Fri, 11 Oct 2019 14:45:48 +0800
Date:   Fri, 11 Oct 2019 14:45:12 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 3ff3a712a9eabb3d7bf52c263dd1ece054345df4
Message-ID: <5da024f8.KwpkXO9IXc37ZPgE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 3ff3a712a9eabb3d7bf52c263dd1ece054345df4  media: ti-vpe: vpe: don't rely on colorspace member for conversion

elapsed time: 803m

configs tested: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

i386                   randconfig-d002-201940
x86_64                 randconfig-d002-201940
x86_64                 randconfig-d004-201940
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arm                              allmodconfig
arm64                            allmodconfig
x86_64                           allyesconfig
i386                             allmodconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                 randconfig-d001-201940
x86_64                 randconfig-d003-201940
i386                   randconfig-d001-201940
i386                   randconfig-d003-201940
i386                   randconfig-d004-201940
x86_64                 randconfig-a004-201940
x86_64                 randconfig-a001-201940
i386                   randconfig-a002-201940
x86_64                 randconfig-a002-201940
i386                   randconfig-a001-201940
i386                   randconfig-a003-201940
i386                   randconfig-a004-201940
x86_64                 randconfig-a003-201940
arm                               allnoconfig
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
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                 randconfig-c001-201940
x86_64                 randconfig-c002-201940
x86_64                 randconfig-c003-201940
x86_64                 randconfig-c004-201940
i386                   randconfig-c001-201940
i386                   randconfig-c002-201940
i386                   randconfig-c003-201940
i386                   randconfig-c004-201940
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
x86_64                           allmodconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
