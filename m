Return-Path: <linux-media+bounces-6927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6385887A0DF
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 02:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E61A61F21AA3
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 01:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D20EB664;
	Wed, 13 Mar 2024 01:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNa7CtdE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EBC9475
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 01:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293732; cv=none; b=MslwfbMdvRqxmTx5BezSK+MmP5TXYBXu8ISYgeRmqlwZX5vynmSl9KY/TgLbGYeXLEP9G0pizy56POn9JYWlLVaM0PGyGTIaIT3ZNsC8Q/6m96+c951rcLvPCFpdO3E45QjkQeboVg+T2hTkT9Gnbksqq9DyUKGYcvuvJXghDzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293732; c=relaxed/simple;
	bh=1rpxfJNBFxGv625k5rAFShqxEUjLGFaa4ywgFWzPxXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdMl1/eXUEqfL0KbK9wCgqKcRM0LeuvF/3wopVf3piVJvoGdRpRZ6xoNPFivi5J1h24sJpcZ6XRb/mZHXgpe+J0qE9Bfvu951fWlUtxOHk7s7SEN0egGlfELqXmOi+HojLdbTuKkrDyKfHfu6uJ5hYdkFYo/CNS3Oz8bxbTfncI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNa7CtdE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710293730; x=1741829730;
  h=date:from:to:cc:subject:message-id;
  bh=1rpxfJNBFxGv625k5rAFShqxEUjLGFaa4ywgFWzPxXA=;
  b=KNa7CtdEl8Q+rg4Hd66/YYXad/3h+9QeQZnsgTLBJN3JQHvMoOvpLnOB
   UnJXYxtgcBISP9s+cbnlrtXshq58kZUfnYs2fVNOeEyapQdA8Gnxh8ycn
   sduGIPhjioHXqFOJ6Ge+jzBV400Ge8dbus6PXlR6x3mmvgzeE7vG9JDeA
   gi9+zu6cOGUXOIMDw6y5aZeJs68yfMss4xu+DXL8KFdJPNMuulXO3lYPo
   lr1y4AzLZQK5YivQhQCJdKCg/ZSEx1aRHL4K6hBH5yKpTi8EZcHa5MMbz
   l/q2ajaQ3H8frAligUnjAQe6r2xs+Z1yvmw1sGzdPl+QYBX+zPxs6WpqX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27510765"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="27510765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 18:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11808927"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2024 18:35:28 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkDWg-000Bt7-0y;
	Wed, 13 Mar 2024 01:35:26 +0000
Date: Wed, 13 Mar 2024 09:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 7bed34c0405b11bac9751a8e7d619dcc5d5db2bb
Message-ID: <202403130950.IT3CgfEr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 7bed34c0405b11bac9751a8e7d619dcc5d5db2bb  ACPI: property: Polish ignoring bad data nodes

elapsed time: 733m

configs tested: 159
configs skipped: 3

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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240313   gcc  
arc                   randconfig-002-20240313   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240313   gcc  
arm                   randconfig-002-20240313   clang
arm                   randconfig-003-20240313   gcc  
arm                   randconfig-004-20240313   clang
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240313   clang
arm64                 randconfig-002-20240313   clang
arm64                 randconfig-003-20240313   clang
arm64                 randconfig-004-20240313   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240313   gcc  
csky                  randconfig-002-20240313   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240313   clang
hexagon               randconfig-002-20240313   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240312   gcc  
i386         buildonly-randconfig-002-20240312   gcc  
i386         buildonly-randconfig-003-20240312   gcc  
i386         buildonly-randconfig-004-20240312   gcc  
i386         buildonly-randconfig-005-20240312   clang
i386         buildonly-randconfig-006-20240312   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240312   gcc  
i386                  randconfig-002-20240312   clang
i386                  randconfig-003-20240312   gcc  
i386                  randconfig-004-20240312   gcc  
i386                  randconfig-005-20240312   gcc  
i386                  randconfig-006-20240312   gcc  
i386                  randconfig-011-20240312   gcc  
i386                  randconfig-012-20240312   gcc  
i386                  randconfig-013-20240312   clang
i386                  randconfig-014-20240312   clang
i386                  randconfig-015-20240312   gcc  
i386                  randconfig-016-20240312   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240313   gcc  
loongarch             randconfig-002-20240313   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240313   gcc  
nios2                 randconfig-002-20240313   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240313   gcc  
parisc                randconfig-002-20240313   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                       eiger_defconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc               randconfig-001-20240313   gcc  
powerpc               randconfig-002-20240313   gcc  
powerpc               randconfig-003-20240313   clang
powerpc                     sequoia_defconfig   clang
powerpc64             randconfig-001-20240313   clang
powerpc64             randconfig-002-20240313   gcc  
powerpc64             randconfig-003-20240313   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240313   clang
riscv                 randconfig-002-20240313   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240313   gcc  
s390                  randconfig-002-20240313   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240313   gcc  
sh                    randconfig-002-20240313   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240313   gcc  
sparc64               randconfig-002-20240313   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240313   gcc  
um                    randconfig-002-20240313   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240313   clang
x86_64       buildonly-randconfig-002-20240313   gcc  
x86_64       buildonly-randconfig-003-20240313   clang
x86_64       buildonly-randconfig-005-20240313   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

