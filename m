Return-Path: <linux-media+bounces-40119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7963B29E20
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 594BC167E36
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F1230E842;
	Mon, 18 Aug 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiEupsXt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C42C15A3
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509744; cv=none; b=MjWb+tS5UaQ7MRMqPet+Yq+D2qw61hr4kkSMXRYa+6vGqAZx4r7LCq+ebe+YvVC7ztsEb4rsiIbBjttYCBhzCT9Fg3i2mxuFuuE3oCIPmzFqQA2H8vXJ+nqIKPwYFV5P/xtBWExqcwhZ/o9lqgxrH27Sr9jRv9EmAqNRx9D4kZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509744; c=relaxed/simple;
	bh=AvWwq+2I/1RFPbOQ34HKfI/V+fKomgewMy6BIIZwBdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHxuLEtATmKi9h0Ja3jOxUcTyfqe2LF3g9rUcUWCIPAvwTErnwDYRGwCHH7HDsJebLOaf4jGL4DNAflCqKT4aeeUSE3jCvikegOghEvQiwQ/238GULkj0s60qCw+pr2EA3CoNPeqNojGfwxJzgA3mh+Bs1KIICeQEwis7LTmKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiEupsXt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755509743; x=1787045743;
  h=date:from:to:cc:subject:message-id;
  bh=AvWwq+2I/1RFPbOQ34HKfI/V+fKomgewMy6BIIZwBdg=;
  b=fiEupsXtfCBRlwOWHe9SBWJ3SgwyMnZB0a8IDckjeGBT7B1dV4VIDdpp
   I3Jrs8Y7fxqnw857WtBTwETrYawnOj01oFtPcujFTkoGnSnIAU/q7mcdh
   YV0So5z+vnJ/FFELshhOhVvU1C3IBfBrd/wOsCl/RDcFKmV5ocKosTzEs
   ChyopdXZ9jTII/nQegAqqr9qv3GhILmsg3+XOhKAjSo2xE1NaolLtyTlx
   4/9EU9OC1lqZ0a+GxpJMVMeTBfjTmtCmG6KCbrtMb+L1ROlM4Y8OtD8GF
   XwD1e842ZDB+BFTufP8Ij9xwEFO+NLVKzLmNrg7Jq8iFmYE4SzgSvAchg
   g==;
X-CSE-ConnectionGUID: MtgYHUGbQkOTjSoyZOQl4g==
X-CSE-MsgGUID: sQboO7v8R2+onb6OavskQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75180566"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75180566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:35:42 -0700
X-CSE-ConnectionGUID: 2xPAb8DmQEuSXIL2rSK2JQ==
X-CSE-MsgGUID: 3VWLmfoGSxCV+eRMst4byQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2025 02:35:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unwGq-000E71-2E;
	Mon, 18 Aug 2025 09:35:26 +0000
Date: Mon, 18 Aug 2025 17:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 2412f16c9afa7710778fc032139a6df38b68fd7c
Message-ID: <202508181714.enKeyCwD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 2412f16c9afa7710778fc032139a6df38b68fd7c  media: v4l2-common: Improve devm_v4l2_sensor_clk_get() documentation

elapsed time: 5263m

