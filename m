Return-Path: <linux-media+bounces-50942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EDD38D94
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 11:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22EAB301EF90
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 10:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A53306B02;
	Sat, 17 Jan 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+tWr8el"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81E550094B
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768644473; cv=none; b=gfFK0JAwKgowSJZxGafYNndO8Yy7/YpFmD3CHRVuUoixkAe1mEo8rbBUbVslIWKAu7jWTR0bz8b2mjPqiAwP/mAiGrViAVdCKE7e1D0ww0Q+aVtRvdB+FO7oJvHcV95MlnotzEAbC2IMGj9ueRjmxS7qDNDlgb+KHbH+ZdbvssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768644473; c=relaxed/simple;
	bh=oRZjnzJIoA4DamD0hhSEcCjNdcQb6VF5Qp4Uv5NM/WY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uqth1fWo0yenaQD071Evm8QltnuDEG8txjdvwBTdTkLbuttqwZ5SPZ4HdNTpcd3Q2c+twwVsq+nuyhU/VAPk6mKK3V/YP4ugdg1AfNBa357TmO3G07BgyOK4VK9+Sm3xDe8bCr6kXUwenPyi78KwjTiooNJpxav7IqLHavkIZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+tWr8el; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768644472; x=1800180472;
  h=date:from:to:cc:subject:message-id;
  bh=oRZjnzJIoA4DamD0hhSEcCjNdcQb6VF5Qp4Uv5NM/WY=;
  b=i+tWr8elbpI2gTjRzx0je77DfuV+AxBFvpKXYx/8LLpzrl4SzvGeeYMv
   jz+IVwrK/M4KpaQNLM5nkiaKea2w5sQ8XePI4lqd1G8flf8QzltQK5ln9
   +nCyJv3E/dmogmpFKLM/RMNgVwIFqMg2WuWUbza8IgoLY1bXRXqqFNHis
   SF/6oZWk4V9EdOwXWof9aN6DjVhwoGgKvhXHlv+yN/zcpyzLs/nk8iDkO
   NnBONtIDtvpyXgI1uDgf3zXJL2pJDWlBZYQ1869dE87wgHeq89R78rKmq
   lD9mrdSB93X1ch3glYDa36skMCtXT8Ct/7IJDLv4t6VUwZidSW+es89i5
   g==;
X-CSE-ConnectionGUID: JCBn+oJnT2mHwsQSvvyT0g==
X-CSE-MsgGUID: 24qlveRfQciIsAwHr3l6dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80580642"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="80580642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:07:51 -0800
X-CSE-ConnectionGUID: qxFANU06TjSzWx/xizOmow==
X-CSE-MsgGUID: P3OPozSBTv2FVemeJ30JgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205856297"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2026 02:07:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3Df-00000000LkS-3cQc;
	Sat, 17 Jan 2026 10:07:47 +0000
Date: Sat, 17 Jan 2026 18:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS WITH UNVERIFIED WARNING
 1c1b79f40ee4444fa1ac96079751608b724c6b2b
Message-ID: <202601171805.HFK0PUvZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 1c1b79f40ee4444fa1ac96079751608b724c6b2b  media: verisilicon: AV1: Set IDR flag for intra_only frame type

Unverified Warning (likely false positive, kindly check if interested):

    drivers/media/i2c/os05b10.c:1132:1: sparse: sparse: bad integer constant expression

Warning ids grouped by kconfigs:

recent_errors
`-- nios2-randconfig-r112-20260117
    `-- drivers-media-i2c-os05b10.c:sparse:sparse:bad-integer-constant-expression

elapsed time: 4899m

