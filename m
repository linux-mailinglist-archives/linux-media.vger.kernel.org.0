Return-Path: <linux-media+bounces-15492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE094023E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB191C222B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85D4A3F;
	Tue, 30 Jul 2024 00:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8LsjqEY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623121EB48
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299354; cv=none; b=d8GJTA3fDy4YZyGdQcq8i1zVuy3lVyJYLB/xOFjKuesWBY6LKEny51eHL0AZy6k4o+SfnOJVevJw4HK9sa3zSYx/rikQQ0c2VIBxVe3Dv8YDdBAMT5dyN6/gwmspd6rRytfL/BdxDTz09Cq3JlY2H4I2mvzfr+BKazlTvO/1q78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299354; c=relaxed/simple;
	bh=S2efutrlsjd28IJCUn16IDvcuTAXGrghJI8BUgWKZ5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZIffWe7ZYe/gVrjYPOQYETi5jqlk9SbnSZUv1Sf/zd2SBcra5TE+/+Sngy5J/VxhF36BJkuK3Nat6mMRR+xrXq4tjl3qpAfZwb8mfqUtNPoNvW0hr50cLkCcQqBWWNxZ3c2jpb9QCLU5uKPNxb8P3zbAkBTK6ctKXzZZbAEZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8LsjqEY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722299352; x=1753835352;
  h=date:from:to:cc:subject:message-id;
  bh=S2efutrlsjd28IJCUn16IDvcuTAXGrghJI8BUgWKZ5k=;
  b=I8LsjqEYqdxzYe0bgmuOhQhusDcYDKhw7Vtofdcatsxd4EhvSbgAR1of
   lHOHMJSa7G0iNlszucHw6DLc8dDAwvTAylJ5854W3mDhIeKc4/VQsRxHW
   T0tGTDButDYr1Zd1mtYAbAHxW8yU9Vq7oBvNZTD147XA7TZ4AcEBaM1sN
   4kHycsIdQdlsPsZjPg8lbU6QCW4svq93s8cPWx30XgOW2PAT3hnYWie7o
   yBJgXNBea/vGOw5o15SZNhLhIM7QJLg2k1AwMd5doILg91lWD4JBTvUkB
   ZvhlU3L+q7tZ3rZ2eZ1Q+UB6DcEBF+DcQR6klxQBlhaxcCeKM/SAipv0Z
   Q==;
X-CSE-ConnectionGUID: 4zIhB6B9QI2n5gy4hJWEIQ==
X-CSE-MsgGUID: BBEXwO+MT1WlcKRlf4MvGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23957024"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="23957024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:29:11 -0700
X-CSE-ConnectionGUID: dQ4FKnYvQ7ySrM91sFgvCQ==
X-CSE-MsgGUID: pIEqwagkQAqoaQRbHx78TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="91644381"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2024 17:29:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYajk-000sEO-10;
	Tue, 30 Jul 2024 00:29:08 +0000
Date: Tue, 30 Jul 2024 08:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 4ec859e2bd779bf3c12f40691f6fff59c8de6378
Message-ID: <202407300802.GJfClIc0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 4ec859e2bd779bf3c12f40691f6fff59c8de6378  media: intel/ipu6: select AUXILIARY_BUS in Kconfig

elapsed time: 918m

