Return-Path: <linux-media+bounces-40212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A96B2B59E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 02:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46933B9272
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 00:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C620B18FC92;
	Tue, 19 Aug 2025 00:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLtP6A2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA693451D0
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 00:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755565100; cv=none; b=NEheYnDAvwgpTS4ZF+K99Y337M7WedmymReA+oYt9BbZNdbh0DBnT/HIJEe8xSdnzduPXkZnm3Hum4+w6ppRVqB3VwjrT/EVpYPBuDJVeOgr9Yn67WqqzY50r+aB5gTfI5B4/s/OyGEOoCfV7FpiDyXrvRZKZzhXfq5aSj42og0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755565100; c=relaxed/simple;
	bh=JcDu8OHlBt214AZMgSF6rdCDAjFCT4DpKt56AMM1Ppw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lnFtmKZPcUL6+JSF3KpOEiepFKnx264eAitQ+Ysy50vsN1vpu3z3dP1MQ5XzoxrYeMkh9z+OcZ+n18YLXLBkI6QYJ6fcsIIXhEqEaManDa7s5skeRxE9cLLdtFjlsxJwQQNl152y105RmIWDVLdl+CF0d5/C4sFvrioMsPPS7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLtP6A2Y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755565098; x=1787101098;
  h=date:from:to:cc:subject:message-id;
  bh=JcDu8OHlBt214AZMgSF6rdCDAjFCT4DpKt56AMM1Ppw=;
  b=TLtP6A2YkpgoojHOioW0YSG5eNlxf3njVLweCFj7BeyXkhWssiOrl7Qe
   YHqxdqTpFfvgHU4FSXOpjvP88c2Jhbs18nXMCmsG/VCiO1xGK0oS8Ksf/
   n8kk6RBcEJqaPFytH/ZikycEt8eqfuV7oZELdXWga3po3w2uZgGAMhjpC
   Dk9k3ioH+8AtpH3X78U9jWahlCdbuzMKax2qeU3YnSr1jiOTKslliiZXv
   GxrM6kCua/U68GqQ/clfX3O7MlQjUexBlEPs7SdKj/1ORg3Xoc9EF/u2E
   sbKTm1ubBUXsUdn+wZn0hXrrFoxeJpM4hpDK4DCKe5zdV148UkeHn/tzj
   g==;
X-CSE-ConnectionGUID: Tm2u4gNjQoCAXhzckO0k0Q==
X-CSE-MsgGUID: mMcgeu/zSFumS/N01gfQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69173293"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="69173293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 17:58:18 -0700
X-CSE-ConnectionGUID: CxW2HXu2QBa+ZqFGh0DLXQ==
X-CSE-MsgGUID: oq0Dj3UrTiSZdphXHCUHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171955421"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 17:58:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoAff-000GMd-2f;
	Tue, 19 Aug 2025 00:57:57 +0000
Date: Tue, 19 Aug 2025 08:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 6f6fbd9a0c5a75eee0618c1499cf73cc770b3f52
Message-ID: <202508190822.dERr4SMl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 6f6fbd9a0c5a75eee0618c1499cf73cc770b3f52  media: Remove redundant pm_runtime_mark_last_busy() calls

elapsed time: 933m

