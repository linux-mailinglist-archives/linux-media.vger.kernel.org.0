Return-Path: <linux-media+bounces-25820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C488A2C93F
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 17:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AFDF16325B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1550D18DB0A;
	Fri,  7 Feb 2025 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnGnmL5v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B8161320
	for <linux-media@vger.kernel.org>; Fri,  7 Feb 2025 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946914; cv=none; b=gvhDnly5RLAH2ypklYV06Cv4o03sg8JloHGqGVJtPyDGHPC00PucUe79QSCqbT5VJF7y0Q1AQAwGOE8b651KS+ZXRAQY5ITEVyOLzCtPjD1wPq8EpUonLt0rlZH1yUkGDXjQFNHuk10l+TVf6cE9uawcsC3wWFhFUoyZbHfZF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946914; c=relaxed/simple;
	bh=S9vpYmLrgpoCJxwEw3R4Maz6vUIYR2+CAuh7wFLr0A0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ouMPDnHIjY+g0RqH1PsozgMbMVPN7ZtVj2BFMU8BNzSSqAVVfghs5YbPgS3TR4fMFaw1/ZIk02qJ4ZCD4EaPuMmZPlO9jPIxGF9Xg2rQEPWgNoUx33/7sx3Fwr4XaxP7FRE12noaX091WDM4GlvVkW2w+ipaSlD+XuR8xs5wJew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnGnmL5v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738946913; x=1770482913;
  h=date:from:to:cc:subject:message-id;
  bh=S9vpYmLrgpoCJxwEw3R4Maz6vUIYR2+CAuh7wFLr0A0=;
  b=lnGnmL5vywn6KGoyO58Z054m9jgPR2StHD5s7E3ycFlfeXnpuotcv9NN
   G3q/GVVCb3T6vmS7irUCZtXA1zjp+jaasFIJos8D4h8fUi+kuZhaoLhUv
   MP5d1CJNnG1V7ixk7cYN4DzHIouCUiu96Eml7LHSZc+A7HnohM2DtJeQk
   sz1zakYO6BLhDHhZu+R+OVdhLJ8RCJ+hxwIhgax6cnVycUtRRHLMLT3bc
   +MY12mVtWLLU7aaMcJBx7kIyMuvNUCS+3e6EHIpKbrHbb+11claLdQj+z
   0oyTSJgpYGNJedBywYBlxa64gWiOBe3MhLR/h+kPYrXZUAzJUZFAjd+hk
   g==;
X-CSE-ConnectionGUID: zD7kdSy2TYSLQmQR3pWGgQ==
X-CSE-MsgGUID: 7K9EM2ItQIGk5k2pA3SVpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43250991"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="43250991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:48:32 -0800
X-CSE-ConnectionGUID: wXbmZ8HgSTmpVyMRTY1qkg==
X-CSE-MsgGUID: sHLjrxnRQzu84eO9O3Db+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="142446092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2025 08:48:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgRWm-000ycV-0p;
	Fri, 07 Feb 2025 16:48:28 +0000
Date: Sat, 08 Feb 2025 00:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 39e3f5bc0ab4a86b0c8fcda0688d21651ec17242
Message-ID: <202502080035.HNcP3qyJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 39e3f5bc0ab4a86b0c8fcda0688d21651ec17242  media: qcom: camss: Add support for VFE 780

elapsed time: 1453m

