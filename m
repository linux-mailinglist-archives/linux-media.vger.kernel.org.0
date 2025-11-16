Return-Path: <linux-media+bounces-47183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6DC61D63
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 22:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F23DE4E2F99
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 21:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC16257827;
	Sun, 16 Nov 2025 21:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1SRa0y/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49622128395
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763328954; cv=none; b=d4ch6eCXt2s5VkaY2OSZSBajQBMhmV+BeHAn5ciwJNrCmsF5A0fLBTpyHmvwPtred9XEHGp89/2NuufD2YT1RdTTz7VB5ihI6yfrsUZuKOdn39pjEzhoYYFSi9UAsBAnL9o9b2lym/1d6FVZrmW4Hi2hTl8o3nvZCUd9tfFWuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763328954; c=relaxed/simple;
	bh=dY5Py9OpleD6PnPp6k/Nhkb0Olk38zoO2wW504QD8DM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nqTrXZ4tU4Lb4/5dwKtXQrrSxodg3qr1LwE0w5EW6YcqPgfpimE5IzvIopCs82SMsaWUyUzSjPbLzfoiKmeS1GT1gpAEcCGFMBVKnAMC0gS8ow9PgAU4hZq8Iq4nm/4ia7ntP1T2jcO7cSpjgWlNebIO3ZiUeDrjtHS2zM0dVDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1SRa0y/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763328952; x=1794864952;
  h=date:from:to:cc:subject:message-id;
  bh=dY5Py9OpleD6PnPp6k/Nhkb0Olk38zoO2wW504QD8DM=;
  b=M1SRa0y/s+a8OQP9vL8s2W+okTpglukxi7IyYKQ+6oOLV/q81pxuI/9b
   K8iMxChhC/q41dCvbUBzbcE52TtRUar03W9rtf4lrdvG0jmWxFXu9EDFE
   b0JJkmc/UCBJe3CLx0qD5piXwEQp6bHUwWlQ/SXjQTfHm6to9cZOX5fZb
   O0esJNu2qH04818SDKRNahEUdBlG9mJhZe+AO+LLfIk/J0NUAZwjyoexj
   DANNz+l+QNwtcoRFAwbsWhu1Ay5lFK2WrQMEeODHobbwuTM6w8xoReehM
   XtsuWiaK+fpMiZH/shKRpfMhILTnLpGjCEsJdRHTwFNFqcXLaXzYJpyxB
   A==;
X-CSE-ConnectionGUID: feVvWqHISoqSZTNP92rLSw==
X-CSE-MsgGUID: goyvZpP8QeG1Fmy+mfnNmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82960448"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82960448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 13:35:51 -0800
X-CSE-ConnectionGUID: G+FllsddRICVP29o+5xepw==
X-CSE-MsgGUID: 5/K7UFTWS9CNsCtCAhP5Ew==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2025 13:35:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKkPU-00095n-2J;
	Sun, 16 Nov 2025 21:35:48 +0000
Date: Mon, 17 Nov 2025 05:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 1f2353f5a1af995efbf7bea44341aa0d03460b28
Message-ID: <202511170522.HKwDgoGP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 1f2353f5a1af995efbf7bea44341aa0d03460b28  media: rockchip: rkcif: add support for rk3568 vicap mipi capture

elapsed time: 1915m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-002-20251115    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                         assabet_defconfig    clang-18
arm                                 defconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-004-20251115    clang-22
arm                           spitz_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251116    gcc-12.5.0
arm64                 randconfig-002-20251116    gcc-10.5.0
arm64                 randconfig-003-20251116    clang-22
arm64                 randconfig-004-20251116    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251116    gcc-12.5.0
csky                  randconfig-002-20251116    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
i386                              allnoconfig    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251117    gcc-12
i386                  randconfig-002-20251117    gcc-14
i386                  randconfig-003-20251117    clang-20
i386                  randconfig-004-20251117    clang-20
i386                  randconfig-005-20251117    gcc-14
i386                  randconfig-006-20251117    gcc-14
i386                  randconfig-007-20251117    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251116    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251116    gcc-12.5.0
parisc                randconfig-002-20251116    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251116    gcc-10.5.0
powerpc               randconfig-002-20251116    clang-22
powerpc64             randconfig-001-20251116    clang-22
powerpc64             randconfig-002-20251116    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251116    clang-20
riscv                 randconfig-002-20251116    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251116    clang-22
s390                  randconfig-002-20251116    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251116    gcc-13.4.0
sh                    randconfig-002-20251116    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251117    gcc-15.1.0
sparc                 randconfig-002-20251117    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251117    clang-20
sparc64               randconfig-002-20251117    gcc-10.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251117    gcc-14
um                    randconfig-002-20251117    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251116    clang-20
x86_64      buildonly-randconfig-002-20251116    clang-20
x86_64      buildonly-randconfig-003-20251116    clang-20
x86_64      buildonly-randconfig-004-20251116    gcc-13
x86_64      buildonly-randconfig-005-20251116    clang-20
x86_64      buildonly-randconfig-006-20251116    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251117    clang-20
x86_64                randconfig-012-20251117    gcc-14
x86_64                randconfig-013-20251117    gcc-14
x86_64                randconfig-014-20251117    gcc-12
x86_64                randconfig-015-20251117    gcc-14
x86_64                randconfig-016-20251117    gcc-14
x86_64                randconfig-071-20251116    clang-20
x86_64                randconfig-072-20251116    clang-20
x86_64                randconfig-073-20251116    clang-20
x86_64                randconfig-074-20251116    clang-20
x86_64                randconfig-075-20251116    clang-20
x86_64                randconfig-076-20251116    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251117    gcc-11.5.0
xtensa                randconfig-002-20251117    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

