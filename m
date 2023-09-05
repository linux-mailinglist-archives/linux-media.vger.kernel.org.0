Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6BC479250D
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbjIEQBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243355AbjIEAuK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 20:50:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B78DD
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 17:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693875006; x=1725411006;
  h=date:from:to:cc:subject:message-id;
  bh=MFK9MGS6hN6Nc1jzAFVvctnEYTGLjFtDi0B0orGs4Oc=;
  b=DoIeZl4WHlMICRZn3sLLyEzHycm49Ed/ALBp4marVPeB50MnbHlkLGke
   ZTVdeR6lyqRRnhEBkYx44CImJyII2f+K7BZqNHxeoe+8X7H/lKj6JERX9
   cKdVR1pt67Ei16xuWVCx6XGo/S84hc1sN0Nwp0NvGyeWsRReNecbBsVas
   iMyGg/ad7+OYTXnBwKeI1TDCSmTr6HAfBuIF/foCHdx2Vax3ClmVPrvEZ
   o+UxkGusf3DR/T6wY//o3X9PB3pMNAZ0eoKrlLf+eeta3r/CH8GBLFPLN
   oavPZFTbgEh8kg42RQ1V2x4+IX+Emv9tBccuDYSobIqE6rT7FgDfrLOEs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379385651"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="379385651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 17:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987618100"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="987618100"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 17:50:05 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdKGZ-00012R-0k;
        Tue, 05 Sep 2023 00:50:03 +0000
Date:   Tue, 05 Sep 2023 08:47:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 3d2c6e37c2be614f39619fcec0349455c66ca8cc
Message-ID: <202309050831.q80pouTY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 3d2c6e37c2be614f39619fcec0349455c66ca8cc  media: uapi: v4l: Document source routes

elapsed time: 1091m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230904   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230904   gcc  
arc                  randconfig-r002-20230904   gcc  
arc                  randconfig-r021-20230904   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230904   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230904   gcc  
arm64                randconfig-r014-20230904   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230904   clang
hexagon               randconfig-002-20230904   clang
hexagon              randconfig-r031-20230904   clang
hexagon              randconfig-r034-20230904   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230904   gcc  
i386         buildonly-randconfig-002-20230904   gcc  
i386         buildonly-randconfig-003-20230904   gcc  
i386         buildonly-randconfig-004-20230904   gcc  
i386         buildonly-randconfig-005-20230904   gcc  
i386         buildonly-randconfig-006-20230904   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230904   gcc  
i386                  randconfig-002-20230904   gcc  
i386                  randconfig-003-20230904   gcc  
i386                  randconfig-004-20230904   gcc  
i386                  randconfig-005-20230904   gcc  
i386                  randconfig-006-20230904   gcc  
i386                  randconfig-011-20230904   clang
i386                  randconfig-012-20230904   clang
i386                  randconfig-013-20230904   clang
i386                  randconfig-014-20230904   clang
i386                  randconfig-015-20230904   clang
i386                  randconfig-016-20230904   clang
i386                 randconfig-r013-20230904   clang
i386                 randconfig-r036-20230904   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230904   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230904   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r033-20230904   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm63xx_defconfig   clang
mips                      bmips_stb_defconfig   clang
mips                            gpr_defconfig   gcc  
mips                           ip27_defconfig   clang
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r032-20230904   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                     taishan_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64            randconfig-r006-20230904   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230904   gcc  
riscv                randconfig-r024-20230904   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230904   clang
s390                 randconfig-r025-20230904   clang
s390                 randconfig-r035-20230904   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                   randconfig-r001-20230904   gcc  
sh                   randconfig-r003-20230904   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r022-20230904   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230904   clang
um                   randconfig-r016-20230904   gcc  
um                   randconfig-r026-20230904   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230904   gcc  
x86_64       buildonly-randconfig-002-20230904   gcc  
x86_64       buildonly-randconfig-003-20230904   gcc  
x86_64       buildonly-randconfig-004-20230904   gcc  
x86_64       buildonly-randconfig-005-20230904   gcc  
x86_64       buildonly-randconfig-006-20230904   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230904   clang
x86_64                randconfig-002-20230904   clang
x86_64                randconfig-003-20230904   clang
x86_64                randconfig-004-20230904   clang
x86_64                randconfig-005-20230904   clang
x86_64                randconfig-006-20230904   clang
x86_64                randconfig-011-20230904   gcc  
x86_64                randconfig-012-20230904   gcc  
x86_64                randconfig-013-20230904   gcc  
x86_64                randconfig-014-20230904   gcc  
x86_64                randconfig-015-20230904   gcc  
x86_64                randconfig-016-20230904   gcc  
x86_64                randconfig-071-20230904   gcc  
x86_64                randconfig-072-20230904   gcc  
x86_64                randconfig-073-20230904   gcc  
x86_64                randconfig-074-20230904   gcc  
x86_64                randconfig-075-20230904   gcc  
x86_64                randconfig-076-20230904   gcc  
x86_64               randconfig-r012-20230904   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230904   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
