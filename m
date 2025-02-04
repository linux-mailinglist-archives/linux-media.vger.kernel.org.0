Return-Path: <linux-media+bounces-25637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AAA272EF
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 14:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771923A3424
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 13:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F5C211476;
	Tue,  4 Feb 2025 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXJU1V7S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07B20FA9C
	for <linux-media@vger.kernel.org>; Tue,  4 Feb 2025 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674668; cv=none; b=Ego6rqw6xtzuMAV7rdbpqcJ3sZ7R7e5fmKoworM+M4EskLKvFWhWCUGRk6Buxtvz2NrpbSqllVqirhhtlr9g/kFjOsGAs5l06EIr+antR9KWd8UWJnxb5RwAw1OFmUHRBpRDMDSKKxw4YsZuOFIdgG1lR/ZHiXTpMH8j5FyrK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674668; c=relaxed/simple;
	bh=hTDFUnk7+QPA7hmHMVBY+GUpt59l2E78G7a8E5SdaMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W99n30pjx0w0Nrqbdl/pX/ePyA5QVDu7Me6aQy9QwnAq8RzjuGWmg9sLmZHLjyMH0qrvLvN5vBgFiQlxCd1lmybUFLGE6k5bIBtwPqCDBmAJ896tlqGfUbBKFQhQdiMxn/gLp2YHNUfjqBMxrEs/VPTVYO0TTpCYiTi1Igdz7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXJU1V7S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738674667; x=1770210667;
  h=date:from:to:cc:subject:message-id;
  bh=hTDFUnk7+QPA7hmHMVBY+GUpt59l2E78G7a8E5SdaMk=;
  b=gXJU1V7S0QOccam8eueVcFivP8HORCxA6g0bEoLUNNh7kXksIrBBsKNO
   9eRMGYhjBG42Lxj8OPOdMcYXZXs6WMZaX9uGERi+JKO80claaHUL/9yx4
   9zvVt1ekeM37FqVkhTZxmGPz78DLjVqoY8wZN2xFBaWTnyQj93flVfQJu
   Z5kucQB12KbFi3hE6eITWcfBs5xxiGEX6+9jllAPPO1p5JAnler5NAAvJ
   TqTW3T5zwI6Y2BFtPlLE8M32KDvnbasBABmu3sNhLKXhKVPu/2Hu2q3hN
   N1YA4WAnFeN6kGM8fCd3/qKUBSe9Dlp04Iuc8I08Amj3qYcZpgD6erkXu
   w==;
X-CSE-ConnectionGUID: XQF5wy3DRS+ggFf5EHYc3A==
X-CSE-MsgGUID: z3znM4j8QEChk+Crx+7Neg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39082544"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39082544"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 05:11:06 -0800
X-CSE-ConnectionGUID: j7aF6XAqTci/tYY1wQiKfQ==
X-CSE-MsgGUID: YGWAQYMtQvSx1k2rlRCf5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110418102"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Feb 2025 05:11:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfIhh-000sVG-0k;
	Tue, 04 Feb 2025 13:11:01 +0000
Date: Tue, 04 Feb 2025 21:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 f2c4a3cca8609142a9e1dcb05d515349785d616e
Message-ID: <202502042149.EG7jnV5f-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: f2c4a3cca8609142a9e1dcb05d515349785d616e  media: imx219: Adjust PLL settings based on the number of MIPI lanes

elapsed time: 1446m

configs tested: 124
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-004-20250204    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-004-20250204    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-002-20250204    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      cm5200_defconfig    clang-21
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-002-20250203    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-002-20250203    clang-18
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