configs tested: 187
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250818    gcc-13.4.0
arc                   randconfig-001-20250819    gcc-8.5.0
arc                   randconfig-002-20250818    gcc-12.5.0
arc                   randconfig-002-20250819    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20250818    gcc-12.5.0
arm                   randconfig-001-20250819    gcc-8.5.0
arm                   randconfig-002-20250818    clang-22
arm                   randconfig-002-20250819    gcc-8.5.0
arm                   randconfig-003-20250818    clang-18
arm                   randconfig-003-20250819    gcc-8.5.0
arm                   randconfig-004-20250818    gcc-10.5.0
arm                   randconfig-004-20250819    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250818    gcc-11.5.0
arm64                 randconfig-001-20250819    gcc-8.5.0
arm64                 randconfig-002-20250818    gcc-12.5.0
arm64                 randconfig-002-20250819    gcc-8.5.0
arm64                 randconfig-003-20250818    gcc-8.5.0
arm64                 randconfig-003-20250819    gcc-8.5.0
arm64                 randconfig-004-20250818    clang-22
arm64                 randconfig-004-20250819    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250818    gcc-15.1.0
csky                  randconfig-002-20250818    gcc-9.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250818    clang-22
hexagon               randconfig-002-20250818    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250818    clang-20
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-002-20250818    clang-20
i386        buildonly-randconfig-002-20250819    gcc-12
i386        buildonly-randconfig-003-20250818    gcc-12
i386        buildonly-randconfig-003-20250819    gcc-12
i386        buildonly-randconfig-004-20250818    clang-20
i386        buildonly-randconfig-004-20250819    gcc-12
i386        buildonly-randconfig-005-20250818    gcc-12
i386        buildonly-randconfig-005-20250819    gcc-12
i386        buildonly-randconfig-006-20250818    gcc-12
i386        buildonly-randconfig-006-20250819    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250818    gcc-15.1.0
loongarch             randconfig-002-20250818    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250818    gcc-9.5.0
nios2                 randconfig-002-20250818    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250818    gcc-10.5.0
parisc                randconfig-002-20250818    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250818    gcc-8.5.0
powerpc               randconfig-002-20250818    gcc-9.5.0
powerpc               randconfig-003-20250818    clang-22
powerpc64             randconfig-001-20250818    gcc-8.5.0
powerpc64             randconfig-002-20250818    clang-17
powerpc64             randconfig-003-20250818    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250818    gcc-10.5.0
riscv                 randconfig-001-20250819    gcc-8.5.0
riscv                 randconfig-002-20250818    clang-22
riscv                 randconfig-002-20250819    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250818    clang-22
s390                  randconfig-001-20250819    gcc-8.5.0
s390                  randconfig-002-20250818    gcc-8.5.0
s390                  randconfig-002-20250819    gcc-8.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250818    gcc-12.5.0
sh                    randconfig-001-20250819    gcc-8.5.0
sh                    randconfig-002-20250818    gcc-13.4.0
sh                    randconfig-002-20250819    gcc-8.5.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250818    gcc-12.5.0
sparc                 randconfig-001-20250819    gcc-8.5.0
sparc                 randconfig-002-20250818    gcc-15.1.0
sparc                 randconfig-002-20250819    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250818    clang-22
sparc64               randconfig-001-20250819    gcc-8.5.0
sparc64               randconfig-002-20250818    gcc-12.5.0
sparc64               randconfig-002-20250819    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250818    gcc-11
um                    randconfig-001-20250819    gcc-8.5.0
um                    randconfig-002-20250818    gcc-12
um                    randconfig-002-20250819    gcc-8.5.0
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250818    gcc-12
x86_64      buildonly-randconfig-001-20250819    clang-20
x86_64      buildonly-randconfig-002-20250818    gcc-12
x86_64      buildonly-randconfig-002-20250819    clang-20
x86_64      buildonly-randconfig-003-20250818    gcc-12
x86_64      buildonly-randconfig-003-20250819    clang-20
x86_64      buildonly-randconfig-004-20250818    gcc-12
x86_64      buildonly-randconfig-004-20250819    clang-20
x86_64      buildonly-randconfig-005-20250818    gcc-12
x86_64      buildonly-randconfig-005-20250819    clang-20
x86_64      buildonly-randconfig-006-20250818    clang-20
x86_64      buildonly-randconfig-006-20250819    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250819    gcc-12
x86_64                randconfig-002-20250819    gcc-12
x86_64                randconfig-003-20250819    gcc-12
x86_64                randconfig-004-20250819    gcc-12
x86_64                randconfig-005-20250819    gcc-12
x86_64                randconfig-006-20250819    gcc-12
x86_64                randconfig-007-20250819    gcc-12
x86_64                randconfig-008-20250819    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250818    gcc-14.3.0
xtensa                randconfig-001-20250819    gcc-8.5.0
xtensa                randconfig-002-20250818    gcc-14.3.0
xtensa                randconfig-002-20250819    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

