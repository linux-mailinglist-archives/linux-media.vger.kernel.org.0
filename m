Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B07DA519
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 07:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391992AbfJQFX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 01:23:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:60187 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728999AbfJQFX7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 01:23:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Oct 2019 22:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,306,1566889200"; 
   d="scan'208";a="279757539"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Oct 2019 22:23:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iKyGT-00058N-3C; Thu, 17 Oct 2019 13:23:57 +0800
Date:   Thu, 17 Oct 2019 13:23:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 4b1d7c2760d26363c497b959a81f8d055ba767c1
Message-ID: <5da7fab9.f4obkGDvcms4bSdM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/media_tree.git  media-tree
branch HEAD: 4b1d7c2760d26363c497b959a81f8d055ba767c1  media: staging: media: Make use of devm_platform_ioremap_resource

elapsed time: 579m

configs tested: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                 randconfig-f001-201941
x86_64                 randconfig-f002-201941
x86_64                 randconfig-f003-201941
x86_64                 randconfig-f004-201941
i386                   randconfig-f001-201941
i386                   randconfig-f002-201941
i386                   randconfig-f003-201941
i386                   randconfig-f004-201941
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
x86_64                           allyesconfig
i386                             allmodconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
i386                   randconfig-d002-201941
x86_64                 randconfig-d002-201941
x86_64                 randconfig-d004-201941
i386                   randconfig-d004-201941
x86_64                 randconfig-d003-201941
i386                   randconfig-d003-201941
x86_64                 randconfig-d001-201941
i386                   randconfig-d001-201941
arc                              allyesconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
i386                   randconfig-b001-201941
x86_64                 randconfig-b002-201941
x86_64                 randconfig-b003-201941
i386                   randconfig-b003-201941
i386                   randconfig-b004-201941
x86_64                 randconfig-b004-201941
x86_64                 randconfig-b001-201941
i386                   randconfig-b002-201941
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64                           allmodconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                 randconfig-e004-201941
x86_64                 randconfig-e001-201941
x86_64                 randconfig-e003-201941
x86_64                 randconfig-e002-201941
i386                   randconfig-e003-201941
i386                   randconfig-e004-201941
i386                   randconfig-e001-201941
i386                   randconfig-e002-201941

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
