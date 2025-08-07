Return-Path: <linux-media+bounces-39080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED6B1DEDC
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 23:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0167A003B0
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 21:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA3223AE9A;
	Thu,  7 Aug 2025 21:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqxTL4AY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366894430
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754602088; cv=none; b=J4JNNAKHid92OGUPV2sZlTRdWNPfiLuD7/NLAee2ww8wg7ijD0WabDBqtcM/XJ046xVure1g0E32OhRRi4tEwnErdz4kbraS8pRbhykDUawSjt+/ycYQ6jy3B3wZtr+kPzaj64hX35Y6B2EqTSbVi8ynlEGpBNre+IITiwdrnXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754602088; c=relaxed/simple;
	bh=qXD97FysQGbHv9//aXOb4MKkOCyMNPuV1VRj8PtMBp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qITGvYaATJjhCcb1VB+L4bV5cKr1eQBRYVReZqH2vwXITAjMOCFQ7OKExg99PF3DG/v9O9xsKu0/mK4VkCBZVFHZxAJwl4ZWbAdPxzWNs/HqPAue/BV/Bd0PSlj4frLgwR74EP90eMs4BRcCN1g6Ni+CGjqB2lSW0a4ryDAWU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqxTL4AY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754602086; x=1786138086;
  h=date:from:to:cc:subject:message-id;
  bh=qXD97FysQGbHv9//aXOb4MKkOCyMNPuV1VRj8PtMBp8=;
  b=hqxTL4AYOsqDk5sn5Us+2eenUiaKMS5/Br/6Q23mITX4p0V+bIm+dNGw
   odT40SMqtZiZuPi8p/PNrmOIVat3L4Bv+KBgN2NgrY7Gd3RyuhE2UCLxz
   xhaSFrj+u0phUs/liKHiQJnNGGzoe38h5YQwR1qPVL4/JAoT/+HoDWcj6
   gCxr1wSSwnA0EqYDxjNOQDZ5Wja0N/OA8pBw5xiWyoqPkAWk7ldIcYu2Q
   YvNttKkdxakhcDIqKfgMNiAuLc7nJXzI/5xzZhMMUGr0iVacjaY/D3KXc
   b6KNMV0TPSDetEtnde/tECJe6KFqP9EU+5ljAQIYZXBPL7J/jm591PSAW
   w==;
X-CSE-ConnectionGUID: 8oRZeiW1Sv6PhQ574H1qVw==
X-CSE-MsgGUID: 9qF3iz7xTPeyx9vNOUve5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56156221"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56156221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 14:28:05 -0700
X-CSE-ConnectionGUID: kKGGB1d7R/SAQ5SxVwXJnQ==
X-CSE-MsgGUID: 59cIMerxT+ac8RqfrA5t1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165181666"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 14:28:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk89Z-0003Ff-37;
	Thu, 07 Aug 2025 21:28:01 +0000
