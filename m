Return-Path: <linux-media+bounces-49801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C5CEBDD4
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 721B93014DAA
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 11:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3562E228C;
	Wed, 31 Dec 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQlJiGpK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D67221F15
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767180879; cv=none; b=uGDxFm/6HFt83XxfPiZ67iPIZuYQutQFBlfL1vs8wPgGSVFFOL+Ttqy3+drEJTcW45u5k9RjyOgnorSKJf3TvT/SFcx4WQHltUvTSNdZsRGWi9X0JlBKi7jPCIoolUII/SXJYHdmm72V2CtYI+8nwcWK1eKUgT3Ls95FqzWy4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767180879; c=relaxed/simple;
	bh=+C9Ncs3e0Vejw2B1YmyvhcVMJVHyjlggnypcZZolu1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IfumFTHbHfHE6i5HycEYB0RrwKK5fAXGGnIIyhVXWgE9ka079phl7VvKB3QOc37nVkYEppK9pz6R1QVPUlqmZt0EglWeU+KH5q9ql6RvLARHgcut4aQWdu4ZIOWAtCiTQr0xP6K7PcFKdDWucUiTjvo6rdGfj6629iIul2fsf8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQlJiGpK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767180878; x=1798716878;
  h=date:from:to:cc:subject:message-id;
  bh=+C9Ncs3e0Vejw2B1YmyvhcVMJVHyjlggnypcZZolu1w=;
  b=nQlJiGpKB+BdbHz71OKQnShb7Mt0YeK8fj1iqej1tMXvTE75kmWGpD+d
   jdGgameON4NAA/f/zb8P/1Z8AHmHYoHAWKUfizkZaEzJtYO2lclrgeeAR
   IQ+Kbcp0cf2gF+CmGahT6JubLcf22jSKBs4nQX0jbaXUL9cQ6OfXuY1+i
   /uihUU07CuttVIOhZ6H13rbOnuFTQU/1kzndo6djl9Rp7kJVQ2uOdRn7f
   W0FE3wY3I5msGRiFqjKBh8V2Nj+MFJ4RB7b7l3PHtuY16sAEdcOH2HbkX
   nfeN/1BgRr7DZZNfEzB8qhbMEswTjbBYItek3gPPAtQRPuIAE60ncqYkg
   A==;
X-CSE-ConnectionGUID: dVD4bS2SR2WAviz48OgMpw==
X-CSE-MsgGUID: P9xsGV6dQ7ays3svHKssOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="91405238"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="91405238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 03:34:37 -0800
X-CSE-ConnectionGUID: zQjIwAdgTd6u3xsSx+sc6w==
X-CSE-MsgGUID: Ddd0wL+3SBu1jiIkWQQSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="200631803"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2025 03:34:36 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vauTJ-0000000019w-24oI;
	Wed, 31 Dec 2025 11:34:33 +0000
Date: Wed, 31 Dec 2025 19:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 92424a8fa1118be768e8f0295fcd10810d87db06
Message-ID: <202512311904.4to6g7uB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 92424a8fa1118be768e8f0295fcd10810d87db06  media: i2c: og0ve1b: make configurable vblank control of the sensor

elapsed time: 1327m

configs tested: 166
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
arc                   randconfig-001-20251231    gcc-11.5.0
arc                   randconfig-002-20251231    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20251231    gcc-12.5.0
arm                   randconfig-002-20251231    clang-22
arm                   randconfig-003-20251231    gcc-8.5.0
arm                   randconfig-004-20251231    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251231    clang-22
arm64                 randconfig-002-20251231    clang-19
arm64                 randconfig-003-20251231    gcc-8.5.0
arm64                 randconfig-004-20251231    gcc-13.4.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251231    gcc-14.3.0
csky                  randconfig-002-20251231    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251231    clang-22
hexagon               randconfig-002-20251231    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251231    clang-20
i386        buildonly-randconfig-002-20251231    gcc-14
i386        buildonly-randconfig-003-20251231    gcc-14
i386        buildonly-randconfig-004-20251231    gcc-14
i386        buildonly-randconfig-005-20251231    gcc-14
i386        buildonly-randconfig-006-20251231    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251231    gcc-14
i386                  randconfig-002-20251231    gcc-12
i386                  randconfig-003-20251231    gcc-14
i386                  randconfig-004-20251231    clang-20
i386                  randconfig-005-20251231    gcc-14
i386                  randconfig-006-20251231    gcc-14
i386                  randconfig-007-20251231    gcc-14
i386                  randconfig-011-20251231    gcc-14
i386                  randconfig-012-20251231    clang-20
i386                  randconfig-013-20251231    gcc-13
i386                  randconfig-014-20251231    gcc-14
i386                  randconfig-015-20251231    gcc-13
i386                  randconfig-016-20251231    clang-20
i386                  randconfig-017-20251231    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251231    gcc-12.5.0
loongarch             randconfig-002-20251231    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251231    gcc-8.5.0
nios2                 randconfig-002-20251231    gcc-10.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251231    gcc-8.5.0
parisc                randconfig-002-20251231    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251231    gcc-8.5.0
powerpc               randconfig-002-20251231    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251231    clang-16
powerpc64             randconfig-002-20251231    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251231    gcc-14.3.0
riscv                 randconfig-002-20251231    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251231    gcc-8.5.0
s390                  randconfig-002-20251231    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251231    gcc-15.1.0
sh                    randconfig-002-20251231    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251231    gcc-11.5.0
sparc                 randconfig-002-20251231    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251231    clang-22
sparc64               randconfig-002-20251231    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251231    clang-22
um                    randconfig-002-20251231    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251231    gcc-14
x86_64      buildonly-randconfig-002-20251231    gcc-14
x86_64      buildonly-randconfig-003-20251231    gcc-14
x86_64      buildonly-randconfig-004-20251231    clang-20
x86_64      buildonly-randconfig-005-20251231    gcc-14
x86_64      buildonly-randconfig-006-20251231    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251231    gcc-13
x86_64                randconfig-002-20251231    clang-20
x86_64                randconfig-003-20251231    clang-20
x86_64                randconfig-004-20251231    clang-20
x86_64                randconfig-005-20251231    clang-20
x86_64                randconfig-006-20251231    clang-20
x86_64                randconfig-011-20251231    clang-20
x86_64                randconfig-012-20251231    gcc-14
x86_64                randconfig-013-20251231    gcc-14
x86_64                randconfig-014-20251231    gcc-12
x86_64                randconfig-015-20251231    gcc-14
x86_64                randconfig-016-20251231    gcc-14
x86_64                randconfig-071-20251231    clang-20
x86_64                randconfig-072-20251231    clang-20
x86_64                randconfig-073-20251231    gcc-12
x86_64                randconfig-074-20251231    gcc-14
x86_64                randconfig-075-20251231    clang-20
x86_64                randconfig-076-20251231    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251231    gcc-8.5.0
xtensa                randconfig-002-20251231    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

