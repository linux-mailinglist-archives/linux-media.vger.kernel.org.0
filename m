Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9AD7101F8
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 02:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjEYAYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 20:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjEYAYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 20:24:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB2A135
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 17:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684974272; x=1716510272;
  h=date:from:to:cc:subject:message-id;
  bh=2Z6948UIzlC1Ff1uAlMYnIkYgcAYaMsAf1Jc/0DsMLk=;
  b=NtINQ7R4ygIqv4EpTDqCnKUpxtoSQMmG/Vo30zTL6dIpOUC1vydGN9wq
   zi63evgKqH7KllOBRI83BwBMaowWwUE8nblx1CKnW6O3Kk3EDKJdaEyGk
   pUTHOBmm6+FpzFoZTn3SUbuctmKEHQU9aRJ02PqSJjnBNsZ9W0Xex4ugZ
   ozECYzV1VhqbqC+WzcxuZpwqKcimLNwppY1TC1INQVqMtheulCxs546JH
   ZJx733cYNXVNA+uUfNO2dTxxG2Fxl5e2DJfUx3JZt0mAd6n4QPTuJiyhP
   cWkK9/rxxtl9TJbwJK0M4V2I+3ua2kO5a3aC90x9t7WfP08SeMKVvo2El
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="419452824"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="419452824"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 17:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034760976"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="1034760976"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 May 2023 17:24:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1ymI-000FHm-01;
        Thu, 25 May 2023 00:24:26 +0000
Date:   Thu, 25 May 2023 08:24:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD SUCCESS
 86db366ca359f8a98aae408159c98212d2456814
Message-ID: <20230525002413.y6rpg%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230524230549/lkp-src/repo/*/sailus-media-tree
git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: 86db366ca359f8a98aae408159c98212d2456814  media: Documentation: v4l: Document sub-device notifiers

elapsed time: 725m

configs tested: 171
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230524   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230524   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230524   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r032-20230524   clang
arm                  randconfig-r046-20230524   gcc  
arm                         s5pv210_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230524   gcc  
csky         buildonly-randconfig-r002-20230524   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230524   gcc  
hexagon              randconfig-r026-20230524   clang
hexagon              randconfig-r034-20230524   clang
hexagon              randconfig-r041-20230524   clang
hexagon              randconfig-r045-20230524   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i051-20230524   gcc  
i386                 randconfig-i052-20230524   gcc  
i386                 randconfig-i053-20230524   gcc  
i386                 randconfig-i054-20230524   gcc  
i386                 randconfig-i055-20230524   gcc  
i386                 randconfig-i056-20230524   gcc  
i386                 randconfig-i061-20230524   gcc  
i386                 randconfig-i062-20230524   gcc  
i386                 randconfig-i063-20230524   gcc  
i386                 randconfig-i064-20230524   gcc  
i386                 randconfig-i065-20230524   gcc  
i386                 randconfig-i066-20230524   gcc  
i386                 randconfig-i071-20230524   clang
i386                 randconfig-i072-20230524   clang
i386                 randconfig-i073-20230524   clang
i386                 randconfig-i074-20230524   clang
i386                 randconfig-i075-20230524   clang
i386                 randconfig-i076-20230524   clang
i386                 randconfig-i081-20230524   clang
i386                 randconfig-i082-20230524   clang
i386                 randconfig-i083-20230524   clang
i386                 randconfig-i084-20230524   clang
i386                 randconfig-i085-20230524   clang
i386                 randconfig-i086-20230524   clang
i386                 randconfig-i091-20230524   gcc  
i386                 randconfig-i092-20230524   gcc  
i386                 randconfig-i093-20230524   gcc  
i386                 randconfig-i094-20230524   gcc  
i386                 randconfig-i095-20230524   gcc  
i386                 randconfig-i096-20230524   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230524   gcc  
ia64         buildonly-randconfig-r006-20230524   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230524   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230524   gcc  
microblaze           randconfig-r012-20230524   gcc  
microblaze           randconfig-r015-20230524   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r006-20230524   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r022-20230524   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230524   gcc  
parisc               randconfig-r005-20230524   gcc  
parisc               randconfig-r031-20230524   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230524   clang
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r011-20230524   clang
powerpc              randconfig-r014-20230524   clang
powerpc              randconfig-r024-20230524   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230524   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230524   gcc  
s390                 randconfig-r044-20230524   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r015-20230524   gcc  
sh                           se7619_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230524   gcc  
sparc                randconfig-r035-20230524   gcc  
sparc64      buildonly-randconfig-r003-20230524   gcc  
sparc64              randconfig-r012-20230524   gcc  
sparc64              randconfig-r023-20230524   gcc  
sparc64              randconfig-r036-20230524   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230524   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230524   gcc  
x86_64               randconfig-a002-20230524   gcc  
x86_64               randconfig-a003-20230524   gcc  
x86_64               randconfig-a004-20230524   gcc  
x86_64               randconfig-a005-20230524   gcc  
x86_64               randconfig-a006-20230524   gcc  
x86_64               randconfig-a011-20230524   clang
x86_64               randconfig-a012-20230524   clang
x86_64               randconfig-a013-20230524   clang
x86_64               randconfig-a014-20230524   clang
x86_64               randconfig-a015-20230524   clang
x86_64               randconfig-a016-20230524   clang
x86_64               randconfig-x051-20230524   clang
x86_64               randconfig-x052-20230524   clang
x86_64               randconfig-x053-20230524   clang
x86_64               randconfig-x054-20230524   clang
x86_64               randconfig-x055-20230524   clang
x86_64               randconfig-x056-20230524   clang
x86_64               randconfig-x061-20230524   clang
x86_64               randconfig-x062-20230524   clang
x86_64               randconfig-x063-20230524   clang
x86_64               randconfig-x064-20230524   clang
x86_64               randconfig-x065-20230524   clang
x86_64               randconfig-x066-20230524   clang
x86_64               randconfig-x071-20230524   gcc  
x86_64               randconfig-x072-20230524   gcc  
x86_64               randconfig-x073-20230524   gcc  
x86_64               randconfig-x074-20230524   gcc  
x86_64               randconfig-x075-20230524   gcc  
x86_64               randconfig-x076-20230524   gcc  
x86_64               randconfig-x081-20230524   gcc  
x86_64               randconfig-x082-20230524   gcc  
x86_64               randconfig-x083-20230524   gcc  
x86_64               randconfig-x084-20230524   gcc  
x86_64               randconfig-x085-20230524   gcc  
x86_64               randconfig-x086-20230524   gcc  
x86_64               randconfig-x091-20230524   clang
x86_64               randconfig-x092-20230524   clang
x86_64               randconfig-x093-20230524   clang
x86_64               randconfig-x094-20230524   clang
x86_64               randconfig-x095-20230524   clang
x86_64               randconfig-x096-20230524   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230524   gcc  
xtensa       buildonly-randconfig-r006-20230524   gcc  
xtensa               randconfig-r003-20230524   gcc  
xtensa               randconfig-r013-20230524   gcc  
xtensa               randconfig-r022-20230524   gcc  
xtensa               randconfig-r025-20230524   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
