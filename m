Return-Path: <linux-media+bounces-26157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBDA35C1D
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 12:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE31D3AF717
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 11:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD8625C6F5;
	Fri, 14 Feb 2025 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AClasPOS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9120186E40
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531042; cv=none; b=n0nUbxVcMxwr1F4TL/cZOcjTyCKjQNLhFp4OCN1woXKaLanIIT4zZV/VH5lSySgQFBaS2XSsls8zItUnwk+vkl+sCNehsCHot/ij8PaixQfHkzBU4UC4/U/tu8OIrq/JeJFOZCm5amkdySyFg6DqzXDYQ93QUM/874vc5y6HCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531042; c=relaxed/simple;
	bh=Go/p+X/m5ZcdcBSkEq9PZuqip0qUU6/zOGcz+43WZVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V8dtOCJsytZrUAkw/UlNWCPod7Wvug9k8oUSOgenmVd0p4dDHGkbBqTojJr3mtZ+muCK1LTLy+kDu2r5wI+gUja00CbfXvKMjMUKpiJWCHHUqnUDoEDJeHgWIVDwZTsOdb/wu3rQdHpXGFh6Oe5Qfri/XXfQ7MmE+CanPixV9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AClasPOS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739531041; x=1771067041;
  h=date:from:to:cc:subject:message-id;
  bh=Go/p+X/m5ZcdcBSkEq9PZuqip0qUU6/zOGcz+43WZVk=;
  b=AClasPOS07yvZOmDwkaKCVq4Lu01w/DyiOtsOdZtuD1ALyELqg49Gs/X
   c1RQXtmeV2eD+OUUmzO3pCOcgmTdbVQOO4yOKKYicsstIXH85dntI5q9k
   eI2f1Cx9pLTkQTATIL9gKKeBprEvIhyn84ENYT0CQbwuQOKdFUexTiF2W
   hwKLoK8WJf5pnYNujpFzjZmbrO/fAhTdpuA4WLPVMAx3HytkBoIpXbpRb
   qlxRB7LjSLnpyEZ/4V3VZiJZCgIWHZvv84vGZXqxhnxRl1qMxOvGYmRkQ
   F3x56+qN9MtPXl0ZnJY0ESO+f/Pl9wLR0I0nzHHfd2KSCt3bn4ehaUmnZ
   Q==;
X-CSE-ConnectionGUID: 8HfGAVZGRIa6fkfER3ocXg==
X-CSE-MsgGUID: 19csxE8FT6KR6DPs66Yb4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51703026"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51703026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:04:00 -0800
X-CSE-ConnectionGUID: cKUY84FET5yxYuKWfV2fCg==
X-CSE-MsgGUID: UNXdwn5aT+Scko4Kx0NVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113298520"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 03:03:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titUC-0019QB-2U;
	Fri, 14 Feb 2025 11:03:56 +0000
Date: Fri, 14 Feb 2025 19:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 b2c4bf0c102084e77ed1b12090d77a76469a6814
Message-ID: <202502141944.xqGhEhL9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: b2c4bf0c102084e77ed1b12090d77a76469a6814  media: rc: add keymap for Siemens Gigaset RC20 remote

elapsed time: 1348m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250213    gcc-13.2.0
arc                   randconfig-002-20250213    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250213    clang-17
arm                   randconfig-002-20250213    clang-15
arm                   randconfig-003-20250213    clang-21
arm                   randconfig-004-20250213    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250213    clang-19
arm64                 randconfig-002-20250213    gcc-14.2.0
arm64                 randconfig-003-20250213    gcc-14.2.0
arm64                 randconfig-004-20250213    clang-21
csky                  randconfig-001-20250213    gcc-14.2.0
csky                  randconfig-002-20250213    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250213    clang-21
hexagon               randconfig-002-20250213    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250213    gcc-12
i386        buildonly-randconfig-002-20250213    clang-19
i386        buildonly-randconfig-003-20250213    clang-19
i386        buildonly-randconfig-004-20250213    clang-19
i386        buildonly-randconfig-005-20250213    clang-19
i386        buildonly-randconfig-006-20250213    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250213    gcc-14.2.0
loongarch             randconfig-002-20250213    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250213    gcc-14.2.0
nios2                 randconfig-002-20250213    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250213    gcc-14.2.0
parisc                randconfig-002-20250213    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250213    clang-17
powerpc               randconfig-002-20250213    gcc-14.2.0
powerpc               randconfig-003-20250213    gcc-14.2.0
powerpc64             randconfig-001-20250213    clang-19
powerpc64             randconfig-002-20250213    clang-21
powerpc64             randconfig-003-20250213    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250213    clang-19
riscv                 randconfig-002-20250213    clang-17
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250213    gcc-14.2.0
s390                  randconfig-002-20250213    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250213    gcc-14.2.0
sh                    randconfig-002-20250213    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250213    gcc-14.2.0
sparc                 randconfig-002-20250213    gcc-14.2.0
sparc64               randconfig-001-20250213    gcc-14.2.0
sparc64               randconfig-002-20250213    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250213    clang-19
um                    randconfig-002-20250213    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250213    gcc-11
x86_64      buildonly-randconfig-002-20250213    gcc-12
x86_64      buildonly-randconfig-003-20250213    clang-19
x86_64      buildonly-randconfig-004-20250213    gcc-12
x86_64      buildonly-randconfig-005-20250213    gcc-12
x86_64      buildonly-randconfig-006-20250213    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250213    gcc-14.2.0
xtensa                randconfig-002-20250213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

