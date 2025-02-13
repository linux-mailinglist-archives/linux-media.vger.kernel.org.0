Return-Path: <linux-media+bounces-26114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4547A33A4E
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0953A675C
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED10620B81E;
	Thu, 13 Feb 2025 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdeOGeL8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05A2063DA
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436849; cv=none; b=FC6j0whJ99fffDC76UyyK9p8US6FBFO91cJ4iqYXoAEsaWLRa6d8WvUjElJAMshXg43vpev+5TDGfal7FfKpymryIDQi89s6xEuhrd+eZicFSHiEHqfFBt7TuSpKi9zbEjP0VVP1qfT8/Gwq4o+hCYZ9rEi/d5k9F7SSushTcEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436849; c=relaxed/simple;
	bh=VJviSIP7OJFCsUmgdYwlZkUglNVq7jZaOgB4u4dcC3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sViFkiIMDamTqF2yiJm9kRGdoCh3QXuTlGdDXV6Haw8yPvBYBTNDmZmSKDc7wt820iIL/Wbc7ImDck5cF/v0TYdVFm0Fq8RDFNPLvvEBBkICa2UR4D/Mr6ZrnJg9FVgqun4v/vT1l3/Cq2aYeH809f/cwuyLykl32hwl42Njqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdeOGeL8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739436848; x=1770972848;
  h=date:from:to:cc:subject:message-id;
  bh=VJviSIP7OJFCsUmgdYwlZkUglNVq7jZaOgB4u4dcC3A=;
  b=AdeOGeL8/QOrZhgMelfcsQ3i9SUpGgg9W7AXkehnVnLca1F43meXv/Ri
   I1kMX8+DG5NAnuUH7eVRrDS19bFcGZn0W8VHbY6ZpPguLnZwoNBdhA2DN
   HBR1C52DKo+FnptKgKjZGEIvSrNUkHLDT2EfE2w9W9a3athR6aHM1G+ui
   MYinh4q9qbRaFUp1mowKF/mKs7TaTSGGbmwhI6CFToGVT4x4yiNwPIR0G
   m/8jryXH3mRQfOz4WfMf538wwJK/S8SKRYoefOwKWfAmjPr0fIXtXD05U
   /RyIlNHFA7qY+7eb1nzEFs67R1w9gtYIbR5FKqDBiyqZtu7OhHb5j66ea
   g==;
X-CSE-ConnectionGUID: TCgpVbC/QfexQ03mfE3whQ==
X-CSE-MsgGUID: +pPPAtjuStqPgZ1aD4q3RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40244056"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40244056"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 00:54:07 -0800
X-CSE-ConnectionGUID: qEat8P7yT26kgGPR6WIpIQ==
X-CSE-MsgGUID: Q1HGqkzXTf+8Phukz4O10w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113067466"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 00:54:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiUyx-0016qD-2b;
	Thu, 13 Feb 2025 08:54:03 +0000
Date: Thu, 13 Feb 2025 16:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 c52643b241525c0f4bf8902eeaba0d74bc5af278
Message-ID: <202502131647.sNtclVoZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c52643b241525c0f4bf8902eeaba0d74bc5af278  media: qcom: camss: add support for SDM670 camss

elapsed time: 892m

