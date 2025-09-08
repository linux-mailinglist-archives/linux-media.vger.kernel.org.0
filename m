Return-Path: <linux-media+bounces-41945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D299B4820F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 03:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E95FB17B44A
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 01:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0542110F1;
	Mon,  8 Sep 2025 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6b4V32Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5C1C3C18
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757294506; cv=none; b=g6TX74GHLakmYLdbAryoilrch17haWjwvVZK/d8WbaKiR6ynxj48LrEFuhGTmS96iyZFPRPWFAcBghQI83QCcTQ6zw4ArLXGsUFiVL1VljK+YU0MzUZJ7KxDFcXVD4/2AOMhXUmiKjqZGEEgHKEaQwbqgDkWWg25QecUpiZvFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757294506; c=relaxed/simple;
	bh=YH7vjdaJ8339GxKudcvEo0nr+eX6YuEOU/vFApdG2ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7aN25NkMd+io0oc4ilsINIvylVHhiUDFeHWvSQbdIpBzfo3yaSBY4W4cRmT7oTlALHyh36Zde9ruCYYBH2IMNsAuL9Xkpq7Ti5xV0J9HCSmYsn7GRNR080V3QlHMH3YYK6iYPYBObcWk1VWRogrtOYu2FX5G+YEy9UvG9pskJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6b4V32Y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757294505; x=1788830505;
  h=date:from:to:cc:subject:message-id;
  bh=YH7vjdaJ8339GxKudcvEo0nr+eX6YuEOU/vFApdG2ko=;
  b=W6b4V32Y8KgnLo/9ATjpUmuWB11O3rA3hFt+cBFVpFScP8sVmd1M3Jqj
   hfeY86LUAuzo9B+wCJXlsngL4MOOILKpd1XPPZ4zBWVcHCSbTHLQSjPql
   2xoY+6UXQ0cKYvOOR45/9D1o/PKMm1ldxN0IubfuBslmz5Y8gEwhwl4+/
   I7nk89fpsXiQssjE+I6soVKSt248cXpEEd1m0UwSA7/1T8BIw+itxFLRa
   0F1FcmON0Zk5UIiHXv8/Y13wI0LHESnQiJUGk4euXH3BotnJpTZKTOcwx
   cvissWunhLZs8VSu03D6nb5yApsORpr3d3TpnW/+E678IXl39avb7fDTY
   Q==;
X-CSE-ConnectionGUID: 3Hk+ogFRRDGSg5cXYohhHw==
X-CSE-MsgGUID: xkbVBoonQwOSiDmhU00Uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59476588"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59476588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 18:21:44 -0700
X-CSE-ConnectionGUID: F13L+WvOSHKjVyUjrrM3KQ==
X-CSE-MsgGUID: yzY1LonuTDaQ+MrIhXfJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="209817636"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2025 18:21:44 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvQZg-0003NR-3A;
	Mon, 08 Sep 2025 01:21:40 +0000
Date: Mon, 08 Sep 2025 09:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3
Message-ID: <202509080933.ajLxVK82-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3  media: i2c: tc358743: add support for more infoframe types

elapsed time: 983m

configs tested: 128
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
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250907    gcc-8.5.0
arc                   randconfig-002-20250907    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.1.0
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250907    gcc-8.5.0
arm                   randconfig-002-20250907    clang-22
arm                   randconfig-003-20250907    clang-22
arm                   randconfig-004-20250907    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250907    clang-22
arm64                 randconfig-002-20250907    gcc-14.3.0
arm64                 randconfig-003-20250907    clang-22
arm64                 randconfig-004-20250907    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250907    gcc-15.1.0
csky                  randconfig-002-20250907    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250907    clang-17
hexagon               randconfig-002-20250907    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250907    clang-20
i386        buildonly-randconfig-002-20250907    clang-20
i386        buildonly-randconfig-003-20250907    gcc-13
i386        buildonly-randconfig-004-20250907    clang-20
i386        buildonly-randconfig-005-20250907    clang-20
i386        buildonly-randconfig-006-20250907    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250907    clang-22
loongarch             randconfig-002-20250907    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250907    gcc-11.5.0
nios2                 randconfig-002-20250907    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250907    gcc-9.5.0
parisc                randconfig-002-20250907    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     mpc83xx_defconfig    clang-22
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20250907    gcc-9.5.0
powerpc               randconfig-002-20250907    clang-22
powerpc               randconfig-003-20250907    gcc-15.1.0
powerpc64             randconfig-001-20250907    gcc-13.4.0
powerpc64             randconfig-002-20250907    clang-22
powerpc64             randconfig-003-20250907    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250907    clang-22
riscv                 randconfig-002-20250907    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250907    gcc-8.5.0
s390                  randconfig-002-20250907    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250907    gcc-12.5.0
sh                    randconfig-002-20250907    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250907    gcc-13.4.0
sparc                 randconfig-002-20250907    gcc-15.1.0
sparc64               randconfig-001-20250907    gcc-12.5.0
sparc64               randconfig-002-20250907    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250907    gcc-13
um                    randconfig-002-20250907    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250907    gcc-13
x86_64      buildonly-randconfig-002-20250907    clang-20
x86_64      buildonly-randconfig-003-20250907    gcc-13
x86_64      buildonly-randconfig-004-20250907    gcc-13
x86_64      buildonly-randconfig-005-20250907    gcc-13
x86_64      buildonly-randconfig-006-20250907    gcc-13
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250907    gcc-10.5.0
xtensa                randconfig-002-20250907    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

