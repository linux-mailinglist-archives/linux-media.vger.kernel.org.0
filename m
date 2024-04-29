Return-Path: <linux-media+bounces-10320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81F8B551D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 12:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807911C21A09
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 10:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DEE2E40C;
	Mon, 29 Apr 2024 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwfPfzqn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1C2DF84
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386101; cv=none; b=Y5AQk/yAbgClvJBrOhhvV0EWG7X9aDOD2GniHbbgLUBGqpaab4YePYp2IsDASgFEKqXJz3x6SFjW6ywlRj4C44n67378D765l/NiwmD2ehY9uaTM4i5d5GhPm0Mgsm3lLDysnWJdkwBMDDPhdxAcY15bmGG4qOylAfsZJd8ZtlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386101; c=relaxed/simple;
	bh=Byx+sQRQgNxqQST2hCjolAUi5/WPsnAyQJbBRZGFJCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gKTwtUwX0iR+38kQ4N3FuiVjgSmOuR5AVea0kGzd/+jkU0ZNHJpvEJubn4Fc2BSfNkVVFCVpLzd03wsDWN4KNxeohiydRvwYQFviUdSsoLgiLCuOk1Zf3XmH3ysUM90ZZSPSta0BR8tTYsVwznn4nulAuqyb5BHe0sGeZr6owtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwfPfzqn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386099; x=1745922099;
  h=date:from:to:cc:subject:message-id;
  bh=Byx+sQRQgNxqQST2hCjolAUi5/WPsnAyQJbBRZGFJCY=;
  b=FwfPfzqnRaQiKozoW3qH6wQ+bsh2miGU4FDTLUcPo/uMOiiYXUvyQetS
   ZdaO/nUhBTQ3pkvopffyVIhu0WU4UMBbpgAFHLuI3cfq+FVEUTweDW+gH
   Z9bh4FDco65dG7S7gS+lXhphn+76y/NPm1jyErnmJIVB7oguP1ltinIk3
   +DGjy7lGOpD1VCuzoNh/lufaeqvbIa+Yi7XVS+vcvUC6+R3Wu7qP2R2LN
   Bk/XcH3dCvnWCTDLODJ7KeiXuykGJVjG2A9xG3TfpkH4GpN+nXfbOsxoE
   bLAAzsS8Z6xurcFZ+wYsBTF4qWCt/BW7euzflVu210BsU+6FZFGgXohDX
   A==;
X-CSE-ConnectionGUID: cqo1znvRRwiLICUwf40SuA==
X-CSE-MsgGUID: c5oMHK3yR56T/gwtY+5B2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10161042"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10161042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:21:39 -0700
X-CSE-ConnectionGUID: W9eyzR5lSrOuXrW3J1qPlA==
X-CSE-MsgGUID: lw/qhsdFQQeFJ+1JJlhc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30722333"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2024 03:21:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1O8d-00077B-1N;
	Mon, 29 Apr 2024 10:21:35 +0000
Date: Mon, 29 Apr 2024 18:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre-drivers-mash] BUILD SUCCESS
 12e3384b874e9f67c3e98ce501561fe5a54a0add
Message-ID: <202404291836.UWtccNeK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre-drivers-mash
branch HEAD: 12e3384b874e9f67c3e98ce501561fe5a54a0add  media: uapi: v4l: Don't expose generic metadata formats to userspace

elapsed time: 721m

configs tested: 184
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
arc                   randconfig-001-20240429   gcc  
arc                   randconfig-002-20240429   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240429   clang
arm                   randconfig-002-20240429   clang
arm                   randconfig-003-20240429   clang
arm                   randconfig-004-20240429   gcc  
arm                           tegra_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240429   clang
arm64                 randconfig-002-20240429   gcc  
arm64                 randconfig-003-20240429   clang
arm64                 randconfig-004-20240429   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240429   gcc  
csky                  randconfig-002-20240429   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240429   clang
hexagon               randconfig-002-20240429   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240429   clang
i386         buildonly-randconfig-002-20240429   clang
i386         buildonly-randconfig-003-20240429   gcc  
i386         buildonly-randconfig-004-20240429   clang
i386         buildonly-randconfig-005-20240429   gcc  
i386         buildonly-randconfig-006-20240429   clang
i386                                defconfig   clang
i386                  randconfig-001-20240429   clang
i386                  randconfig-002-20240429   clang
i386                  randconfig-003-20240429   clang
i386                  randconfig-004-20240429   clang
i386                  randconfig-005-20240429   gcc  
i386                  randconfig-006-20240429   clang
i386                  randconfig-011-20240429   gcc  
i386                  randconfig-012-20240429   gcc  
i386                  randconfig-013-20240429   clang
i386                  randconfig-014-20240429   gcc  
i386                  randconfig-015-20240429   clang
i386                  randconfig-016-20240429   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240429   gcc  
loongarch             randconfig-002-20240429   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240429   gcc  
nios2                 randconfig-002-20240429   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240429   gcc  
parisc                randconfig-002-20240429   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240429   gcc  
powerpc               randconfig-002-20240429   gcc  
powerpc               randconfig-003-20240429   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240429   clang
powerpc64             randconfig-002-20240429   clang
powerpc64             randconfig-003-20240429   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240429   gcc  
riscv                 randconfig-002-20240429   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240429   gcc  
s390                  randconfig-002-20240429   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240429   gcc  
sh                    randconfig-002-20240429   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240429   gcc  
sparc64               randconfig-002-20240429   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240429   gcc  
um                    randconfig-002-20240429   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240429   clang
x86_64       buildonly-randconfig-002-20240429   gcc  
x86_64       buildonly-randconfig-003-20240429   clang
x86_64       buildonly-randconfig-004-20240429   gcc  
x86_64       buildonly-randconfig-005-20240429   clang
x86_64       buildonly-randconfig-006-20240429   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240429   clang
x86_64                randconfig-002-20240429   gcc  
x86_64                randconfig-003-20240429   clang
x86_64                randconfig-004-20240429   gcc  
x86_64                randconfig-005-20240429   clang
x86_64                randconfig-006-20240429   gcc  
x86_64                randconfig-011-20240429   gcc  
x86_64                randconfig-012-20240429   gcc  
x86_64                randconfig-013-20240429   gcc  
x86_64                randconfig-014-20240429   clang
x86_64                randconfig-015-20240429   clang
x86_64                randconfig-016-20240429   gcc  
x86_64                randconfig-071-20240429   clang
x86_64                randconfig-072-20240429   clang
x86_64                randconfig-073-20240429   gcc  
x86_64                randconfig-074-20240429   gcc  
x86_64                randconfig-075-20240429   clang
x86_64                randconfig-076-20240429   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240429   gcc  
xtensa                randconfig-002-20240429   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