configs tested: 193
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-19
arc                   randconfig-001-20250207    gcc-13.2.0
arc                   randconfig-002-20250207    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250207    gcc-13.2.0
arm                   randconfig-001-20250207    gcc-14.2.0
arm                   randconfig-002-20250207    gcc-13.2.0
arm                   randconfig-002-20250207    gcc-14.2.0
arm                   randconfig-003-20250207    gcc-13.2.0
arm                   randconfig-003-20250207    gcc-14.2.0
arm                   randconfig-004-20250207    clang-21
arm                   randconfig-004-20250207    gcc-13.2.0
arm                         s3c6400_defconfig    clang-19
arm                         wpcm450_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250207    gcc-13.2.0
arm64                 randconfig-001-20250207    gcc-14.2.0
arm64                 randconfig-002-20250207    gcc-13.2.0
arm64                 randconfig-002-20250207    gcc-14.2.0
arm64                 randconfig-003-20250207    clang-16
arm64                 randconfig-003-20250207    gcc-13.2.0
arm64                 randconfig-004-20250207    clang-21
arm64                 randconfig-004-20250207    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250207    gcc-14.2.0
csky                  randconfig-002-20250207    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250207    clang-21
hexagon               randconfig-001-20250207    gcc-14.2.0
hexagon               randconfig-002-20250207    clang-17
hexagon               randconfig-002-20250207    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250207    gcc-12
i386        buildonly-randconfig-002-20250207    gcc-12
i386        buildonly-randconfig-003-20250207    gcc-12
i386        buildonly-randconfig-004-20250207    gcc-12
i386        buildonly-randconfig-005-20250207    clang-19
i386        buildonly-randconfig-005-20250207    gcc-12
i386        buildonly-randconfig-006-20250207    clang-19
i386        buildonly-randconfig-006-20250207    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250207    gcc-12
i386                  randconfig-002-20250207    gcc-12
i386                  randconfig-003-20250207    gcc-12
i386                  randconfig-004-20250207    gcc-12
i386                  randconfig-005-20250207    gcc-12
i386                  randconfig-006-20250207    gcc-12
i386                  randconfig-007-20250207    gcc-12
i386                  randconfig-011-20250207    gcc-12
i386                  randconfig-012-20250207    gcc-12
i386                  randconfig-013-20250207    gcc-12
i386                  randconfig-014-20250207    gcc-12
i386                  randconfig-015-20250207    gcc-12
i386                  randconfig-016-20250207    gcc-12
i386                  randconfig-017-20250207    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250207    gcc-14.2.0
loongarch             randconfig-002-20250207    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250207    gcc-14.2.0
nios2                 randconfig-002-20250207    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250207    gcc-14.2.0
parisc                randconfig-002-20250207    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                 canyonlands_defconfig    clang-19
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250207    clang-21
powerpc               randconfig-001-20250207    gcc-14.2.0
powerpc               randconfig-002-20250207    clang-21
powerpc               randconfig-002-20250207    gcc-14.2.0
powerpc               randconfig-003-20250207    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-19
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250207    gcc-14.2.0
powerpc64             randconfig-002-20250207    clang-21
powerpc64             randconfig-002-20250207    gcc-14.2.0
powerpc64             randconfig-003-20250207    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250207    gcc-14.2.0
riscv                 randconfig-002-20250207    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250207    gcc-14.2.0
s390                  randconfig-002-20250207    clang-21
s390                  randconfig-002-20250207    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250207    gcc-14.2.0
sh                    randconfig-002-20250207    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250207    gcc-14.2.0
sparc                 randconfig-002-20250207    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250207    gcc-14.2.0
sparc64               randconfig-002-20250207    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250207    clang-21
um                    randconfig-001-20250207    gcc-14.2.0
um                    randconfig-002-20250207    gcc-12
um                    randconfig-002-20250207    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250207    clang-19
x86_64      buildonly-randconfig-001-20250207    gcc-12
x86_64      buildonly-randconfig-002-20250207    clang-19
x86_64      buildonly-randconfig-003-20250207    clang-19
x86_64      buildonly-randconfig-004-20250207    clang-19
x86_64      buildonly-randconfig-005-20250207    clang-19
x86_64      buildonly-randconfig-006-20250207    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250207    clang-19
x86_64                randconfig-002-20250207    clang-19
x86_64                randconfig-003-20250207    clang-19
x86_64                randconfig-004-20250207    clang-19
x86_64                randconfig-005-20250207    clang-19
x86_64                randconfig-006-20250207    clang-19
x86_64                randconfig-007-20250207    clang-19
x86_64                randconfig-008-20250207    clang-19
x86_64                randconfig-071-20250207    gcc-12
x86_64                randconfig-072-20250207    gcc-12
x86_64                randconfig-073-20250207    gcc-12
x86_64                randconfig-074-20250207    gcc-12
x86_64                randconfig-075-20250207    gcc-12
x86_64                randconfig-076-20250207    gcc-12
x86_64                randconfig-077-20250207    gcc-12
x86_64                randconfig-078-20250207    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250207    gcc-14.2.0
xtensa                randconfig-002-20250207    gcc-14.2.0
xtensa                         virt_defconfig    clang-19

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