configs tested: 202
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250213    gcc-13.2.0
arc                   randconfig-001-20250213    gcc-14.2.0
arc                   randconfig-002-20250213    gcc-13.2.0
arc                   randconfig-002-20250213    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250213    clang-17
arm                   randconfig-001-20250213    gcc-14.2.0
arm                   randconfig-002-20250213    clang-15
arm                   randconfig-002-20250213    gcc-14.2.0
arm                   randconfig-003-20250213    clang-21
arm                   randconfig-003-20250213    gcc-14.2.0
arm                   randconfig-004-20250213    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250213    clang-19
arm64                 randconfig-001-20250213    gcc-14.2.0
arm64                 randconfig-002-20250213    gcc-14.2.0
arm64                 randconfig-003-20250213    gcc-14.2.0
arm64                 randconfig-004-20250213    clang-21
arm64                 randconfig-004-20250213    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250213    clang-21
csky                  randconfig-001-20250213    gcc-14.2.0
csky                  randconfig-002-20250213    clang-21
csky                  randconfig-002-20250213    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250213    clang-21
hexagon               randconfig-002-20250213    clang-18
hexagon               randconfig-002-20250213    clang-21
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250213    clang-19
i386        buildonly-randconfig-001-20250213    gcc-12
i386        buildonly-randconfig-002-20250213    clang-19
i386        buildonly-randconfig-003-20250213    clang-19
i386        buildonly-randconfig-004-20250213    clang-19
i386        buildonly-randconfig-005-20250213    clang-19
i386        buildonly-randconfig-006-20250213    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250213    clang-19
i386                  randconfig-002-20250213    clang-19
i386                  randconfig-003-20250213    clang-19
i386                  randconfig-004-20250213    clang-19
i386                  randconfig-005-20250213    clang-19
i386                  randconfig-006-20250213    clang-19
i386                  randconfig-007-20250213    clang-19
i386                  randconfig-011-20250213    gcc-12
i386                  randconfig-012-20250213    gcc-12
i386                  randconfig-013-20250213    gcc-12
i386                  randconfig-014-20250213    gcc-12
i386                  randconfig-015-20250213    gcc-12
i386                  randconfig-016-20250213    gcc-12
i386                  randconfig-017-20250213    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250213    clang-21
loongarch             randconfig-001-20250213    gcc-14.2.0
loongarch             randconfig-002-20250213    clang-21
loongarch             randconfig-002-20250213    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250213    clang-21
nios2                 randconfig-001-20250213    gcc-14.2.0
nios2                 randconfig-002-20250213    clang-21
nios2                 randconfig-002-20250213    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250213    clang-21
parisc                randconfig-001-20250213    gcc-14.2.0
parisc                randconfig-002-20250213    clang-21
parisc                randconfig-002-20250213    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250213    clang-17
powerpc               randconfig-001-20250213    clang-21
powerpc               randconfig-002-20250213    clang-21
powerpc               randconfig-002-20250213    gcc-14.2.0
powerpc               randconfig-003-20250213    clang-21
powerpc               randconfig-003-20250213    gcc-14.2.0
powerpc64             randconfig-001-20250213    clang-19
powerpc64             randconfig-001-20250213    clang-21
powerpc64             randconfig-002-20250213    clang-21
powerpc64             randconfig-003-20250213    clang-21
powerpc64             randconfig-003-20250213    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250213    clang-19
riscv                 randconfig-001-20250213    clang-21
riscv                 randconfig-002-20250213    clang-17
riscv                 randconfig-002-20250213    clang-21
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250213    clang-21
s390                  randconfig-001-20250213    gcc-14.2.0
s390                  randconfig-002-20250213    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250213    clang-21
sh                    randconfig-001-20250213    gcc-14.2.0
sh                    randconfig-002-20250213    clang-21
sh                    randconfig-002-20250213    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250213    clang-21
sparc                 randconfig-001-20250213    gcc-14.2.0
sparc                 randconfig-002-20250213    clang-21
sparc                 randconfig-002-20250213    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250213    clang-21
sparc64               randconfig-001-20250213    gcc-14.2.0
sparc64               randconfig-002-20250213    clang-21
sparc64               randconfig-002-20250213    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250213    clang-19
um                    randconfig-001-20250213    clang-21
um                    randconfig-002-20250213    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250213    gcc-11
x86_64      buildonly-randconfig-001-20250213    gcc-12
x86_64      buildonly-randconfig-002-20250213    gcc-12
x86_64      buildonly-randconfig-003-20250213    clang-19
x86_64      buildonly-randconfig-003-20250213    gcc-12
x86_64      buildonly-randconfig-004-20250213    gcc-12
x86_64      buildonly-randconfig-005-20250213    gcc-12
x86_64      buildonly-randconfig-006-20250213    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250213    clang-19
x86_64                randconfig-002-20250213    clang-19
x86_64                randconfig-003-20250213    clang-19
x86_64                randconfig-004-20250213    clang-19
x86_64                randconfig-005-20250213    clang-19
x86_64                randconfig-006-20250213    clang-19
x86_64                randconfig-007-20250213    clang-19
x86_64                randconfig-008-20250213    clang-19
x86_64                randconfig-071-20250213    gcc-12
x86_64                randconfig-072-20250213    gcc-12
x86_64                randconfig-073-20250213    gcc-12
x86_64                randconfig-074-20250213    gcc-12
x86_64                randconfig-075-20250213    gcc-12
x86_64                randconfig-076-20250213    gcc-12
x86_64                randconfig-077-20250213    gcc-12
x86_64                randconfig-078-20250213    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250213    clang-21
xtensa                randconfig-001-20250213    gcc-14.2.0
xtensa                randconfig-002-20250213    clang-21
xtensa                randconfig-002-20250213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

