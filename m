Return-Path: <linux-media+bounces-39628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB81B239E3
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 22:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B2A3AB8F7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 20:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46B82D0612;
	Tue, 12 Aug 2025 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUpZXRu+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D412C21EC
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030070; cv=none; b=d5xOyQ0GjdeVxY1RqTtil4RQyp2qhgLTwNBnu4hRKVyF5Y1tvWu1cS39sA2CEADD7DXhX8caUxk3Buw9xvLai/C8uNx3qgCSI5ZZvIsLXUGhrpyYw1bm1MJg70bcLP2jfVX4SZCjr2t7XRzDcE9NEQxnhSLgSsz7CamC96dw+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030070; c=relaxed/simple;
	bh=8+ijje/NdjSVBZd4vGvFxof4O23f4MApF5eb0nCCvA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lp5C0LMg9q+DKv0PhBzy9VDWXDtR8YiHaLK43RyzOJYfgwUOdVQBwxW0lzXHMBtLhsGoODP92bx4K7z2U9WXzntnC3oxmHjKvcpLrNNqKN0B0Obkv3Q9HM/PR4pC0R/09iMfWx8OM9uqjUbmWh1kBZkLKCyZWjusZIB81Nn2HrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUpZXRu+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755030068; x=1786566068;
  h=date:from:to:cc:subject:message-id;
  bh=8+ijje/NdjSVBZd4vGvFxof4O23f4MApF5eb0nCCvA4=;
  b=GUpZXRu+2/sOiL8YsnGiBkTYHVHGW3dIEi8zEgP2QAl0UPmsyPm0J1+7
   TQewjH+zpCEi+riaPpGR1hoM1M1WG25Gr5aVjTqjuR3OSTOYVPgo3tbpe
   gReMAj0eJHqM02Ulqq5petauA7ifXqFeAW+CQYj/OBvP12VS8y62OSGdE
   V2h8TXtvippUTPAp5SWHTMk2R7G9TaoAnJPEHJ6K5mWhiec8zDc/1O49q
   isnc8Wg/ITGErOSJK57i5hIBjxG5ioBPjURt34oyBdsEImV+CfykRnKQa
   k3GE3aRm1wjjpBsyITNoo9cyYpNXaDF1FhS2/eET9czVFDr9aHbv1QsRs
   A==;
X-CSE-ConnectionGUID: MbT6TLMHRV2B651C/S/PIw==
X-CSE-MsgGUID: UrI0pgkeTAqxr6RjJ61qbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44893776"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="44893776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 13:21:07 -0700
X-CSE-ConnectionGUID: LB11KlekQ4uxbjoY/Z4s3Q==
X-CSE-MsgGUID: x9GMnZEZTNO9nPrQWQ0n9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170421720"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2025 13:21:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulvUW-0009Gq-1E;
	Tue, 12 Aug 2025 20:21:04 +0000
Date: Wed, 13 Aug 2025 04:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 7b1c48d7d525ee84c4dc79d6810171873b954c92
Message-ID: <202508130456.aVnJ6oCT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 7b1c48d7d525ee84c4dc79d6810171873b954c92  media: i2c: add ov2735 image sensor driver

elapsed time: 1463m

configs tested: 198
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250812    gcc-8.5.0
arc                   randconfig-001-20250813    clang-22
arc                   randconfig-002-20250812    gcc-12.5.0
arc                   randconfig-002-20250813    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                          ep93xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250812    clang-22
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250812    clang-22
arm                   randconfig-002-20250813    clang-22
arm                   randconfig-003-20250812    gcc-14.3.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250812    gcc-10.5.0
arm                   randconfig-004-20250813    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250812    gcc-8.5.0
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250812    gcc-8.5.0
arm64                 randconfig-002-20250813    clang-22
arm64                 randconfig-003-20250812    gcc-14.3.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250812    gcc-8.5.0
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250812    gcc-13.4.0
csky                  randconfig-001-20250813    clang-20
csky                  randconfig-002-20250812    gcc-10.5.0
csky                  randconfig-002-20250813    clang-20
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250812    clang-22
hexagon               randconfig-001-20250813    clang-20
hexagon               randconfig-002-20250812    clang-22
hexagon               randconfig-002-20250813    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-006-20250812    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250813    clang-20
i386                  randconfig-002-20250813    clang-20
i386                  randconfig-003-20250813    clang-20
i386                  randconfig-004-20250813    clang-20
i386                  randconfig-005-20250813    clang-20
i386                  randconfig-006-20250813    clang-20
i386                  randconfig-007-20250813    clang-20
i386                  randconfig-011-20250813    gcc-11
i386                  randconfig-012-20250813    gcc-11
i386                  randconfig-013-20250813    gcc-11
i386                  randconfig-014-20250813    gcc-11
i386                  randconfig-015-20250813    gcc-11
i386                  randconfig-016-20250813    gcc-11
i386                  randconfig-017-20250813    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250812    gcc-15.1.0
loongarch             randconfig-001-20250813    clang-20
loongarch             randconfig-002-20250812    gcc-15.1.0
loongarch             randconfig-002-20250813    clang-20
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250812    gcc-10.5.0
nios2                 randconfig-001-20250813    clang-20
nios2                 randconfig-002-20250812    gcc-11.5.0
nios2                 randconfig-002-20250813    clang-20
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250812    gcc-10.5.0
parisc                randconfig-001-20250813    clang-20
parisc                randconfig-002-20250812    gcc-14.3.0
parisc                randconfig-002-20250813    clang-20
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250812    clang-19
powerpc               randconfig-001-20250813    clang-20
powerpc               randconfig-002-20250812    clang-22
powerpc               randconfig-002-20250813    clang-20
powerpc               randconfig-003-20250812    gcc-12.5.0
powerpc               randconfig-003-20250813    clang-20
powerpc64             randconfig-001-20250812    clang-22
powerpc64             randconfig-001-20250813    clang-20
powerpc64             randconfig-002-20250812    clang-16
powerpc64             randconfig-002-20250813    clang-20
powerpc64             randconfig-003-20250812    clang-18
powerpc64             randconfig-003-20250813    clang-20
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250812    gcc-9.5.0
riscv                 randconfig-002-20250812    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250812    clang-18
s390                  randconfig-002-20250812    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250812    gcc-15.1.0
sh                    randconfig-002-20250812    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250812    gcc-8.5.0
sparc                 randconfig-002-20250812    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250812    clang-22
sparc64               randconfig-002-20250812    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250812    gcc-11
um                    randconfig-002-20250812    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250813    gcc-12
x86_64                randconfig-002-20250813    gcc-12
x86_64                randconfig-003-20250813    gcc-12
x86_64                randconfig-004-20250813    gcc-12
x86_64                randconfig-005-20250813    gcc-12
x86_64                randconfig-006-20250813    gcc-12
x86_64                randconfig-007-20250813    gcc-12
x86_64                randconfig-008-20250813    gcc-12
x86_64                randconfig-071-20250813    clang-20
x86_64                randconfig-072-20250813    clang-20
x86_64                randconfig-073-20250813    clang-20
x86_64                randconfig-074-20250813    clang-20
x86_64                randconfig-075-20250813    clang-20
x86_64                randconfig-076-20250813    clang-20
x86_64                randconfig-077-20250813    clang-20
x86_64                randconfig-078-20250813    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250812    gcc-10.5.0
xtensa                randconfig-002-20250812    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

