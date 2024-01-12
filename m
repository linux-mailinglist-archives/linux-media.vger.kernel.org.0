Return-Path: <linux-media+bounces-3654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B988982C529
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 19:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B57BB1C2231A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 18:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6279817C9A;
	Fri, 12 Jan 2024 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK5EqBma"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF317C8D
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705082667; x=1736618667;
  h=date:from:to:cc:subject:message-id;
  bh=O9fM318MMuFwNItTII4mTzhGtDdv87efB/hn8568y4Q=;
  b=FK5EqBmazyrZW+T+XDqC2b/1S83H+7NNxS/tIurCHsZQsgWhkOsReBSN
   XQjpFk6qAiKVjwUwW34D5S2D4MrVCZUbB2fmp2qdrOQJFT1xS/KWQA1ww
   olCA9V7RaheBHuVC5nI48lGvLpvAEHfbIZGUcqcm45uh/ZlVePLu2UT2Y
   jSfbWnR1dM6oyNT1dS2Yx7RSe4m6nNy1ovCVCNRkHi6RmvQjqNp17NXEr
   zKJVylpempYWoD0TwN38T8mpCamot2MgW1JcXo8Kh/ZJvfUUrcRKCAwfJ
   XXA5X/93XpbpuADlMFPnwvB0v3plr1B+dYnIMCz43+CskDQ+Um1Bl/D21
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12725970"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="12725970"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 10:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="1029998541"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="1029998541"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jan 2024 10:04:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOLtE-0009jx-21;
	Fri, 12 Jan 2024 18:04:21 +0000
Date: Sat, 13 Jan 2024 02:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 60a031b64984ad4a219a13b0fe912746b586bb9b
Message-ID: <202401130223.BZtqgo4D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 60a031b64984ad4a219a13b0fe912746b586bb9b  media: i2c: thp7312: select CONFIG_FW_LOADER

elapsed time: 1453m

configs tested: 152
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240112   gcc  
arc                   randconfig-002-20240112   gcc  
arm                               allnoconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240112   gcc  
csky                  randconfig-002-20240112   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240112   gcc  
i386                  randconfig-012-20240112   gcc  
i386                  randconfig-013-20240112   gcc  
i386                  randconfig-014-20240112   gcc  
i386                  randconfig-015-20240112   gcc  
i386                  randconfig-016-20240112   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240112   gcc  
loongarch             randconfig-002-20240112   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240112   gcc  
nios2                 randconfig-002-20240112   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240112   gcc  
parisc                randconfig-002-20240112   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240112   gcc  
s390                  randconfig-002-20240112   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240112   gcc  
sh                    randconfig-002-20240112   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240112   gcc  
sparc64               randconfig-002-20240112   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240112   clang
x86_64       buildonly-randconfig-002-20240112   clang
x86_64       buildonly-randconfig-003-20240112   clang
x86_64       buildonly-randconfig-004-20240112   clang
x86_64       buildonly-randconfig-005-20240112   clang
x86_64       buildonly-randconfig-006-20240112   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240112   clang
x86_64                randconfig-012-20240112   clang
x86_64                randconfig-013-20240112   clang
x86_64                randconfig-014-20240112   clang
x86_64                randconfig-015-20240112   clang
x86_64                randconfig-016-20240112   clang
x86_64                randconfig-071-20240112   clang
x86_64                randconfig-072-20240112   clang
x86_64                randconfig-073-20240112   clang
x86_64                randconfig-074-20240112   clang
x86_64                randconfig-075-20240112   clang
x86_64                randconfig-076-20240112   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240112   gcc  
xtensa                randconfig-002-20240112   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