configs tested: 352
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs103_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260114    gcc-10.5.0
arc                   randconfig-001-20260114    gcc-8.5.0
arc                   randconfig-001-20260117    gcc-8.5.0
arc                   randconfig-002-20260114    gcc-10.5.0
arc                   randconfig-002-20260114    gcc-8.5.0
arc                   randconfig-002-20260117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                            hisi_defconfig    clang-22
arm                          ixp4xx_defconfig    clang-22
arm                           omap1_defconfig    clang-22
arm                          pxa910_defconfig    clang-22
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20260114    clang-20
arm                   randconfig-001-20260114    gcc-10.5.0
arm                   randconfig-001-20260117    clang-20
arm                   randconfig-002-20260114    clang-22
arm                   randconfig-002-20260114    gcc-10.5.0
arm                   randconfig-002-20260117    gcc-8.5.0
arm                   randconfig-003-20260114    clang-22
arm                   randconfig-003-20260114    gcc-10.5.0
arm                   randconfig-003-20260117    gcc-8.5.0
arm                   randconfig-004-20260114    gcc-10.5.0
arm                   randconfig-004-20260117    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260114    clang-22
arm64                 randconfig-001-20260117    gcc-15.2.0
arm64                 randconfig-002-20260114    clang-22
arm64                 randconfig-002-20260117    clang-22
arm64                 randconfig-003-20260114    clang-22
arm64                 randconfig-003-20260114    gcc-10.5.0
arm64                 randconfig-003-20260117    clang-18
arm64                 randconfig-004-20260114    clang-18
arm64                 randconfig-004-20260114    clang-22
arm64                 randconfig-004-20260117    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260114    clang-22
csky                  randconfig-001-20260114    gcc-15.2.0
csky                  randconfig-001-20260117    gcc-12.5.0
csky                  randconfig-002-20260114    clang-22
csky                  randconfig-002-20260114    gcc-10.5.0
csky                  randconfig-002-20260117    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260114    clang-22
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-002-20260114    clang-22
hexagon               randconfig-002-20260117    clang-22
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260114    gcc-14
i386        buildonly-randconfig-001-20260117    clang-20
i386        buildonly-randconfig-001-20260117    gcc-13
i386        buildonly-randconfig-002-20260114    clang-20
i386        buildonly-randconfig-002-20260114    gcc-14
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-003-20260114    gcc-14
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-004-20260114    clang-20
i386        buildonly-randconfig-004-20260114    gcc-14
i386        buildonly-randconfig-004-20260117    clang-20
i386        buildonly-randconfig-004-20260117    gcc-13
i386        buildonly-randconfig-005-20260114    gcc-14
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-006-20260114    clang-20
i386        buildonly-randconfig-006-20260114    gcc-14
i386        buildonly-randconfig-006-20260117    clang-20
i386        buildonly-randconfig-006-20260117    gcc-13
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260114    gcc-14
i386                  randconfig-001-20260117    gcc-13
i386                  randconfig-001-20260117    gcc-14
i386                  randconfig-002-20260114    gcc-14
i386                  randconfig-002-20260117    gcc-14
i386                  randconfig-003-20260114    clang-20
i386                  randconfig-003-20260114    gcc-14
i386                  randconfig-003-20260117    clang-20
i386                  randconfig-003-20260117    gcc-14
i386                  randconfig-004-20260114    clang-20
i386                  randconfig-004-20260114    gcc-14
i386                  randconfig-004-20260117    gcc-14
i386                  randconfig-005-20260114    gcc-14
i386                  randconfig-005-20260117    clang-20
i386                  randconfig-005-20260117    gcc-14
i386                  randconfig-006-20260114    gcc-14
i386                  randconfig-006-20260117    clang-20
i386                  randconfig-006-20260117    gcc-14
i386                  randconfig-007-20260114    clang-20
i386                  randconfig-007-20260114    gcc-14
i386                  randconfig-007-20260117    clang-20
i386                  randconfig-007-20260117    gcc-14
i386                  randconfig-011-20260114    gcc-13
i386                  randconfig-011-20260114    gcc-14
i386                  randconfig-011-20260117    clang-20
i386                  randconfig-012-20260114    gcc-14
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-013-20260114    clang-20
i386                  randconfig-013-20260114    gcc-14
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-014-20260114    clang-20
i386                  randconfig-014-20260114    gcc-14
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-015-20260114    clang-20
i386                  randconfig-015-20260114    gcc-14
i386                  randconfig-015-20260117    gcc-12
i386                  randconfig-016-20260114    clang-20
i386                  randconfig-016-20260114    gcc-14
i386                  randconfig-016-20260117    clang-20
i386                  randconfig-017-20260114    clang-20
i386                  randconfig-017-20260114    gcc-14
i386                  randconfig-017-20260117    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260114    clang-22
loongarch             randconfig-001-20260114    gcc-15.2.0
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-002-20260114    clang-18
loongarch             randconfig-002-20260114    clang-22
loongarch             randconfig-002-20260117    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5275evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    clang-22
mips                          malta_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260114    clang-22
nios2                 randconfig-001-20260114    gcc-10.5.0
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-002-20260114    clang-22
nios2                 randconfig-002-20260114    gcc-11.5.0
nios2                 randconfig-002-20260117    clang-22
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
parisc                randconfig-001-20260114    gcc-10.5.0
parisc                randconfig-001-20260114    gcc-14.3.0
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-002-20260114    gcc-13.4.0
parisc                randconfig-002-20260114    gcc-14.3.0
parisc                randconfig-002-20260117    clang-22
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                        cell_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc                       ppc64_defconfig    clang-22
powerpc                      ppc64e_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260114    gcc-11.5.0
powerpc               randconfig-001-20260114    gcc-14.3.0
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-002-20260114    gcc-12.5.0
powerpc               randconfig-002-20260114    gcc-14.3.0
powerpc               randconfig-002-20260117    clang-22
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260114    gcc-14.3.0
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-002-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260114    gcc-8.5.0
powerpc64             randconfig-002-20260117    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260114    gcc-14.3.0
riscv                 randconfig-001-20260114    gcc-15.2.0
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-002-20260114    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-9.5.0
riscv                 randconfig-002-20260117    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260114    gcc-15.2.0
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-002-20260114    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-8.5.0
s390                  randconfig-002-20260117    gcc-10.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20260114    gcc-15.2.0
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-002-20260114    gcc-12.5.0
sh                    randconfig-002-20260114    gcc-15.2.0
sh                    randconfig-002-20260117    gcc-10.5.0
sh                           se7751_defconfig    clang-22
sh                  sh7785lcr_32bit_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260114    clang-20
sparc                 randconfig-001-20260114    gcc-14.3.0
sparc                 randconfig-001-20260117    gcc-14.3.0
sparc                 randconfig-002-20260114    clang-20
sparc                 randconfig-002-20260114    gcc-8.5.0
sparc                 randconfig-002-20260117    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260114    clang-20
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-002-20260114    clang-20
sparc64               randconfig-002-20260114    gcc-9.5.0
sparc64               randconfig-002-20260117    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260114    clang-20
um                    randconfig-001-20260114    gcc-14
um                    randconfig-001-20260117    gcc-14.3.0
um                    randconfig-002-20260114    clang-20
um                    randconfig-002-20260114    clang-22
um                    randconfig-002-20260117    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260114    clang-20
x86_64      buildonly-randconfig-001-20260117    clang-20
x86_64      buildonly-randconfig-002-20260114    clang-20
x86_64      buildonly-randconfig-002-20260117    clang-20
x86_64      buildonly-randconfig-003-20260114    clang-20
x86_64      buildonly-randconfig-003-20260117    clang-20
x86_64      buildonly-randconfig-004-20260114    clang-20
x86_64      buildonly-randconfig-004-20260117    clang-20
x86_64      buildonly-randconfig-005-20260114    clang-20
x86_64      buildonly-randconfig-005-20260117    clang-20
x86_64      buildonly-randconfig-006-20260114    clang-20
x86_64      buildonly-randconfig-006-20260117    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260114    gcc-14
x86_64                randconfig-002-20260114    clang-20
x86_64                randconfig-002-20260114    gcc-14
x86_64                randconfig-003-20260114    clang-20
x86_64                randconfig-003-20260114    gcc-14
x86_64                randconfig-004-20260114    gcc-14
x86_64                randconfig-005-20260114    gcc-14
x86_64                randconfig-006-20260114    clang-20
x86_64                randconfig-006-20260114    gcc-14
x86_64                randconfig-011-20260114    gcc-14
x86_64                randconfig-011-20260117    clang-20
x86_64                randconfig-012-20260114    clang-20
x86_64                randconfig-012-20260114    gcc-14
x86_64                randconfig-012-20260117    clang-20
x86_64                randconfig-013-20260114    clang-20
x86_64                randconfig-013-20260114    gcc-14
x86_64                randconfig-013-20260117    clang-20
x86_64                randconfig-014-20260114    gcc-14
x86_64                randconfig-014-20260117    clang-20
x86_64                randconfig-015-20260114    gcc-14
x86_64                randconfig-015-20260117    clang-20
x86_64                randconfig-015-20260117    gcc-14
x86_64                randconfig-016-20260114    gcc-14
x86_64                randconfig-016-20260117    clang-20
x86_64                randconfig-071-20260114    clang-20
x86_64                randconfig-072-20260114    clang-20
x86_64                randconfig-073-20260114    clang-20
x86_64                randconfig-074-20260114    clang-20
x86_64                randconfig-075-20260114    clang-20
x86_64                randconfig-076-20260114    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                  cadence_csp_defconfig    clang-22
xtensa                randconfig-001-20260114    clang-20
xtensa                randconfig-001-20260114    gcc-10.5.0
xtensa                randconfig-001-20260117    gcc-14.3.0
xtensa                randconfig-002-20260114    clang-20
xtensa                randconfig-002-20260114    gcc-12.5.0
xtensa                randconfig-002-20260117    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

