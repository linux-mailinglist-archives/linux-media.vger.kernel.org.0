Return-Path: <linux-media+bounces-41296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156BB3B319
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17451C85F6B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 06:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1F121CFFA;
	Fri, 29 Aug 2025 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pw9pTcU5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81817404E
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448038; cv=none; b=pbltRr4HG3u0wPUq9n/noO4gu3tOduzKCTr57/4cuGSU9Uj2aB1PnaZDMZGypjq9XFEOQcmIgIoI6moP1nfpa+PDjSyqelD/bzgN4C+L9ZxsMb/XIX+wcnr1fGgyLkQRIwddcEb5mg9aUgflXb0V7osCe74dawfqld1fS3Y7Voc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448038; c=relaxed/simple;
	bh=sxE8fcxCbTZjqOOVM6pO/q60kU4JvTZWu4POlXWQY94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H04RVZd9kjSaTMYumk3sFatT8n9HluHscFGh2jsqFOijO8zj/5Ef9WMvyGAYuHpDCDiBG/CMTUr9Ga9m0+4HNPIb+pbptWPkIACTXw+EnCKTvQZgz7egFkGdZ8Q8VMUjqT2PgQ1s0BXimt3sti8bqchWVLiYAFiml3AVKGw3PVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pw9pTcU5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756448037; x=1787984037;
  h=date:from:to:cc:subject:message-id;
  bh=sxE8fcxCbTZjqOOVM6pO/q60kU4JvTZWu4POlXWQY94=;
  b=Pw9pTcU5YoRs/4H2UFv8FK4wdtcNOOO+Vm82z4883rZJc+WPBE5UQLhF
   ts8ZN1QWEsWOaZOgZSOQRipsIoFUKrJ8Y37GLLBUCznwL01kiVPT+wXur
   pkRRE+WWpK1M20G8+ui/rnne6p3xYT3kHGApMWMyyQiNejTUhslVVh8ba
   uy/qCHbCtm+pY/xRdMCyKWYCiybrRuEKHs3g08b2TLkNlC1uy8pEPqB6Q
   5GYTnGvCKR4hGvKZfOUD3YGzZrob7h3rI/kGCODsEzkPH3d/e3mmNW3GK
   RF674b/UfLoqUWAML17Ak7HdCAw5A2qs971X7hn/C9P/U5jv4O8oEv8+7
   g==;
X-CSE-ConnectionGUID: s6tFQ3jKTnqIwPDkR5MYCQ==
X-CSE-MsgGUID: B7KWUODBT0y+sAq29XLWuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62548444"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="62548444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 23:13:57 -0700
X-CSE-ConnectionGUID: VHtrT1y9QLyb3Rq+mhwNag==
X-CSE-MsgGUID: UpmTfdEjTJaYIygC8dtC7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="175585931"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2025 23:13:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ursMz-000UOd-0G;
	Fri, 29 Aug 2025 06:13:53 +0000
Date: Fri, 29 Aug 2025 14:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:v4l2-clk-helper] BUILD SUCCESS
 a5cd28462a6f95e1cb2c1ef605eb3522e0eab317
Message-ID: <202508291456.2LfwdSlM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git v4l2-clk-helper
branch HEAD: a5cd28462a6f95e1cb2c1ef605eb3522e0eab317  arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node

elapsed time: 1344m

