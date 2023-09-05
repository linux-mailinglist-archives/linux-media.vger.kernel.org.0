Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD65792517
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbjIEQBX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245698AbjIECXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 22:23:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EC2CC6
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 19:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693880620; x=1725416620;
  h=date:from:to:cc:subject:message-id;
  bh=E1PYKL/XlO2etWP1YfEVQ7wiSXstpr9L0mO5d26K4no=;
  b=LblDgxhvpif73Vpf9jBeV2pEzsjouQKI5wRtZv+CgbU+TKaEM1o7uLtN
   4zJEP3Xa5prNwab1wxUsegLmnjrbmAqa816C77qleZNu7a12EOt/1noHp
   IKLgXq3Sesi0lLmg9OwcZebEuUHSsXg+rOC4m/r4vKyr3GYNSYyEOxDVN
   IupB95WbfL94t17OACxMxjtzysnZIa0ULY2R+joreZxUMDjL7BVwJ45Mu
   Rx5pDgbhT1f9nDZ+h3ZkmBYfJOGXxzWuFQska2S3JpoHyUmxmdi7u8YC+
   2iQs6MDiyqJQcw65qT1YUZOmOwBHLPElRb9oOiS5PVNT6TnFdXO1p1fXq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356994483"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356994483"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 19:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="776024835"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="776024835"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Sep 2023 19:23:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdLij-00018g-2B;
        Tue, 05 Sep 2023 02:23:16 +0000
Date:   Tue, 05 Sep 2023 10:21:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 69d5111f677f4d85032ad288f98044407464f0f5
Message-ID: <202309051050.EoSj0xF5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 69d5111f677f4d85032ad288f98044407464f0f5  media: i2c: rdacm21: Remove an incorrect fwnode_handle_put() call

elapsed time: 722m

configs tested: 166
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
arc                   randconfig-001-20230904   gcc  
arc                  randconfig-r026-20230904   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230904   gcc  
arm                  randconfig-r002-20230904   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230904   gcc  
arm64                randconfig-r036-20230904   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230904   gcc  
hexagon               randconfig-001-20230904   clang
hexagon               randconfig-002-20230904   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230904   gcc  
i386         buildonly-randconfig-002-20230904   gcc  
i386         buildonly-randconfig-003-20230904   gcc  
i386         buildonly-randconfig-004-20230904   gcc  
i386         buildonly-randconfig-005-20230904   gcc  
i386         buildonly-randconfig-006-20230904   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230904   gcc  
i386                  randconfig-002-20230904   gcc  
i386                  randconfig-003-20230904   gcc  
i386                  randconfig-004-20230904   gcc  
i386                  randconfig-005-20230904   gcc  
i386                  randconfig-006-20230904   gcc  
i386                  randconfig-011-20230904   clang
i386                  randconfig-012-20230904   clang
i386                  randconfig-013-20230904   clang
i386                  randconfig-014-20230904   clang
i386                  randconfig-015-20230904   clang
i386                  randconfig-016-20230904   clang
i386                 randconfig-r011-20230904   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230904   gcc  
loongarch            randconfig-r006-20230904   gcc  
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
mips                 randconfig-r013-20230904   gcc  
mips                 randconfig-r015-20230904   gcc  
mips                 randconfig-r022-20230904   gcc  
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230904   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r012-20230904   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230904   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc              randconfig-r004-20230904   gcc  
powerpc64            randconfig-r003-20230904   gcc  
powerpc64            randconfig-r035-20230904   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230904   gcc  
riscv                randconfig-r021-20230904   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230904   clang
s390                 randconfig-r025-20230904   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r033-20230904   gcc  
sh                          rsk7264_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230904   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230904   clang
um                   randconfig-r014-20230904   gcc  
um                   randconfig-r016-20230904   gcc  
um                   randconfig-r023-20230904   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230904   gcc  
x86_64       buildonly-randconfig-002-20230904   gcc  
x86_64       buildonly-randconfig-003-20230904   gcc  
x86_64       buildonly-randconfig-004-20230904   gcc  
x86_64       buildonly-randconfig-005-20230904   gcc  
x86_64       buildonly-randconfig-006-20230904   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230904   clang
x86_64                randconfig-002-20230904   clang
x86_64                randconfig-003-20230904   clang
x86_64                randconfig-004-20230904   clang
x86_64                randconfig-005-20230904   clang
x86_64                randconfig-006-20230904   clang
x86_64                randconfig-011-20230904   gcc  
x86_64                randconfig-012-20230904   gcc  
x86_64                randconfig-013-20230904   gcc  
x86_64                randconfig-014-20230904   gcc  
x86_64                randconfig-015-20230904   gcc  
x86_64                randconfig-016-20230904   gcc  
x86_64                randconfig-071-20230904   gcc  
x86_64                randconfig-072-20230904   gcc  
x86_64                randconfig-073-20230904   gcc  
x86_64                randconfig-074-20230904   gcc  
x86_64                randconfig-075-20230904   gcc  
x86_64                randconfig-076-20230904   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
