Return-Path: <linux-media+bounces-50967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFDD39213
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 02:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B5D63008C99
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 01:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165EF1DE3A4;
	Sun, 18 Jan 2026 01:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/6pJ5s/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC717C77
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768699477; cv=none; b=ccTDzDj0Obf6TH9nUbaXooR3BJvO4qFnQqyTUA4Dqzn04aZpu1tb0DiU2cHtp8nNd+fV+AKNjjayWypYguSVrkYIrp90YzaKOS7fMVvt2a3T1TgGzbKcISLk/zwXgbEvvSzBUgAnwGHBDUd6KHeVNOQ089K5B8jm06F0nwFvR+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768699477; c=relaxed/simple;
	bh=Zw3+/Vn7BxIs8PyC3S12liQC0itfLs/FDT88lFKUr4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdiXgPrXxzjcNYx5q+LGJ5IXbu07QG45v6FQxAF1Xuw5N0+b3UbMfNHuLI86OOl92qzzoT0JMDj8AdW3+NNJDAnAscdVqMKqQspTlTxDxFrCJehrD8l53UP4aNYVOoGlg3SEmrYEb+AbS9MMi6T/IWHRvpoexPG8ricFFXI8sUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/6pJ5s/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768699474; x=1800235474;
  h=date:from:to:cc:subject:message-id;
  bh=Zw3+/Vn7BxIs8PyC3S12liQC0itfLs/FDT88lFKUr4I=;
  b=E/6pJ5s/7riwf1iiqcy2hJfESAIY4on4eNgY67wRqSGy/jHQdUm9gAgE
   AkYRGSfMvdPHaGIkUpJfbA6qOUo6qDEa9L09fYUaCzcNSr9GZuGmaaX0q
   4iEcFQro1VgWDGMPI1ooVnKJjXGZr6RDiICo8Ax0LbYrE+lWsdfjYKIRV
   9t/xHzIrfrLJWVxNk+N4gKOxSm0TcW/u57ZRmgsf/i7tIH/1iE0MPz9mq
   8UBoAhkfVTtuWHJR9oY3YgerjEXSLk/pa+K5OttRpgByJ1dduJjVE97xU
   FcTRVzltfxUqyDDAuiY1p5a+22Y3G4cGNRPioCA3+Avnzc+/p0PxAmFGZ
   Q==;
X-CSE-ConnectionGUID: 2PFBmwmQRsKxxBejCz8emw==
X-CSE-MsgGUID: 2wxWT/QERoO2m2XUkKA/Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73816257"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73816257"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 17:24:33 -0800
X-CSE-ConnectionGUID: pcz5L5Y5SoOyqfKFzhveOg==
X-CSE-MsgGUID: bK/QJt8iTIazi98p0BfyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205162261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 17:24:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhHWn-00000000MUu-2IXA;
	Sun, 18 Jan 2026 01:24:29 +0000
Date: Sun, 18 Jan 2026 09:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 eb4ee870747c3a77a9c3c84d84efb64bd481013a
Message-ID: <202601180904.wbqrPhgP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: eb4ee870747c3a77a9c3c84d84efb64bd481013a  Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules info

elapsed time: 914m

