Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E32378E5F1
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 07:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240580AbjHaFsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 01:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjHaFsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 01:48:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE98ED7
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 22:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693460887; x=1724996887;
  h=date:from:to:cc:subject:message-id;
  bh=ixLxMrRZexiwT7hAa3SiawdWDPnX7YLZ95fXpHs/QTg=;
  b=WFRulGtJzsGQwCluy3i55AsIyX5j82L0Mi9Y7lDmBSI7bta5jBXe9JH+
   zUlT/kb6tlP9uPMGP61ThT+rO1CWH5WyfAJbwTE0fhKpr7LC7AF03tlBw
   1gcOvhqGbdAWAdOVUIndlPttBe0kgUGhs1jQfN2Wz8tPaSGbb1hSHQBJq
   NNTwYv6mvrheZNPc1YZWll1eTryHyDHf9/lVgV2ezyod1X8OHxDMWavzI
   wbToJmg5upssGXrlH6dLgwkMPIKgluiew10azkSRzUUp6tbFyEFBWMhzD
   vjs5gyugJVuQ7Tlpfgw/I9yyChLXSFeDr6OA4sUetkxMqzo9E/Efge/QP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374734411"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="374734411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="883009894"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 22:48:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbaXE-000Akh-2W;
        Thu, 31 Aug 2023 05:48:04 +0000
Date:   Thu, 31 Aug 2023 13:47:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 4c420b729238696d06d39f31fc85a287629a0304
Message-ID: <202308311304.YQ1MSwqW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 4c420b729238696d06d39f31fc85a287629a0304  media: ivsc: Depend on VIDEO_DEV

elapsed time: 909m

configs tested: 197
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230830   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230830   gcc  
arc                   randconfig-001-20230831   gcc  
arc                  randconfig-r015-20230830   gcc  
arc                  randconfig-r023-20230831   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230830   clang
arm                   randconfig-001-20230831   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230830   clang
arm64                randconfig-r036-20230830   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230830   gcc  
csky                 randconfig-r016-20230830   gcc  
csky                 randconfig-r031-20230830   gcc  
hexagon               randconfig-001-20230830   clang
hexagon               randconfig-001-20230831   clang
hexagon               randconfig-002-20230830   clang
hexagon               randconfig-002-20230831   clang
hexagon              randconfig-r003-20230831   clang
hexagon              randconfig-r013-20230831   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230830   clang
i386         buildonly-randconfig-002-20230830   clang
i386         buildonly-randconfig-003-20230830   clang
i386         buildonly-randconfig-004-20230830   clang
i386         buildonly-randconfig-005-20230830   clang
i386         buildonly-randconfig-006-20230830   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230830   clang
i386                  randconfig-002-20230830   clang
i386                  randconfig-003-20230830   clang
i386                  randconfig-004-20230830   clang
i386                  randconfig-005-20230830   clang
i386                  randconfig-006-20230830   clang
i386                  randconfig-011-20230830   gcc  
i386                  randconfig-011-20230831   clang
i386                  randconfig-012-20230830   gcc  
i386                  randconfig-012-20230831   clang
i386                  randconfig-013-20230830   gcc  
i386                  randconfig-013-20230831   clang
i386                  randconfig-014-20230830   gcc  
i386                  randconfig-014-20230831   clang
i386                  randconfig-015-20230830   gcc  
i386                  randconfig-015-20230831   clang
i386                  randconfig-016-20230830   gcc  
i386                  randconfig-016-20230831   clang
i386                 randconfig-r036-20230831   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230830   gcc  
loongarch             randconfig-001-20230831   gcc  
loongarch            randconfig-r022-20230830   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230831   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230830   gcc  
microblaze           randconfig-r014-20230831   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r012-20230830   clang
mips                 randconfig-r024-20230830   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230830   gcc  
nios2                randconfig-r021-20230831   gcc  
nios2                randconfig-r022-20230831   gcc  
nios2                randconfig-r033-20230830   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r025-20230830   gcc  
openrisc             randconfig-r033-20230831   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230830   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r005-20230830   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230830   clang
riscv                 randconfig-001-20230831   gcc  
riscv                randconfig-r014-20230830   gcc  
riscv                randconfig-r016-20230831   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230830   gcc  
s390                  randconfig-001-20230831   clang
s390                 randconfig-r012-20230831   clang
s390                 randconfig-r024-20230831   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r001-20230831   gcc  
sh                   randconfig-r004-20230831   gcc  
sh                   randconfig-r005-20230831   gcc  
sh                   randconfig-r006-20230830   gcc  
sh                   randconfig-r021-20230830   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230831   gcc  
sparc                randconfig-r023-20230830   gcc  
sparc                randconfig-r034-20230831   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230831   gcc  
sparc64              randconfig-r031-20230831   gcc  
sparc64              randconfig-r035-20230831   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230830   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-002-20230830   clang
x86_64       buildonly-randconfig-003-20230830   clang
x86_64       buildonly-randconfig-004-20230830   clang
x86_64       buildonly-randconfig-005-20230830   clang
x86_64       buildonly-randconfig-006-20230830   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230830   gcc  
x86_64                randconfig-002-20230830   gcc  
x86_64                randconfig-003-20230830   gcc  
x86_64                randconfig-004-20230830   gcc  
x86_64                randconfig-005-20230830   gcc  
x86_64                randconfig-006-20230830   gcc  
x86_64                randconfig-011-20230831   gcc  
x86_64                randconfig-012-20230831   gcc  
x86_64                randconfig-013-20230831   gcc  
x86_64                randconfig-014-20230831   gcc  
x86_64                randconfig-015-20230831   gcc  
x86_64                randconfig-016-20230831   gcc  
x86_64                randconfig-071-20230830   clang
x86_64                randconfig-072-20230830   clang
x86_64                randconfig-073-20230830   clang
x86_64                randconfig-074-20230830   clang
x86_64                randconfig-075-20230830   clang
x86_64                randconfig-076-20230830   clang
x86_64               randconfig-r002-20230830   clang
x86_64               randconfig-r004-20230830   clang
x86_64               randconfig-r015-20230831   clang
x86_64               randconfig-r026-20230831   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r002-20230831   gcc  
xtensa               randconfig-r025-20230831   gcc  
xtensa               randconfig-r026-20230830   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
