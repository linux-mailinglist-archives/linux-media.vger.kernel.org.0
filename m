Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082F1712DD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 09:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388342AbfGWH2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 03:28:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:16519 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729058AbfGWH2o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 03:28:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 00:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,298,1559545200"; 
   d="scan'208";a="163414842"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jul 2019 00:28:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hppE1-000J5X-Vt; Tue, 23 Jul 2019 15:28:41 +0800
Date:   Tue, 23 Jul 2019 15:27:58 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 66193b24514c91aeda88da744554b2665471aeae
Message-ID: <5d36b6fe.7SbTWwsz7ALMyjcR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 66193b24514c91aeda88da744554b2665471aeae  media: dvbsky: add support for Mygica T230C v2

elapsed time: 707m

configs tested: 109

The following configs have been built successfully.
More configs may be tested in the coming days.

mips                             allmodconfig
mips                      malta_kvm_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
x86_64                 randconfig-g001-201929
x86_64                 randconfig-g002-201929
x86_64                 randconfig-g003-201929
x86_64                 randconfig-g004-201929
i386                   randconfig-g001-201929
i386                   randconfig-g002-201929
i386                   randconfig-g003-201929
i386                   randconfig-g004-201929
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
riscv                              tinyconfig
i386                               tinyconfig
x86_64                           allmodconfig
x86_64                           allyesconfig
i386                             alldefconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                 randconfig-h001-201929
x86_64                 randconfig-h002-201929
x86_64                 randconfig-h003-201929
x86_64                 randconfig-h004-201929
i386                   randconfig-h001-201929
i386                   randconfig-h002-201929
i386                   randconfig-h003-201929
i386                   randconfig-h004-201929
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                                   jz4740
mips                                     txx9
x86_64                 randconfig-e001-201929
x86_64                 randconfig-e002-201929
x86_64                 randconfig-e003-201929
x86_64                 randconfig-e004-201929
i386                   randconfig-e001-201929
i386                   randconfig-e002-201929
i386                   randconfig-e003-201929
i386                   randconfig-e004-201929
i386                             allmodconfig
arm                              allmodconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
i386                              allnoconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
ia64                             alldefconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
openrisc                 simple_smp_defconfig

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
