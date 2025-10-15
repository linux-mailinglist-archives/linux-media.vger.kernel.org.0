Return-Path: <linux-media+bounces-44556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98689BDDC8F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 11:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEAEC18911E6
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61A5306D37;
	Wed, 15 Oct 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H85fuRFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF581DE3A4
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520629; cv=none; b=cA1hNzaqCnLvFNJ5nT6uNu5Z2yQEgUtN/n4atg9PnPgmPqU/fLxhC2xrI4RV/+fTztSNuGLrI5hgpDN8mwLGi2DdaWMlo8X+Krbj8jXnmmqxJD94PJyPtiMuqW1BWzJJBYdL/FathZO14BmrXSDQbGGHGB5FFn4kdWM9QmYfBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520629; c=relaxed/simple;
	bh=Z26MuygCVlDOMhKvfMHjFFbFHMQn/T/iIdev+s+KmEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGE4ZNpZrGNU3X0ukr9u+hROqiuLE1YpTap+YQAoi0zjCvZTSby9e1AT6Lbn6KBPoGxmlSCbu5Dcr/27c7uXfq3WehizrAFHiwodvOdqGcFQ1yA+gaFfyo6rW+CEsjIdtSpRm8f9ppexdhiGMnwNqUbZFlm9qpg1Rh18WOa0zI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H85fuRFr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760520627; x=1792056627;
  h=date:from:to:cc:subject:message-id;
  bh=Z26MuygCVlDOMhKvfMHjFFbFHMQn/T/iIdev+s+KmEs=;
  b=H85fuRFr15Ap0t8T5IiJ9eVMcfEIJTqAI7hTDIz0NYBe9IJJeP/8lRUR
   9UH6SUCZXJ6jBJc1qLw8v+DEm87mxw/paLlRsR7TT3MxLtrZG5qoGSx+a
   E5gKVrGxoD9t8dXM+SJIZ+l/8LoHUv+x/HNqa0aQZoe82MjQqRho5rO1W
   BiFjkW69Hy8FsPUjrJqH0+gpIzXpo8ZPP4ye5JhWn4Pk1sNCsWTEwj7Jb
   OcbT/4xUoKB9rycLEiwxwKxfyKsP7fQVv+zv8MitSjHbSIEMzUm0OUnT7
   RgFFer3ZIGt1VHzOjbw59R6RkfeUrG0dTJeVqkeo2hU/DONOCS72xYtTK
   g==;
X-CSE-ConnectionGUID: kUxkJI6ATvWfV46SUp255A==
X-CSE-MsgGUID: lYVK4ciOT4KTjUoJii6Umg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73793911"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="73793911"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 02:30:27 -0700
X-CSE-ConnectionGUID: 0jTuPQZlSH2E7szMbp6c1A==
X-CSE-MsgGUID: 7BcTB5/5QGCHXloDHMV2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="212730855"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2025 02:30:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8xpv-0003gN-0Y;
	Wed, 15 Oct 2025 09:30:23 +0000
Date: Wed, 15 Oct 2025 17:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 c90fad3e4157f943b6d5842d3ceb20b32e566986
Message-ID: <202510151721.rDhm9MPh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: c90fad3e4157f943b6d5842d3ceb20b32e566986  media: ivtv: Fix invalid access to file *

elapsed time: 1118m

configs tested: 253
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    clang-22
arc                   randconfig-001-20251014    gcc-15.1.0
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-002-20251014    gcc-8.5.0
arc                   randconfig-002-20251015    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    clang-22
arm                   randconfig-001-20251014    gcc-15.1.0
arm                   randconfig-001-20251015    gcc-8.5.0
arm                   randconfig-002-20251014    gcc-13.4.0
arm                   randconfig-002-20251015    gcc-8.5.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-004-20251014    gcc-8.5.0
arm                   randconfig-004-20251015    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251014    gcc-9.5.0
arm64                 randconfig-001-20251015    gcc-8.5.0
arm64                 randconfig-002-20251014    gcc-10.5.0
arm64                 randconfig-002-20251015    gcc-8.5.0
arm64                 randconfig-003-20251014    gcc-14.3.0
arm64                 randconfig-003-20251015    gcc-8.5.0
arm64                 randconfig-004-20251014    gcc-14.3.0
arm64                 randconfig-004-20251015    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251014    gcc-15.1.0
csky                  randconfig-001-20251015    clang-22
csky                  randconfig-002-20251014    gcc-13.4.0
csky                  randconfig-002-20251015    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251014    clang-22
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-002-20251014    clang-22
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
loongarch             randconfig-001-20251014    clang-18
loongarch             randconfig-001-20251015    clang-22
loongarch             randconfig-002-20251014    gcc-15.1.0
loongarch             randconfig-002-20251015    clang-22
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
nios2                 randconfig-001-20251014    gcc-11.5.0
nios2                 randconfig-001-20251015    clang-22
nios2                 randconfig-002-20251014    gcc-8.5.0
nios2                 randconfig-002-20251015    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251014    gcc-11.5.0
parisc                randconfig-001-20251015    clang-22
parisc                randconfig-002-20251014    gcc-9.5.0
parisc                randconfig-002-20251015    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251014    gcc-9.5.0
powerpc               randconfig-001-20251015    clang-22
powerpc               randconfig-002-20251014    clang-22
powerpc               randconfig-002-20251015    clang-22
powerpc               randconfig-003-20251014    gcc-14.3.0
powerpc               randconfig-003-20251015    clang-22
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-003-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251015    clang-22
riscv                            alldefconfig    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-001-20251015    clang-22
riscv                 randconfig-002-20251014    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251014    clang-22
s390                  randconfig-001-20251015    clang-22
s390                  randconfig-002-20251014    clang-19
s390                  randconfig-002-20251015    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20251014    gcc-14.3.0
sh                    randconfig-001-20251015    clang-22
sh                    randconfig-002-20251014    gcc-11.5.0
sh                    randconfig-002-20251015    clang-22
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251014    gcc-15.1.0
sparc                 randconfig-001-20251015    clang-22
sparc                 randconfig-002-20251014    gcc-15.1.0
sparc                 randconfig-002-20251015    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251014    clang-20
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-002-20251014    clang-22
sparc64               randconfig-002-20251015    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251014    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-002-20251014    gcc-14
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
xtensa                randconfig-001-20251014    gcc-8.5.0
xtensa                randconfig-001-20251015    clang-22
xtensa                randconfig-002-20251014    gcc-8.5.0
xtensa                randconfig-002-20251015    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