configs tested: 251
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240729   gcc-13.2.0
arc                   randconfig-002-20240729   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.3.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.3.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.3.0
arm                   randconfig-001-20240729   gcc-13.2.0
arm                   randconfig-001-20240729   gcc-14.1.0
arm                   randconfig-002-20240729   gcc-13.2.0
arm                   randconfig-002-20240729   gcc-14.1.0
arm                   randconfig-003-20240729   gcc-13.2.0
arm                   randconfig-003-20240729   gcc-14.1.0
arm                   randconfig-004-20240729   clang-20
arm                   randconfig-004-20240729   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.3.0
arm                       spear13xx_defconfig   gcc-13.3.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240729   clang-17
arm64                 randconfig-001-20240729   gcc-13.2.0
arm64                 randconfig-002-20240729   clang-20
arm64                 randconfig-002-20240729   gcc-13.2.0
arm64                 randconfig-003-20240729   gcc-13.2.0
arm64                 randconfig-003-20240729   gcc-14.1.0
arm64                 randconfig-004-20240729   clang-20
arm64                 randconfig-004-20240729   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240729   gcc-13.2.0
csky                  randconfig-001-20240729   gcc-14.1.0
csky                  randconfig-002-20240729   gcc-13.2.0
csky                  randconfig-002-20240729   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240729   clang-20
hexagon               randconfig-002-20240729   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240729   clang-18
i386         buildonly-randconfig-001-20240730   gcc-13
i386         buildonly-randconfig-002-20240729   clang-18
i386         buildonly-randconfig-002-20240730   gcc-13
i386         buildonly-randconfig-003-20240729   clang-18
i386         buildonly-randconfig-003-20240730   gcc-13
i386         buildonly-randconfig-004-20240729   clang-18
i386         buildonly-randconfig-004-20240730   gcc-13
i386         buildonly-randconfig-005-20240729   clang-18
i386         buildonly-randconfig-005-20240730   gcc-13
i386         buildonly-randconfig-006-20240729   clang-18
i386         buildonly-randconfig-006-20240729   gcc-8
i386         buildonly-randconfig-006-20240730   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240729   clang-18
i386                  randconfig-001-20240729   gcc-12
i386                  randconfig-001-20240730   gcc-13
i386                  randconfig-002-20240729   clang-18
i386                  randconfig-002-20240730   gcc-13
i386                  randconfig-003-20240729   clang-18
i386                  randconfig-003-20240729   gcc-10
i386                  randconfig-003-20240730   gcc-13
i386                  randconfig-004-20240729   clang-18
i386                  randconfig-004-20240729   gcc-13
i386                  randconfig-004-20240730   gcc-13
i386                  randconfig-005-20240729   clang-18
i386                  randconfig-005-20240729   gcc-8
i386                  randconfig-005-20240730   gcc-13
i386                  randconfig-006-20240729   clang-18
i386                  randconfig-006-20240729   gcc-13
i386                  randconfig-006-20240730   gcc-13
i386                  randconfig-011-20240729   clang-18
i386                  randconfig-011-20240729   gcc-13
i386                  randconfig-011-20240730   gcc-13
i386                  randconfig-012-20240729   clang-18
i386                  randconfig-012-20240730   gcc-13
i386                  randconfig-013-20240729   clang-18
i386                  randconfig-013-20240729   gcc-9
i386                  randconfig-013-20240730   gcc-13
i386                  randconfig-014-20240729   clang-18
i386                  randconfig-014-20240730   gcc-13
i386                  randconfig-015-20240729   clang-18
i386                  randconfig-015-20240729   gcc-13
i386                  randconfig-015-20240730   gcc-13
i386                  randconfig-016-20240729   clang-18
i386                  randconfig-016-20240730   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240729   gcc-13.2.0
loongarch             randconfig-001-20240729   gcc-14.1.0
loongarch             randconfig-002-20240729   gcc-13.2.0
loongarch             randconfig-002-20240729   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                        qi_lb60_defconfig   gcc-13.3.0
mips                           xway_defconfig   gcc-13.2.0
nios2                         10m50_defconfig   gcc-13.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240729   gcc-13.2.0
nios2                 randconfig-001-20240729   gcc-14.1.0
nios2                 randconfig-002-20240729   gcc-13.2.0
nios2                 randconfig-002-20240729   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.3.0
parisc                randconfig-001-20240729   gcc-13.2.0
parisc                randconfig-001-20240729   gcc-14.1.0
parisc                randconfig-002-20240729   gcc-13.2.0
parisc                randconfig-002-20240729   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       eiger_defconfig   gcc-13.3.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.3.0
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.3.0
powerpc                     tqm5200_defconfig   gcc-13.3.0
powerpc                     tqm8541_defconfig   gcc-13.3.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240729   gcc-13.2.0
powerpc64             randconfig-001-20240729   gcc-14.1.0
powerpc64             randconfig-002-20240729   gcc-13.2.0
powerpc64             randconfig-002-20240729   gcc-14.1.0
powerpc64             randconfig-003-20240729   gcc-13.2.0
powerpc64             randconfig-003-20240729   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240729   clang-16
riscv                 randconfig-001-20240729   gcc-13.2.0
riscv                 randconfig-002-20240729   clang-20
riscv                 randconfig-002-20240729   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240729   clang-20
s390                  randconfig-001-20240729   gcc-13.2.0
s390                  randconfig-002-20240729   gcc-13.2.0
s390                  randconfig-002-20240729   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240729   gcc-13.2.0
sh                    randconfig-001-20240729   gcc-14.1.0
sh                    randconfig-002-20240729   gcc-13.2.0
sh                    randconfig-002-20240729   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.3.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                 randconfig-001-20240729   gcc-14.1.0
sparc                 randconfig-002-20240729   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240729   gcc-13.2.0
sparc64               randconfig-001-20240729   gcc-14.1.0
sparc64               randconfig-002-20240729   gcc-13.2.0
sparc64               randconfig-002-20240729   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240729   clang-14
um                    randconfig-001-20240729   gcc-13.2.0
um                    randconfig-002-20240729   gcc-13.2.0
um                    randconfig-002-20240729   gcc-8
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240729   clang-18
x86_64       buildonly-randconfig-002-20240729   clang-18
x86_64       buildonly-randconfig-003-20240729   clang-18
x86_64       buildonly-randconfig-004-20240729   clang-18
x86_64       buildonly-randconfig-005-20240729   clang-18
x86_64       buildonly-randconfig-006-20240729   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240729   clang-18
x86_64                randconfig-002-20240729   clang-18
x86_64                randconfig-003-20240729   clang-18
x86_64                randconfig-004-20240729   clang-18
x86_64                randconfig-005-20240729   clang-18
x86_64                randconfig-006-20240729   clang-18
x86_64                randconfig-011-20240729   clang-18
x86_64                randconfig-012-20240729   clang-18
x86_64                randconfig-013-20240729   clang-18
x86_64                randconfig-014-20240729   clang-18
x86_64                randconfig-015-20240729   clang-18
x86_64                randconfig-016-20240729   clang-18
x86_64                randconfig-071-20240729   clang-18
x86_64                randconfig-072-20240729   clang-18
x86_64                randconfig-073-20240729   clang-18
x86_64                randconfig-074-20240729   clang-18
x86_64                randconfig-075-20240729   clang-18
x86_64                randconfig-076-20240729   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240729   gcc-13.2.0
xtensa                randconfig-001-20240729   gcc-14.1.0
xtensa                randconfig-002-20240729   gcc-13.2.0
xtensa                randconfig-002-20240729   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

