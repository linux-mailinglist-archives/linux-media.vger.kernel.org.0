Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC7EF172A
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 14:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfKFNcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 08:32:07 -0500
Received: from mga03.intel.com ([134.134.136.65]:35436 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbfKFNcH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 08:32:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 05:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; 
   d="scan'208";a="402355248"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2019 05:32:05 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iSLPo-000FV2-SK; Wed, 06 Nov 2019 21:32:04 +0800
Date:   Wed, 06 Nov 2019 21:31:52 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 d065070e009b0c0b2ab4ee09972a41b072f6ed54
Message-ID: <5dc2cb48.DALwdHQXLgxxv8lk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: d065070e009b0c0b2ab4ee09972a41b072f6ed54  media: hi556: Add support for Hi-556 sensor

elapsed time: 1502m

configs tested: 137

The following configs have been built successfully.
More configs may be tested in the coming days.

ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
x86_64                 randconfig-c001-201944
x86_64                 randconfig-c002-201944
i386                   randconfig-c001-201944
i386                   randconfig-c004-201944
i386                   randconfig-c003-201944
i386                   randconfig-c002-201944
x86_64                 randconfig-c004-201944
x86_64                 randconfig-c003-201944
i386                              allnoconfig
i386                                defconfig
i386                             alldefconfig
i386                   randconfig-d002-201944
x86_64                 randconfig-d002-201944
x86_64                 randconfig-d004-201944
i386                   randconfig-d004-201944
x86_64                 randconfig-d003-201944
i386                   randconfig-d003-201944
x86_64                 randconfig-d001-201944
i386                   randconfig-d001-201944
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                              fedora-25
x86_64                                  kexec
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
i386                   randconfig-b001-201944
x86_64                 randconfig-b002-201944
i386                   randconfig-b003-201944
x86_64                 randconfig-b003-201944
i386                   randconfig-b004-201944
x86_64                 randconfig-b001-201944
x86_64                 randconfig-b004-201944
i386                   randconfig-b002-201944
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                 randconfig-e004-201944
x86_64                 randconfig-e001-201944
x86_64                 randconfig-e003-201944
x86_64                 randconfig-e002-201944
i386                   randconfig-e003-201944
i386                   randconfig-e001-201944
i386                   randconfig-e004-201944
i386                   randconfig-e002-201944
i386                   randconfig-f002-201944
i386                   randconfig-f001-201944
x86_64                 randconfig-f003-201944
x86_64                 randconfig-f004-201944
x86_64                 randconfig-f002-201944
i386                   randconfig-f003-201944
i386                   randconfig-f004-201944
x86_64                 randconfig-f001-201944
x86_64                 randconfig-g002-201944
i386                   randconfig-g004-201944
x86_64                 randconfig-g001-201944
i386                   randconfig-g002-201944
x86_64                 randconfig-g004-201944
x86_64                 randconfig-g003-201944
i386                   randconfig-g003-201944
i386                   randconfig-g001-201944
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
arm                              allmodconfig
arm64                            allmodconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
x86_64                 randconfig-a001-201944
x86_64                 randconfig-a002-201944
x86_64                 randconfig-a003-201944
x86_64                 randconfig-a004-201944
i386                   randconfig-a001-201944
i386                   randconfig-a002-201944
i386                   randconfig-a003-201944
i386                   randconfig-a004-201944
x86_64                           allyesconfig
i386                             allmodconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                           allmodconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
