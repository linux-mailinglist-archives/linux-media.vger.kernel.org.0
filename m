Return-Path: <linux-media+bounces-23844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 037269F8768
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 22:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EA7A16F25B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 21:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62961CC8AD;
	Thu, 19 Dec 2024 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8A8MSN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914268F6D
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645541; cv=none; b=CFBxkZXtAVi7uowR5lsKUUlhmZH+ja0xO26PNEOOzh95sKC+2RoqoV8GrPu+2SWq1FgKYgCrQZIcm1uY50mtfrw1KFY9JoFrzcz3a+RYKg1QkMZTQY3sVInGNAwd2GHCwISPiVYPHwfoRO4aXDPTtTXUaV+EpcwyX0PeK/9b4Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645541; c=relaxed/simple;
	bh=D6CceBUnwSuiu0O6FcX5sl3SEMlbqkKNANg7zOhdDJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kiKjIjE0c8bFpgZNrgR1PTmZvAjDA+KKTJzuLNZ0UEwWQjmSvYe83J8I1YdI4grtrRZe+9iMMSeaI00/V+zEMNsHAX1ivI9Lr5jIGSBy+RgtxDBDpGwU+i4TrYOV10MVd+i3oLIJpWiohFXcenu1GPxsoVBrkbFM34muNVy0LGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8A8MSN2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734645540; x=1766181540;
  h=date:from:to:cc:subject:message-id;
  bh=D6CceBUnwSuiu0O6FcX5sl3SEMlbqkKNANg7zOhdDJY=;
  b=Z8A8MSN2YgFhuN0oG94pYfdI3UzLXUXGnawg1H8M8JYRSh1Jutv1Uf3k
   PDOGple9N2ddj+CAkGTZqxxa6H4ZY4gTrQePt/mFhJVNMwy9w8ilUZJpL
   gbXfJYsdmTtA/YxLwtBPt6wcjgneCbZhqiG9KuYVnvuqT0Jt9NG6hbZ3S
   oS5Mv7m2F92AWxEmpqMcpJ1VR3yQdqoh+hs0n+beyQWqaq3q/faIRaJOr
   hbdUAEF0kQcpneVoM+cUXD01BWuB2EsQGwW1idmkfJelM5iaefZGV+lCM
   835W1bDrX3L+yPTqajJlOaMBunsldbVVsaMtv5YUrP09X9g3j4gBiGwHe
   w==;
X-CSE-ConnectionGUID: SMJR80uATye22cr+t2oFWg==
X-CSE-MsgGUID: MxL9nKr5TSO+Uc79IiXP8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35404524"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35404524"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:58:59 -0800
X-CSE-ConnectionGUID: yNo60yKeTC20dTQDaO76Sw==
X-CSE-MsgGUID: pO8huaiBQfSYN4Wby+jBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129291500"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Dec 2024 13:58:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOXn-0000ZX-26;
	Thu, 19 Dec 2024 21:58:55 +0000
Date: Fri, 20 Dec 2024 05:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:fixes] BUILD SUCCESS
 2dd59fe0e19e1ab955259978082b62e5751924c7
Message-ID: <202412200531.ZshooxOJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git fixes
branch HEAD: 2dd59fe0e19e1ab955259978082b62e5751924c7  media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg

elapsed time: 11723m

configs tested: 173
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241212    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241212    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-19
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20241212    gcc-14.2.0
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241212    clang-20
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241212    clang-19
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241212    clang-20
arm                   randconfig-004-20241219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241212    clang-20
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241212    clang-15
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241212    clang-20
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241212    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241212    gcc-14.2.0
csky                  randconfig-002-20241212    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241212    clang-14
hexagon               randconfig-002-20241212    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241212    clang-19
i386        buildonly-randconfig-001-20241219    gcc-12
i386        buildonly-randconfig-002-20241212    clang-19
i386        buildonly-randconfig-002-20241219    gcc-12
i386        buildonly-randconfig-003-20241212    clang-19
i386        buildonly-randconfig-003-20241219    clang-19
i386        buildonly-randconfig-004-20241212    clang-19
i386        buildonly-randconfig-004-20241219    clang-19
i386        buildonly-randconfig-005-20241212    clang-19
i386        buildonly-randconfig-005-20241219    gcc-12
i386        buildonly-randconfig-006-20241212    gcc-12
i386        buildonly-randconfig-006-20241219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241212    gcc-14.2.0
loongarch             randconfig-002-20241212    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241212    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241212    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241212    gcc-14.2.0
parisc                randconfig-002-20241212    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    clang-17
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc               randconfig-001-20241212    gcc-14.2.0
powerpc               randconfig-002-20241212    clang-20
powerpc               randconfig-003-20241212    clang-15
powerpc64             randconfig-001-20241212    clang-20
powerpc64             randconfig-002-20241212    gcc-14.2.0
powerpc64             randconfig-003-20241212    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241212    clang-17
riscv                 randconfig-001-20241219    clang-16
riscv                 randconfig-002-20241212    clang-20
riscv                 randconfig-002-20241219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241212    clang-18
s390                  randconfig-001-20241219    gcc-14.2.0
s390                  randconfig-002-20241212    clang-20
s390                  randconfig-002-20241219    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241212    gcc-14.2.0
sh                    randconfig-001-20241219    gcc-14.2.0
sh                    randconfig-002-20241212    gcc-14.2.0
sh                    randconfig-002-20241219    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241212    gcc-14.2.0
sparc                 randconfig-001-20241219    gcc-14.2.0
sparc                 randconfig-002-20241212    gcc-14.2.0
sparc                 randconfig-002-20241219    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241212    gcc-14.2.0
sparc64               randconfig-001-20241219    gcc-14.2.0
sparc64               randconfig-002-20241212    gcc-14.2.0
sparc64               randconfig-002-20241219    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241212    gcc-12
um                    randconfig-001-20241219    gcc-12
um                    randconfig-002-20241212    clang-20
um                    randconfig-002-20241219    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241213    gcc-12
x86_64      buildonly-randconfig-001-20241219    gcc-12
x86_64      buildonly-randconfig-002-20241213    gcc-12
x86_64      buildonly-randconfig-002-20241219    gcc-12
x86_64      buildonly-randconfig-003-20241213    gcc-12
x86_64      buildonly-randconfig-003-20241219    clang-19
x86_64      buildonly-randconfig-004-20241213    gcc-12
x86_64      buildonly-randconfig-004-20241219    gcc-12
x86_64      buildonly-randconfig-005-20241213    gcc-12
x86_64      buildonly-randconfig-005-20241219    gcc-12
x86_64      buildonly-randconfig-006-20241213    clang-19
x86_64      buildonly-randconfig-006-20241219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241212    gcc-14.2.0
xtensa                randconfig-001-20241219    gcc-14.2.0
xtensa                randconfig-002-20241212    gcc-14.2.0
xtensa                randconfig-002-20241219    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

