Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E376FBAFC
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 00:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbjEHWXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 18:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEHWXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 18:23:51 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B75618A
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 15:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683584630; x=1715120630;
  h=date:from:to:cc:subject:message-id;
  bh=3vP+6skQRvD5IQn887xDQennC9KXNheAthnWVNbWItY=;
  b=FBbP+7gVctr5P+IfUYKdUvy6ph6I+zYNwoK5dUGaN1gsOFqoKsb370Q/
   bbt4cTuBe9F5utYl1QpjgHqLfrvLAPra4hmx2RsE5fE8QlFDsesX9hVE+
   EUggoKRrP90mKX3O9jr7G95b/1MKFrG08eSVal8/rvs8c8grVUevJEovO
   u5CwC9GDobPOgJxYiZX1piO/hZiet4YE98X8i0V3nXBPEJmYtturnMVhu
   CcpBZgKPLkWepkTCyB3lgNPR54aia4VOfhNdoKb568GZcZqhwkeqYCl2m
   5KzbLF3CL10+vuUv/iFiG6B8eih1mYVjAViGXpgWJwHir/JTWWEmqOIi6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349802548"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="349802548"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 15:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028572881"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="1028572881"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 15:23:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pw9Gh-0001Rc-2u;
        Mon, 08 May 2023 22:23:43 +0000
Date:   Tue, 09 May 2023 06:23:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 a87275ba15b3ad515131b0241f412e69d94e9c44
Message-ID: <20230508222305.RH-Li%lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: a87275ba15b3ad515131b0241f412e69d94e9c44  media: uapi: Fix [GS]_ROUTING ACTIVE flag value

elapsed time: 833m

configs tested: 134
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230507   gcc  
alpha                randconfig-r026-20230507   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230507   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230507   clang
arm                  randconfig-r026-20230508   clang
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230507   clang
arm64                randconfig-r016-20230507   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230507   gcc  
hexagon      buildonly-randconfig-r004-20230508   clang
hexagon              randconfig-r015-20230508   clang
hexagon              randconfig-r023-20230507   clang
hexagon              randconfig-r031-20230507   clang
hexagon              randconfig-r036-20230508   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230508   clang
i386         buildonly-randconfig-r005-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r035-20230508   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230508   gcc  
ia64                 randconfig-r021-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230508   gcc  
m68k                 randconfig-r013-20230508   gcc  
m68k                 randconfig-r024-20230507   gcc  
microblaze           randconfig-r022-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230507   clang
mips                 randconfig-r004-20230507   clang
mips                 randconfig-r034-20230507   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230508   gcc  
nios2                randconfig-r005-20230507   gcc  
nios2                randconfig-r005-20230508   gcc  
nios2                randconfig-r015-20230507   gcc  
nios2                randconfig-r031-20230508   gcc  
openrisc     buildonly-randconfig-r001-20230507   gcc  
openrisc             randconfig-r001-20230507   gcc  
openrisc             randconfig-r012-20230508   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230508   gcc  
parisc               randconfig-r011-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230507   clang
powerpc              randconfig-r022-20230508   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230507   clang
riscv                randconfig-r025-20230508   gcc  
riscv                randconfig-r035-20230507   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230507   gcc  
s390                 randconfig-r032-20230507   gcc  
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230507   gcc  
sh                   randconfig-r012-20230507   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r032-20230508   gcc  
sparc                randconfig-r033-20230507   gcc  
sparc64      buildonly-randconfig-r006-20230507   gcc  
sparc64              randconfig-r011-20230508   gcc  
sparc64              randconfig-r036-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230508   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64               randconfig-r033-20230508   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r016-20230508   gcc  
xtensa               randconfig-r021-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
