Return-Path: <linux-media+bounces-50437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04874D11F9F
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2CA30D59C6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04D2322B68;
	Mon, 12 Jan 2026 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P28I3wCM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB6269D18
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214537; cv=none; b=BVWpX3Zx23Mja4DGxjWkVZ9UHArrkY6K+eGUAipxsgtGJDzIe29Rzgl6HmfIUXS11zHe2JwYmmW5/rW+YPyQJSpq9zuhqpXvc4vs5wmpQVPIQ1jLFCPza3mMQUSncr93xVc2e4QO6Pe3zSND6blfhdfI9Ov0xADWaLjBJyXWxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214537; c=relaxed/simple;
	bh=knl31wgg0hBKzoGmFOvuL3d2SIIRpcpqxjNNU8fJfWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAN9GsWqlbs/1zCmjTQ2VpuDSdRruXDT2N239vDCC4Y/OgJNsZZRXR2NTzsNjkOtmEB0UL8x5RShoZhwLq+ZlNh6qQa6q8uDPZoPNAgH/nzruS0AAXNg4ICeu7yEXX4Sky3oPeWhEHYscYeGFzxj7/cUAIxS7A9uQZLIPoUKl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P28I3wCM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768214536; x=1799750536;
  h=date:from:to:cc:subject:message-id;
  bh=knl31wgg0hBKzoGmFOvuL3d2SIIRpcpqxjNNU8fJfWA=;
  b=P28I3wCMyeFZVq/EBl74xhCuVByOWtHSH8NcuEqjCTRWTVIcJOs8jnHV
   6wGhEs5pP7z670UxWYPipt1bDBMXHTVEjS3KSfwUnfhv3gLW7WO7KbqlJ
   1GYepGZXVXSXSb/+V5q9b0szC7eJUYsGwfvsEkqA/Y8I5Fc8jZq6nDJMi
   IEm82BFGUYn3DLI/27fif0IGPc73/xljiLwkpL2a/XP4MJb9e2HGtDCSq
   5sl3WU6QeQNLx2Kwn8V4aZTEvkXNq0JD4hXwZMDcD99jMujEV2huIvdbt
   fzxYtgxxwl+oE98XjWfCdpxg3HlMnBzdsHDBeiHSkGv/r5xwhElx6KQiP
   A==;
X-CSE-ConnectionGUID: pTJszcGYQs21ui0R+Pu3sQ==
X-CSE-MsgGUID: S8M8cjUxQLiFweLS2PsIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80941064"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80941064"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:42:15 -0800
X-CSE-ConnectionGUID: +yki4lx1R3S7xLJ8gBtYGg==
X-CSE-MsgGUID: ELxrrjl9RMuonqJx2eJ8gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204342633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2026 02:42:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfFND-00000000DHE-2iUv;
	Mon, 12 Jan 2026 10:42:11 +0000
Date: Mon, 12 Jan 2026 18:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup2] BUILD SUCCESS
 bb4d294925558f0805af83722b8b19b6f9cdebba
Message-ID: <202601121840.YZjeP87k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup2
branch HEAD: bb4d294925558f0805af83722b8b19b6f9cdebba  media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

elapsed time: 751m

