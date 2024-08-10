Return-Path: <linux-media+bounces-16069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D494DAAC
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 06:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92461F21EDE
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 04:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE8613B5AC;
	Sat, 10 Aug 2024 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6MyC79d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA213699A
	for <linux-media@vger.kernel.org>; Sat, 10 Aug 2024 04:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723263747; cv=none; b=IP2ShwOGzgt/Tjh2yMlkjvkwbkDbvyti+u3uYuxksAmcc6GxptzkFfpWAq6So6v64kmFMYrBKDxcCMKUyS31F/t8BhTuCej+P5pvPjILqqVUera4rwfDKfIc3vjDNzhy1VqL6ZmXz6PBhHRsadNdzjMumG+rg/Gtx04BbXCSW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723263747; c=relaxed/simple;
	bh=kx3gpn3eSglTceQ838ArCEarIQbwcQBjdbf7Z4e7+8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xw3JVQmpgazyHBKZhpVes+JIbVx7RseFs8/K4z7y22x+k+VmBBhukdwe6Xt0YTh/0k9BwMnXl9MIr5m7KjMQtKhlXM1hgUo+QRhXkuvmHxydViB15mJ2IxSVWaO43Io5cdLIn3yxrHI5jeZilyVJkcEGhWiD1Zmjk/8ZEv1KBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6MyC79d; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723263745; x=1754799745;
  h=date:from:to:cc:subject:message-id;
  bh=kx3gpn3eSglTceQ838ArCEarIQbwcQBjdbf7Z4e7+8s=;
  b=g6MyC79dKCWy4PmR9RoQA07+E4JDZ3XbmsggQFBKE6LyOkTsFQxzOsq8
   FaLWP5PRGSKHi+b0jYqTTjbmRoDOPFQBRKDwDveqd6ntivLsWR/aZVXWn
   6tsMTP4D2CO4Jzu4b1masn3zMFPw5ziub7XVhDgHRbFHb47MEIxo2EqC1
   uMaYw4jOKQ6zPZ8d78ed/G8YsFMz101ilCUvoFsz3NEJ8G7YvLeHxfhC9
   R3tNaDXD9+7Cy6efWuI6DGTfQKMeZszpLjpDWWSYFknWrZCziZomecPkw
   37HUhQfuUF88VnDpDJCzFRdfu0LCYtdmjjBDoPKkC5P9HQy9aIOQeiEWp
   A==;
X-CSE-ConnectionGUID: Zt3llECDQhmFscpc1f04mQ==
X-CSE-MsgGUID: 5EbRMiQvSwmF4EAP1YvGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="24352021"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="24352021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 21:22:24 -0700
X-CSE-ConnectionGUID: cEokNz4wTWGkQbw+1E/yJA==
X-CSE-MsgGUID: mdPJV/m2QJelpBGOyHazxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="80979307"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2024 21:22:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scdcS-0009al-2X;
	Sat, 10 Aug 2024 04:22:20 +0000
Date: Sat, 10 Aug 2024 12:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
Message-ID: <202408101216.LO8LJ8Kv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9  media: ti: cal: use 'time_left' variable with wait_event_timeout()

elapsed time: 1306m