configs tested: 292
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260117    gcc-8.5.0
arc                   randconfig-001-20260118    gcc-15.2.0
arc                   randconfig-002-20260117    gcc-9.5.0
arc                   randconfig-002-20260118    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                            mmp2_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260117    clang-20
arm                   randconfig-001-20260118    gcc-15.2.0
arm                   randconfig-002-20260117    gcc-8.5.0
arm                   randconfig-002-20260118    gcc-15.2.0
arm                   randconfig-003-20260117    gcc-8.5.0
arm                   randconfig-003-20260118    gcc-15.2.0
arm                   randconfig-004-20260117    gcc-12.5.0
arm                   randconfig-004-20260118    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260117    clang-22
arm64                 randconfig-001-20260117    gcc-15.2.0
arm64                 randconfig-001-20260118    clang-17
arm64                 randconfig-002-20260117    clang-22
arm64                 randconfig-002-20260118    clang-17
arm64                 randconfig-003-20260117    clang-18
arm64                 randconfig-003-20260117    clang-22
arm64                 randconfig-003-20260118    clang-17
arm64                 randconfig-004-20260117    clang-22
arm64                 randconfig-004-20260118    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260117    clang-22
csky                  randconfig-001-20260117    gcc-12.5.0
csky                  randconfig-001-20260118    clang-17
csky                  randconfig-002-20260117    clang-22
csky                  randconfig-002-20260117    gcc-15.2.0
csky                  randconfig-002-20260118    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-001-20260118    clang-22
hexagon               randconfig-002-20260117    clang-22
hexagon               randconfig-002-20260118    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260117    clang-20
i386        buildonly-randconfig-001-20260118    gcc-14
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-002-20260118    gcc-14
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-003-20260118    gcc-14
i386        buildonly-randconfig-004-20260117    clang-20
i386        buildonly-randconfig-004-20260118    gcc-14
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-005-20260118    gcc-14
i386        buildonly-randconfig-006-20260117    clang-20
i386        buildonly-randconfig-006-20260118    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260117    gcc-13
i386                  randconfig-001-20260118    gcc-14
i386                  randconfig-002-20260117    gcc-14
i386                  randconfig-002-20260118    gcc-14
i386                  randconfig-003-20260117    clang-20
i386                  randconfig-003-20260118    gcc-14
i386                  randconfig-004-20260117    gcc-14
i386                  randconfig-004-20260118    gcc-14
i386                  randconfig-005-20260117    clang-20
i386                  randconfig-005-20260118    gcc-14
i386                  randconfig-006-20260117    clang-20
i386                  randconfig-006-20260118    gcc-14
i386                  randconfig-007-20260117    clang-20
i386                  randconfig-007-20260118    gcc-14
i386                  randconfig-011-20260117    gcc-14
i386                  randconfig-011-20260118    clang-20
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-012-20260118    clang-20
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-013-20260118    clang-20
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-014-20260118    clang-20
i386                  randconfig-015-20260117    gcc-14
i386                  randconfig-015-20260118    clang-20
i386                  randconfig-016-20260117    gcc-14
i386                  randconfig-016-20260118    clang-20
i386                  randconfig-017-20260117    gcc-14
i386                  randconfig-017-20260118    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260117    clang-20
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-001-20260118    clang-22
loongarch             randconfig-002-20260117    clang-22
loongarch             randconfig-002-20260118    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-001-20260117    gcc-8.5.0
nios2                 randconfig-001-20260118    clang-22
nios2                 randconfig-002-20260117    clang-22
nios2                 randconfig-002-20260117    gcc-11.5.0
nios2                 randconfig-002-20260118    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-001-20260117    gcc-12.5.0
parisc                randconfig-001-20260118    clang-22
parisc                randconfig-002-20260117    clang-22
parisc                randconfig-002-20260117    gcc-15.2.0
parisc                randconfig-002-20260118    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    clang-22
powerpc                      katmai_defconfig    gcc-15.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-001-20260117    gcc-8.5.0
powerpc               randconfig-001-20260118    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc               randconfig-002-20260118    clang-22
powerpc                     tqm8540_defconfig    clang-22
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-001-20260118    clang-22
powerpc64             randconfig-002-20260117    clang-22
powerpc64             randconfig-002-20260117    gcc-8.5.0
powerpc64             randconfig-002-20260118    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260117    clang-22
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-001-20260118    gcc-15.2.0
riscv                 randconfig-002-20260117    clang-17
riscv                 randconfig-002-20260117    gcc-10.5.0
riscv                 randconfig-002-20260118    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260117    clang-22
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-001-20260118    gcc-15.2.0
s390                  randconfig-002-20260117    clang-22
s390                  randconfig-002-20260117    gcc-10.5.0
s390                  randconfig-002-20260118    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-001-20260118    gcc-15.2.0
sh                    randconfig-002-20260117    gcc-10.5.0
sh                    randconfig-002-20260117    gcc-15.2.0
sh                    randconfig-002-20260118    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260117    gcc-8.5.0
sparc                 randconfig-001-20260118    gcc-12.5.0
sparc                 randconfig-002-20260117    gcc-8.5.0
sparc                 randconfig-002-20260118    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-001-20260118    gcc-12.5.0
sparc64               randconfig-002-20260117    gcc-15.2.0
sparc64               randconfig-002-20260118    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260117    clang-22
um                    randconfig-001-20260118    gcc-12.5.0
um                    randconfig-002-20260117    clang-22
um                    randconfig-002-20260118    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260117    clang-20
x86_64      buildonly-randconfig-001-20260118    gcc-14
x86_64      buildonly-randconfig-002-20260117    clang-20
x86_64      buildonly-randconfig-002-20260118    gcc-14
x86_64      buildonly-randconfig-003-20260117    clang-20
x86_64      buildonly-randconfig-003-20260118    gcc-14
x86_64      buildonly-randconfig-004-20260117    clang-20
x86_64      buildonly-randconfig-004-20260118    gcc-14
x86_64      buildonly-randconfig-005-20260117    clang-20
x86_64      buildonly-randconfig-005-20260118    gcc-14
x86_64      buildonly-randconfig-006-20260117    clang-20
x86_64      buildonly-randconfig-006-20260118    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260118    gcc-14
x86_64                randconfig-002-20260118    gcc-14
x86_64                randconfig-003-20260118    gcc-14
x86_64                randconfig-004-20260118    gcc-14
x86_64                randconfig-005-20260118    gcc-14
x86_64                randconfig-006-20260118    gcc-14
x86_64                randconfig-011-20260117    clang-20
x86_64                randconfig-012-20260117    clang-20
x86_64                randconfig-013-20260117    clang-20
x86_64                randconfig-014-20260117    clang-20
x86_64                randconfig-015-20260117    clang-20
x86_64                randconfig-015-20260117    gcc-14
x86_64                randconfig-016-20260117    clang-20
x86_64                randconfig-071-20260117    clang-20
x86_64                randconfig-072-20260117    gcc-13
x86_64                randconfig-073-20260117    clang-20
x86_64                randconfig-074-20260117    clang-20
x86_64                randconfig-075-20260117    clang-20
x86_64                randconfig-076-20260117    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260117    gcc-10.5.0
xtensa                randconfig-001-20260118    gcc-12.5.0
xtensa                randconfig-002-20260117    gcc-13.4.0
xtensa                randconfig-002-20260118    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

