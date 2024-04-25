Return-Path: <linux-media+bounces-10122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D838B2A65
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792762845ED
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2161552EE;
	Thu, 25 Apr 2024 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7BSRuww"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AF14F9ED
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714079239; cv=none; b=tp+kPIXLOy018qE9FRe0O5uDVsEIQtKdWOwPL5xq6yPrkUl+Md41T/E9tf7HLhqqWfGeHbaBvIWAuii63uxgw6/EbgZW2NHcHCGOGlkg2WyaQxaREXLGCKGpKSO8MP/OwLTbrlxiy5u+laLP1JENlo82fn1MDe5qXDUTlyIhfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714079239; c=relaxed/simple;
	bh=1oDoo4Qm2tgL98SgpEFwcOJ58IFxhTaGyJ6hy5TeDgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efIX46QHBCkXP51KiH0Dzn4/kE27v+UctTwVADscu0b/OcVMXh5/bPUD3zcIzvE7AEJ5PVH3RaaxnXaQWFItUYqu1D/ukP8y4vR87wWUr6OuzMs2/x/nqQeeDOkR8qjSy9QywIFY8/uIdO2iTLp0qbGFEhEjNWfDtFT3Ff1PPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7BSRuww; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714079238; x=1745615238;
  h=date:from:to:cc:subject:message-id;
  bh=1oDoo4Qm2tgL98SgpEFwcOJ58IFxhTaGyJ6hy5TeDgo=;
  b=k7BSRuwwDYiQwlFzSEtfYtGTrT4kdaziySJAKNTqssJ+uexGHDpUUY5x
   YbgBl/KcZ9R47FVEbzx4D6T67sFxZMETYGWiCbVX2Citd8jcruHwgysB8
   Ema/PzJI8iXZdcSX83ALXtmwl8VS6KMxIG5MdA0+zAnO12IUqZT2qrfRv
   f/VAB3xTNZm5fm4f6kGBswUavBELoaMLSo1JXOSXF61PDIG6mvJDYsnhX
   D16na6tk8vOdcbT8FQMjBulB9CWLsNb0djY43+dXNtkpW9P7RXDhYrXKM
   mLsrfCEw7yVeyjS+oIA4PXn/l+q4Lwu+roDfzkt1E/F1Z/RQhY0hx57x2
   Q==;
X-CSE-ConnectionGUID: OCU5zjFrSJ6aKTzRNtjeuw==
X-CSE-MsgGUID: vWrSPZSYTYCClwYEMdJHfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27315600"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="27315600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:07:17 -0700
X-CSE-ConnectionGUID: cGtBJZH0RmGDAKEGsF8Rdg==
X-CSE-MsgGUID: C/zUgkVeS4C2z2nc25DfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="62679224"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Apr 2024 14:07:16 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s06JF-0002rk-1s;
	Thu, 25 Apr 2024 21:07:13 +0000
Date: Fri, 26 Apr 2024 05:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 e6fd0a5e0bb6d025c18b48ee489d986019e39c21
Message-ID: <202404260514.Pm5eb7L1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: e6fd0a5e0bb6d025c18b48ee489d986019e39c21  media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface

elapsed time: 1449m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240426   clang
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
arm64                 randconfig-003-20240426   clang
arm64                 randconfig-004-20240426   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
csky                  randconfig-002-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240426   clang
hexagon               randconfig-002-20240426   clang
i386         buildonly-randconfig-001-20240425   gcc  
i386         buildonly-randconfig-002-20240425   clang
i386         buildonly-randconfig-003-20240425   gcc  
i386         buildonly-randconfig-004-20240425   clang
i386         buildonly-randconfig-005-20240425   clang
i386         buildonly-randconfig-006-20240425   gcc  
i386                  randconfig-001-20240425   clang
i386                  randconfig-002-20240425   clang
i386                  randconfig-003-20240425   clang
i386                  randconfig-004-20240425   gcc  
i386                  randconfig-005-20240425   clang
i386                  randconfig-006-20240425   clang
i386                  randconfig-011-20240425   clang
i386                  randconfig-012-20240425   clang
i386                  randconfig-013-20240425   gcc  
i386                  randconfig-014-20240425   gcc  
i386                  randconfig-015-20240425   gcc  
i386                  randconfig-016-20240425   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240426   gcc  
loongarch             randconfig-002-20240426   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   clang
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240426   gcc  
nios2                 randconfig-002-20240426   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   motionpro_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64       buildonly-randconfig-001-20240425   clang
x86_64       buildonly-randconfig-002-20240425   gcc  
x86_64       buildonly-randconfig-003-20240425   clang
x86_64       buildonly-randconfig-004-20240425   clang
x86_64       buildonly-randconfig-005-20240425   clang
x86_64       buildonly-randconfig-006-20240425   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240425   clang
x86_64                randconfig-002-20240425   clang
x86_64                randconfig-003-20240425   clang
x86_64                randconfig-004-20240425   gcc  
x86_64                randconfig-005-20240425   gcc  
x86_64                randconfig-006-20240425   clang
x86_64                randconfig-011-20240425   gcc  
x86_64                randconfig-012-20240425   clang
x86_64                randconfig-013-20240425   clang
x86_64                randconfig-014-20240425   gcc  
x86_64                randconfig-015-20240425   clang
x86_64                randconfig-016-20240425   clang
x86_64                randconfig-071-20240425   clang
x86_64                randconfig-072-20240425   gcc  
x86_64                randconfig-073-20240425   gcc  
x86_64                randconfig-074-20240425   clang
x86_64                randconfig-075-20240425   clang
x86_64                randconfig-076-20240425   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