configs tested: 227
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240810   gcc-13.2.0
arc                   randconfig-002-20240810   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   clang-20
arm                         lpc18xx_defconfig   clang-20
arm                            mps2_defconfig   gcc-13.2.0
arm                   randconfig-001-20240810   gcc-13.2.0
arm                   randconfig-002-20240810   gcc-13.2.0
arm                   randconfig-003-20240810   gcc-13.2.0
arm                   randconfig-004-20240810   gcc-13.2.0
arm                         s3c6400_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240810   gcc-13.2.0
arm64                 randconfig-002-20240810   gcc-13.2.0
arm64                 randconfig-003-20240810   gcc-13.2.0
arm64                 randconfig-004-20240810   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240810   gcc-13.2.0
csky                  randconfig-002-20240810   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240809   gcc-12
i386         buildonly-randconfig-001-20240810   clang-18
i386         buildonly-randconfig-002-20240809   clang-18
i386         buildonly-randconfig-002-20240809   gcc-12
i386         buildonly-randconfig-002-20240810   clang-18
i386         buildonly-randconfig-003-20240809   gcc-11
i386         buildonly-randconfig-003-20240809   gcc-12
i386         buildonly-randconfig-003-20240810   clang-18
i386         buildonly-randconfig-004-20240809   clang-18
i386         buildonly-randconfig-004-20240809   gcc-12
i386         buildonly-randconfig-004-20240810   clang-18
i386         buildonly-randconfig-005-20240809   clang-18
i386         buildonly-randconfig-005-20240809   gcc-12
i386         buildonly-randconfig-005-20240810   clang-18
i386         buildonly-randconfig-006-20240809   gcc-12
i386         buildonly-randconfig-006-20240810   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240809   gcc-12
i386                  randconfig-001-20240810   clang-18
i386                  randconfig-002-20240809   clang-18
i386                  randconfig-002-20240809   gcc-12
i386                  randconfig-002-20240810   clang-18
i386                  randconfig-003-20240809   clang-18
i386                  randconfig-003-20240809   gcc-12
i386                  randconfig-003-20240810   clang-18
i386                  randconfig-004-20240809   gcc-12
i386                  randconfig-004-20240810   clang-18
i386                  randconfig-005-20240809   clang-18
i386                  randconfig-005-20240809   gcc-12
i386                  randconfig-005-20240810   clang-18
i386                  randconfig-006-20240809   gcc-12
i386                  randconfig-006-20240810   clang-18
i386                  randconfig-011-20240809   gcc-12
i386                  randconfig-011-20240810   clang-18
i386                  randconfig-012-20240809   gcc-12
i386                  randconfig-012-20240810   clang-18
i386                  randconfig-013-20240809   gcc-12
i386                  randconfig-013-20240810   clang-18
i386                  randconfig-014-20240809   gcc-12
i386                  randconfig-014-20240810   clang-18
i386                  randconfig-015-20240809   gcc-11
i386                  randconfig-015-20240809   gcc-12
i386                  randconfig-015-20240810   clang-18
i386                  randconfig-016-20240809   gcc-12
i386                  randconfig-016-20240810   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240810   gcc-13.2.0
loongarch             randconfig-002-20240810   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
mips                        qi_lb60_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
mips                         rt305x_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240810   gcc-13.2.0
nios2                 randconfig-002-20240810   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240810   gcc-13.2.0
parisc                randconfig-002-20240810   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   clang-20
powerpc64             randconfig-001-20240810   gcc-13.2.0
powerpc64             randconfig-002-20240810   gcc-13.2.0
powerpc64             randconfig-003-20240810   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240810   gcc-13.2.0
riscv                 randconfig-002-20240810   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240810   gcc-13.2.0
s390                  randconfig-002-20240810   gcc-13.2.0
s390                       zfcpdump_defconfig   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240810   gcc-13.2.0
sh                    randconfig-002-20240810   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240810   gcc-13.2.0
sparc64               randconfig-002-20240810   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240810   gcc-13.2.0
um                    randconfig-002-20240810   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240810   gcc-12
x86_64       buildonly-randconfig-002-20240810   gcc-12
x86_64       buildonly-randconfig-003-20240810   gcc-12
x86_64       buildonly-randconfig-004-20240810   gcc-12
x86_64       buildonly-randconfig-005-20240810   gcc-12
x86_64       buildonly-randconfig-006-20240810   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240810   gcc-12
x86_64                randconfig-002-20240810   gcc-12
x86_64                randconfig-003-20240810   gcc-12
x86_64                randconfig-004-20240810   gcc-12
x86_64                randconfig-005-20240810   gcc-12
x86_64                randconfig-006-20240810   gcc-12
x86_64                randconfig-011-20240810   gcc-12
x86_64                randconfig-012-20240810   gcc-12
x86_64                randconfig-013-20240810   gcc-12
x86_64                randconfig-014-20240810   gcc-12
x86_64                randconfig-015-20240810   gcc-12
x86_64                randconfig-016-20240810   gcc-12
x86_64                randconfig-071-20240810   gcc-12
x86_64                randconfig-072-20240810   gcc-12
x86_64                randconfig-073-20240810   gcc-12
x86_64                randconfig-074-20240810   gcc-12
x86_64                randconfig-075-20240810   gcc-12
x86_64                randconfig-076-20240810   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240810   gcc-13.2.0
xtensa                randconfig-002-20240810   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

