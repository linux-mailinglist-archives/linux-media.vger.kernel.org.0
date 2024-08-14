Return-Path: <linux-media+bounces-16319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D395236A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 22:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D641C22687
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 20:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F05A1C3F0D;
	Wed, 14 Aug 2024 20:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfLDy0bW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB518C910
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723667803; cv=none; b=TEb29VfkF0LqejI+/eprrQHkjeLVDX1dbU0PKayvqmuK4S71jWPlB7+USLmIOJfAXihv8/9Q8gpGEIiV3toAnvw0HJbIcEXqIuBQIk//+6GNZvo45vV7aFSWBO39s/2+gB4zGhSfw3uyj+aiHqYhS4XEYjaMynGfJR4QBlBEQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723667803; c=relaxed/simple;
	bh=i2GQsMRGqj35T7mGtII8zCv04nPHbLoFfW8AACFuHEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IFpNjMlUpAHPIw2BjFC+QVPUAeWHTDRLiotlD8WXfmWQVx79nAih60eK/Lf7mXcLgtRri1sS3/byJlnwAuin2qe+YaMj4bMKbeXCOK2r8Pm4Ys40RC0xdV7k/kiEVcBHI/ClM8S6SeW++P12X63Ijq7jucdUWJ9XeBFh1W7m/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfLDy0bW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723667800; x=1755203800;
  h=date:from:to:cc:subject:message-id;
  bh=i2GQsMRGqj35T7mGtII8zCv04nPHbLoFfW8AACFuHEQ=;
  b=TfLDy0bWpb5E8jikrEcNjZftiwbwMPvB6B0mucirQJQtbeqHt/6M3QH5
   rVXirrw/iFbjY+hJhDlQzX7t0ygoi0dx+QHNtRirrdYAQQLxqu52DDsf8
   mrkrAHFL19yw+KgdP67sAVxlRwO3r7D+QLN8mFVhv/x80CHQmY2Uq6gwD
   9Ot29eAOq9HF6EMUCegJNyJmJnMkFyfFOwfljbWd3csnrOujV92N3/FMJ
   pDmrAtg6+ELDQA34MxtuTa8X5qU633Y1OL7VI3F3J8a4labVIAaKLnmS2
   5iDqM9zxHust7S31JGoHZFkY+TKUURu3a1ExhSeYGJDywrgzw8IB+Xisf
   g==;
X-CSE-ConnectionGUID: 7X7GNvjfT7yYgDAA0ww3vA==
X-CSE-MsgGUID: 2ubyjmlcTVuRMNGi8/jPNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21767160"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21767160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 13:36:40 -0700
X-CSE-ConnectionGUID: PbRhP4fjRPCJU/YsmRuv8w==
X-CSE-MsgGUID: PJkutAKXSFS0Bf4/CTPyJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63788753"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2024 13:36:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seKjU-0002rK-1p;
	Wed, 14 Aug 2024 20:36:36 +0000
Date: Thu, 15 Aug 2024 04:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 63de936b513f7a9ce559194d3269ac291f4f4662
Message-ID: <202408150428.UZujl4VN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 63de936b513f7a9ce559194d3269ac291f4f4662  media: atomisp: Fix streaming no longer working on BYT / ISP2400 devices

elapsed time: 862m

