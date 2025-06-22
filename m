Return-Path: <linux-media+bounces-35538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FBAE2E75
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 07:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1421318909CC
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 05:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099767A13A;
	Sun, 22 Jun 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQE8Y2Kv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020D8F66
	for <linux-media@vger.kernel.org>; Sun, 22 Jun 2025 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750571954; cv=none; b=SLBWw2Ag4/48J+h5MZG1RN0hIXyjTI0nhTMO6ov/2LjuuS3TrZiaBAUCXgWbsMjBU2L9QkwhXBrI6kROwVqA04z89+3eiLnWfqjTt1CVP0jMrf+nBDdIcM3zZPluwCSdiYfNavU9VVcYwGGUTkOPqIHm3ccWXnqbJh2jG/RQ6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750571954; c=relaxed/simple;
	bh=nZnBnER7ISY0CaBwwJz6PNlfq7AKnpCXtNasA7AEv8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XAh6iSZlWf8bJsu5j8U3f3k4Plny9kOCcQcGQe14mRUCtkVJlKtOZMAAzX0Iqqw4ZectZ7VWN1wChNLGprHT531L2u8tkoatFvlIWKDhuPckZ11VxmZfs3DOxocpw9HBwBT2XhmH3vmUatPckOEX6aLDnaUJqYNX64XGX0OXrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQE8Y2Kv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750571952; x=1782107952;
  h=date:from:to:cc:subject:message-id;
  bh=nZnBnER7ISY0CaBwwJz6PNlfq7AKnpCXtNasA7AEv8Q=;
  b=iQE8Y2Kv5yi3stXrCAL4E84gZuX9RsU47aM34hcTcFduWN6Q/+ArGR/g
   904lN6MAtYmEb2EFK2Rnsm3pr7+C5rhtpA7+RMQ0ekjPGIFUHqduiCrme
   v6Ot0sIuf+0jk9oKm7+0+D38cd3U7ZiyINj2BuHK1hYYizFy7CaORBM/b
   pTzC+FQTLftQaUBTwWZxAqxeCxbrFYPBptx1GDyOusMc0u64f7gt9vnHR
   iiLhZZS2p2V+nFGEfp3PX4/VKM0ygV5pOtuHT+GD10MI4c+zwkvOdBjFV
   QiMsrZX0mlImCOCcOUcmZJAZqYCN+O3W4iYjcTqrbec9pft8kz7ByRroP
   w==;
X-CSE-ConnectionGUID: hLLPSM0kRh2Vy0M8rjC9Kg==
X-CSE-MsgGUID: mq/v1LfnTBmC0k4nUX2a4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="63840757"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="63840757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 22:59:11 -0700
X-CSE-ConnectionGUID: mWBv5y5pTN2LnXKYwI1eBw==
X-CSE-MsgGUID: fafgP3HSStK781I/JGoiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="150758431"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jun 2025 22:59:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTDjP-000N5a-3C;
	Sun, 22 Jun 2025 05:59:07 +0000
Date: Sun, 22 Jun 2025 13:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 2eb7b0a1567fd0da91e70f762d8cf94af1ffd7f9
Message-ID: <202506221323.pcjyKw6y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 2eb7b0a1567fd0da91e70f762d8cf94af1ffd7f9  media: ipu6: Add support for raw CFA-agnostic formats

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506220450.mD3aWxjx-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202506221114.aszIbhTI-lkp@intel.com

    drivers/media/i2c/imx219.c:898:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/media/v4l2-core/v4l2-mc.c:804:15-18: ERROR: sd is NULL but dereferenced.
    drivers/media/v4l2-core/v4l2-mc.c:808:15-18: ERROR: sd is NULL but dereferenced.

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r062-20250622
|   `-- drivers-media-v4l2-core-v4l2-mc.c:ERROR:sd-is-NULL-but-dereferenced.
|-- arm64-allmodconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- hexagon-allyesconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- nios2-randconfig-r064-20250622
|   `-- drivers-media-v4l2-core-v4l2-mc.c:ERROR:sd-is-NULL-but-dereferenced.
|-- powerpc-allyesconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- riscv-allmodconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- riscv-randconfig-r052-20250622
|   `-- drivers-media-v4l2-core-v4l2-mc.c:ERROR:sd-is-NULL-but-dereferenced.
|-- s390-allmodconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- um-allmodconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- x86_64-allyesconfig
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
|-- x86_64-randconfig-072-20250622
|   `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions
`-- x86_64-randconfig-161-20250622
    `-- drivers-media-i2c-imx219.c:warning:label-followed-by-a-declaration-is-a-C23-extension-Wc23-extensions

elapsed time: 726m

configs tested: 150
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                   randconfig-001-20250622    gcc-8.5.0
arc                   randconfig-002-20250622    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    clang-16
arm                        keystone_defconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250622    clang-19
arm                   randconfig-002-20250622    gcc-13.3.0
arm                   randconfig-003-20250622    clang-21
arm                   randconfig-004-20250622    clang-21
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250622    gcc-9.5.0
arm64                 randconfig-002-20250622    clang-21
arm64                 randconfig-003-20250622    clang-21
arm64                 randconfig-004-20250622    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250622    gcc-11.5.0
csky                  randconfig-002-20250622    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250622    clang-19
hexagon               randconfig-002-20250622    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250622    gcc-12
i386        buildonly-randconfig-002-20250622    clang-20
i386        buildonly-randconfig-003-20250622    clang-20
i386        buildonly-randconfig-004-20250622    gcc-12
i386        buildonly-randconfig-005-20250622    gcc-12
i386        buildonly-randconfig-006-20250622    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250622    gcc-11
i386                  randconfig-012-20250622    gcc-11
i386                  randconfig-013-20250622    gcc-11
i386                  randconfig-014-20250622    gcc-11
i386                  randconfig-015-20250622    gcc-11
i386                  randconfig-016-20250622    gcc-11
i386                  randconfig-017-20250622    gcc-11
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250622    gcc-15.1.0
loongarch             randconfig-002-20250622    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250622    gcc-13.3.0
nios2                 randconfig-002-20250622    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250622    gcc-9.3.0
parisc                randconfig-002-20250622    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                       holly_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250622    clang-21
powerpc               randconfig-002-20250622    clang-20
powerpc               randconfig-003-20250622    gcc-8.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250622    gcc-10.5.0
powerpc64             randconfig-002-20250622    clang-21
powerpc64             randconfig-003-20250622    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250622    clang-16
riscv                 randconfig-002-20250622    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250622    gcc-8.5.0
s390                  randconfig-002-20250622    gcc-12.4.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250622    gcc-15.1.0
sh                    randconfig-002-20250622    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250622    gcc-12.4.0
sparc                 randconfig-002-20250622    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250622    gcc-8.5.0
sparc64               randconfig-002-20250622    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250622    gcc-12
um                    randconfig-002-20250622    gcc-11
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250622    clang-20
x86_64      buildonly-randconfig-002-20250622    clang-20
x86_64      buildonly-randconfig-003-20250622    clang-20
x86_64      buildonly-randconfig-004-20250622    clang-20
x86_64      buildonly-randconfig-005-20250622    gcc-12
x86_64      buildonly-randconfig-006-20250622    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250622    gcc-10.5.0
xtensa                randconfig-002-20250622    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

