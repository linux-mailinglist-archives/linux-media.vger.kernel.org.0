Return-Path: <linux-media+bounces-8961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1F89EA4A
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 08:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CD3AB21681
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 06:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB778200CD;
	Wed, 10 Apr 2024 06:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xr8as3/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E0C129
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712729081; cv=none; b=WRaOjq1Ls+Y4+I9oBymxvgjesewL60oJ1T8B5rLiIcM9QMNoC0g0agKM3RDOPKU2IDJIm153XbXQOV5mN5HUDv+eUhU6ZD2dIxhMo9NNUtnF8bpk4c09NQczI0DbJngxuU2Fv4/Yea8Eqcw0FIFdbnNnCx1ctRYPoVpJE/TJBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712729081; c=relaxed/simple;
	bh=LGwIBwSwD6HI+1CANB0Y3s38Htzizr8kTouO9OV5Q24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hQt2FjORALntZs9P+BFgZFQ5bJMRqTwkkvfgxX+GXZKnI0fMAlAjCmXva7C4p7Yrxnj8og2NMpaJ9M3n2fCOrIjIc6u+UIEcX1e3azJwmEcp5jSmBV3JKx7shT8kxAJborAgeJIOaX8vONH8/+/TLKHtBI7OiWWOyg4IYqK5LTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xr8as3/o; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712729080; x=1744265080;
  h=date:from:to:cc:subject:message-id;
  bh=LGwIBwSwD6HI+1CANB0Y3s38Htzizr8kTouO9OV5Q24=;
  b=Xr8as3/o6KnGeWqn3JtczFvY0HD1Or9lp9X1VubLNLzAWO5ZkE7/cx+x
   NzcKP97YN7RPogK6NdiG7TpoNWV6IOZKrqvNaLSXT7m7hk9nDQZDtHp46
   MnXlHhmWcTLyVZ/2ey9dtZQUwS06iZPIFCXO49RQBZDK4rTjdaLorXcQx
   qVNLwUkfSHeY+w5ynbD6WPjzlSiJYNq1oDroE8L3yXUsG50VPqp17PO3Z
   1UGgwe2WZ+zX2mavR4REg1qkIKc9pUkv0SHM/U9E2oyf/DEcjosrdzRax
   uD2FSdKLBA7Icq6Jjp7heqdeSvlIZNttnl7rxi5mDb223nx8lqLLbbxgb
   Q==;
X-CSE-ConnectionGUID: rWFUK8nsSWKHeQed9Km6IQ==
X-CSE-MsgGUID: tKrpCRQbQmGYblklcaXd4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8645357"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8645357"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:04:39 -0700
X-CSE-ConnectionGUID: 41BvAC9bQ3yU0hAGMCcwrw==
X-CSE-MsgGUID: gBT/7looSlOQ/EkgqGeQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25242139"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2024 23:04:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruR4U-0006yX-29;
	Wed, 10 Apr 2024 06:04:34 +0000
Date: Wed, 10 Apr 2024 14:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:test] BUILD SUCCESS
 6a46d0146ce3391b33ec8131a774c393efd4a6e7
Message-ID: <202404101459.KEzSv0JF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git test
branch HEAD: 6a46d0146ce3391b33ec8131a774c393efd4a6e7  media: ti: j721e-csi2rx: Fix races while restarting DMA

elapsed time: 1185m

configs tested: 172
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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240410   gcc  
arc                   randconfig-002-20240410   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240410   gcc  
arm                   randconfig-002-20240410   clang
arm                   randconfig-003-20240410   gcc  
arm                   randconfig-004-20240410   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240410   clang
arm64                 randconfig-002-20240410   gcc  
arm64                 randconfig-003-20240410   gcc  
arm64                 randconfig-004-20240410   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240410   gcc  
csky                  randconfig-002-20240410   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240410   clang
hexagon               randconfig-002-20240410   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240410   gcc  
i386         buildonly-randconfig-002-20240410   clang
i386         buildonly-randconfig-003-20240410   clang
i386         buildonly-randconfig-004-20240410   clang
i386         buildonly-randconfig-005-20240410   gcc  
i386         buildonly-randconfig-006-20240410   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240410   clang
i386                  randconfig-002-20240410   clang
i386                  randconfig-003-20240410   gcc  
i386                  randconfig-004-20240410   gcc  
i386                  randconfig-005-20240410   gcc  
i386                  randconfig-006-20240410   clang
i386                  randconfig-011-20240410   clang
i386                  randconfig-012-20240410   clang
i386                  randconfig-013-20240410   gcc  
i386                  randconfig-014-20240410   clang
i386                  randconfig-015-20240410   gcc  
i386                  randconfig-016-20240410   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240410   gcc  
loongarch             randconfig-002-20240410   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240410   gcc  
nios2                 randconfig-002-20240410   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240410   gcc  
parisc                randconfig-002-20240410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-001-20240410   gcc  
powerpc               randconfig-002-20240410   gcc  
powerpc               randconfig-003-20240410   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240410   gcc  
powerpc64             randconfig-002-20240410   gcc  
powerpc64             randconfig-003-20240410   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240410   gcc  
riscv                 randconfig-002-20240410   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240410   clang
s390                  randconfig-002-20240410   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240410   gcc  
sh                    randconfig-002-20240410   gcc  
sh                           se7712_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240410   gcc  
sparc64               randconfig-002-20240410   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240410   clang
um                    randconfig-002-20240410   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240410   clang
x86_64       buildonly-randconfig-003-20240410   clang
x86_64       buildonly-randconfig-005-20240410   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240410   clang
x86_64                randconfig-003-20240410   clang
x86_64                randconfig-004-20240410   clang
x86_64                randconfig-006-20240410   clang
x86_64                randconfig-014-20240410   clang
x86_64                randconfig-016-20240410   clang
x86_64                randconfig-072-20240410   clang
x86_64                randconfig-074-20240410   clang
x86_64                randconfig-076-20240410   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240410   gcc  
xtensa                randconfig-002-20240410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