configs tested: 228
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250828    gcc-8.5.0
arc                   randconfig-001-20250829    gcc-12.5.0
arc                   randconfig-002-20250828    gcc-14.3.0
arc                   randconfig-002-20250829    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                                 defconfig    clang-22
arm                          exynos_defconfig    clang-22
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20250828    gcc-14.3.0
arm                   randconfig-001-20250829    gcc-12.5.0
arm                   randconfig-002-20250828    gcc-10.5.0
arm                   randconfig-002-20250829    gcc-12.5.0
arm                   randconfig-003-20250828    clang-22
arm                   randconfig-003-20250829    gcc-12.5.0
arm                   randconfig-004-20250828    gcc-8.5.0
arm                   randconfig-004-20250829    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250828    clang-22
arm64                 randconfig-001-20250829    gcc-12.5.0
arm64                 randconfig-002-20250828    clang-22
arm64                 randconfig-002-20250829    gcc-12.5.0
arm64                 randconfig-003-20250828    gcc-15.1.0
arm64                 randconfig-003-20250829    gcc-12.5.0
arm64                 randconfig-004-20250828    gcc-15.1.0
arm64                 randconfig-004-20250829    gcc-12.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250828    gcc-15.1.0
csky                  randconfig-002-20250828    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250828    clang-22
hexagon               randconfig-002-20250828    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250828    gcc-12
i386        buildonly-randconfig-001-20250829    clang-20
i386        buildonly-randconfig-002-20250828    gcc-12
i386        buildonly-randconfig-002-20250829    clang-20
i386        buildonly-randconfig-003-20250828    gcc-12
i386        buildonly-randconfig-003-20250829    clang-20
i386        buildonly-randconfig-004-20250828    gcc-12
i386        buildonly-randconfig-004-20250829    clang-20
i386        buildonly-randconfig-005-20250828    gcc-12
i386        buildonly-randconfig-005-20250829    clang-20
i386        buildonly-randconfig-006-20250828    clang-20
i386        buildonly-randconfig-006-20250829    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250829    clang-20
i386                  randconfig-002-20250829    clang-20
i386                  randconfig-003-20250829    clang-20
i386                  randconfig-004-20250829    clang-20
i386                  randconfig-005-20250829    clang-20
i386                  randconfig-006-20250829    clang-20
i386                  randconfig-007-20250829    clang-20
i386                  randconfig-011-20250829    clang-20
i386                  randconfig-012-20250829    clang-20
i386                  randconfig-013-20250829    clang-20
i386                  randconfig-014-20250829    clang-20
i386                  randconfig-015-20250829    clang-20
i386                  randconfig-016-20250829    clang-20
i386                  randconfig-017-20250829    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250828    clang-22
loongarch             randconfig-002-20250828    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250828    gcc-8.5.0
nios2                 randconfig-002-20250828    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250828    gcc-13.4.0
parisc                randconfig-002-20250828    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    clang-22
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250828    clang-22
powerpc               randconfig-002-20250828    gcc-8.5.0
powerpc               randconfig-003-20250828    gcc-8.5.0
powerpc64             randconfig-001-20250828    gcc-10.5.0
powerpc64             randconfig-003-20250828    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250828    clang-22
riscv                 randconfig-002-20250828    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250828    clang-18
s390                  randconfig-002-20250828    clang-19
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250828    gcc-12.5.0
sh                    randconfig-002-20250828    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250828    gcc-8.5.0
sparc                 randconfig-002-20250828    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250828    gcc-8.5.0
sparc64               randconfig-002-20250828    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250828    clang-19
um                    randconfig-002-20250828    gcc-12
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250828    gcc-12
x86_64      buildonly-randconfig-001-20250829    clang-20
x86_64      buildonly-randconfig-002-20250828    gcc-12
x86_64      buildonly-randconfig-002-20250829    clang-20
x86_64      buildonly-randconfig-003-20250828    clang-20
x86_64      buildonly-randconfig-003-20250829    clang-20
x86_64      buildonly-randconfig-004-20250828    gcc-12
x86_64      buildonly-randconfig-004-20250829    clang-20
x86_64      buildonly-randconfig-005-20250828    gcc-12
x86_64      buildonly-randconfig-005-20250829    clang-20
x86_64      buildonly-randconfig-006-20250828    gcc-12
x86_64      buildonly-randconfig-006-20250829    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250829    gcc-12
x86_64                randconfig-002-20250829    gcc-12
x86_64                randconfig-003-20250829    gcc-12
x86_64                randconfig-004-20250829    gcc-12
x86_64                randconfig-005-20250829    gcc-12
x86_64                randconfig-006-20250829    gcc-12
x86_64                randconfig-007-20250829    gcc-12
x86_64                randconfig-008-20250829    gcc-12
x86_64                randconfig-071-20250829    clang-20
x86_64                randconfig-072-20250829    clang-20
x86_64                randconfig-073-20250829    clang-20
x86_64                randconfig-074-20250829    clang-20
x86_64                randconfig-075-20250829    clang-20
x86_64                randconfig-076-20250829    clang-20
x86_64                randconfig-077-20250829    clang-20
x86_64                randconfig-078-20250829    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250828    gcc-8.5.0
xtensa                randconfig-002-20250828    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

