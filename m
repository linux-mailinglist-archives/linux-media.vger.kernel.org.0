Return-Path: <linux-media+bounces-44562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAABDDE0A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5FF1889E0D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251D331B813;
	Wed, 15 Oct 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ4Uo6Cx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F01270553
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760522028; cv=none; b=ir9uilYOvuZj3Qe0jsKNXxsuwnFjYPbsb4BgHGZl39qfr1iKHPs4KoTEPUkl6wZPgsyXr9hix0hnyyJM932DYNJejXORcO2vsWgDVCEbya8uOhaIgm0t2FZIucURWuC3eQ23CRwPZcPD7gkx1SDz7O/bcF/zWbgJcaU0vuF0MBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760522028; c=relaxed/simple;
	bh=48GWp+Bt34lSQJW1uN8mA/6+3asu7/MbAAQ33UUzODs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=doWHmA8Vo48OHGKUJ7WheiU5EHiGYUOYQ7rosvCqWeCFpbaiAOytKoOKA87Ie/3ARPUFDKkl5LeJUP7r1EYDY//OG/w+JiTziHtE3U4H7yV641t3ht040iEzcSWvNNhsqKUsJcLbpfo71jATjfaPGslXOHetvOgwLFUBUflIvsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ4Uo6Cx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760522026; x=1792058026;
  h=date:from:to:cc:subject:message-id;
  bh=48GWp+Bt34lSQJW1uN8mA/6+3asu7/MbAAQ33UUzODs=;
  b=CZ4Uo6CxAm4vHtnyPnJQVeLgyMVFsywmkyWMnZ7LueGnwkHS+ha/Skq3
   i5DHFQgr7yA7wkRkhLrKYWWVOe0K9QtAcExltzJmTQWIbGqLzHgCmkxDL
   ivGjQnJ/SzzYGfaAZpGPdOt5o8HJ//Nq7ACuQN+c2UbpH8dOga5lg0bnO
   TGGX7NYVZW1ngKqXumcgaj6G3TBdJwMTHZq2wYnrn0/ECdTEjYlNTnGBO
   HG1NMyNJuXNmC473cCIhruRba4jaWU+jaUo9dJnYWx8b2DZGNnbw8Fdly
   sjnGT7E+cNLSS1qPNomU38YBPtyUIMGZpx83b0xj8pUXutnJJZkMxFj2k
   A==;
X-CSE-ConnectionGUID: L9IVKDtFQoqqwJVYs7fm0A==
X-CSE-MsgGUID: J63fbwDLTDeNYo3BL7lSVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62788478"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62788478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 02:53:46 -0700
X-CSE-ConnectionGUID: 5OnP3YB3SqmmX4Xj0oTelA==
X-CSE-MsgGUID: nTNesRqfTAGiyBHzblrjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="182076499"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2025 02:53:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8yCU-0003hn-11;
	Wed, 15 Oct 2025 09:53:42 +0000
Date: Wed, 15 Oct 2025 17:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 082b86919b7a94de01d849021b4da820a6cb89dc
Message-ID: <202510151743.yRLVTLXY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 082b86919b7a94de01d849021b4da820a6cb89dc  media: v4l2-mem2mem: Fix outdated documentation

elapsed time: 1086m

