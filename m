Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9A17678D7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 01:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbjG1XRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 19:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjG1XRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 19:17:40 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898232D7D
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690586259; x=1722122259;
  h=date:from:to:cc:subject:message-id;
  bh=LYQujhTy2WVGA/AQOUnFchFhyf2MzVLY3trwLTg8YIM=;
  b=DElPiWpHiNrv+OXaMg8v8LBJhVH4MeCwNeEvnKHIxwoik3TEbH72PgU0
   0F4hYQx7nCcIBhCA81y8Om9errmOxeEz/j/Rl9dm9Th7vwrbKZOoTB3aJ
   dC8tm0yMfB3frQQbcCpXmgmRZaNIU+aMcFKH8R5myzAHlVuJO5fGWBJnB
   GFtzEL/Yjp+1JJ3G013ojSq1D7XhAmpnck6zo1RyomOTOUAtBXGY/RZn3
   xkzFn1vCIcZbadFmecLrmMOieMF3JUg56u1o58nZug3xLqD6VOYZjezgR
   1Y8tdA2T0FWRoBUcVYW9iZwp3pCelok0N+6eBQYnHwi53DVUMg+Cg+jX4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348307691"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="348307691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 16:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704739842"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="704739842"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 16:17:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPWiH-0003eb-0I;
        Fri, 28 Jul 2023 23:17:37 +0000
Date:   Sat, 29 Jul 2023 07:17:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 38d6a03d2511bee97455b2ea0314c918537ef1ec
Message-ID: <202307290732.a9fUfXko-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 38d6a03d2511bee97455b2ea0314c918537ef1ec  media: go7007: Remove redundant if statement

elapsed time: 725m

configs tested: 174
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230728   gcc  
alpha                randconfig-r021-20230727   gcc  
alpha                randconfig-r033-20230728   gcc  
alpha                randconfig-r034-20230728   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r014-20230728   gcc  
arc                  randconfig-r031-20230728   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230728   gcc  
arm                  randconfig-r046-20230728   gcc  
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230728   gcc  
csky                 randconfig-r011-20230728   gcc  
csky                 randconfig-r021-20230727   gcc  
hexagon              randconfig-r021-20230728   clang
hexagon              randconfig-r025-20230728   clang
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r045-20230728   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r006-20230728   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230728   gcc  
i386                 randconfig-i002-20230728   gcc  
i386                 randconfig-i003-20230728   gcc  
i386                 randconfig-i004-20230728   gcc  
i386                 randconfig-i005-20230728   gcc  
i386                 randconfig-i006-20230728   gcc  
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i016-20230728   clang
i386                 randconfig-r022-20230727   gcc  
i386                 randconfig-r023-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230728   gcc  
loongarch            randconfig-r022-20230728   gcc  
loongarch            randconfig-r023-20230728   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230728   gcc  
m68k                 randconfig-r013-20230728   gcc  
m68k                 randconfig-r021-20230728   gcc  
m68k                 randconfig-r024-20230727   gcc  
m68k                 randconfig-r035-20230728   gcc  
m68k                 randconfig-r036-20230728   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r001-20230728   gcc  
microblaze           randconfig-r006-20230728   gcc  
microblaze           randconfig-r012-20230728   gcc  
microblaze           randconfig-r013-20230728   gcc  
microblaze           randconfig-r016-20230728   gcc  
microblaze           randconfig-r025-20230727   gcc  
microblaze           randconfig-r032-20230728   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           gcw0_defconfig   gcc  
mips                            gpr_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230728   gcc  
nios2                randconfig-r015-20230728   gcc  
nios2                randconfig-r026-20230727   gcc  
openrisc             randconfig-r001-20230728   gcc  
openrisc             randconfig-r002-20230728   gcc  
openrisc             randconfig-r003-20230728   gcc  
openrisc             randconfig-r005-20230728   gcc  
openrisc             randconfig-r016-20230728   gcc  
openrisc             randconfig-r032-20230728   gcc  
openrisc             randconfig-r035-20230728   gcc  
parisc                           alldefconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230728   gcc  
parisc               randconfig-r011-20230728   gcc  
parisc               randconfig-r031-20230728   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r011-20230728   clang
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230728   gcc  
riscv                randconfig-r025-20230728   clang
riscv                randconfig-r031-20230728   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230728   gcc  
s390                 randconfig-r014-20230728   clang
s390                 randconfig-r026-20230728   clang
s390                 randconfig-r044-20230728   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r015-20230728   gcc  
sh                   randconfig-r024-20230727   gcc  
sh                          rsk7269_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230728   gcc  
sparc                randconfig-r024-20230728   gcc  
sparc                randconfig-r032-20230728   gcc  
sparc64              randconfig-r014-20230728   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230728   clang
um                   randconfig-r036-20230728   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r026-20230728   clang
x86_64               randconfig-r034-20230728   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230728   gcc  
xtensa               randconfig-r004-20230728   gcc  
xtensa               randconfig-r026-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