configs tested: 250
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260112    gcc-8.5.0
arc                   randconfig-002-20260112    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                        multi_v5_defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                   randconfig-001-20260112    clang-22
arm                   randconfig-001-20260112    gcc-8.5.0
arm                   randconfig-002-20260112    gcc-8.5.0
arm                   randconfig-003-20260112    clang-22
arm                   randconfig-003-20260112    gcc-8.5.0
arm                   randconfig-004-20260112    gcc-8.5.0
arm                        vexpress_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260112    clang-19
arm64                 randconfig-001-20260112    gcc-8.5.0
arm64                 randconfig-002-20260112    gcc-8.5.0
arm64                 randconfig-003-20260112    gcc-15.2.0
arm64                 randconfig-003-20260112    gcc-8.5.0
arm64                 randconfig-004-20260112    clang-18
arm64                 randconfig-004-20260112    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260112    gcc-15.2.0
csky                  randconfig-001-20260112    gcc-8.5.0
csky                  randconfig-002-20260112    gcc-8.5.0
csky                  randconfig-002-20260112    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260112    clang-22
hexagon               randconfig-002-20260112    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260112    gcc-14
i386        buildonly-randconfig-002-20260112    clang-20
i386        buildonly-randconfig-002-20260112    gcc-14
i386        buildonly-randconfig-003-20260112    gcc-14
i386        buildonly-randconfig-004-20260112    clang-20
i386        buildonly-randconfig-004-20260112    gcc-14
i386        buildonly-randconfig-005-20260112    gcc-14
i386        buildonly-randconfig-006-20260112    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260112    clang-20
i386                  randconfig-002-20260112    clang-20
i386                  randconfig-003-20260112    clang-20
i386                  randconfig-004-20260112    clang-20
i386                  randconfig-004-20260112    gcc-14
i386                  randconfig-005-20260112    clang-20
i386                  randconfig-005-20260112    gcc-14
i386                  randconfig-006-20260112    clang-20
i386                  randconfig-006-20260112    gcc-12
i386                  randconfig-007-20260112    clang-20
i386                  randconfig-007-20260112    gcc-14
i386                  randconfig-011-20260112    clang-20
i386                  randconfig-012-20260112    clang-20
i386                  randconfig-013-20260112    clang-20
i386                  randconfig-013-20260112    gcc-14
i386                  randconfig-014-20260112    clang-20
i386                  randconfig-015-20260112    clang-20
i386                  randconfig-016-20260112    clang-20
i386                  randconfig-017-20260112    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260112    clang-22
loongarch             randconfig-001-20260112    gcc-15.2.0
loongarch             randconfig-002-20260112    clang-22
loongarch             randconfig-002-20260112    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     loongson2k_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260112    clang-22
nios2                 randconfig-001-20260112    gcc-8.5.0
nios2                 randconfig-002-20260112    clang-22
nios2                 randconfig-002-20260112    gcc-9.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260112    gcc-10.5.0
parisc                randconfig-001-20260112    gcc-14.3.0
parisc                randconfig-002-20260112    gcc-10.5.0
parisc                randconfig-002-20260112    gcc-11.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                        cell_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-22
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260112    gcc-10.5.0
powerpc               randconfig-001-20260112    gcc-13.4.0
powerpc               randconfig-002-20260112    gcc-10.5.0
powerpc               randconfig-002-20260112    gcc-11.5.0
powerpc                        warp_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260112    gcc-10.5.0
powerpc64             randconfig-002-20260112    clang-22
powerpc64             randconfig-002-20260112    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260112    gcc-11.5.0
riscv                 randconfig-001-20260112    gcc-15.2.0
riscv                 randconfig-002-20260112    clang-17
riscv                 randconfig-002-20260112    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260112    clang-22
s390                  randconfig-001-20260112    gcc-15.2.0
s390                  randconfig-002-20260112    gcc-10.5.0
s390                  randconfig-002-20260112    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                        edosk7760_defconfig    gcc-15.2.0
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260112    gcc-15.2.0
sh                    randconfig-002-20260112    gcc-14.3.0
sh                    randconfig-002-20260112    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260112    clang-20
sparc                 randconfig-001-20260112    gcc-15.2.0
sparc                 randconfig-002-20260112    clang-20
sparc                 randconfig-002-20260112    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260112    clang-20
sparc64               randconfig-002-20260112    clang-20
sparc64               randconfig-002-20260112    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260112    clang-20
um                    randconfig-001-20260112    gcc-14
um                    randconfig-002-20260112    clang-20
um                    randconfig-002-20260112    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260112    gcc-14
x86_64      buildonly-randconfig-002-20260112    clang-20
x86_64      buildonly-randconfig-002-20260112    gcc-14
x86_64      buildonly-randconfig-003-20260112    gcc-14
x86_64      buildonly-randconfig-004-20260112    gcc-14
x86_64      buildonly-randconfig-005-20260112    gcc-14
x86_64      buildonly-randconfig-006-20260112    clang-20
x86_64      buildonly-randconfig-006-20260112    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260112    gcc-13
x86_64                randconfig-002-20260112    clang-20
x86_64                randconfig-002-20260112    gcc-13
x86_64                randconfig-003-20260112    gcc-13
x86_64                randconfig-004-20260112    gcc-13
x86_64                randconfig-005-20260112    clang-20
x86_64                randconfig-005-20260112    gcc-13
x86_64                randconfig-006-20260112    clang-20
x86_64                randconfig-006-20260112    gcc-13
x86_64                randconfig-011-20260112    clang-20
x86_64                randconfig-012-20260112    clang-20
x86_64                randconfig-012-20260112    gcc-14
x86_64                randconfig-013-20260112    clang-20
x86_64                randconfig-013-20260112    gcc-14
x86_64                randconfig-014-20260112    clang-20
x86_64                randconfig-014-20260112    gcc-14
x86_64                randconfig-015-20260112    clang-20
x86_64                randconfig-015-20260112    gcc-12
x86_64                randconfig-016-20260112    clang-20
x86_64                randconfig-071-20260112    gcc-14
x86_64                randconfig-072-20260112    gcc-14
x86_64                randconfig-073-20260112    gcc-14
x86_64                randconfig-074-20260112    gcc-14
x86_64                randconfig-075-20260112    clang-20
x86_64                randconfig-075-20260112    gcc-14
x86_64                randconfig-076-20260112    clang-20
x86_64                randconfig-076-20260112    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260112    clang-20
xtensa                randconfig-001-20260112    gcc-10.5.0
xtensa                randconfig-002-20260112    clang-20
xtensa                randconfig-002-20260112    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

