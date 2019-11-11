Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D35F6FB1
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 09:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfKKI2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 03:28:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:16907 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfKKI2K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 03:28:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Nov 2019 00:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; 
   d="scan'208";a="405129336"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2019 00:28:08 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iU53P-000IDa-U5; Mon, 11 Nov 2019 16:28:07 +0800
Date:   Mon, 11 Nov 2019 16:27:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 dca6b3733a4a46e63603496f544ece8ace541fde
Message-ID: <5dc91b80.xO/HSxIjKbMBkxgw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: dca6b3733a4a46e63603496f544ece8ace541fde  media: Revert "media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding"

elapsed time: 891m

configs tested: 146

The following configs have been built successfully.
More configs may be tested in the coming days.

um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
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
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
parisc                            allnoconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
i386                   randconfig-f002-201945
i386                   randconfig-f001-201945
x86_64                 randconfig-f003-201945
x86_64                 randconfig-f004-201945
x86_64                 randconfig-f002-201945
i386                   randconfig-f003-201945
i386                   randconfig-f004-201945
x86_64                 randconfig-f001-201945
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
x86_64                 randconfig-g002-201945
i386                   randconfig-g004-201945
x86_64                 randconfig-g001-201945
i386                   randconfig-g002-201945
x86_64                 randconfig-g004-201945
x86_64                 randconfig-g003-201945
i386                   randconfig-g003-201945
i386                   randconfig-g001-201945
x86_64                           allyesconfig
i386                             allmodconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                           allmodconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
x86_64                 randconfig-a001-201945
x86_64                 randconfig-a002-201945
x86_64                 randconfig-a003-201945
x86_64                 randconfig-a004-201945
i386                   randconfig-a001-201945
i386                   randconfig-a002-201945
i386                   randconfig-a003-201945
i386                   randconfig-a004-201945
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
alpha                               defconfig
nds32                             allnoconfig
nds32                               defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                 randconfig-e001-201945
x86_64                 randconfig-e002-201945
x86_64                 randconfig-e003-201945
x86_64                 randconfig-e004-201945
i386                   randconfig-e001-201945
i386                   randconfig-e002-201945
i386                   randconfig-e003-201945
i386                   randconfig-e004-201945
x86_64                 randconfig-h002-201945
x86_64                 randconfig-h001-201945
i386                   randconfig-h004-201945
i386                   randconfig-h003-201945
i386                   randconfig-h002-201945
x86_64                 randconfig-h003-201945
i386                   randconfig-h001-201945
x86_64                 randconfig-h004-201945
x86_64                 randconfig-d001-201945
x86_64                 randconfig-d002-201945
x86_64                 randconfig-d003-201945
x86_64                 randconfig-d004-201945
i386                   randconfig-d001-201945
i386                   randconfig-d002-201945
i386                   randconfig-d003-201945
i386                   randconfig-d004-201945
x86_64                 randconfig-b001-201945
x86_64                 randconfig-b002-201945
x86_64                 randconfig-b003-201945
x86_64                 randconfig-b004-201945
i386                   randconfig-b001-201945
i386                   randconfig-b002-201945
i386                   randconfig-b003-201945
i386                   randconfig-b004-201945
x86_64                         rhel-7.6-kasan
x86_64                 randconfig-c001-201945
x86_64                 randconfig-c002-201945
x86_64                 randconfig-c003-201945
x86_64                 randconfig-c004-201945
i386                   randconfig-c001-201945
i386                   randconfig-c002-201945
i386                   randconfig-c003-201945
i386                   randconfig-c004-201945
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
