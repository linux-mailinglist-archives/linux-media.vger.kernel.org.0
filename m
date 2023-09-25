Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBDA7ACE62
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 04:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjIYCle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 22:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjIYCld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 22:41:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F13FB9
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 19:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695609686; x=1727145686;
  h=date:from:to:cc:subject:message-id;
  bh=JOL6uqwo83mDUvLLiEyeF77wIXs6GRsGNqjZkXXxHwQ=;
  b=iC8kgJt1vaWinqmsiLFGEws5qldBNuhVjQgEm1PJeSwCO9gGBzg/3OhE
   Ge3owwjC3hAQ8i8DJm/YdpU3BzcD5ATvlzCdmkkGo2WOsl0A2JC+wixfi
   +uc5mdvFz5yEOQ81h0irISBwonDEnruwCcE4ejFvK5if6mlMGlxmM+zIs
   sLZACkCuHki8b4cCGHgJmTEDYXWIZ6EXf5YbOKVYDL8/rNndQIbuz4FEr
   pWyoFoQgv+ROcZx2ee4bUmcor+/l7LC57FA4yZ/2+mgZ6EbxiKFrId2LR
   OQUUC8S6EtNgTM7q8FeDsJW/Wy4GhwWM78fDLc9upXhVuFV5CcfeE482V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445254471"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="445254471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697833604"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697833604"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2023 19:41:24 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qkbXG-0000yV-0c;
        Mon, 25 Sep 2023 02:41:22 +0000
Date:   Mon, 25 Sep 2023 10:41:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 1eb313b9ec4b45825601f4dbf9bd7b441e96f9cc
Message-ID: <202309251017.axfJZRNO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 1eb313b9ec4b45825601f4dbf9bd7b441e96f9cc  media: mc: Check pad flag validity

elapsed time: 3705m

configs tested: 305
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
arc                          axs101_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20230922   gcc  
arc                   randconfig-001-20230923   gcc  
arc                   randconfig-001-20230924   gcc  
arc                        vdk_hs38_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20230923   gcc  
arm                   randconfig-001-20230924   gcc  
arm                   randconfig-001-20230925   gcc  
arm                             rpc_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-001-20230923   gcc  
i386         buildonly-randconfig-001-20230924   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-002-20230923   gcc  
i386         buildonly-randconfig-002-20230924   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-003-20230923   gcc  
i386         buildonly-randconfig-003-20230924   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-004-20230923   gcc  
i386         buildonly-randconfig-004-20230924   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-005-20230923   gcc  
i386         buildonly-randconfig-005-20230924   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386         buildonly-randconfig-006-20230923   gcc  
i386         buildonly-randconfig-006-20230924   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-001-20230923   gcc  
i386                  randconfig-001-20230924   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-002-20230923   gcc  
i386                  randconfig-002-20230924   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-003-20230923   gcc  
i386                  randconfig-003-20230924   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-004-20230923   gcc  
i386                  randconfig-004-20230924   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-005-20230923   gcc  
i386                  randconfig-005-20230924   gcc  
i386                  randconfig-005-20230925   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-006-20230923   gcc  
i386                  randconfig-006-20230924   gcc  
i386                  randconfig-006-20230925   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-011-20230923   gcc  
i386                  randconfig-011-20230924   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-012-20230923   gcc  
i386                  randconfig-012-20230924   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-013-20230923   gcc  
i386                  randconfig-013-20230924   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-014-20230923   gcc  
i386                  randconfig-014-20230924   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-015-20230923   gcc  
i386                  randconfig-015-20230924   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-016-20230922   gcc  
i386                  randconfig-016-20230923   gcc  
i386                  randconfig-016-20230924   gcc  
i386                  randconfig-016-20230925   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20230922   gcc  
loongarch             randconfig-001-20230923   gcc  
loongarch             randconfig-001-20230924   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20230923   gcc  
riscv                 randconfig-001-20230924   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230923   gcc  
s390                  randconfig-001-20230924   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230922   gcc  
sparc                 randconfig-001-20230923   gcc  
sparc                 randconfig-001-20230924   gcc  
sparc                 randconfig-001-20230925   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-001-20230923   gcc  
x86_64       buildonly-randconfig-001-20230924   gcc  
x86_64       buildonly-randconfig-001-20230925   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-002-20230923   gcc  
x86_64       buildonly-randconfig-002-20230924   gcc  
x86_64       buildonly-randconfig-002-20230925   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-003-20230923   gcc  
x86_64       buildonly-randconfig-003-20230924   gcc  
x86_64       buildonly-randconfig-003-20230925   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-004-20230923   gcc  
x86_64       buildonly-randconfig-004-20230924   gcc  
x86_64       buildonly-randconfig-004-20230925   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-005-20230923   gcc  
x86_64       buildonly-randconfig-005-20230924   gcc  
x86_64       buildonly-randconfig-005-20230925   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64       buildonly-randconfig-006-20230923   gcc  
x86_64       buildonly-randconfig-006-20230924   gcc  
x86_64       buildonly-randconfig-006-20230925   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230923   gcc  
x86_64                randconfig-001-20230924   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-002-20230923   gcc  
x86_64                randconfig-002-20230924   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-003-20230923   gcc  
x86_64                randconfig-003-20230924   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-004-20230923   gcc  
x86_64                randconfig-004-20230924   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-005-20230923   gcc  
x86_64                randconfig-005-20230924   gcc  
x86_64                randconfig-005-20230925   gcc  
x86_64                randconfig-006-20230923   gcc  
x86_64                randconfig-006-20230924   gcc  
x86_64                randconfig-006-20230925   gcc  
x86_64                randconfig-011-20230923   gcc  
x86_64                randconfig-011-20230924   gcc  
x86_64                randconfig-011-20230925   gcc  
x86_64                randconfig-012-20230923   gcc  
x86_64                randconfig-012-20230924   gcc  
x86_64                randconfig-012-20230925   gcc  
x86_64                randconfig-013-20230923   gcc  
x86_64                randconfig-013-20230924   gcc  
x86_64                randconfig-013-20230925   gcc  
x86_64                randconfig-014-20230923   gcc  
x86_64                randconfig-014-20230924   gcc  
x86_64                randconfig-014-20230925   gcc  
x86_64                randconfig-015-20230923   gcc  
x86_64                randconfig-015-20230924   gcc  
x86_64                randconfig-015-20230925   gcc  
x86_64                randconfig-016-20230923   gcc  
x86_64                randconfig-016-20230924   gcc  
x86_64                randconfig-016-20230925   gcc  
x86_64                randconfig-071-20230923   gcc  
x86_64                randconfig-071-20230924   gcc  
x86_64                randconfig-071-20230925   gcc  
x86_64                randconfig-072-20230923   gcc  
x86_64                randconfig-072-20230924   gcc  
x86_64                randconfig-072-20230925   gcc  
x86_64                randconfig-073-20230923   gcc  
x86_64                randconfig-073-20230924   gcc  
x86_64                randconfig-073-20230925   gcc  
x86_64                randconfig-074-20230923   gcc  
x86_64                randconfig-074-20230924   gcc  
x86_64                randconfig-074-20230925   gcc  
x86_64                randconfig-075-20230923   gcc  
x86_64                randconfig-075-20230924   gcc  
x86_64                randconfig-075-20230925   gcc  
x86_64                randconfig-076-20230923   gcc  
x86_64                randconfig-076-20230924   gcc  
x86_64                randconfig-076-20230925   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
