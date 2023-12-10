Return-Path: <linux-media+bounces-2062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1809280B9B7
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 08:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9991D1F20FFC
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 07:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995135384;
	Sun, 10 Dec 2023 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDhOVoGm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9757E9
	for <linux-media@vger.kernel.org>; Sat,  9 Dec 2023 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702194336; x=1733730336;
  h=date:from:to:cc:subject:message-id;
  bh=VxE3VT5EoKIX/VAQ4VAeqfc1t+Db4rTKj67jGkwF+Hw=;
  b=DDhOVoGmQDa71qzHq7PteSdBOmEsuYk9JKz3X6EuMWtQlk1/ukfKEW+b
   VCu+3x5qTfeV/12lWGvhGNPC7UoTXoxLL2HyVUBpgQEyMZiari3YdC2Tm
   YbLoNz30rzvAQEMne8u4ts+PKAUfngUykrDskBlQH8c6Eu7qgixjPy30P
   sLwKI/+mqnyMYBpvXmGu+0l5A9hT6O1uRWTXr+7Riu9nQLG18tSWAQxtg
   V0F8pJqmjPTs7nIoOZMj/54426uYAtKgbUsJimnxsVLojLmvplfxRGtZK
   2mGdZWrV3Dh6yhzS7pa+yc8/8DNZaC+xTer4DvDfUmGvnJ8mxN8yXyGsY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="394278665"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="394278665"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 23:45:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1019822997"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1019822997"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2023 23:45:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCEVI-000GYt-2T;
	Sun, 10 Dec 2023 07:45:32 +0000
Date: Sun, 10 Dec 2023 15:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 efa28efd9cba015f8c3d88123527c3c3cfcd13d0
Message-ID: <202312101526.DqVBkITA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: efa28efd9cba015f8c3d88123527c3c3cfcd13d0  media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state

elapsed time: 1475m

configs tested: 150
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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20231210   gcc  
arc                   randconfig-002-20231210   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   clang
arm                   randconfig-001-20231210   gcc  
arm                   randconfig-002-20231210   gcc  
arm                   randconfig-003-20231210   gcc  
arm                   randconfig-004-20231210   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231210   gcc  
arm64                 randconfig-002-20231210   gcc  
arm64                 randconfig-003-20231210   gcc  
arm64                 randconfig-004-20231210   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231210   gcc  
csky                  randconfig-002-20231210   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231210   clang
hexagon               randconfig-002-20231210   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231209   gcc  
i386         buildonly-randconfig-002-20231209   gcc  
i386         buildonly-randconfig-003-20231209   gcc  
i386         buildonly-randconfig-004-20231209   gcc  
i386         buildonly-randconfig-005-20231209   gcc  
i386         buildonly-randconfig-006-20231209   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231209   gcc  
i386                  randconfig-002-20231209   gcc  
i386                  randconfig-003-20231209   gcc  
i386                  randconfig-004-20231209   gcc  
i386                  randconfig-005-20231209   gcc  
i386                  randconfig-006-20231209   gcc  
i386                  randconfig-011-20231209   clang
i386                  randconfig-012-20231209   clang
i386                  randconfig-013-20231209   clang
i386                  randconfig-014-20231209   clang
i386                  randconfig-015-20231209   clang
i386                  randconfig-016-20231209   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231210   gcc  
loongarch             randconfig-002-20231210   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231210   gcc  
nios2                 randconfig-002-20231210   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231210   gcc  
parisc                randconfig-002-20231210   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20231210   gcc  
powerpc               randconfig-002-20231210   gcc  
powerpc               randconfig-003-20231210   gcc  
powerpc64             randconfig-001-20231210   gcc  
powerpc64             randconfig-002-20231210   gcc  
powerpc64             randconfig-003-20231210   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231210   gcc  
riscv                 randconfig-002-20231210   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231210   clang
s390                  randconfig-002-20231210   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20231210   gcc  
sh                    randconfig-002-20231210   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231210   gcc  
sparc64               randconfig-002-20231210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231210   gcc  
um                    randconfig-002-20231210   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

