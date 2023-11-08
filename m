Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412237E52E4
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 10:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbjKHJwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 04:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHJwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 04:52:43 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA881B4
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 01:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699437161; x=1730973161;
  h=date:from:to:cc:subject:message-id;
  bh=3m0g21+Yv3998UpWsLIt+VQdSIKX+eb3jlH/DiI7138=;
  b=FRTu+YJjHrtMSNzIOMlqtAY/bvJyT/7HM/Q2rPNVnvAsqc10aHjE11eh
   vPKR0OzUle7db2T84bmlDTj+df/Vmnf3MMgjlIGPkDaFbH4uJhdsF3LiA
   bNCGn+Pwhf7SioW2LwPdlVbLOlCy6k8DmU6w83rl2mIbJXs+OYTs+swEz
   ENLVhjDaWyQ37HCY1B4jUl0iGpRVdpQ6mjMzyLSL4LU66vx/BepE24VXg
   iWVJ+LwlUIp+PoU73t9gmch5Ao3c9SakogIuXcRCqgZrKghuvVQ9uV0LD
   iNmM+NCZaSSuzy5UFhHXLo9GNKPcpMHpSp4XL4CfScw5AXKRD5itWqnrP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392598919"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="392598919"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="766601921"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="766601921"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Nov 2023 01:52:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r0fEj-0007sU-35;
        Wed, 08 Nov 2023 09:52:37 +0000
Date:   Wed, 08 Nov 2023 17:52:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 f30342efd32ea95b9b7437faf8dc37f3e784efc0
Message-ID: <202311081714.ObT0AKuA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: f30342efd32ea95b9b7437faf8dc37f3e784efc0  media: v4l: subdev: Return NULL from pad access functions on error

elapsed time: 1050m

configs tested: 162
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
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-004-20231108   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-004-20231108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231108   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        omega2p_defconfig   clang
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc64                           defconfig   gcc  
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-003-20231108   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231108   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-011-20231108   gcc  
x86_64                randconfig-012-20231108   gcc  
x86_64                randconfig-013-20231108   gcc  
x86_64                randconfig-014-20231108   gcc  
x86_64                randconfig-015-20231108   gcc  
x86_64                randconfig-016-20231108   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231108   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
