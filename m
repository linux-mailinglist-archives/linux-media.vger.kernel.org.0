Return-Path: <linux-media+bounces-36872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62738AF9D05
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 02:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A647A9B1C
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 00:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9FC82D98;
	Sat,  5 Jul 2025 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5ZtOVfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F3B4689
	for <linux-media@vger.kernel.org>; Sat,  5 Jul 2025 00:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677022; cv=none; b=pE37XdB3tKcUF9E2/spUqh05kMpYjPyjs05+C+lY3+qWz79IXNiweC8gv67C+mWM1ETEbx5Pc0UYrqPri+mPMga3mJMtgY/d/Nug5S+bJwEcA0WZuCsgZSEizt4LW/CXZ0y8U4ocH/KZbOz2qI5RoRc9OZDeKa5jB3w9ZOF+E5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677022; c=relaxed/simple;
	bh=r++QZ///qLAUR+wMZcRRu+WZFnKpGUOg0lxNCl61XMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tUX8aG43X2UnshcLwRQQsC2OLswigcdTZXxpTSzAs7pfyj+2zK9mzoH7ZLUnEQ35x3E+iP89HkSmFFbH3chZYedXGcozhVrvHnA68Ex9npN5cMGdS5NBJpP0Ga/MwUZ+qaDG7hcKsgH+9xWjyYwLrjvax8n0y2Dj5XaHiswWzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5ZtOVfZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751677021; x=1783213021;
  h=date:from:to:cc:subject:message-id;
  bh=r++QZ///qLAUR+wMZcRRu+WZFnKpGUOg0lxNCl61XMk=;
  b=b5ZtOVfZIIFQXupRjSWx+3ofeQ25qIaCGKQN91Fm3615j3ZRcoV6nfeD
   RUY+gn9g8oVxjxsZnZJPJmSxwFIIvutJWO31xAf3ulpcJy9iQ0L34Q+5/
   H5xXLaPxrF/+H4Dgo5Up3/UjZXsIv5LmrhpgWoPWxBLXVACjEyxRmGpLW
   wREFSfIJ2uLbMezzeAPupa8KiKgJsAtOEv78EyWDxnBKiq181A0zBuplW
   Rlv/4oeTd+EaDVHv5LsIe1kn7thMueEsDq8aaOk/nnmjd7yHlU1ns5bt4
   Msdcy3Tc60Bht1V0cZgG0xmrIdpNjMWr0ii8NHCg9NnxW9EJDmq/MA2Lm
   g==;
X-CSE-ConnectionGUID: xcvjBqcQQZmC74ubmsiOIA==
X-CSE-MsgGUID: +Y6DJZoATCKF+r1cbLxChw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65344086"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="65344086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 17:57:00 -0700
X-CSE-ConnectionGUID: EctYu/iYSamG1Bwvjl0icg==
X-CSE-MsgGUID: p1CoIgXzT8S0UR2C8oNlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="159084568"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2025 17:56:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXrD6-0004Ah-2j;
	Sat, 05 Jul 2025 00:56:56 +0000
Date: Sat, 05 Jul 2025 08:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a8598c7de1bcd94461ca54c972efa9b4ea501fb9
Message-ID: <202507050833.AMVw5LoM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a8598c7de1bcd94461ca54c972efa9b4ea501fb9  media: ipu7: Drop IPU8 PCI ID for now

elapsed time: 1031m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250704    gcc-8.5.0
arc                   randconfig-002-20250704    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-004-20250704    gcc-13.4.0
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-004-20250704    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250704    gcc-15.1.0
csky                  randconfig-002-20250704    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250704    clang-21
hexagon               randconfig-002-20250704    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250704    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-006-20250704    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250704    gcc-15.1.0
loongarch             randconfig-002-20250704    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250704    gcc-8.5.0
nios2                 randconfig-002-20250704    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250704    gcc-14.3.0
parisc                randconfig-002-20250704    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250704    clang-21
powerpc               randconfig-002-20250704    gcc-9.3.0
powerpc               randconfig-003-20250704    clang-21
powerpc64             randconfig-001-20250704    clang-18
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-003-20250704    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-002-20250704    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250704    gcc-15.1.0
s390                  randconfig-002-20250704    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250704    gcc-15.1.0
sh                    randconfig-002-20250704    gcc-13.4.0
sh                           se7722_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250704    gcc-11.5.0
sparc                 randconfig-002-20250704    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250704    gcc-13.4.0
sparc64               randconfig-002-20250704    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-002-20250704    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250704    clang-20
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-003-20250704    clang-20
x86_64      buildonly-randconfig-004-20250704    clang-20
x86_64      buildonly-randconfig-005-20250704    clang-20
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250704    gcc-12.4.0
xtensa                randconfig-002-20250704    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

