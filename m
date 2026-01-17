Return-Path: <linux-media+bounces-50941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC87D38D7A
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 10:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 499F9301FFB3
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 09:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC71030EF8F;
	Sat, 17 Jan 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTONMrbA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15B7260D
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643213; cv=none; b=esNSrabAmp8zNZaKuALw3gXYc0jcj5BNSBKOWp1QSpKmZ49fiB6H3lDpEPiod1ZbHOOxIOezR/U7Q+qw2fHmCZCd32U/Q+kek0HAiISXsDrukCxZZdyLNbQA8TrrfGg5jZ8cTLEIOqhSIc6Ww8GMXu2pTAwSOHo45f4WoBn/1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643213; c=relaxed/simple;
	bh=Igob9mQOwvi6HkKvZTZ9Qi0GGne3O5JsshMcuEwIv/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o2guKj7VK2/Lcfpo/VRhEePVcX1wBZEm0gz78cgZkM+yHfuMedhFtyqiq62Ju3Y1kyxtsdXhM2XPqr4xbzxvw3707DDPpnfWa+4SL34OxG1iAY9TG79YyeDYp/N3AkIzqk68FB6V04wDYi4s3tpvWhsS2f9D3BYsa0yjdcNlcAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTONMrbA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768643212; x=1800179212;
  h=date:from:to:cc:subject:message-id;
  bh=Igob9mQOwvi6HkKvZTZ9Qi0GGne3O5JsshMcuEwIv/U=;
  b=BTONMrbARtKxsJ1IwcJQSBDwdklD/nyKGyWnBh0fXW3S5wJXvYkH7Hsg
   Z8baiiCIRdx2uFW38QdWWkf3a9S92F2FUTucQasOal8EMeiVqrLIdEqXU
   I2w6vAG05ya+osOjvRsfyrL5E0f8QCZYtQJ/3wl8T9gOsE3WKDJIAMdWN
   OqdUdJdaFTcxaltJrIiLadIleLB5RVPSarYu56Npu41FrLqnDrcQGlz39
   amUR3wXC+bD6SeHq/cEX+vIkg5lpTpjyvPrDIXARL0Pz6HMo4dHCih6Gu
   owvBNYCk+G18h9PuQx+WrplQEH9vljRba5zZGmEPfMY85926xcqgrwWTb
   w==;
X-CSE-ConnectionGUID: pbxR5yYlTq6AfvtHP/ZJMA==
X-CSE-MsgGUID: xLoZv1koSuWJGV6vz2p84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81056155"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81056155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:46:51 -0800
X-CSE-ConnectionGUID: 9yoH72azTqmVjo9WQ4Y//g==
X-CSE-MsgGUID: 70yIgGkKSziELO2/wkcigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="209941138"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2026 01:46:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2tL-00000000LjO-0Kjx;
	Sat, 17 Jan 2026 09:46:47 +0000
Date: Sat, 17 Jan 2026 17:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 f31283b29e5f1c39e183c6ca694cd9540e1db0dc
Message-ID: <202601171744.5CuIn67J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: f31283b29e5f1c39e183c6ca694cd9540e1db0dc  media: i2c: os05b10: Few minor improvements

elapsed time: 1216m

configs tested: 191
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs103_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           stm32_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-002-20260117    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260117    gcc-13
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-004-20260117    gcc-13
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-006-20260117    gcc-13
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260117    gcc-14
i386                  randconfig-002-20260117    gcc-14
i386                  randconfig-003-20260117    gcc-14
i386                  randconfig-004-20260117    gcc-14
i386                  randconfig-005-20260117    gcc-14
i386                  randconfig-006-20260117    gcc-14
i386                  randconfig-007-20260117    gcc-14
i386                  randconfig-011-20260117    gcc-14
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-015-20260117    gcc-14
i386                  randconfig-016-20260117    gcc-14
i386                  randconfig-017-20260117    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260117    clang-20
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-002-20260117    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                          malta_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-001-20260117    gcc-8.5.0
nios2                 randconfig-002-20260117    clang-22
nios2                 randconfig-002-20260117    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-002-20260117    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                      ppc64e_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-002-20260117    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-002-20260117    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-002-20260117    gcc-10.5.0
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-002-20260117    gcc-10.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260117    gcc-14.3.0
sparc                 randconfig-002-20260117    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-002-20260117    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260117    gcc-14.3.0
um                    randconfig-002-20260117    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260117    clang-20
x86_64      buildonly-randconfig-002-20260117    clang-20
x86_64      buildonly-randconfig-003-20260117    clang-20
x86_64      buildonly-randconfig-004-20260117    clang-20
x86_64      buildonly-randconfig-005-20260117    clang-20
x86_64      buildonly-randconfig-006-20260117    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260117    clang-20
x86_64                randconfig-002-20260117    clang-20
x86_64                randconfig-003-20260117    clang-20
x86_64                randconfig-004-20260117    clang-20
x86_64                randconfig-005-20260117    clang-20
x86_64                randconfig-005-20260117    gcc-12
x86_64                randconfig-006-20260117    clang-20
x86_64                randconfig-006-20260117    gcc-14
x86_64                randconfig-011-20260117    clang-20
x86_64                randconfig-012-20260117    clang-20
x86_64                randconfig-013-20260117    clang-20
x86_64                randconfig-014-20260117    clang-20
x86_64                randconfig-015-20260117    clang-20
x86_64                randconfig-016-20260117    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260117    gcc-14.3.0
xtensa                randconfig-002-20260117    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

