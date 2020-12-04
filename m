Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FF52CE6F5
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 05:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgLDEMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 23:12:46 -0500
Received: from mga07.intel.com ([134.134.136.100]:33248 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgLDEMq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 23:12:46 -0500
IronPort-SDR: 1+BDqrZWQ68WIwna6nQGg/Scqdu+wHtxRIms1bJcPRSFzQ0JnpmizllaKi2s7Ktu4IVcbIEJna
 /8uniigDi/eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="237442633"
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; 
   d="scan'208";a="237442633"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 20:12:04 -0800
IronPort-SDR: 9nR1W+yxK4smfpDQu2IqBRdp9d2mZ96+kOoBxyFFVLhXU6WJ4n8PjfAtd92Yv9bOgAwVwl5sYZ
 aiWl8kDAQ2cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; 
   d="scan'208";a="336216368"
Received: from lkp-server02.sh.intel.com (HELO 2c2f8f825ef9) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2020 20:12:02 -0800
Received: from kbuild by 2c2f8f825ef9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kl2Ru-00000b-5J; Fri, 04 Dec 2020 04:12:02 +0000
Date:   Fri, 04 Dec 2020 12:11:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 fb1f3a1befdb43a40255d35d50ac49a332232fc0
Message-ID: <5fc9b6ea.h/TjFAMYTtR6e+O3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: fb1f3a1befdb43a40255d35d50ac49a332232fc0  media: pixfmt-compressed.rst: fix 'bullet' formatting

elapsed time: 1035m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                         shannon_defconfig
mips                     decstation_defconfig
mips                         mpc30x_defconfig
mips                           ci20_defconfig
riscv                            alldefconfig
powerpc                      ppc6xx_defconfig
arm                            hisi_defconfig
arm                            dove_defconfig
arc                     nsimosci_hs_defconfig
arm                          imote2_defconfig
nds32                            alldefconfig
mips                      fuloong2e_defconfig
sh                           se7724_defconfig
powerpc                      obs600_defconfig
arm                          pcm027_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                            zx1_defconfig
arm                            mps2_defconfig
arm                          simpad_defconfig
arm                          collie_defconfig
nios2                         3c120_defconfig
powerpc                     asp8347_defconfig
arc                           tb10x_defconfig
c6x                              alldefconfig
arm                           h3600_defconfig
mips                          malta_defconfig
powerpc                     sequoia_defconfig
um                            kunit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201204
x86_64               randconfig-a006-20201204
x86_64               randconfig-a002-20201204
x86_64               randconfig-a001-20201204
x86_64               randconfig-a005-20201204
x86_64               randconfig-a003-20201204
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
