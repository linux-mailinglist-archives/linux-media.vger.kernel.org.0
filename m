Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE88715E0E
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 13:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjE3L4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 07:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjE3Lz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 07:55:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD45F7
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447736; x=1716983736;
  h=date:from:to:cc:subject:message-id;
  bh=d4c9oLDOB+xZqOia5vvOyWp6VsouQXSLaNq8o0g/hXA=;
  b=OqOvmZNTYh4DZvK1juIti5I1+ptdJs23LB3ONznmkSazBQ6fgxzwWKeE
   KZiqHLsaIIT3dXrEmv8UTeMuRA0a1shjaEf6NEOiqC/yre2JGf6QEG/iI
   PkUU0dI1ZCEsosmb0n1V10myR8ICQNXCWIl2JM2GhNGsOsie1ga4rVNaF
   zrNoSlH2BUqbg4CvXEe7qNlW6TgAiJ4NG+ED2AhcgLLwAkHl2KSgN0b5k
   DmHkknci8C+D3X638lTa2lR+pekAFAubcmcYs8N87GhKjbedkIIxSE+3F
   2cnFFIJg6vzgOTVx8gkOVXLbJ86/FuSrB79hzGOkMuyzd1jGSBcYkwY9v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335239915"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="335239915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880731868"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="880731868"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2023 04:54:07 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3xvS-0000K5-2m;
        Tue, 30 May 2023 11:54:06 +0000
Date:   Tue, 30 May 2023 19:53:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:of-match-ptr] BUILD SUCCESS
 dad147ce46d5d521f820ee5dd2397f6a06be63f0
Message-ID: <20230530115350.Uv_n1%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git of-match-ptr
branch HEAD: dad147ce46d5d521f820ee5dd2397f6a06be63f0  media: i2c: max9286: drop of_match_ptr for ID table

elapsed time: 7041m

configs tested: 189
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230525   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r035-20230525   gcc  
arc                  randconfig-r043-20230525   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                  randconfig-r011-20230525   clang
arm                  randconfig-r046-20230525   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230525   gcc  
arm64                randconfig-r026-20230526   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230526   gcc  
hexagon              randconfig-r025-20230526   clang
hexagon              randconfig-r041-20230525   clang
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230525   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i071-20230526   clang
i386                 randconfig-i072-20230526   clang
i386                 randconfig-i073-20230526   clang
i386                 randconfig-i074-20230526   clang
i386                 randconfig-i075-20230526   clang
i386                 randconfig-i076-20230526   clang
i386                 randconfig-i081-20230526   clang
i386                 randconfig-i082-20230526   clang
i386                 randconfig-i083-20230526   clang
i386                 randconfig-i084-20230526   clang
i386                 randconfig-i085-20230526   clang
i386                 randconfig-i086-20230526   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i096-20230526   gcc  
i386                 randconfig-r026-20230525   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r014-20230526   gcc  
m68k                 randconfig-r024-20230525   gcc  
m68k                 randconfig-r032-20230525   gcc  
microblaze           randconfig-r033-20230526   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                 randconfig-r015-20230525   clang
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230526   gcc  
nios2                randconfig-r031-20230526   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230525   gcc  
parisc               randconfig-r022-20230525   gcc  
parisc               randconfig-r025-20230525   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc              randconfig-r003-20230526   gcc  
powerpc              randconfig-r033-20230525   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r036-20230526   gcc  
riscv                randconfig-r042-20230525   gcc  
riscv                randconfig-r042-20230526   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230526   clang
s390                                defconfig   gcc  
s390                 randconfig-r004-20230526   gcc  
s390                 randconfig-r016-20230525   gcc  
s390                 randconfig-r044-20230525   gcc  
s390                 randconfig-r044-20230526   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230526   gcc  
sh                   randconfig-r031-20230525   gcc  
sh                   randconfig-r034-20230526   gcc  
sh                             shx3_defconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r006-20230526   gcc  
sparc64              randconfig-r015-20230526   gcc  
sparc64              randconfig-r035-20230526   gcc  
sparc64              randconfig-r036-20230525   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-k001-20230526   clang
x86_64               randconfig-r001-20230526   gcc  
x86_64               randconfig-r034-20230525   clang
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x061-20230526   clang
x86_64               randconfig-x062-20230526   clang
x86_64               randconfig-x063-20230526   clang
x86_64               randconfig-x064-20230526   clang
x86_64               randconfig-x065-20230526   clang
x86_64               randconfig-x066-20230526   clang
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x073-20230526   gcc  
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x096-20230526   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r011-20230526   gcc  
xtensa               randconfig-r023-20230525   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
