Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279B0842A8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 04:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfHGCy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 22:54:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:3110 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfHGCy6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Aug 2019 22:54:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 19:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="373621925"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2019 19:54:56 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hvC6K-000By5-Dp; Wed, 07 Aug 2019 10:54:56 +0800
Date:   Wed, 07 Aug 2019 10:54:06 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 d42974e438feebda372fe4a39d7761cc596abc57
Message-ID: <5d4a3d4e.x+ELQ5792tbyb3yT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: d42974e438feebda372fe4a39d7761cc596abc57  media: venus: dec: populate properly timestamps and flags for capture buffers

elapsed time: 2193m

configs tested: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

x86_64                           allmodconfig
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                nfsroot
x86_64                                   rhel
x86_64                               rhel-7.6
powerpc                             defconfig
x86_64                 randconfig-a001-201931
x86_64                 randconfig-a002-201931
x86_64                 randconfig-a003-201931
x86_64                 randconfig-a004-201931
i386                   randconfig-a001-201931
i386                   randconfig-a002-201931
i386                   randconfig-a003-201931
i386                   randconfig-a004-201931
x86_64                 randconfig-c001-201931
x86_64                 randconfig-c002-201931
x86_64                 randconfig-c003-201931
x86_64                 randconfig-c004-201931
i386                   randconfig-c001-201931
i386                   randconfig-c002-201931
i386                   randconfig-c003-201931
i386                   randconfig-c004-201931
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                                   jz4740
mips                      malta_kvm_defconfig
mips                                     txx9
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                                 defconfig
powerpc                           allnoconfig
x86_64                 randconfig-d001-201931
x86_64                 randconfig-d002-201931
x86_64                 randconfig-d003-201931
x86_64                 randconfig-d004-201931
i386                   randconfig-d001-201931
i386                   randconfig-d002-201931
i386                   randconfig-d003-201931
i386                   randconfig-d004-201931
x86_64                 randconfig-f001-201931
x86_64                 randconfig-f002-201931
x86_64                 randconfig-f003-201931
x86_64                 randconfig-f004-201931
i386                   randconfig-f001-201931
i386                   randconfig-f002-201931
i386                   randconfig-f003-201931
i386                   randconfig-f004-201931
arm                              allmodconfig
arm64                            allmodconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
ia64                             alldefconfig
riscv                             allnoconfig
riscv                               defconfig
nds32                               defconfig
alpha                               defconfig
nds32                             allnoconfig
sparc64                          allmodconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
i386                              allnoconfig
i386                                defconfig
i386                             alldefconfig
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
parisc                        c3000_defconfig
parisc                         b180_defconfig
parisc                              defconfig
parisc                            allnoconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
x86_64                           allyesconfig
i386                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
