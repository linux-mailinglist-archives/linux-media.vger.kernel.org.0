Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC77439578
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 14:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhJYMDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 08:03:32 -0400
Received: from mga09.intel.com ([134.134.136.24]:63257 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230090AbhJYMDb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 08:03:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="229492505"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="229492505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 05:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="464841273"
Received: from lkp-server02.sh.intel.com (HELO 74392981b700) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Oct 2021 05:01:08 -0700
Received: from kbuild by 74392981b700 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1meyf5-0001lJ-P7; Mon, 25 Oct 2021 12:01:07 +0000
Date:   Mon, 25 Oct 2021 20:00:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8
Message-ID: <61769c46.igqYJdu68Gqmcjop%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8  media: venus: core: Add sdm660 DT compatible and resource struct

elapsed time: 5632m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211025
arm                          pxa3xx_defconfig
nios2                         3c120_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
arm                            dove_defconfig
mips                          ath79_defconfig
sh                            titan_defconfig
arc                           tb10x_defconfig
ia64                         bigsur_defconfig
arm                         s3c2410_defconfig
arm                          ixp4xx_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nds32                             allnoconfig
arc                              allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20211024
x86_64               randconfig-a004-20211024
x86_64               randconfig-a005-20211024
x86_64               randconfig-a006-20211024
x86_64               randconfig-a001-20211024
x86_64               randconfig-a003-20211024
i386                 randconfig-a003-20211024
i386                 randconfig-a004-20211024
i386                 randconfig-a002-20211024
i386                 randconfig-a005-20211024
i386                 randconfig-a006-20211024
i386                 randconfig-a001-20211024
x86_64               randconfig-a013-20211025
x86_64               randconfig-a015-20211025
x86_64               randconfig-a011-20211025
x86_64               randconfig-a014-20211025
x86_64               randconfig-a016-20211025
x86_64               randconfig-a012-20211025
i386                 randconfig-a012-20211025
i386                 randconfig-a013-20211025
i386                 randconfig-a011-20211025
i386                 randconfig-a016-20211025
i386                 randconfig-a015-20211025
i386                 randconfig-a014-20211025
arc                  randconfig-r043-20211025
s390                 randconfig-r044-20211025
riscv                randconfig-r042-20211025
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a003-20211025
i386                 randconfig-a004-20211025
i386                 randconfig-a002-20211025
i386                 randconfig-a005-20211025
i386                 randconfig-a001-20211025
i386                 randconfig-a006-20211025
hexagon              randconfig-r045-20211021
hexagon              randconfig-r041-20211021
hexagon              randconfig-r045-20211025
hexagon              randconfig-r041-20211025

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
