Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C931B1C8BC4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 15:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgEGNH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 09:07:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:4976 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgEGNH6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 09:07:58 -0400
IronPort-SDR: HF2d/lsYa2SB/iHp3x1Vj7DpZHZrDU1VIQTU3d2t2H1H2wq2lzXkAvgkQvmaKfTxL2YoYa7kzr
 hbO0t/vL1Dyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:07:46 -0700
IronPort-SDR: 7sJZ3h/oGmbqFMYdsvDpPt0PEONXaTz5xvph1n3GbrvZKfjS7eEptrIkkPzO3+3Qsyoh9eb+Xx
 auKaRWE7zy0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="339345322"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 May 2020 06:07:45 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jWgFa-0004cX-VA; Thu, 07 May 2020 21:07:42 +0800
Date:   Thu, 07 May 2020 21:06:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 5b9f8e4ac9473962fa0e824fd1f04138600d459d
Message-ID: <5eb407ea.dUFG7HafxV8YHTCN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 5b9f8e4ac9473962fa0e824fd1f04138600d459d  media: ipu3.rst: fix a build warning

elapsed time: 1371m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm                               allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm64                             allnoconfig
arm64                               defconfig
sparc                            allyesconfig
m68k                             allyesconfig
ia64                             allyesconfig
m68k                             allmodconfig
h8300                            allmodconfig
csky                             allyesconfig
m68k                              allnoconfig
riscv                               defconfig
i386                                defconfig
openrisc                         allyesconfig
nds32                             allnoconfig
c6x                               allnoconfig
mips                              allnoconfig
nios2                            allyesconfig
alpha                               defconfig
parisc                           allyesconfig
nds32                               defconfig
s390                              allnoconfig
um                                allnoconfig
alpha                            allyesconfig
m68k                           sun3_defconfig
s390                             allmodconfig
xtensa                              defconfig
openrisc                            defconfig
s390                                defconfig
i386                              allnoconfig
csky                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
m68k                                defconfig
nios2                               defconfig
c6x                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                       allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200507
x86_64               randconfig-a006-20200507
x86_64               randconfig-a002-20200507
i386                 randconfig-a005-20200507
i386                 randconfig-a004-20200507
i386                 randconfig-a001-20200507
i386                 randconfig-a002-20200507
i386                 randconfig-a003-20200507
i386                 randconfig-a006-20200507
x86_64               randconfig-a003-20200506
x86_64               randconfig-a001-20200506
x86_64               randconfig-a002-20200506
i386                 randconfig-a001-20200506
i386                 randconfig-a002-20200506
i386                 randconfig-a003-20200506
x86_64               randconfig-a015-20200507
x86_64               randconfig-a014-20200507
x86_64               randconfig-a012-20200507
x86_64               randconfig-a013-20200507
x86_64               randconfig-a011-20200507
x86_64               randconfig-a016-20200507
i386                 randconfig-a012-20200507
i386                 randconfig-a016-20200507
i386                 randconfig-a014-20200507
i386                 randconfig-a011-20200507
i386                 randconfig-a015-20200507
i386                 randconfig-a013-20200507
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                               allyesconfig
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