configs tested: 238
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    clang-22
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-002-20251015    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    clang-22
arm                   randconfig-001-20251015    clang-22
arm                   randconfig-001-20251015    gcc-8.5.0
arm                   randconfig-002-20251015    clang-22
arm                   randconfig-002-20251015    gcc-8.5.0
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-004-20251015    clang-22
arm                   randconfig-004-20251015    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251015    clang-22
arm64                 randconfig-001-20251015    gcc-8.5.0
arm64                 randconfig-002-20251015    gcc-13.4.0
arm64                 randconfig-002-20251015    gcc-8.5.0
arm64                 randconfig-003-20251015    clang-22
arm64                 randconfig-003-20251015    gcc-8.5.0
arm64                 randconfig-004-20251015    clang-22
arm64                 randconfig-004-20251015    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251015    clang-22
csky                  randconfig-001-20251015    gcc-15.1.0
csky                  randconfig-002-20251015    clang-22
csky                  randconfig-002-20251015    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-002-20251015    clang-19
hexagon               randconfig-002-20251015    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251015    clang-20
i386        buildonly-randconfig-001-20251015    gcc-13
i386        buildonly-randconfig-002-20251015    clang-20
i386        buildonly-randconfig-002-20251015    gcc-14
i386        buildonly-randconfig-003-20251015    clang-20
i386        buildonly-randconfig-004-20251015    clang-20
i386        buildonly-randconfig-005-20251015    clang-20
i386        buildonly-randconfig-006-20251015    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251015    clang-20
i386                  randconfig-002-20251015    clang-20
i386                  randconfig-003-20251015    clang-20
i386                  randconfig-004-20251015    clang-20
i386                  randconfig-005-20251015    clang-20
i386                  randconfig-006-20251015    clang-20
i386                  randconfig-007-20251015    clang-20
i386                  randconfig-011-20251015    clang-20
i386                  randconfig-012-20251015    clang-20
i386                  randconfig-013-20251015    clang-20
i386                  randconfig-014-20251015    clang-20
i386                  randconfig-015-20251015    clang-20
i386                  randconfig-016-20251015    clang-20
i386                  randconfig-017-20251015    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251015    clang-22
loongarch             randconfig-001-20251015    gcc-15.1.0
loongarch             randconfig-002-20251015    clang-22
loongarch             randconfig-002-20251015    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251015    clang-22
nios2                 randconfig-001-20251015    gcc-8.5.0
nios2                 randconfig-002-20251015    clang-22
nios2                 randconfig-002-20251015    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251015    clang-22
parisc                randconfig-001-20251015    gcc-9.5.0
parisc                randconfig-002-20251015    clang-22
parisc                randconfig-002-20251015    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251015    clang-22
powerpc               randconfig-001-20251015    gcc-15.1.0
powerpc               randconfig-002-20251015    clang-22
powerpc               randconfig-002-20251015    gcc-12.5.0
powerpc               randconfig-003-20251015    clang-22
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-003-20251015    clang-22
powerpc64             randconfig-003-20251015    gcc-13.4.0
riscv                            alldefconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20251015    clang-22
riscv                 randconfig-001-20251015    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251015    clang-22
s390                  randconfig-001-20251015    gcc-12.5.0
s390                  randconfig-002-20251015    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20251015    clang-22
sh                    randconfig-001-20251015    gcc-11.5.0
sh                    randconfig-002-20251015    clang-22
sh                    randconfig-002-20251015    gcc-11.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251015    clang-22
sparc                 randconfig-001-20251015    gcc-8.5.0
sparc                 randconfig-002-20251015    clang-22
sparc                 randconfig-002-20251015    gcc-13.4.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-002-20251015    clang-22
sparc64               randconfig-002-20251015    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-002-20251015    clang-22
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251015    clang-20
x86_64      buildonly-randconfig-001-20251015    gcc-13
x86_64      buildonly-randconfig-002-20251015    gcc-13
x86_64      buildonly-randconfig-002-20251015    gcc-14
x86_64      buildonly-randconfig-003-20251015    clang-20
x86_64      buildonly-randconfig-003-20251015    gcc-13
x86_64      buildonly-randconfig-004-20251015    clang-20
x86_64      buildonly-randconfig-004-20251015    gcc-13
x86_64      buildonly-randconfig-005-20251015    gcc-13
x86_64      buildonly-randconfig-005-20251015    gcc-14
x86_64      buildonly-randconfig-006-20251015    gcc-13
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251015    clang-20
x86_64                randconfig-002-20251015    clang-20
x86_64                randconfig-003-20251015    clang-20
x86_64                randconfig-004-20251015    clang-20
x86_64                randconfig-005-20251015    clang-20
x86_64                randconfig-006-20251015    clang-20
x86_64                randconfig-007-20251015    clang-20
x86_64                randconfig-008-20251015    clang-20
x86_64                randconfig-071-20251015    gcc-14
x86_64                randconfig-072-20251015    gcc-14
x86_64                randconfig-073-20251015    gcc-14
x86_64                randconfig-074-20251015    gcc-14
x86_64                randconfig-075-20251015    gcc-14
x86_64                randconfig-076-20251015    gcc-14
x86_64                randconfig-077-20251015    gcc-14
x86_64                randconfig-078-20251015    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251015    clang-22
xtensa                randconfig-001-20251015    gcc-9.5.0
xtensa                randconfig-002-20251015    clang-22
xtensa                randconfig-002-20251015    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

