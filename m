Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46B570776C
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 03:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjERB15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 21:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjERB14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 21:27:56 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81D83599
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 18:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684373275; x=1715909275;
  h=date:from:to:cc:subject:message-id;
  bh=S5jNde25MldhN6LzoPIEf95p1NWtVP2ZJT2cfx0czBY=;
  b=VcSEPazHQm3aEAghAPmkz+tKkPkn0jBo38eNLUTA0taQQCMzkN6SzYvA
   JeJ89gVehXE+WSztrDgke8fOH9fhE3bRFvv7kII7z6ngzdv6pmuG/PudI
   TSPI3StRzU29lOd8sZlJX/5Rt6d4tssTC/ecZnC1EbOPVRcIewzOKx+wZ
   18e+yDsjJ8i+fp7y7mCJjzoSRnamveLhQ+mHkGb7kdwQ3VdKq/I/MbfjD
   VzA2K7jnOJ8xjZWcvShbGsnmCoMhiuBUVKHJs+ZuMTm8J6H89g7BHjb1W
   pxsYl7T+DpB7pcVD3PVp3aNEuxpkBYVeV40BCtJkeFWMBg0QIvZjDvjQP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="355114290"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="355114290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 18:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="814122269"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="814122269"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 18:27:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pzSQr-0009Oj-1S;
        Thu, 18 May 2023 01:27:53 +0000
Date:   Thu, 18 May 2023 09:27:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 a9b5a8a05f0143a48c7bf1d06e9f62bf5e0fdde0
Message-ID: <20230518012700.4KM2_%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230517200055/lkp-src/repo/*/sailus-media-tree
git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: a9b5a8a05f0143a48c7bf1d06e9f62bf5e0fdde0  staging: media: imx: initialize hs_settle to avoid warning

elapsed time: 729m

configs tested: 198
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230517   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230517   gcc  
alpha                randconfig-r034-20230517   gcc  
alpha                randconfig-r035-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230517   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230517   gcc  
arc                  randconfig-r022-20230517   gcc  
arc                  randconfig-r025-20230517   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                       imx_v6_v7_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                  randconfig-r046-20230517   clang
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230517   clang
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230517   gcc  
arm64                randconfig-r023-20230517   gcc  
arm64                randconfig-r034-20230517   clang
csky         buildonly-randconfig-r002-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230517   gcc  
hexagon              randconfig-r012-20230517   clang
hexagon              randconfig-r016-20230517   clang
hexagon              randconfig-r022-20230517   clang
hexagon              randconfig-r035-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
i386                              allnoconfig   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230517   gcc  
ia64                                defconfig   gcc  
ia64                      gensparse_defconfig   gcc  
ia64                 randconfig-r005-20230517   gcc  
ia64                 randconfig-r012-20230517   gcc  
ia64                 randconfig-r013-20230517   gcc  
ia64                 randconfig-r014-20230517   gcc  
ia64                 randconfig-r023-20230517   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230517   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230517   gcc  
loongarch            randconfig-r011-20230517   gcc  
loongarch            randconfig-r032-20230517   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r005-20230517   gcc  
m68k                 randconfig-r015-20230517   gcc  
m68k                 randconfig-r023-20230517   gcc  
microblaze   buildonly-randconfig-r005-20230517   gcc  
microblaze           randconfig-r021-20230517   gcc  
microblaze           randconfig-r025-20230517   gcc  
microblaze           randconfig-r033-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                        maltaup_defconfig   clang
mips                 randconfig-r025-20230517   clang
mips                 randconfig-r032-20230517   gcc  
nios2        buildonly-randconfig-r002-20230517   gcc  
nios2        buildonly-randconfig-r006-20230517   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230517   gcc  
nios2                randconfig-r004-20230517   gcc  
nios2                randconfig-r011-20230517   gcc  
nios2                randconfig-r025-20230517   gcc  
nios2                randconfig-r032-20230517   gcc  
openrisc     buildonly-randconfig-r004-20230517   gcc  
openrisc             randconfig-r001-20230517   gcc  
openrisc             randconfig-r003-20230517   gcc  
openrisc             randconfig-r013-20230517   gcc  
openrisc             randconfig-r026-20230517   gcc  
openrisc             randconfig-r031-20230517   gcc  
openrisc             randconfig-r035-20230517   gcc  
parisc                           alldefconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230517   gcc  
parisc               randconfig-r016-20230517   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc      buildonly-randconfig-r003-20230517   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc              randconfig-r011-20230517   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                      walnut_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230517   gcc  
riscv        buildonly-randconfig-r003-20230517   gcc  
riscv        buildonly-randconfig-r004-20230517   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230517   gcc  
riscv                randconfig-r014-20230517   gcc  
riscv                randconfig-r015-20230517   gcc  
riscv                randconfig-r024-20230517   gcc  
riscv                randconfig-r026-20230517   gcc  
riscv                randconfig-r032-20230517   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230517   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230517   clang
s390                 randconfig-r004-20230517   clang
s390                 randconfig-r005-20230517   clang
s390                 randconfig-r016-20230517   gcc  
s390                 randconfig-r021-20230517   gcc  
s390                 randconfig-r022-20230517   gcc  
s390                 randconfig-r031-20230517   clang
s390                 randconfig-r032-20230517   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230517   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh           buildonly-randconfig-r006-20230517   gcc  
sh                        dreamcast_defconfig   gcc  
sh                   randconfig-r005-20230517   gcc  
sh                   randconfig-r013-20230517   gcc  
sh                   randconfig-r024-20230517   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230517   gcc  
sparc        buildonly-randconfig-r006-20230517   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230517   gcc  
sparc                randconfig-r021-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r036-20230517   gcc  
sparc64      buildonly-randconfig-r001-20230517   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230517   gcc  
xtensa               randconfig-r004-20230517   gcc  
xtensa               randconfig-r012-20230517   gcc  
xtensa               randconfig-r021-20230517   gcc  
xtensa               randconfig-r026-20230517   gcc  
xtensa               randconfig-r031-20230517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
