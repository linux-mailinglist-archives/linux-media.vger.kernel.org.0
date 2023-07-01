Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CDC744BC3
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 01:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjGAXZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jul 2023 19:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGAXZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jul 2023 19:25:26 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E092D1725
        for <linux-media@vger.kernel.org>; Sat,  1 Jul 2023 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688253925; x=1719789925;
  h=date:from:to:cc:subject:message-id;
  bh=DcAB3hugwAEd7hqgOQOZBh20V9M7LyH7r/JdVrnkRPg=;
  b=UD4b+7G+SQtKLE0wQav7X0GMHQBFMLMg2Fea4ExVK7sYgupeWULYI1rc
   KeS3UcwJ+YdZc6iGUCtpqNOXvC2LdsvdICkFnWMrGnxHd/vzrMefD5tRu
   zZd3TphiBS4WVpJIkvwznWCfI1GPiz8ytFBJT50yr8WQW2edCbUaTwDaM
   6a9p1jAa7jJRBx1OPfstbD1tf8wcLWXutdNWNqzKcQLtnd96R+pWJQ5i8
   77RjGBVnQGy+HRfleQNbtsht5fFK7NSorNBUFZW7Fv//Uru6NbkapvFww
   HLz8fuv1pofi+fziTv5BwjrQhNA5TSkex5SZiMG7XFGotX3gSupasTMbA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="360115258"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="360115258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 16:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="712166166"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="712166166"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Jul 2023 16:25:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFjxz-000GKN-0H;
        Sat, 01 Jul 2023 23:25:23 +0000
Date:   Sun, 02 Jul 2023 07:24:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 59aa267f8720e10029004c6d25ce3f93741d1334
Message-ID: <202307020751.IpDshTY9-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 59aa267f8720e10029004c6d25ce3f93741d1334  media: v4l: Support line-based metadata capture

elapsed time: 754m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230701   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230701   gcc  
arc                  randconfig-r043-20230701   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                        mvebu_v5_defconfig   clang
arm                       netwinder_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r026-20230701   gcc  
arm                  randconfig-r046-20230701   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230701   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230701   clang
hexagon              randconfig-r045-20230701   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230701   gcc  
i386         buildonly-randconfig-r005-20230701   gcc  
i386         buildonly-randconfig-r006-20230701   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230701   gcc  
i386                 randconfig-i002-20230701   gcc  
i386                 randconfig-i003-20230701   gcc  
i386                 randconfig-i004-20230701   gcc  
i386                 randconfig-i005-20230701   gcc  
i386                 randconfig-i006-20230701   gcc  
i386                 randconfig-i011-20230701   clang
i386                 randconfig-i012-20230701   clang
i386                 randconfig-i013-20230701   clang
i386                 randconfig-i014-20230701   clang
i386                 randconfig-i015-20230701   clang
i386                 randconfig-i016-20230701   clang
i386                 randconfig-r001-20230701   gcc  
i386                 randconfig-r006-20230701   gcc  
i386                 randconfig-r031-20230701   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230701   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230701   gcc  
m68k                 randconfig-r013-20230701   gcc  
microblaze           randconfig-r003-20230701   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                          rm200_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230701   gcc  
nios2                randconfig-r015-20230701   gcc  
openrisc                            defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r035-20230701   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230701   clang
riscv                randconfig-r042-20230701   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230701   clang
s390                 randconfig-r033-20230701   gcc  
s390                 randconfig-r044-20230701   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230701   gcc  
sh                   randconfig-r016-20230701   gcc  
sh                           se7724_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r014-20230701   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r023-20230701   gcc  
um                   randconfig-r036-20230701   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230701   gcc  
x86_64       buildonly-randconfig-r002-20230701   gcc  
x86_64       buildonly-randconfig-r003-20230701   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230701   clang
x86_64               randconfig-x002-20230701   clang
x86_64               randconfig-x003-20230701   clang
x86_64               randconfig-x004-20230701   clang
x86_64               randconfig-x005-20230701   clang
x86_64               randconfig-x006-20230701   clang
x86_64               randconfig-x011-20230701   gcc  
x86_64               randconfig-x012-20230701   gcc  
x86_64               randconfig-x013-20230701   gcc  
x86_64               randconfig-x014-20230701   gcc  
x86_64               randconfig-x015-20230701   gcc  
x86_64               randconfig-x016-20230701   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r004-20230701   gcc  
xtensa               randconfig-r032-20230701   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
