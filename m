Return-Path: <linux-media+bounces-51085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE673D3BC90
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 01:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 840A9301EC50
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 00:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE4017C211;
	Tue, 20 Jan 2026 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmpb0xgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251884086A
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768869991; cv=none; b=CldJafpJnBmos3qNPH4oJroV0Sse8cIbXBuuYMJFR8YZx8KfGuiBCfcvzJpl3RfAilSjcGTFUZFq746Sln9Cb/4qxsfnt16lh9XJzlme/f0P7pb+6cFtAsciYpoyhbTrKT+SfT9l2lqbdANhfAkLpNZOBHwJaWtMOYvE0waAvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768869991; c=relaxed/simple;
	bh=SgRW6x90H1smccl8m+Sl7uJpV7aWfzk7Fh1Zqs02E50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n5B5JhlPiHZnH8D8o4wZXrUfQEDKPapYnnITA8o1gu3b3HDcc0m8W5jTHKiw3XJfu8Wr2DqTv441SvjZfwKaMRAe6XPxhpOeCgzDOdDnjpTdHqUClpy4qUMHwZgLX4bJvsm2znnoO7DjvgtbZ4QPjH5b0wfJmAd09v/4dkZprmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmpb0xgF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768869989; x=1800405989;
  h=date:from:to:cc:subject:message-id;
  bh=SgRW6x90H1smccl8m+Sl7uJpV7aWfzk7Fh1Zqs02E50=;
  b=gmpb0xgF9t5pvhwhFaOXca5E8gPIMECSVH9KEcqKJRnCV6DGzo08CHNj
   bDaI5F5YY7Xf2k+cg0Ri5/uyHtHnBSuv6Y4GMbq8qrPtMZdLR/e94fxC6
   m0bXnsxPsxdDhQm7Fvog4g6cQs5TJc7tycPXXpaM2uwXiqlrAgDe9YuDY
   p9xgLKytfVwXYdy5fryIm5nvRHsGoXf6kE798EHc3eFfnbk/GVRftYf84
   VUwRHRwu20z+Noovj753wyFDyRC0wI3nEkkt5IX63JFSfqhko4f9PVYG2
   KE4069W2mjeTyngZZQwSZQT2DC4t+VxiL41UBnEVPoKvDOww2P3q9QA+H
   g==;
X-CSE-ConnectionGUID: mLdlsdnTTTC6VJK79cWSfA==
X-CSE-MsgGUID: 7wzC4Z7JRe2c9VxBfZMbhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95548471"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="95548471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 16:46:28 -0800
X-CSE-ConnectionGUID: desywlvESMaXzd7up2teug==
X-CSE-MsgGUID: Vbv5qSDJSNKuGT6/5hXjnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205605093"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jan 2026 16:46:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhzt2-00000000OQb-2qiY;
	Tue, 20 Jan 2026 00:46:24 +0000
Date: Tue, 20 Jan 2026 08:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 55ba38aaeb6e07cbbbe550578fa4737b05de1d00
Message-ID: <202601200808.l4a8Ejm7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 55ba38aaeb6e07cbbbe550578fa4737b05de1d00  media: ipu6: Don't track power status, rely on runtime PM

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202601200019.peMSxK0X-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202601200058.QeQb8IRb-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202601200156.XCbBK9ms-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202601200147.SRFr3GE9-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202601200249.VHkXezfb-lkp@intel.com

    drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:541:14: warning: variable 'first' set but not used [-Wunused-but-set-variable]
    drivers/media/pci/intel/ipu6/ipu6-isys-video.c:1026:17: error: implicit declaration of function 'close_streaming_firmware'; did you mean 'ipu6_isys_close_streaming_firmware'? [-Wimplicit-function-declaration]
    drivers/media/pci/intel/ipu6/ipu6-isys-video.c:885:17: error: implicit declaration of function 'close_streaming_firmware'; did you mean 'ipu6_isys_close_streaming_firmware'? [-Wimplicit-function-declaration]
    drivers/media/v4l2-core/v4l2-subdev.c:2675:55: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]

Unverified Error/Warning (likely false positive, kindly check if interested):

    drivers/media/mc/mc-entity.c:893 __media_pipeline_start() warn: missing unwind goto?
    drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc() warn: was && intended here instead of ||?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-003-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- arm64-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- i386-allmodconfig
