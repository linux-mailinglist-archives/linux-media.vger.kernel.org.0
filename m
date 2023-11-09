Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291F27E67D7
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 11:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbjKIKYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 05:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbjKIKXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 05:23:55 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2A8258D
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 02:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699525432; x=1731061432;
  h=date:from:to:cc:subject:message-id;
  bh=NmxcfUASvEE8SDAXZfw9DC4NF88I4cS0kMnzPczXNHs=;
  b=GXVLAx9cyFoeKgyiam7NoJXZ1ZFDTHNV3qW2d6rTcNKtPNe2cTIzLNB1
   Ub1kixBO/M8w5OuuE9Bcf1RRYqaVig6D27xyzV7EKKRGtm7ijAFy6Xll/
   QZGqK/g7VggDV3dY2/Ba6vJivBziWeAZBYpoe+LEKAQnr5N2EW4waFfR3
   72EGwXZgmIhrxLq0N3nYgYW9Ng48q/lbBRL3gFdmaHBcZAQG/Grygo+tl
   8FSRJUoM0ZQ96jZMUt8ZyZkzM6GIE1OHXfTSSODjXqpdx3ewgzWQtBveZ
   woOZReKMjpHYkUJH4wtVOi/6dYvFKXvi7rQiUcFjRnjotRSxcVps3YMgt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370160264"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="370160264"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 02:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010590991"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1010590991"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2023 02:23:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r12CS-0008eB-3C;
        Thu, 09 Nov 2023 10:23:48 +0000
Date:   Thu, 09 Nov 2023 18:23:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 62bdf633090d684c3ac6d3b46e926c0ac8cef466
Message-ID: <202311091833.RHnAq3pD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 62bdf633090d684c3ac6d3b46e926c0ac8cef466  media: v4l: subdev: Return NULL from pad access functions on error

elapsed time: 1462m

configs tested: 268
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-001-20231109   gcc  
arc                   randconfig-002-20231108   gcc  
arc                   randconfig-002-20231109   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-001-20231109   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-002-20231109   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-003-20231109   gcc  
arm                   randconfig-004-20231108   gcc  
arm                   randconfig-004-20231109   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-001-20231109   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-002-20231109   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-003-20231109   gcc  
arm64                 randconfig-004-20231108   gcc  
arm64                 randconfig-004-20231109   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-001-20231109   gcc  
csky                  randconfig-002-20231108   gcc  
csky                  randconfig-002-20231109   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231108   gcc  
i386         buildonly-randconfig-001-20231109   gcc  
i386         buildonly-randconfig-002-20231108   gcc  
i386         buildonly-randconfig-002-20231109   gcc  
i386         buildonly-randconfig-003-20231108   gcc  
i386         buildonly-randconfig-003-20231109   gcc  
i386         buildonly-randconfig-004-20231108   gcc  
i386         buildonly-randconfig-004-20231109   gcc  
i386         buildonly-randconfig-005-20231108   gcc  
i386         buildonly-randconfig-005-20231109   gcc  
i386         buildonly-randconfig-006-20231108   gcc  
i386         buildonly-randconfig-006-20231109   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-001-20231109   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-002-20231109   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-003-20231109   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-004-20231109   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-005-20231109   gcc  
i386                  randconfig-006-20231108   gcc  
i386                  randconfig-006-20231109   gcc  
i386                  randconfig-011-20231108   gcc  
i386                  randconfig-011-20231109   gcc  
i386                  randconfig-012-20231108   gcc  
i386                  randconfig-012-20231109   gcc  
i386                  randconfig-013-20231108   gcc  
i386                  randconfig-013-20231109   gcc  
i386                  randconfig-014-20231108   gcc  
i386                  randconfig-014-20231109   gcc  
i386                  randconfig-015-20231108   gcc  
i386                  randconfig-015-20231109   gcc  
i386                  randconfig-016-20231108   gcc  
i386                  randconfig-016-20231109   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-001-20231109   gcc  
loongarch             randconfig-002-20231108   gcc  
loongarch             randconfig-002-20231109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-001-20231109   gcc  
nios2                 randconfig-002-20231108   gcc  
nios2                 randconfig-002-20231109   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-001-20231109   gcc  
parisc                randconfig-002-20231108   gcc  
parisc                randconfig-002-20231109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-001-20231109   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-002-20231109   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc               randconfig-003-20231109   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-001-20231109   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-002-20231109   gcc  
powerpc64             randconfig-003-20231108   gcc  
powerpc64             randconfig-003-20231109   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-001-20231109   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                 randconfig-002-20231109   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-001-20231109   gcc  
s390                  randconfig-002-20231108   gcc  
s390                  randconfig-002-20231109   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-001-20231109   gcc  
sh                    randconfig-002-20231108   gcc  
sh                    randconfig-002-20231109   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-001-20231109   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc                 randconfig-002-20231109   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-001-20231109   gcc  
sparc64               randconfig-002-20231108   gcc  
sparc64               randconfig-002-20231109   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-001-20231109   gcc  
um                    randconfig-002-20231108   gcc  
um                    randconfig-002-20231109   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231108   gcc  
x86_64       buildonly-randconfig-001-20231109   gcc  
x86_64       buildonly-randconfig-002-20231108   gcc  
x86_64       buildonly-randconfig-002-20231109   gcc  
x86_64       buildonly-randconfig-003-20231108   gcc  
x86_64       buildonly-randconfig-003-20231109   gcc  
x86_64       buildonly-randconfig-004-20231108   gcc  
x86_64       buildonly-randconfig-004-20231109   gcc  
x86_64       buildonly-randconfig-005-20231108   gcc  
x86_64       buildonly-randconfig-005-20231109   gcc  
x86_64       buildonly-randconfig-006-20231108   gcc  
x86_64       buildonly-randconfig-006-20231109   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-001-20231109   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-002-20231109   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-003-20231109   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-004-20231109   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-005-20231109   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-006-20231109   gcc  
x86_64                randconfig-011-20231108   gcc  
x86_64                randconfig-011-20231109   gcc  
x86_64                randconfig-012-20231108   gcc  
x86_64                randconfig-012-20231109   gcc  
x86_64                randconfig-013-20231108   gcc  
x86_64                randconfig-013-20231109   gcc  
x86_64                randconfig-014-20231108   gcc  
x86_64                randconfig-014-20231109   gcc  
x86_64                randconfig-015-20231108   gcc  
x86_64                randconfig-015-20231109   gcc  
x86_64                randconfig-016-20231108   gcc  
x86_64                randconfig-016-20231109   gcc  
x86_64                randconfig-071-20231108   gcc  
x86_64                randconfig-071-20231109   gcc  
x86_64                randconfig-072-20231108   gcc  
x86_64                randconfig-072-20231109   gcc  
x86_64                randconfig-073-20231108   gcc  
x86_64                randconfig-073-20231109   gcc  
x86_64                randconfig-074-20231108   gcc  
x86_64                randconfig-074-20231109   gcc  
x86_64                randconfig-075-20231108   gcc  
x86_64                randconfig-075-20231109   gcc  
x86_64                randconfig-076-20231108   gcc  
x86_64                randconfig-076-20231109   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-001-20231109   gcc  
xtensa                randconfig-002-20231108   gcc  
xtensa                randconfig-002-20231109   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
