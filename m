Return-Path: <linux-media+bounces-24345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AFA04246
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 15:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A6B166A38
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 14:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD41F37DF;
	Tue,  7 Jan 2025 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtH/jCxw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48B1E3DEB
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259578; cv=none; b=i63C4E6gknfApWVisMLxExhsjUHiX3tJNGTchxhQHkO2Rkm4haHtLuccfk8E6f27EDU5BPbvMxpPC6vLS4htVkfTBYH+UX8tZAWrPK8Fwsl0tYq8FLuoXyYxLeA/G+Ezon4fjx5jn1w4JfPIYi4y/XpgjIqXCt0Zw0/VnuaCaHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259578; c=relaxed/simple;
	bh=ZKcfKUbIqW2Rj4PkxmjPcI4Cc1YI5pZ9umQ+BgNdpDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KA19dYQHcZoceh0Wr4lZ9xGDSdP7xHx7EKslI4kB0JlKuqS/NCfF3eYjeF6q2k6xW+gBQwxHbsRW5s6oeLfJ7tcpVvqHqbpAUvddd6FJEMVv5IfsuroSB6CMYpbfXNKjmKv4mz5CxK6B2alvM/iEel+XRTxZiDUUgtVMppOhG4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtH/jCxw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736259574; x=1767795574;
  h=date:from:to:cc:subject:message-id;
  bh=ZKcfKUbIqW2Rj4PkxmjPcI4Cc1YI5pZ9umQ+BgNdpDc=;
  b=WtH/jCxwgxlME2/zLWGLn6SATbpAyhxtx+YjG/lqfQq6IWRM0LU2P37H
   pZ2VnCdEluQ8BDf8v/4ShBgSY6aG16ExeCy2iWrfl/hjj3Gw8FiUhqTpV
   4g2cqJoMr76aKfp7/vX6pR/h0sDPBe+5Mz3VAZNXX8bF67HM4dmv9kwK7
   YyfZfr7m5vez4gz2xgbUh6g2jY+lvOREMIL0+qRlGSQhQESeBTNHkf3B1
   1c8BhxexNqoQPlG8fcThrGT2KA4y+KmQIKt6lMGH+YVGHd3+pKiGwqYES
   iClQtDF71TiYvCYrptL9lIUBS8RsJgZNxMVEFJwTkhrjo+B7o9eNBxP3M
   Q==;
X-CSE-ConnectionGUID: q87z4w5ORvKVH3dnDvPaAA==
X-CSE-MsgGUID: RSSuv31uRoWKIAGdGdLDkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36460043"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36460043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:19:33 -0800
X-CSE-ConnectionGUID: Mr4vikZBSB2U7XfKz8tQyg==
X-CSE-MsgGUID: 710MtzyXSlupzP3a9ZQ0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107397802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jan 2025 06:19:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVAQc-000EnP-09;
	Tue, 07 Jan 2025 14:19:30 +0000
Date: Tue, 07 Jan 2025 22:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 210afa1598de32070faac2c7a33db6006c8408be
Message-ID: <202501072244.EiCOBL5Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 210afa1598de32070faac2c7a33db6006c8408be  media: venus: Remove unused hfi_core_ping()

elapsed time: 1455m

configs tested: 236
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                         mv78xx0_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm                        realview_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250106    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250106    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250106    clang-15
hexagon               randconfig-001-20250107    gcc-14.2.0
hexagon               randconfig-002-20250106    clang-20
hexagon               randconfig-002-20250107    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250106    clang-19
i386        buildonly-randconfig-001-20250107    gcc-12
i386        buildonly-randconfig-002-20250106    gcc-12
i386        buildonly-randconfig-002-20250107    gcc-12
i386        buildonly-randconfig-003-20250106    clang-19
i386        buildonly-randconfig-003-20250107    gcc-12
i386        buildonly-randconfig-004-20250106    gcc-12
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-005-20250106    clang-19
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-006-20250106    gcc-12
i386        buildonly-randconfig-006-20250107    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250107    clang-19
i386                  randconfig-002-20250107    clang-19
i386                  randconfig-003-20250107    clang-19
i386                  randconfig-004-20250107    clang-19
i386                  randconfig-005-20250107    clang-19
i386                  randconfig-006-20250107    clang-19
i386                  randconfig-007-20250107    clang-19
i386                  randconfig-011-20250107    clang-19
i386                  randconfig-012-20250107    clang-19
i386                  randconfig-013-20250107    clang-19
i386                  randconfig-014-20250107    clang-19
i386                  randconfig-015-20250107    clang-19
i386                  randconfig-016-20250107    clang-19
i386                  randconfig-017-20250107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250106    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250106    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250106    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250106    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250106    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250106    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      katmai_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250106    clang-20
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250106    clang-20
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250106    clang-20
powerpc               randconfig-003-20250107    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250106    clang-16
powerpc64             randconfig-001-20250107    gcc-14.2.0
powerpc64             randconfig-002-20250106    clang-18
powerpc64             randconfig-002-20250107    gcc-14.2.0
powerpc64             randconfig-003-20250106    clang-20
powerpc64             randconfig-003-20250107    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-001-20250107    clang-20
riscv                 randconfig-002-20250107    clang-20
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250107    clang-20
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250107    clang-20
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    clang-20
sh                    randconfig-002-20250107    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    clang-20
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    clang-20
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc                       sparc64_defconfig    clang-20
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250107    clang-20
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    clang-20
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250107    clang-20
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250106    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-002-20250106    gcc-12
x86_64      buildonly-randconfig-002-20250107    clang-19
x86_64      buildonly-randconfig-003-20250106    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-004-20250106    gcc-12
x86_64      buildonly-randconfig-004-20250107    clang-19
x86_64      buildonly-randconfig-005-20250106    clang-19
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-006-20250106    gcc-12
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250107    gcc-12
x86_64                randconfig-002-20250107    gcc-12
x86_64                randconfig-003-20250107    gcc-12
x86_64                randconfig-004-20250107    gcc-12
x86_64                randconfig-005-20250107    gcc-12
x86_64                randconfig-006-20250107    gcc-12
x86_64                randconfig-007-20250107    gcc-12
x86_64                randconfig-008-20250107    gcc-12
x86_64                randconfig-071-20250107    clang-19
x86_64                randconfig-072-20250107    clang-19
x86_64                randconfig-073-20250107    clang-19
x86_64                randconfig-074-20250107    clang-19
x86_64                randconfig-075-20250107    clang-19
x86_64                randconfig-076-20250107    clang-19
x86_64                randconfig-077-20250107    clang-19
x86_64                randconfig-078-20250107    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                           alldefconfig    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    clang-20
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    clang-20
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