Date: Fri, 08 Aug 2025 05:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 c004c51265ae9cb188ea355ff4e13bdabea658a9
Message-ID: <202508080529.N6KVt5Ug-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: c004c51265ae9cb188ea355ff4e13bdabea658a9  media: ipu6: Add support for raw CFA-agnostic formats

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202508071549.H718BtnN-lkp@intel.com

    ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.data.rel.local.max7301_driver'
    ERROR: modpost: __ex_table+0x1abc references non-executable section '.exitcall.exit'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- riscv-randconfig-002-20250807
    |-- ERROR:__ex_table-references-non-executable-section-.data.rel.local.max7301_driver
    `-- ERROR:__ex_table-references-non-executable-section-.exitcall.exit

elapsed time: 1118m

configs tested: 243
configs skipped: 4

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250807    clang-22
arc                   randconfig-001-20250807    gcc-13.4.0
arc                   randconfig-002-20250807    clang-22
arc                   randconfig-002-20250807    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                                 defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20250807    clang-22
arm                   randconfig-002-20250807    clang-22
arm                   randconfig-002-20250807    gcc-10.5.0
arm                   randconfig-003-20250807    clang-22
arm                   randconfig-004-20250807    clang-22
arm                   randconfig-004-20250807    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250807    clang-22
arm64                 randconfig-001-20250807    gcc-8.5.0
arm64                 randconfig-002-20250807    clang-22
arm64                 randconfig-002-20250807    gcc-8.5.0
arm64                 randconfig-003-20250807    clang-22
arm64                 randconfig-004-20250807    clang-22
arm64                 randconfig-004-20250807    gcc-14.3.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250807    gcc-15.1.0
csky                  randconfig-002-20250807    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250807    clang-22
hexagon               randconfig-001-20250807    gcc-15.1.0
hexagon               randconfig-002-20250807    clang-22
hexagon               randconfig-002-20250807    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250807    clang-20
i386        buildonly-randconfig-001-20250807    gcc-12
i386        buildonly-randconfig-002-20250807    clang-20
i386        buildonly-randconfig-002-20250807    gcc-12
i386        buildonly-randconfig-003-20250807    gcc-12
i386        buildonly-randconfig-004-20250807    gcc-11
i386        buildonly-randconfig-004-20250807    gcc-12
i386        buildonly-randconfig-005-20250807    gcc-12
i386        buildonly-randconfig-006-20250807    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250807    gcc-12
i386                  randconfig-002-20250807    gcc-12
i386                  randconfig-003-20250807    gcc-12
i386                  randconfig-004-20250807    gcc-12
i386                  randconfig-005-20250807    gcc-12
i386                  randconfig-006-20250807    gcc-12
i386                  randconfig-007-20250807    gcc-12
i386                  randconfig-011-20250807    clang-20
i386                  randconfig-012-20250807    clang-20
i386                  randconfig-013-20250807    clang-20
i386                  randconfig-014-20250807    clang-20
i386                  randconfig-015-20250807    clang-20
i386                  randconfig-016-20250807    clang-20
i386                  randconfig-017-20250807    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250807    clang-22
loongarch             randconfig-001-20250807    gcc-15.1.0
loongarch             randconfig-002-20250807    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250807    gcc-11.5.0
nios2                 randconfig-001-20250807    gcc-15.1.0
nios2                 randconfig-002-20250807    gcc-15.1.0
nios2                 randconfig-002-20250807    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250807    gcc-15.1.0
parisc                randconfig-001-20250807    gcc-8.5.0
parisc                randconfig-002-20250807    gcc-11.5.0
parisc                randconfig-002-20250807    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-22
powerpc               randconfig-001-20250807    gcc-12.5.0
powerpc               randconfig-001-20250807    gcc-15.1.0
powerpc               randconfig-002-20250807    gcc-10.5.0
powerpc               randconfig-002-20250807    gcc-15.1.0
powerpc               randconfig-003-20250807    gcc-11.5.0
powerpc               randconfig-003-20250807    gcc-15.1.0
powerpc                         wii_defconfig    clang-22
powerpc64             randconfig-001-20250807    gcc-11.5.0
powerpc64             randconfig-001-20250807    gcc-15.1.0
powerpc64             randconfig-002-20250807    clang-22
powerpc64             randconfig-002-20250807    gcc-15.1.0
powerpc64             randconfig-003-20250807    gcc-13.4.0
powerpc64             randconfig-003-20250807    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250807    gcc-12.5.0
riscv                 randconfig-002-20250807    gcc-12.5.0
riscv                 randconfig-002-20250807    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250807    clang-22
s390                  randconfig-001-20250807    gcc-12.5.0
s390                  randconfig-002-20250807    clang-22
s390                  randconfig-002-20250807    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250807    gcc-12.5.0
sh                    randconfig-001-20250807    gcc-14.3.0
sh                    randconfig-002-20250807    gcc-12.5.0
sh                    randconfig-002-20250807    gcc-9.5.0
sh                      rts7751r2d1_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250807    gcc-12.5.0
sparc                 randconfig-001-20250807    gcc-14.3.0
sparc                 randconfig-002-20250807    gcc-12.5.0
sparc                 randconfig-002-20250807    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250807    clang-22
sparc64               randconfig-001-20250807    gcc-12.5.0
sparc64               randconfig-002-20250807    clang-22
sparc64               randconfig-002-20250807    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250807    gcc-12
um                    randconfig-001-20250807    gcc-12.5.0
um                    randconfig-002-20250807    gcc-11
um                    randconfig-002-20250807    gcc-12.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250807    clang-20
x86_64      buildonly-randconfig-001-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-11
x86_64      buildonly-randconfig-002-20250807    gcc-12
x86_64      buildonly-randconfig-003-20250807    clang-20
x86_64      buildonly-randconfig-003-20250807    gcc-11
x86_64      buildonly-randconfig-004-20250807    clang-20
x86_64      buildonly-randconfig-004-20250807    gcc-11
x86_64      buildonly-randconfig-005-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250807    gcc-12
x86_64                randconfig-002-20250807    gcc-12
x86_64                randconfig-003-20250807    gcc-12
x86_64                randconfig-004-20250807    gcc-12
x86_64                randconfig-005-20250807    gcc-12
x86_64                randconfig-006-20250807    gcc-12
x86_64                randconfig-007-20250807    gcc-12
x86_64                randconfig-008-20250807    gcc-12
x86_64                randconfig-071-20250807    clang-20
x86_64                randconfig-072-20250807    clang-20
x86_64                randconfig-073-20250807    clang-20
x86_64                randconfig-074-20250807    clang-20
x86_64                randconfig-075-20250807    clang-20
x86_64                randconfig-076-20250807    clang-20
x86_64                randconfig-077-20250807    clang-20
x86_64                randconfig-078-20250807    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250807    gcc-12.5.0
xtensa                randconfig-001-20250807    gcc-15.1.0
xtensa                randconfig-002-20250807    gcc-12.5.0
xtensa                randconfig-002-20250807    gcc-8.5.0
xtensa                         virt_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

