Return-Path: <linux-media+bounces-48217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0969CA3159
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377AE30BE68E
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853F4333420;
	Thu,  4 Dec 2025 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xo51/ERE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5A2BE62D
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841623; cv=none; b=FyRO2PVuw9Kp3soWf5VlokP1NpcXJj5FfighTqxUbjmr+qyDPxSsB0IWpsAYBtsG0VPIm7IdJxl60EXBAIV77b5Xi3/b3k4BAjBntj6zSLnzqsqtGJo3jF+wRWvxBvpCEBP4HJV9lLF3rEFyQv04eaOO6FZpVnA6OEOORVJ2qLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841623; c=relaxed/simple;
	bh=WRaGuL/HKZYYz6CJyrOBO71SOj+a6XQjQt+Etdmf/H8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VSsaEXVeN/R3fSeSPqkB1xMWnQ3XO9ozvp77BzjT4O+p7tK7EFywxdFqEgu7rjj4VQQ8L4QCfHP9AodG+Ifh2kCMVwTpRfO0c5ViG1zVVMESatZvKMYa8K0/uuJYMdFgZN9/rs+gKrv/7cpnklZB1fozfZLKA82mBZ5jNiSWQz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xo51/ERE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764841622; x=1796377622;
  h=date:from:to:cc:subject:message-id;
  bh=WRaGuL/HKZYYz6CJyrOBO71SOj+a6XQjQt+Etdmf/H8=;
  b=Xo51/ERE2fPCxL0jhjaVJUmoLFhkRe3tXmUmHyOA0GXEhnwwWpN0elqM
   IVA9+cygipSVIkh/FiXTQP5X2Q6kZcxVtW5V60XSQ0G9sY4Lcz0erJiTA
   HnOheFbMCjQfOvBbTKkru9qPFIUfk+BC489A8GvHZjrWVXHb+6vNPQuMy
   ozCqba66NVgc1HExZlK2/jhbSsYn1zfTntIv7xe/S9zXoMhK7+qqnbIwj
   ICayLyaIjoUbn+Nay6qdvVi0/zoVhf8o3g7hpUSMcIhhNaGQQEivqrQEg
   FrlDhJcgfZP7s8NbGhcLEq3SY+OWGNn7MmkZz94+47t6oV2GioQPeqd3L
   g==;
X-CSE-ConnectionGUID: KDmUVFkeRJa3sr9jKDohBQ==
X-CSE-MsgGUID: RGxmUSY/QVaehBOZJAC7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69447923"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="69447923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:47:01 -0800
X-CSE-ConnectionGUID: 2lEPhK8FRF6F0poLnoggnQ==
X-CSE-MsgGUID: TbY53yyrRA6yiU5EY3fJDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="225609052"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2025 01:47:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR5vM-00000000Ddt-3hAB;
	Thu, 04 Dec 2025 09:46:56 +0000
Date: Thu, 04 Dec 2025 17:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 f7231cff1f3ff8259bef02dc4999bc132abf29cf
Message-ID: <202512041715.oz9a11wi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: f7231cff1f3ff8259bef02dc4999bc132abf29cf  media: uapi: c3-isp: Fix documentation warning

elapsed time: 1448m

configs tested: 211
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251204    gcc-10.5.0
arc                   randconfig-002-20251204    gcc-10.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                        multi_v5_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                         orion5x_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20251204    gcc-10.5.0
arm                   randconfig-002-20251204    gcc-10.5.0
arm                   randconfig-003-20251204    gcc-10.5.0
arm                   randconfig-004-20251204    gcc-10.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251204    gcc-14.3.0
arm64                 randconfig-002-20251204    gcc-14.3.0
arm64                 randconfig-003-20251204    gcc-14.3.0
arm64                 randconfig-004-20251204    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251204    gcc-14.3.0
csky                  randconfig-002-20251204    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251204    gcc-15.1.0
hexagon               randconfig-002-20251204    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251204    clang-20
i386        buildonly-randconfig-002-20251204    clang-20
i386        buildonly-randconfig-003-20251204    clang-20
i386        buildonly-randconfig-004-20251204    clang-20
i386        buildonly-randconfig-005-20251204    clang-20
i386        buildonly-randconfig-006-20251204    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251204    clang-20
i386                  randconfig-002-20251204    clang-20
i386                  randconfig-003-20251204    clang-20
i386                  randconfig-004-20251204    clang-20
i386                  randconfig-005-20251204    clang-20
i386                  randconfig-006-20251204    clang-20
i386                  randconfig-007-20251204    clang-20
i386                  randconfig-011-20251204    gcc-14
i386                  randconfig-012-20251204    gcc-14
i386                  randconfig-013-20251204    gcc-14
i386                  randconfig-014-20251204    gcc-14
i386                  randconfig-015-20251204    gcc-14
i386                  randconfig-016-20251204    gcc-14
i386                  randconfig-017-20251204    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251204    gcc-15.1.0
loongarch             randconfig-002-20251204    gcc-15.1.0
m68k                             alldefconfig    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    clang-22
m68k                           sun3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251204    gcc-15.1.0
nios2                 randconfig-002-20251204    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    clang-22
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-22
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251204    clang-22
riscv                 randconfig-002-20251204    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251204    clang-22
s390                  randconfig-002-20251204    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    clang-22
sh                            hp6xx_defconfig    clang-22
sh                    randconfig-001-20251204    clang-22
sh                    randconfig-002-20251204    clang-22
sh                          rsk7201_defconfig    gcc-15.1.0
sh                      rts7751r2d1_defconfig    clang-22
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7705_defconfig    clang-22
sh                           se7712_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251204    clang-22
sparc                 randconfig-002-20251204    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251204    clang-22
sparc64               randconfig-002-20251204    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251204    clang-22
um                    randconfig-002-20251204    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251204    clang-20
x86_64      buildonly-randconfig-002-20251204    clang-20
x86_64      buildonly-randconfig-003-20251204    clang-20
x86_64      buildonly-randconfig-004-20251204    clang-20
x86_64      buildonly-randconfig-005-20251204    clang-20
x86_64      buildonly-randconfig-006-20251204    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251204    clang-20
x86_64                randconfig-002-20251204    clang-20
x86_64                randconfig-003-20251204    clang-20
x86_64                randconfig-004-20251204    clang-20
x86_64                randconfig-005-20251204    clang-20
x86_64                randconfig-006-20251204    clang-20
x86_64                randconfig-011-20251204    clang-20
x86_64                randconfig-012-20251204    clang-20
x86_64                randconfig-013-20251204    clang-20
x86_64                randconfig-014-20251204    clang-20
x86_64                randconfig-015-20251204    clang-20
x86_64                randconfig-016-20251204    clang-20
x86_64                randconfig-071-20251204    clang-20
x86_64                randconfig-072-20251204    clang-20
x86_64                randconfig-073-20251204    clang-20
x86_64                randconfig-074-20251204    clang-20
x86_64                randconfig-075-20251204    clang-20
x86_64                randconfig-076-20251204    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251204    clang-22
xtensa                randconfig-002-20251204    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