configs tested: 188
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250815    gcc-8.5.0
arc                   randconfig-001-20250818    gcc-13.4.0
arc                   randconfig-002-20250815    gcc-9.5.0
arc                   randconfig-002-20250818    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20250815    clang-16
arm                   randconfig-001-20250818    gcc-12.5.0
arm                   randconfig-002-20250815    clang-18
arm                   randconfig-002-20250818    clang-22
arm                   randconfig-003-20250815    gcc-14.3.0
arm                   randconfig-003-20250818    clang-18
arm                   randconfig-004-20250815    gcc-8.5.0
arm                   randconfig-004-20250818    gcc-10.5.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250815    gcc-8.5.0
arm64                 randconfig-001-20250818    gcc-11.5.0
arm64                 randconfig-002-20250815    gcc-8.5.0
arm64                 randconfig-002-20250818    gcc-12.5.0
arm64                 randconfig-003-20250815    clang-22
arm64                 randconfig-003-20250818    gcc-8.5.0
arm64                 randconfig-004-20250815    gcc-15.1.0
arm64                 randconfig-004-20250818    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250815    gcc-15.1.0
csky                  randconfig-001-20250818    gcc-15.1.0
csky                  randconfig-002-20250815    gcc-15.1.0
csky                  randconfig-002-20250818    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250815    clang-22
hexagon               randconfig-001-20250818    clang-22
hexagon               randconfig-002-20250815    clang-22
hexagon               randconfig-002-20250818    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250815    gcc-12
i386        buildonly-randconfig-001-20250818    clang-20
i386        buildonly-randconfig-002-20250815    clang-20
i386        buildonly-randconfig-002-20250818    clang-20
i386        buildonly-randconfig-003-20250815    clang-20
i386        buildonly-randconfig-003-20250818    gcc-12
i386        buildonly-randconfig-004-20250815    clang-20
i386        buildonly-randconfig-004-20250818    clang-20
i386        buildonly-randconfig-005-20250815    clang-20
i386        buildonly-randconfig-005-20250818    gcc-12
i386        buildonly-randconfig-006-20250815    gcc-12
i386        buildonly-randconfig-006-20250818    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250815    clang-22
loongarch             randconfig-001-20250818    gcc-15.1.0
loongarch             randconfig-002-20250815    clang-20
loongarch             randconfig-002-20250818    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250815    gcc-11.5.0
nios2                 randconfig-001-20250818    gcc-9.5.0
nios2                 randconfig-002-20250815    gcc-11.5.0
nios2                 randconfig-002-20250818    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250815    gcc-8.5.0
parisc                randconfig-001-20250818    gcc-10.5.0
parisc                randconfig-002-20250815    gcc-14.3.0
parisc                randconfig-002-20250818    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250815    gcc-11.5.0
powerpc               randconfig-001-20250818    gcc-8.5.0
powerpc               randconfig-002-20250815    clang-19
powerpc               randconfig-002-20250818    gcc-9.5.0
powerpc               randconfig-003-20250815    gcc-11.5.0
powerpc               randconfig-003-20250818    clang-22
powerpc64             randconfig-001-20250815    gcc-14.3.0
powerpc64             randconfig-001-20250818    gcc-8.5.0
powerpc64             randconfig-002-20250815    gcc-10.5.0
powerpc64             randconfig-002-20250818    clang-17
powerpc64             randconfig-003-20250815    clang-22
powerpc64             randconfig-003-20250818    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250815    gcc-12.5.0
riscv                 randconfig-001-20250818    gcc-10.5.0
riscv                 randconfig-002-20250815    gcc-8.5.0
riscv                 randconfig-002-20250818    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250815    gcc-8.5.0
s390                  randconfig-001-20250818    clang-22
s390                  randconfig-002-20250815    clang-22
s390                  randconfig-002-20250818    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250815    gcc-11.5.0
sh                    randconfig-001-20250818    gcc-12.5.0
sh                    randconfig-002-20250815    gcc-12.5.0
sh                    randconfig-002-20250818    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250815    gcc-11.5.0
sparc                 randconfig-001-20250818    gcc-12.5.0
sparc                 randconfig-002-20250815    gcc-13.4.0
sparc                 randconfig-002-20250818    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250815    clang-22
sparc64               randconfig-001-20250818    clang-22
sparc64               randconfig-002-20250815    gcc-15.1.0
sparc64               randconfig-002-20250818    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250815    gcc-12
um                    randconfig-001-20250818    gcc-11
um                    randconfig-002-20250815    clang-19
um                    randconfig-002-20250818    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250815    clang-20
x86_64      buildonly-randconfig-001-20250818    gcc-12
x86_64      buildonly-randconfig-002-20250815    gcc-12
x86_64      buildonly-randconfig-002-20250818    gcc-12
x86_64      buildonly-randconfig-003-20250815    gcc-12
x86_64      buildonly-randconfig-003-20250818    gcc-12
x86_64      buildonly-randconfig-004-20250815    clang-20
x86_64      buildonly-randconfig-004-20250818    gcc-12
x86_64      buildonly-randconfig-005-20250815    clang-20
x86_64      buildonly-randconfig-005-20250818    gcc-12
x86_64      buildonly-randconfig-006-20250815    gcc-12
x86_64      buildonly-randconfig-006-20250818    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250815    gcc-8.5.0
xtensa                randconfig-001-20250818    gcc-14.3.0
xtensa                randconfig-002-20250815    gcc-15.1.0
xtensa                randconfig-002-20250818    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