|   |-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:variable-first-set-but-not-used
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-video.c:error:implicit-declaration-of-function-close_streaming_firmware
|-- i386-randconfig-007-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- loongarch-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- loongarch-defconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- powerpc-randconfig-001-20260120
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- riscv-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- riscv-allyesconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- riscv-defconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- sparc64-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- sparc64-randconfig-002-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- sparc64-randconfig-r071-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- um-randconfig-001-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- x86_64-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- x86_64-allyesconfig
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- x86_64-buildonly-randconfig-001-20260119
|   |-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:variable-first-set-but-not-used
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-video.c:error:implicit-declaration-of-function-close_streaming_firmware
|-- x86_64-buildonly-randconfig-002-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
|-- x86_64-randconfig-071-20260119
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:overlapping-comparisons-always-evaluate-to-true
`-- x86_64-randconfig-161-20260119
    |-- drivers-media-mc-mc-entity.c-__media_pipeline_start()-warn:missing-unwind-goto
    `-- drivers-media-v4l2-core-v4l2-subdev.c-v4l2_subdev_get_frame_desc()-warn:was-intended-here-instead-of

elapsed time: 830m

configs tested: 156
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260119    gcc-11.5.0
arc                   randconfig-002-20260119    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                          pxa910_defconfig    gcc-15.2.0
arm                   randconfig-001-20260119    clang-22
arm                   randconfig-002-20260119    clang-22
arm                   randconfig-003-20260119    clang-22
arm                   randconfig-004-20260119    gcc-14.3.0
arm                          sp7021_defconfig    gcc-15.2.0
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260120    gcc-12.5.0
arm64                 randconfig-002-20260120    gcc-8.5.0
arm64                 randconfig-003-20260120    clang-22
arm64                 randconfig-004-20260120    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-002-20260120    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20260120    clang-22
hexagon               randconfig-002-20260120    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-004-20260120    clang-20
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-006-20260120    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260119    gcc-14
i386                  randconfig-002-20260119    gcc-13
i386                  randconfig-003-20260119    clang-20
i386                  randconfig-004-20260119    gcc-14
i386                  randconfig-005-20260119    clang-20
i386                  randconfig-006-20260119    clang-20
i386                  randconfig-007-20260119    clang-20
i386                  randconfig-011-20260119    gcc-14
i386                  randconfig-012-20260119    gcc-14
i386                  randconfig-013-20260119    gcc-14
i386                  randconfig-014-20260119    gcc-14
i386                  randconfig-015-20260119    gcc-14
i386                  randconfig-016-20260119    gcc-14
i386                  randconfig-017-20260119    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-002-20260120    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260120    gcc-11.5.0
nios2                 randconfig-002-20260120    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260119    gcc-12.5.0
parisc                randconfig-001-20260120    gcc-8.5.0
parisc                randconfig-002-20260119    gcc-8.5.0
parisc                randconfig-002-20260120    gcc-9.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260119    gcc-15.2.0
powerpc               randconfig-001-20260120    clang-19
powerpc               randconfig-002-20260119    clang-22
powerpc               randconfig-002-20260120    gcc-10.5.0
powerpc64             randconfig-001-20260119    clang-22
powerpc64             randconfig-001-20260120    gcc-12.5.0
powerpc64             randconfig-002-20260120    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260119    gcc-8.5.0
riscv                 randconfig-002-20260119    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260119    gcc-9.5.0
s390                  randconfig-002-20260119    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260119    gcc-15.2.0
sh                    randconfig-002-20260119    gcc-12.5.0
sh                          sdk7780_defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260119    gcc-11.5.0
sparc                 randconfig-002-20260119    gcc-15.2.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260119    gcc-14.3.0
sparc64               randconfig-002-20260119    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260119    clang-17
um                    randconfig-002-20260119    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260119    gcc-14
x86_64      buildonly-randconfig-002-20260119    clang-20
x86_64      buildonly-randconfig-003-20260119    gcc-14
x86_64      buildonly-randconfig-004-20260119    gcc-13
x86_64      buildonly-randconfig-005-20260119    clang-20
x86_64      buildonly-randconfig-006-20260119    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20260119    clang-20
x86_64                randconfig-072-20260119    gcc-14
x86_64                randconfig-073-20260119    gcc-14
x86_64                randconfig-074-20260119    clang-20
x86_64                randconfig-075-20260119    gcc-14
x86_64                randconfig-076-20260119    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260119    gcc-12.5.0
xtensa                randconfig-002-20260119    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

