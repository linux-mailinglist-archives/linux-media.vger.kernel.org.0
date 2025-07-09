Return-Path: <linux-media+bounces-37178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44265AFE25F
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C1DD1C426F3
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 08:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4060123C50D;
	Wed,  9 Jul 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf+N2A+R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB54438B
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049265; cv=none; b=T2bQzEkAvP89M8OD22vA9JLm4WwiyNwQUXHw9et5ZG5c3Bqyn8fMCRBozR7m3GzxoACvz8Skw9PN+4tQdRS0Jpw1IgLB9BH3bLBTFzPvL6vlvpduW0c53wPZhpxNSzy3SfuUT+ogAdgpNuW1Ehlq9spMDA/NtPii82bBALFzt5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049265; c=relaxed/simple;
	bh=iwdg+LYzeZEzssbWx1dvzduqWjBKE/iZ8IhOY4nhX0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZSRyWOdqFor6E+qEf0AfUhW2U3knC8X1hMZjzPwObwAMN41OjyJ9nOhYSl6JHPUEwiTKQQG/+F3WG72R542anzbFqs7s/AH+3SBG0qSXZrnL3/EmL4eaf8X6Gyv6jqQYjiQL6rZC4SOLbf18UEBLQURv/YMkA9ZmY2r8bZ3H20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf+N2A+R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752049264; x=1783585264;
  h=date:from:to:cc:subject:message-id;
  bh=iwdg+LYzeZEzssbWx1dvzduqWjBKE/iZ8IhOY4nhX0o=;
  b=Tf+N2A+RzKRkq/0Romn7fTMuNe7FpwnnUDyCmgPEwtlMXgyGkNsD+H0O
   u/aCCLq4ah0PyqzF6cbykr5BYjC6c1nOQKUop8IrH29iPZPh7a/dNcKkC
   pM7Y2Sms+KVFmxW+jnwiIo/OZq5/1KbFlBOUMfULsdM4QChj/iGlEF5gC
   gJ5P7TdTdHbgEsmL3z2CIFti33khRnt0P1p3T5z/GvVNfPcYbi9POqt1+
   k4ECZa81PO6OQODRF7l2lw03uIWMeFU9Dl9PL1T5AzV9/mgctVcAm/xfG
   yeUIKOKoQZQyHORVvIuTeOFzq/JGTBAmTUkm2goucOtCISH86DE2Ioinw
   A==;
X-CSE-ConnectionGUID: fmp76dxfR2W8caORaOmb2Q==
X-CSE-MsgGUID: 8gP/oeezSbmR1D2sQsm+cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53517242"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="53517242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:21:03 -0700
X-CSE-ConnectionGUID: grBNxxSwSG29bRlblaF13g==
X-CSE-MsgGUID: 3eulrr32TXmRzfnNiatnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156046289"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2025 01:21:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZQ32-0003IB-0Z;
	Wed, 09 Jul 2025 08:21:00 +0000
Date: Wed, 09 Jul 2025 16:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 45149a5793433c2f5137a6de2564796182a9787a
Message-ID: <202507091644.AeXSvr1z-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 45149a5793433c2f5137a6de2564796182a9787a  media: i2c: Automatically select common options for lens drivers

elapsed time: 1372m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-002-20250708    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-004-20250708    clang-21
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-004-20250708    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-002-20250708    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-002-20250708    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-002-20250708    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-21
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-003-20250708    clang-21
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-003-20250708    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-002-20250708    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-002-20250708    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-002-20250708    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-002-20250708    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250708    clang-21
um                    randconfig-002-20250708    clang-17
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-002-20250708    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