configs tested: 208
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240814   gcc-13.2.0
arc                   randconfig-002-20240814   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240814   clang-20
arm                   randconfig-002-20240814   clang-20
arm                   randconfig-003-20240814   clang-20
arm                   randconfig-004-20240814   clang-20
arm                           sunxi_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240814   clang-20
arm64                 randconfig-002-20240814   gcc-14.1.0
arm64                 randconfig-003-20240814   gcc-14.1.0
arm64                 randconfig-004-20240814   clang-20
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240814   gcc-14.1.0
csky                  randconfig-002-20240814   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240814   clang-16
hexagon               randconfig-002-20240814   clang-14
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240814   clang-18
i386         buildonly-randconfig-002-20240814   clang-18
i386         buildonly-randconfig-003-20240814   clang-18
i386         buildonly-randconfig-004-20240814   clang-18
i386         buildonly-randconfig-005-20240814   clang-18
i386         buildonly-randconfig-005-20240814   gcc-12
i386         buildonly-randconfig-006-20240814   clang-18
i386         buildonly-randconfig-006-20240814   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240814   clang-18
i386                  randconfig-002-20240814   clang-18
i386                  randconfig-002-20240814   gcc-12
i386                  randconfig-003-20240814   clang-18
i386                  randconfig-003-20240814   gcc-12
i386                  randconfig-004-20240814   clang-18
i386                  randconfig-005-20240814   clang-18
i386                  randconfig-006-20240814   clang-18
i386                  randconfig-011-20240814   clang-18
i386                  randconfig-011-20240814   gcc-12
i386                  randconfig-012-20240814   clang-18
i386                  randconfig-012-20240814   gcc-12
i386                  randconfig-013-20240814   clang-18
i386                  randconfig-014-20240814   clang-18
i386                  randconfig-014-20240814   gcc-11
i386                  randconfig-015-20240814   clang-18
i386                  randconfig-015-20240814   gcc-12
i386                  randconfig-016-20240814   clang-18
i386                  randconfig-016-20240814   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240814   gcc-14.1.0
loongarch             randconfig-002-20240814   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
mips                         rt305x_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240814   gcc-14.1.0
nios2                 randconfig-002-20240814   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240814   gcc-14.1.0
parisc                randconfig-002-20240814   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                      ppc44x_defconfig   gcc-13.2.0
powerpc               randconfig-002-20240814   clang-20
powerpc               randconfig-003-20240814   gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240814   clang-20
powerpc64             randconfig-002-20240814   clang-15
powerpc64             randconfig-003-20240814   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240814   gcc-14.1.0
riscv                 randconfig-002-20240814   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-13.2.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240814   gcc-14.1.0
s390                  randconfig-002-20240814   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240814   gcc-14.1.0
sh                    randconfig-002-20240814   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240814   gcc-14.1.0
sparc64               randconfig-002-20240814   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240814   clang-20
um                    randconfig-002-20240814   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240814   clang-18
x86_64       buildonly-randconfig-002-20240814   clang-18
x86_64       buildonly-randconfig-002-20240814   gcc-12
x86_64       buildonly-randconfig-003-20240814   clang-18
x86_64       buildonly-randconfig-004-20240814   clang-18
x86_64       buildonly-randconfig-005-20240814   clang-18
x86_64       buildonly-randconfig-005-20240814   gcc-12
x86_64       buildonly-randconfig-006-20240814   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240814   clang-18
x86_64                randconfig-002-20240814   clang-18
x86_64                randconfig-002-20240814   gcc-12
x86_64                randconfig-003-20240814   clang-18
x86_64                randconfig-003-20240814   gcc-11
x86_64                randconfig-004-20240814   clang-18
x86_64                randconfig-004-20240814   gcc-12
x86_64                randconfig-005-20240814   clang-18
x86_64                randconfig-005-20240814   gcc-12
x86_64                randconfig-006-20240814   clang-18
x86_64                randconfig-006-20240814   gcc-12
x86_64                randconfig-011-20240814   clang-18
x86_64                randconfig-012-20240814   clang-18
x86_64                randconfig-013-20240814   clang-18
x86_64                randconfig-013-20240814   gcc-11
x86_64                randconfig-014-20240814   clang-18
x86_64                randconfig-015-20240814   clang-18
x86_64                randconfig-015-20240814   gcc-12
x86_64                randconfig-016-20240814   clang-18
x86_64                randconfig-071-20240814   clang-18
x86_64                randconfig-072-20240814   clang-18
x86_64                randconfig-073-20240814   clang-18
x86_64                randconfig-074-20240814   clang-18
x86_64                randconfig-075-20240814   clang-18
x86_64                randconfig-075-20240814   gcc-12
x86_64                randconfig-076-20240814   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240814   gcc-14.1.0
xtensa                randconfig-002-20240814   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

