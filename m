Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EE770EBAD
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 05:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239231AbjEXDIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 23:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239186AbjEXDIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 23:08:47 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07D718C
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684897725; x=1716433725;
  h=date:from:to:cc:subject:message-id;
  bh=9sS6zXUdY83ozxDRr4aq3GDMVL3uy1LaajGjDNLFGqI=;
  b=c3cKgoDnqIOawKUOKo2AItr9P/LcN7QbzoHng710XIcmhfWJtYf4emmy
   uZ2MMlZLKdqRo5fI2gkoRT2CtXIYwgv+DtdA7Fx1e95M9xvRWhSMwuLed
   RNu9HuUdU8esnzHKDMaPqa1EAkE1alDL38lBRfieKqcF18HQA6o2gagL5
   Z/qcYs7eCK1kAFRCxN/8ym/OKa0H1LkuYcKJkbyIzwqJkoNNH8uhI4KHH
   cHkfxvuZn4/eu8NA4XLMafUtt/FyClOjXeCUFHOaRNbrvVCNmf9+h7TZs
   pgiJpk6AQ9TBQ7WO9JVPz7e0C0UR4Gqmyg0s8VTMDmWNE4xQY1lZl8JK5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356660835"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="356660835"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 20:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848560807"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="848560807"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 May 2023 20:08:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1erj-000EL8-21;
        Wed, 24 May 2023 03:08:43 +0000
Date:   Wed, 24 May 2023 11:08:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD SUCCESS
 c5f8318fc54a441e139cf184714418fc432ca1a9
Message-ID: <20230524030839.CExjY%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230524105746/lkp-src/repo/*/sailus-media-tree
git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: c5f8318fc54a441e139cf184714418fc432ca1a9  media: Documentation: v4l: Document sub-device notifiers

elapsed time: 725m

configs tested: 155
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230522   gcc  
alpha                randconfig-r024-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc          buildonly-randconfig-r003-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230522   gcc  
arc                  randconfig-r023-20230522   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230522   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230522   clang
arm64                randconfig-r033-20230521   clang
arm64                randconfig-r034-20230522   gcc  
csky         buildonly-randconfig-r004-20230521   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r024-20230521   clang
hexagon              randconfig-r036-20230521   clang
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
i386                 randconfig-r026-20230522   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230521   gcc  
ia64                 randconfig-r013-20230521   gcc  
ia64                 randconfig-r035-20230522   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230521   gcc  
loongarch            randconfig-r032-20230522   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230521   gcc  
m68k                 randconfig-r031-20230522   gcc  
microblaze           randconfig-r015-20230522   gcc  
microblaze           randconfig-r031-20230521   gcc  
microblaze           randconfig-r034-20230521   gcc  
microblaze           randconfig-r035-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230521   clang
mips                 randconfig-r022-20230522   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230522   gcc  
openrisc     buildonly-randconfig-r002-20230521   gcc  
openrisc             randconfig-r003-20230522   gcc  
parisc       buildonly-randconfig-r002-20230522   gcc  
parisc       buildonly-randconfig-r004-20230522   gcc  
parisc       buildonly-randconfig-r006-20230521   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230521   gcc  
parisc               randconfig-r016-20230522   gcc  
parisc               randconfig-r036-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r016-20230521   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230521   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230522   gcc  
s390                 randconfig-r023-20230521   gcc  
s390                 randconfig-r033-20230522   gcc  
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230521   gcc  
sh                   randconfig-r013-20230522   gcc  
sh                   randconfig-r014-20230522   gcc  
sh                   randconfig-r021-20230521   gcc  
sparc        buildonly-randconfig-r005-20230521   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230521   gcc  
sparc64              randconfig-r002-20230521   gcc  
sparc64              randconfig-r002-20230522   gcc  
sparc64              randconfig-r006-20230521   gcc  
sparc64              randconfig-r025-20230521   gcc  
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
xtensa               randconfig-r022-20230521   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
