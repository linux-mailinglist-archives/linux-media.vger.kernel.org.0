Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83E870D402
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 08:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjEWGaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 02:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234983AbjEWGaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 02:30:07 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3479188
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684823403; x=1716359403;
  h=date:from:to:cc:subject:message-id;
  bh=J7F8tya78OVx5F1MkKCoGc5ZYuj2cCZWNjFkTvHQucY=;
  b=nbxvLbw+hkV7wfkkjGbj7rDGOX6Z2pjZ8bl+iMiN+6D/Xr/dPQHGSWbr
   hZX8euqUmcoQU4R21i69T+KkPCjeYyGJR62VqP/qvn6lOlPVs1xtMQIz/
   UV+HSrAa9o1pu4/pFo1c0WDecBHhAQAi4kTElC3zB8o1ZRnyngkJSx6Ds
   8yliQHq1U4TlxYCXf48/r0iU63FLe/etsE+6HI9aMk+e/RC1TkHuttJzw
   2xdg2QcX5Nt8SFRwiaA7DPhWmK3tXsghqBfCcdY1J/F9JlbnyhrAC4ZGM
   N82GHMTjf+9rEgBsvVyBc6o8PYrA/vHXPVTHs6RbOLDVhG6hNBxNzQaDF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439500852"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="439500852"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 23:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="703816983"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="703816983"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 May 2023 23:29:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1LWj-000DXh-12;
        Tue, 23 May 2023 06:29:45 +0000
Date:   Tue, 23 May 2023 14:29:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD SUCCESS
 d5b62de50dc7d055cc998e5bcd35d573bfbbd344
Message-ID: <20230523062940.tu6jI%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230523114855/lkp-src/repo/*/sailus-media-tree
git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: d5b62de50dc7d055cc998e5bcd35d573bfbbd344  debug print

elapsed time: 815m

configs tested: 159
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230522   gcc  
alpha        buildonly-randconfig-r004-20230521   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230522   gcc  
arc                  randconfig-r015-20230522   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230522   clang
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230522   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230522   clang
csky                                defconfig   gcc  
csky                 randconfig-r013-20230522   gcc  
hexagon      buildonly-randconfig-r002-20230521   clang
hexagon              randconfig-r003-20230521   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230521   gcc  
ia64                 randconfig-r031-20230521   gcc  
ia64                 randconfig-r035-20230522   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230521   gcc  
loongarch            randconfig-r026-20230522   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230522   gcc  
microblaze   buildonly-randconfig-r001-20230522   gcc  
microblaze           randconfig-r022-20230522   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230522   clang
mips                 randconfig-r033-20230522   clang
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r003-20230522   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230521   gcc  
openrisc             randconfig-r036-20230521   gcc  
parisc       buildonly-randconfig-r001-20230521   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230521   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc              randconfig-r001-20230522   gcc  
powerpc              randconfig-r023-20230522   clang
powerpc              randconfig-r034-20230521   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230521   gcc  
riscv                randconfig-r031-20230522   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230522   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230521   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                   randconfig-r002-20230522   gcc  
sh                   randconfig-r016-20230521   gcc  
sh                   randconfig-r035-20230521   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230521   gcc  
sparc                randconfig-r014-20230521   gcc  
sparc64      buildonly-randconfig-r006-20230522   gcc  
sparc64              randconfig-r005-20230522   gcc  
sparc64              randconfig-r032-20230522   gcc  
sparc64              randconfig-r033-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64               randconfig-r025-20230522   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230521   gcc  
xtensa               randconfig-r003-20230522   gcc  
xtensa               randconfig-r004-20230521   gcc  
xtensa               randconfig-r004-20230522   gcc  
xtensa               randconfig-r011-20230522   gcc  
xtensa               randconfig-r014-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
