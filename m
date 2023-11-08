Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC587E6057
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 23:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjKHWJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 17:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjKHWJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 17:09:37 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3480418E
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699481375; x=1731017375;
  h=date:from:to:cc:subject:message-id;
  bh=ciRFFlTmfnS02BVCxt+mhuI61YqfpDqZ+zIdv1c2w2E=;
  b=MIOauXizX+CDZvItDm+cNs/NQvUrf1E1BSX9V348MuQtYJlB8e4UxEiz
   0qVII/calBEvHNQRhWCNAEe4n1fSJ+fQKC1A91puropdCun/nwVzDdVlz
   DYVI/QfqawnyDbFOhEHeM/Lh6gPsBLTdKcWMZp/Pu5t94JLpNax8cQJjT
   yUJovN02IBQOq60Cd9AmwN3u/0ZcVRgO/yB4c5I5Q47gUxEoFgWTl+LuJ
   WoUqigpXBNM1kBCJu/2nbzgHZRE4RlYyCD15iULdlx49E9sls8P6UjhKY
   S2G8mW3rjImIjIJnKtO+PfuI/We1uG36Yz9ZamNlHYQi0fAfzLp6StANX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392742963"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="392742963"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 14:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886792909"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="886792909"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2023 14:09:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r0qjq-0008Do-2f;
        Wed, 08 Nov 2023 22:09:30 +0000
Date:   Thu, 09 Nov 2023 06:08:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 33e85c36810f5d0ec903ee1552381fe10c0f7689
Message-ID: <202311090647.vQEAvTZI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 33e85c36810f5d0ec903ee1552381fe10c0f7689  media: ccs: Print ireal and float limits converted to integers

elapsed time: 3379m

configs tested: 180
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
arc                   randconfig-001-20231107   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231107   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231107   gcc  
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-002-20231107   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-003-20231107   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-004-20231107   gcc  
arm                   randconfig-004-20231108   gcc  
arm64                 randconfig-001-20231107   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-002-20231107   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-003-20231107   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-004-20231107   gcc  
arm64                 randconfig-004-20231108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231107   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231107   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231108   gcc  
i386         buildonly-randconfig-002-20231108   gcc  
i386         buildonly-randconfig-003-20231108   gcc  
i386         buildonly-randconfig-004-20231108   gcc  
i386         buildonly-randconfig-005-20231108   gcc  
i386         buildonly-randconfig-006-20231108   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231108   gcc  
i386                  randconfig-011-20231108   gcc  
i386                  randconfig-012-20231108   gcc  
i386                  randconfig-013-20231108   gcc  
i386                  randconfig-014-20231108   gcc  
i386                  randconfig-015-20231108   gcc  
i386                  randconfig-016-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231107   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231107   gcc  
loongarch             randconfig-002-20231108   gcc  
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
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231107   gcc  
powerpc               randconfig-002-20231107   gcc  
powerpc               randconfig-003-20231107   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc64             randconfig-001-20231107   gcc  
powerpc64             randconfig-002-20231107   gcc  
powerpc64             randconfig-003-20231107   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231107   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231107   gcc  
sh                    randconfig-002-20231108   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231107   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231107   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231107   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231107   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231107   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231107   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231108   gcc  
x86_64       buildonly-randconfig-002-20231108   gcc  
x86_64       buildonly-randconfig-003-20231108   gcc  
x86_64       buildonly-randconfig-004-20231108   gcc  
x86_64       buildonly-randconfig-005-20231108   gcc  
x86_64       buildonly-randconfig-006-20231108   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-071-20231108   gcc  
x86_64                randconfig-072-20231108   gcc  
x86_64                randconfig-073-20231108   gcc  
x86_64                randconfig-074-20231108   gcc  
x86_64                randconfig-075-20231108   gcc  
x86_64                randconfig-076-20231108   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231107   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231107   gcc  
xtensa                randconfig-002-20231108   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
