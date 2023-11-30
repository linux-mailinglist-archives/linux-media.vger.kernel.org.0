Return-Path: <linux-media+bounces-1402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED317FEF9F
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07FE1C20AFD
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E33BB39;
	Thu, 30 Nov 2023 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKkaee7V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A9A10D4
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701349155; x=1732885155;
  h=date:from:to:cc:subject:message-id;
  bh=UNlKbUXQHEH/g4RN9Y9mIAIizVmqXT6aymIdzeJjrgU=;
  b=CKkaee7VlBOb06R0bvLtadW2uExHbWtUqie25c22DJypwyzv11Dy/4Sp
   LxY7afALA6TEzh/06QlaG3ZJMiq5dUvswu58GWGbtRR6PIxisS+7zXhYX
   kFjU9lxm266RC4YLuX5DeWFAMLKneHocngDGx3A9BpIokHrAI9BFBv8Bc
   C7nKhtNC6X7yslooerMq6DgMB07FAi1JjXxUSHS3rclU5PrqV5sHl8uCJ
   RljWuXM2ZTHvSzxU81sMPLMSo5gmRXuKdjIObmXjdgX73GUwiMaqvdgvR
   A2mMzAf2BBvCsGXh/6T0xtOfjhXlk8n7uZ5RKGNzM4ijFSOJWs+gbiKMP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6594647"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="6594647"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100934478"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1100934478"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2023 04:59:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gdK-0001yR-1S;
	Thu, 30 Nov 2023 12:59:10 +0000
Date: Thu, 30 Nov 2023 20:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 99e560d51f6c59ded60c03657134eb569592ae72
Message-ID: <202311302010.rAFAmrQt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 99e560d51f6c59ded60c03657134eb569592ae72  media: stm32-dcmipp: STM32 DCMIPP camera interface driver

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-randconfig-161-20231130
    `-- drivers-media-dvb-frontends-mb86a16.c-mb86a16_set_fe()-warn:Function-too-hairy.-No-more-merges.
clang_recent_errors
`-- x86_64-randconfig-004-20231130
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dml-dcn30-display_mode_vba_30.c:warning:stack-frame-size-()-exceeds-limit-()-in-DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculati
    |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dml-dcn31-display_mode_vba_31.c:warning:stack-frame-size-()-exceeds-limit-()-in-DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculati
    `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dml-dcn314-display_mode_vba_314.c:warning:stack-frame-size-()-exceeds-limit-()-in-DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula

elapsed time: 1458m

configs tested: 130
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20231130   gcc  
arc                   randconfig-002-20231130   gcc  
arm                       aspeed_g4_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231130   gcc  
arm                   randconfig-002-20231130   gcc  
arm                   randconfig-003-20231130   gcc  
arm                   randconfig-004-20231130   gcc  
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                 randconfig-001-20231130   gcc  
arm64                 randconfig-002-20231130   gcc  
arm64                 randconfig-003-20231130   gcc  
arm64                 randconfig-004-20231130   gcc  
csky                  randconfig-001-20231130   gcc  
csky                  randconfig-002-20231130   gcc  
hexagon               randconfig-001-20231130   clang
hexagon               randconfig-002-20231130   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231130   gcc  
i386         buildonly-randconfig-002-20231130   gcc  
i386         buildonly-randconfig-003-20231130   gcc  
i386         buildonly-randconfig-004-20231130   gcc  
i386         buildonly-randconfig-005-20231130   gcc  
i386         buildonly-randconfig-006-20231130   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231130   gcc  
i386                  randconfig-002-20231130   gcc  
i386                  randconfig-003-20231130   gcc  
i386                  randconfig-004-20231130   gcc  
i386                  randconfig-005-20231130   gcc  
i386                  randconfig-006-20231130   gcc  
i386                  randconfig-011-20231130   clang
i386                  randconfig-012-20231130   clang
i386                  randconfig-013-20231130   clang
i386                  randconfig-014-20231130   clang
i386                  randconfig-015-20231130   clang
i386                  randconfig-016-20231130   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20231130   gcc  
loongarch             randconfig-002-20231130   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                      malta_kvm_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231130   gcc  
nios2                 randconfig-002-20231130   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231130   gcc  
parisc                randconfig-002-20231130   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20231130   gcc  
powerpc               randconfig-002-20231130   gcc  
powerpc               randconfig-003-20231130   gcc  
powerpc64             randconfig-001-20231130   gcc  
powerpc64             randconfig-002-20231130   gcc  
powerpc64             randconfig-003-20231130   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20231130   gcc  
riscv                 randconfig-002-20231130   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231130   clang
s390                  randconfig-002-20231130   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20231130   gcc  
sh                    randconfig-002-20231130   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231130   gcc  
sparc64               randconfig-002-20231130   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231130   gcc  
um                    randconfig-002-20231130   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231130   gcc  
x86_64       buildonly-randconfig-002-20231130   gcc  
x86_64       buildonly-randconfig-003-20231130   gcc  
x86_64       buildonly-randconfig-004-20231130   gcc  
x86_64       buildonly-randconfig-005-20231130   gcc  
x86_64       buildonly-randconfig-006-20231130   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231130   clang
x86_64                randconfig-002-20231130   clang
x86_64                randconfig-003-20231130   clang
x86_64                randconfig-004-20231130   clang
x86_64                randconfig-005-20231130   clang
x86_64                randconfig-006-20231130   clang
x86_64                randconfig-011-20231130   gcc  
x86_64                randconfig-012-20231130   gcc  
x86_64                randconfig-013-20231130   gcc  
x86_64                randconfig-014-20231130   gcc  
x86_64                randconfig-015-20231130   gcc  
x86_64                randconfig-016-20231130   gcc  
x86_64                randconfig-071-20231130   gcc  
x86_64                randconfig-072-20231130   gcc  
x86_64                randconfig-073-20231130   gcc  
x86_64                randconfig-074-20231130   gcc  
x86_64                randconfig-075-20231130   gcc  
x86_64                randconfig-076-20231130   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231130   gcc  
xtensa                randconfig-002-20231130   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

